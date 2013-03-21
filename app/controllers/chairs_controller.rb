class ChairsController < ApplicationController
  before_filter :load_shop

  def load_shop
    @shop = Shop.find_by_screen_name(params[:shop_id])
  end

  # GET /chairs
  # GET /chairs.json
  def index
    @chairs = Chair.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chairs }
    end
  end

  # GET /chairs/1
  # GET /chairs/1.json
  def show
    @chair = Chair.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chair }
    end
  end

  # GET /chairs/new
  # GET /chairs/new.json
  def new
    @chair = Chair.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chair }
    end
  end

  # GET /chairs/1/edit
  def edit
    @chair = Chair.find(params[:id])
  end

  # POST /chairs
  # POST /chairs.json
  def create
    @chair = @shop.chairs.create(params[:chair])

    render json: { size: @shop.chairs.all.size }
  end

  # PUT /chairs/1
  # PUT /chairs/1.json
  def update
    @chair = @shop.chairs.find(params[:id])

    if @chair.update_attributes(params[:chair])
      render json: { p:params[:chair] }
    else
      render json: { failed:true }
    end

    return
    respond_to do |format|
      if @chair.update_attributes(params[:chair])
        format.html { redirect_to @chair, notice: 'Chair was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chairs/1
  # DELETE /chairs/1.json
  def destroy
    @chair = Chair.find(params[:id])
    @chair.destroy

    respond_to do |format|
      format.html { redirect_to chairs_url }
      format.json { head :no_content }
    end
  end
end
