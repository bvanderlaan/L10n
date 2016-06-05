class TranslatedStringsController < ApplicationController
  before_action :set_translated_string, only: [:show, :edit, :update, :destroy]

  # GET /translated_strings
  # GET /translated_strings.json
  def index
    @translated_strings = TranslatedString.all
  end

  # GET /translated_strings/1
  # GET /translated_strings/1.json
  def show
  end

  # GET /translated_strings/new
  def new
    @translated_string = TranslatedString.new
  end

  # GET /translated_strings/1/edit
  def edit
  end

  # POST /translated_strings
  # POST /translated_strings.json
  def create
    @translated_string = TranslatedString.new(translated_string_params)

    respond_to do |format|
      if @translated_string.save
        format.html { redirect_to @translated_string, notice: 'Translated string was successfully created.' }
        format.json { render :show, status: :created, location: @translated_string }
      else
        format.html { render :new }
        format.json { render json: @translated_string.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translated_strings/1
  # PATCH/PUT /translated_strings/1.json
  def update
    respond_to do |format|
      if @translated_string.update(translated_string_params)
        format.html { redirect_to @translated_string, notice: 'Translated string was successfully updated.' }
        format.json { render :show, status: :ok, location: @translated_string }
      else
        format.html { render :edit }
        format.json { render json: @translated_string.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translated_strings/1
  # DELETE /translated_strings/1.json
  def destroy
    @translated_string.destroy
    respond_to do |format|
      format.html { redirect_to translated_strings_url, notice: 'Translated string was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translated_string
      @translated_string = TranslatedString.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def translated_string_params
      params.require(:translated_string).permit(:translation, :comment, :rootstring_id, :language_id)
    end
end
