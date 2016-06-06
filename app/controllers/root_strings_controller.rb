class RootStringsController < ApplicationController
  before_action :set_root_string, only: [:show, :edit, :update, :destroy]

  # GET /root_strings
  # GET /root_strings.json
  def index
    @root_strings = RootString.order("lower(string)").all
  end

  # GET /root_strings/1
  # GET /root_strings/1.json
  def show
  end

  # GET /root_strings/new
  def new
    @root_string = RootString.new
  end

  # GET /root_strings/1/edit
  def edit
  end

  # POST /root_strings
  # POST /root_strings.json
  def create
    @root_string = RootString.new(root_string_params)

    respond_to do |format|
      if @root_string.save
        format.html { redirect_to @root_string, notice: 'Root string was successfully created.' }
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
        format.html { redirect_to @root_string, notice: 'Root string was successfully updated.' }
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
      format.html { redirect_to root_strings_url, notice: 'Root string was successfully destroyed.' }
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
      params.require(:root_string).permit(:string, :comment)
    end
end
