class PurchasesController < ApplicationController

    def new
        if params[:user_id]
            @purchase = Purchase.new 
            @user = User.find(params[:user_id])
            @purchase.user = @user 
        else
            @purchase = Purchase.new 
        end
    end

    def create
        purchase = Purchase.create(purchase_params)
        message = purchase.purchase_book 
        redirect_to user_books_path(purchase.user), flash: { message: message }
    end
    
    private
    
    def purchase_params
        params.require(:purchase).permit(
        :user_id,
        :book_id,
        :location
        )
    end

end
