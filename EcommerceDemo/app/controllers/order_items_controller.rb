class OrderItemsController < InheritedResources::Base

  include CurrentCart

  layout 'index', only: [:index, :show]
  before_action :set_order_item, only: %i[ show edit update destroy ]
  before_action :set_cart, only: [:create]

  def index
    @order_item = OrderItem.all
  end

  def show
  end

  def new
    @order_item = OrderItem.new
  end

  def create

    product = Product.find(params[:product_id])
    @order_item = @cart.set_product(product)
    # @order_item = @cart.set_user(current_user)
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order_item.cart, notice: "Item added to cart." }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if@order_item.update(order_item_params)
        format.html { redirect_to order_item_url(@order_item), notice: "Order Item was successfully updated." }
        format.json { render :show, status: :ok, location:@order_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json:@order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroyed

    @cart = Cart.find(session[:cart_id])
    @order_item.destroy
      respond_to do |format|
        format.html { redirect_to cart_path(@cart), notice: "Order Item  was successfully destroyed." }
        format.json { head :no_content }
      end
  end

  private

    def order_item_params
      params.require(:order_item).permit(:product_id)
    end
    
    def set_order_item
        @cart_item = OrderItem.find(params[:id])
      end

end
