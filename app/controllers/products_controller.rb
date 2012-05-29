class ProductsController < ApplicationController
  before_filter :get_business
  # GET /products
  # GET /products.json
  def index
    @products = @business.products rescue []
    @nested_sequence = params[:nested_sequence]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
      format.js { render layout: false}
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = @business.products.new
    @product.nested_sequence = params[:nested_sequence]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
      format.js { render layout: false }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = @business.products.new(params[:product])
    @is_save = @product.save
    respond_to do |format|
      if @is_save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
        format.js { render layout: false }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js { render layout: false }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
  
  protected
  
  def get_business
    @business = Business.find(params[:business_id]) rescue nil
  end
end
