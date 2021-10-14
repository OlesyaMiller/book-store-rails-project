class PurchasesController < ApplicationController

    before_action :require_login

    def create
        book = Book.find_by(id: params[:purchase][:book_id])
        if current_user.credit >= book.price
            purchase = Purchase.create(purchase_params)
            message = purchase.purchase_book 
            redirect_to user_books_path(purchase.user), flash: { message: message }
        else
            redirect_to user_path(current_user), flash: { message: "You do not have enough credit to purchase this book" }
        end
    end
    
    private
    
    def purchase_params
        params.require(:purchase).permit(
            :user_id,
            :book_id,
        )
    end

end
