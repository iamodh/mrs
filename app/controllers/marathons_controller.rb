class MarathonsController < ApplicationController
  before_action :set_marathon, only: %i[ show edit update destroy ]

  # GET /marathons or /marathons.json
  def index
    @marathons = Marathon.all
  end

  # GET /marathons/1 or /marathons/1.json
  def show
  end

  # GET /marathons/new
  def new
    @marathon = Marathon.new
  end

  # GET /marathons/1/edit
  def edit
  end

  # POST /marathons or /marathons.json
  def create
    @marathon = Marathon.new(marathon_params)

    respond_to do |format|
      if @marathon.save
        format.html { redirect_to @marathon, notice: "Marathon was successfully created." }
        format.json { render :show, status: :created, location: @marathon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @marathon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marathons/1 or /marathons/1.json
  def update
    respond_to do |format|
      if @marathon.update(marathon_params)
        format.html { redirect_to @marathon, notice: "Marathon was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @marathon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @marathon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marathons/1 or /marathons/1.json
  def destroy
    @marathon.destroy!

    respond_to do |format|
      format.html { redirect_to marathons_path, notice: "Marathon was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marathon
      @marathon = Marathon.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def marathon_params
      params.expect(marathon: [ :name, :entry_start, :entry_end ])
    end
end
