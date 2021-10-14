class PurchasesController < ApplicationController

    before_action :require_login

    def new
        @purchase = Purchase.new 
        if params[:user_id]
            user = User.find(params[:user_id])
            @purchase.user = user 
        else
            user = User.find_by(id: current_user.id)
            @purchase.user = user 
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
        )
    end

end
