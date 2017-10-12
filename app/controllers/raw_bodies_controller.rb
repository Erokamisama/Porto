class RawBodiesController < ApplicationController
  before_action :set_raw_body, only: [:show, :edit, :update, :destroy]

  # GET /raw_bodies
  # GET /raw_bodies.json
  def index
    @raw_bodies = RawBody.all
  end

  # GET /raw_bodies/1
  # GET /raw_bodies/1.json
  def show
  end

  # GET /raw_bodies/new
  def new
    @raw_body = RawBody.new
  end

  # GET /raw_bodies/1/edit
  def edit
  end

  # POST /raw_bodies
  # POST /raw_bodies.json
  def create
    @raw_body = RawBody.new(raw_body_params)

    respond_to do |format|
      if @raw_body.save
        format.html { redirect_to @raw_body, notice: 'Raw body was successfully created.' }
        format.json { render :show, status: :created, location: @raw_body }
      else
        format.html { render :new }
        format.json { render json: @raw_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raw_bodies/1
  # PATCH/PUT /raw_bodies/1.json
  def update
    respond_to do |format|
      if @raw_body.update(raw_body_params)
        format.html { redirect_to @raw_body, notice: 'Raw body was successfully updated.' }
        format.json { render :show, status: :ok, location: @raw_body }
      else
        format.html { render :edit }
        format.json { render json: @raw_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_bodies/1
  # DELETE /raw_bodies/1.json
  def destroy
    @raw_body.destroy
    respond_to do |format|
      format.html { redirect_to raw_bodies_url, notice: 'Raw body was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_body
      @raw_body = RawBody.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raw_body_params
      params.require(:raw_body).permit(:body, :title, :company_name, :company_des)
    end
end
