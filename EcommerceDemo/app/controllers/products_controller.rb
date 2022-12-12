class ProductsController < InheritedResources::Base

  layout 'index', only: [:index, :show]

  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /products
  def index
    @products = Product.all
    return @products
end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = current_user.products.build
  end

  # GET /products/1/edit
  def edit
    # @product = Product.find(params[:id])
  end

  # POST /products
  def create
    @product = current_user.products.build(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url(@product), notice: "Product was successfully created." }
        format.json { render :index, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_url(@product), notice: "Product was successfully updated." }
        format.json { render :index, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  def destroy
    
    # @product = Product.find(params[:id])
    if @product.present?
    @product.destroy
    end
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product  was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :condition, :price, :image)
    end

end


