class ProductsController < InheritedResources::Base

  layout 'index', only: [:index, :show]

  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /user_lists or /user_lists.json
  def index
    @products = Product.all
    return @products
end

  # GET /user_lists/1 or /user_lists/1.json
  def show
  end

  # GET /user_lists/new
  def new
    @product = current_user.products.build
  end

  # GET /user_lists/1/edit
  def edit
    # @product = Product.find(params[:id])
  end

  # POST /user_lists or /user_lists.json
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

  # PATCH/PUT /user_lists/1 or /user_lists/1.json
  def update
    # @product = Product.find(params[:id])
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

  # DELETE /user_lists/1 or /user_lists/1.json
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

  # def correct_user
  #   @friend = current_user.user_lists.find_by(id: params[:id])
  #   redirect_to user_list_path, notice: "Not Autherized to edit this user" if @friend.nil?
  # end

  private
  #   # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

  #   # Only allow a list of trusted parameters through.
  #   def user_list_params
  #     params.require(:user_list).permit(:first_name, :last_name, :email, :phone, :insta_id, :user_id)
  #   end

  private

    def product_params
      params.require(:product).permit(:name, :description, :condition, :price, :image)
    end

end


