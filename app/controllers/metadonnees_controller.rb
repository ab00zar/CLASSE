class MetadonneesController < ApplicationController
  before_action :set_metadonnee, only: [:show, :edit, :update, :destroy]

  # GET /metadonnees
  # GET /metadonnees.json
  def index
    @metadonnees = Metadonnee.all
  end

  # GET /metadonnees/1
  # GET /metadonnees/1.json
  def show
  end

  # GET /metadonnees/new
  def new
    @metadonnee = Metadonnee.new
  end

  # GET /metadonnees/1/edit
  def edit
  end

  # POST /metadonnees
  # POST /metadonnees.json
  def create
    @metadonnee = Metadonnee.new(metadonnee_params)
    respond_to do |format|
      if @metadonnee.save
        format.html { redirect_to @metadonnee, notice: 'Metadonnee was successfully created.' }
        format.json { render :show, status: :created, location: @metadonnee }
      else
        format.html { render :new }
        format.json { render json: @metadonnee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metadonnees/1
  # PATCH/PUT /metadonnees/1.json
  def update
    respond_to do |format|
      if @metadonnee.update(metadonnee_params)
        format.html { redirect_to @metadonnee, notice: 'Metadonnee was successfully updated.' }
        format.json { render :show, status: :ok, location: @metadonnee }
      else
        format.html { render :edit }
        format.json { render json: @metadonnee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metadonnees/1
  # DELETE /metadonnees/1.json
  def destroy
    @metadonnee.destroy
    respond_to do |format|
      format.html { redirect_to metadonnees_url, notice: 'Metadonnee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metadonnee
      @metadonnee = Metadonnee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metadonnee_params
      params.require(:metadonnee).permit(:titre, :descriptif, :date, :couverture, :nombre, :geocode, :projection, 
        :type, :organisme, :mail, :periodicite, :nom, :tel, :acces, :autre, :shape_file, :excel_file, :texte_file,
        :access_file, :autre_file, :champs, :noms, :file, format: [], thematique: [])
    end
end
