class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
<<<<<<< HEAD
  skip_before_filter :verify_authenticity_token
=======

>>>>>>> e13d96732411e0cc266c6590d5dfed3490dede10
  # def csv

  #     file = "#{Rails.root}/public/data.csv"

  #     data = Message.all

  #     CSV.open( file, 'w' ) do |writer|
  #           data.each do |s|
  #                  writer << [s.type, s.repeatIndicator, s.mmsi]
  #           end
  #     end
  # end
<<<<<<< HEAD
  def stats
    @messages = Message.all.count
    #@ships = Message.all.distinct("mmsi").count
    #@jan = Message.janv.count # Message.where(:date.lte => Time.now).count
  end

=======
>>>>>>> e13d96732411e0cc266c6590d5dfed3490dede10
  def ships
    #@ships =  Message.today
    #@ships = Message.select("mmsi").distinct #
   # sshd = [{"$group"=> {"_id" => "$mmsi","nu"=>{$sum=>1}}}]
#@ships = Message.aggregate(sshd)
  myships = Message.all.distinct("mmsi")
  @ships = Kaminari.paginate_array(myships).page(params[:page])
  end

  def ships_show
    #@ships = Message.aggregate([{"$group"=> {_id => "$mmsi",nu=>{$sum=>1}}}]).page(params[:page])
    #@ships = Message.ship #select("mmsi").distinct
    
    #@messages = Message.where("#{:mmsi}" => 100010001).count
    #@messages = Message.distinct(:mmsi).count
<<<<<<< HEAD
    @messages = Message.where(mmsi: params[:id]).order_by(:date => 'desc')
  end
  # GET /messages
  # GET /messages.json
  
  def indexs 
    messages = Message.all.limit(500)
    @messages = Kaminari.paginate_array(messages).page(params[:page])
  end

=======
    @messages = Message.where(mmsi: params[:id])
  end
  # GET /messages
  # GET /messages.json
>>>>>>> e13d96732411e0cc266c6590d5dfed3490dede10
  def index
      
      #case params[:type_de_message]
       #when "1"
       # @messages = Message.where(:type => "1")
      #else
        

      #end

      
      #if params[:type_de_message] == "1"
      #        @messages = Message.where(:type => "1")
      #end

<<<<<<< HEAD

    #Date - Search filter  
    if params[:daterange] == "all" || params[:daterange].blank?
      @messages = Message.limit(50).order_by(:date => 'desc')#all.page(params[:page])
    elsif !params[:daterange].blank?
      @daterange = params[:daterange].split("-") 
      from = DateTime.new(@daterange[0].to_i, @daterange[1].to_i, @daterange[2].to_i)
      to = DateTime.new(@daterange[3].to_i, @daterange[4].to_i, @daterange[5].to_i)       
      @messages = Message.datesearch(from,to).order_by(:date => 'desc')     
    end

    #Message Type - Search filter  
    if params[:type_de_message] == "all" || params[:type_de_message].blank?
      @messages = Message.limit(50).order_by(:date => 'desc')#all.page(params[:page])
    elsif !params[:type_de_message].blank?       
      messages = Message.limit(50) #.type(params[:type_de_message]).order_by(:date => 'desc')
      @messages = Kaminari.paginate_array(messages).page(params[:page])     
    end


    #Source - Search filter
    if params[:source] == "all" || params[:source].blank?
      @messages = Message.limit(50).order_by(:date => 'desc')#all.page(params[:page])
    elsif !params[:source].blank?
      @messages = Message.limit(50).source(params[:source]).order_by(:date => 'desc') #.page(params[:page])
    end


=======
        if params[:type_de_message] == "all" || params[:type_de_message].blank?
          @messages = Message.limit(50)#all.page(params[:page])
        elsif !params[:type_de_message].blank?
              @messages = Message.type(params[:type_de_message]).page(params[:page])
            end
>>>>>>> e13d96732411e0cc266c6590d5dfed3490dede10

       #if params[:type_de_navire] == "all" || params[:type_de_navire].blank?
         #    @messages = 
       if !params[:type_de_navire].blank? && params[:type_de_navire] != "all"
<<<<<<< HEAD
          @messages = @messages.navire(params[:type_de_navire]).order_by(:date => 'desc')
=======
          @messages = @messages.navire(params[:type_de_navire])
>>>>>>> e13d96732411e0cc266c6590d5dfed3490dede10
        end
      respond_to do |format|

              format.html
              format.csv { 
                send_data @messages.to_csv() }
          
      end




  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:type, :repeatIndicator, :mmsi, :receivedDate, :shipType)
    end
end
