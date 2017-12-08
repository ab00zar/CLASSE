require 'test_helper'

class MetadonneesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @metadonnee = metadonnees(:one)
  end

  test "should get index" do
    get metadonnees_url
    assert_response :success
  end

  test "should get new" do
    get new_metadonnee_url
    assert_response :success
  end

  test "should create metadonnee" do
    assert_difference('Metadonnee.count') do
      post metadonnees_url, params: { metadonnee: { couverture: @metadonnee.couverture, date: @metadonnee.date, descriptif: @metadonnee.descriptif, titre: @metadonnee.titre } }
    end

    assert_redirected_to metadonnee_url(Metadonnee.last)
  end

  test "should show metadonnee" do
    get metadonnee_url(@metadonnee)
    assert_response :success
  end

  test "should get edit" do
    get edit_metadonnee_url(@metadonnee)
    assert_response :success
  end

  test "should update metadonnee" do
    patch metadonnee_url(@metadonnee), params: { metadonnee: { couverture: @metadonnee.couverture, date: @metadonnee.date, descriptif: @metadonnee.descriptif, titre: @metadonnee.titre } }
    assert_redirected_to metadonnee_url(@metadonnee)
  end

  test "should destroy metadonnee" do
    assert_difference('Metadonnee.count', -1) do
      delete metadonnee_url(@metadonnee)
    end

    assert_redirected_to metadonnees_url
  end
end
