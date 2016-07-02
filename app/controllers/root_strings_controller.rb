class RootStringsController < ApplicationController
  before_action :set_root_string, only: [:show, :edit, :update, :destroy]
  add_flash_types :success, :warning, :danger, :info

  # GET /root_strings
  # GET /root_strings.json
  def index
    @root_strings = RootString.search(params[:search], params[:page])
  end

  # GET /root_strings/1
  # GET /root_strings/1.json
  def show
  end

  # GET /root_strings/new
  def new
    @root_string = RootString.new
    Language.all.each do |lang| 
      @root_string.translated_strings.build :language => lang
    end    
  end

  # GET /root_strings/1/edit
  def edit
    Language.all.each do |lang| 
      @root_string.translated_strings.build :language => lang unless @root_string.translated_strings.any? { |ts| ts.language == lang }
    end
  end

  # POST /root_strings
  # POST /root_strings.json
  def create
    @root_string = RootString.new(root_string_params)

    respond_to do |format|
      if @root_string.save
        format.html { redirect_to @root_string, success: 'A new string was successfully added.'  }
        format.json { render :show, status: :created, location: @root_string }
      else
        format.html { render :new }
        format.json { render json: @root_string.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /root_strings/1
  # PATCH/PUT /root_strings/1.json
  def update
    respond_to do |format|
      if @root_string.update(root_string_params)
        format.html { redirect_to @root_string, success: 'A string was successfully updated.' }
        format.json { render :show, status: :ok, location: @root_string }
      else
        format.html { render :edit }
        format.json { render json: @root_string.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /root_strings/1
  # DELETE /root_strings/1.json
  def destroy
    @root_string.destroy
    respond_to do |format|
      format.html { redirect_to root_strings_url, success: 'A string was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_root_string
      @root_string = RootString.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def root_string_params
      params.require(:root_string).permit(:string, :comment, :search, :page, :translated_strings_attributes => [:translation, :comment, :language_id, :id])
    end
end
