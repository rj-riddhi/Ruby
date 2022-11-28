module ApplicationHelper

    
    def cart_has_items
        return @cart.order_items.count > 0
    end

    def cart_count_over_one
        if @cart.order_items.count > 0
            return  @cart.order_items.count
        end
    end

end
