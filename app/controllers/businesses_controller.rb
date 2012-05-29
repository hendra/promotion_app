class BusinessesController < ApplicationController
  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @businesses }
    end
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    @business = Business.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business }
    end
  end

  # GET /businesses/new
  # GET /businesses/new.json
  def new
    @business = Business.new
    @business.nested_sequence = params[:nested_sequence]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business }
      format.js {render layout: false}
    end
  end

  # GET /businesses/1/edit
  def edit
    @business = Business.find(params[:id])
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(params[:business])
    @is_save = @business.save
    respond_to do |format|
      if @is_save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render json: @business, status: :created, location: @business }
        format.js {render layout: false}
      else
        format.html { render action: "new" }
        format.json { render json: @business.errors, status: :unprocessable_entity }
        format.js {render layout: false}
      end
    end
  end

  # PUT /businesses/1
  # PUT /businesses/1.json
  def update
    @business = Business.find(params[:id])

    respond_to do |format|
      if @business.update_attributes(params[:business])
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business = Business.find(params[:id])
    @business.destroy

    respond_to do |format|
      format.html { redirect_to businesses_url }
      format.json { head :no_content }
    end
  end
end
