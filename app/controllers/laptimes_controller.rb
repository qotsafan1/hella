class LaptimesController < ApplicationController
  before_action :set_laptime, only: [:show, :edit, :update, :destroy]

  # GET /laptimes
  # GET /laptimes.json
  def index
    @laptimes = Laptime.all
  end

  # GET /laptimes/1
  # GET /laptimes/1.json
  def show
  end

  # GET /laptimes/new
  def new
    @laptime = Laptime.new
  end

  # GET /laptimes/1/edit
  def edit
  end

  # POST /laptimes
  # POST /laptimes.json
  def create
    @laptime = Laptime.new(laptime_params)

    respond_to do |format|
      if @laptime.save
        format.html { redirect_to @laptime, notice: 'Laptime was successfully created.' }
        format.json { render :show, status: :created, location: @laptime }
      else
        format.html { render :new }
        format.json { render json: @laptime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laptimes/1
  # PATCH/PUT /laptimes/1.json
  def update
    respond_to do |format|
      if @laptime.update(laptime_params)
        format.html { redirect_to @laptime, notice: 'Laptime was successfully updated.' }
        format.json { render :show, status: :ok, location: @laptime }
      else
        format.html { render :edit }
        format.json { render json: @laptime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laptimes/1
  # DELETE /laptimes/1.json
  def destroy
    @laptime.destroy
    respond_to do |format|
      format.html { redirect_to laptimes_url, notice: 'Laptime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laptime
      @laptime = Laptime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laptime_params
      params.require(:laptime).permit(:competitor_id, :lap_number, :laptime)
    end
end
