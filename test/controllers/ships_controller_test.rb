require 'test_helper'

class ShipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ship = ships(:one)
  end

  test "should get index" do
    get ships_url
    assert_response :success
  end

  test "should get new" do
    get new_ship_url
    assert_response :success
  end

  test "should create ship" do
    assert_difference('Ship.count') do
      post ships_url, params: { ship: { built: @ship.built, category: @ship.category, deadweight: @ship.deadweight, draught: @ship.draught, flag: @ship.flag, length: @ship.length, name: @ship.name, operator: @ship.operator, operator_list_url: @ship.operator_list_url, operator_url: @ship.operator_url, owner_list_url: @ship.owner_list_url, owner_url: @ship.owner_url, registered_owner: @ship.registered_owner, shipmanager: @ship.shipmanager, shipmanager_list_url: @ship.shipmanager_list_url, shipmanager_url: @ship.shipmanager_url, teu: @ship.teu } }
    end

    assert_redirected_to ship_url(Ship.last)
  end

  test "should show ship" do
    get ship_url(@ship)
    assert_response :success
  end

  test "should get edit" do
    get edit_ship_url(@ship)
    assert_response :success
  end

  test "should update ship" do
    patch ship_url(@ship), params: { ship: { built: @ship.built, category: @ship.category, deadweight: @ship.deadweight, draught: @ship.draught, flag: @ship.flag, length: @ship.length, name: @ship.name, operator: @ship.operator, operator_list_url: @ship.operator_list_url, operator_url: @ship.operator_url, owner_list_url: @ship.owner_list_url, owner_url: @ship.owner_url, registered_owner: @ship.registered_owner, shipmanager: @ship.shipmanager, shipmanager_list_url: @ship.shipmanager_list_url, shipmanager_url: @ship.shipmanager_url, teu: @ship.teu } }
    assert_redirected_to ship_url(@ship)
  end

  test "should destroy ship" do
    assert_difference('Ship.count', -1) do
      delete ship_url(@ship)
    end

    assert_redirected_to ships_url
  end
end
