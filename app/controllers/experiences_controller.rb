class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = Experience.all
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
    
    @hash = Gmaps4rails.build_markers(@experience.location) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
    end
    
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
    @experience.programs.build
    @experience.build_location
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(experience_params)

    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
        format.json { render action: 'index', status: :created, location: @experience }
      else
        @experience.build_location
        format.html { render action: 'new' }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url }
      format.json { head :no_content }
    end
  end

  private
    def set_experience
      @experience = Experience.find(params[:id])
    end

    def experience_params
      params.require(:experience).permit(:category_id, :private, :title, :description, :included, :not_included, :duration, :duration_type,:max_group_size, :availability, :additional_information,location_attributes:[:country, :city, :zip_code, :adress], programs_attributes:[:when, :what])
    end
end
