class CartsController < InheritedResources::Base

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  layout 'index', only: [:index, :show]
  # GET /user_lists or /user_lists.json
  def index
    @cart = Cart.all
    return @cart
end

  # GET /user_lists/1 or /user_lists/1.json
  def show
  end

  # GET /user_lists/new
  def new
    @cart =Cart.new
  end

  # GET /user_lists/1/edit
  def edit
  end

  # POST /user_lists or /user_lists.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_lists/1 or /user_lists/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_status
    
    @cart = Cart.find(params[:id])
    @order_item = @cart.order_items
    @cart.update(:status => 1)
    @cart.order_items.update(:status => 1)
    redirect_to @cart, notice: "Your Payment has been done successfully 🥳"
  end

  # DELETE /user_lists/1 or /user_lists/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart  was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # def correct_user
  #   @friend = current_user.user_lists.find_by(id: params[:id])
  #   redirect_to user_list_path, notice: "Not Autherized to edit this user" if @friend.nil?
  # end

  private
  #   # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params.require(:cart).permit()
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice: "That cart does'nt exist"
    end

end
