class BooksController < ApplicationController
    
    before_action :require_login

    def new
        if current_user.role == "admin"
            @book = Book.new
        else
            redirect_to user_path(current_user)
        end    
    end

    def create
        @book = Book.new(book_params)
        if @book.save && @book.valid?
            redirect_to book_path(@book)
        else
            render :new
        end
    end

    def show
        @book = Book.find_by(id: params[:id])
        @purchase = Purchase.new 
    end

    def index
        if !params[:user_id]
            if (params[:book] && params[:book][:genre_id].blank?) || !params[:book]
                @books = Book.all.order(:title) 
            else
                @books = Book.where(genre_id: params[:book][:genre_id])
            end
        else
            @user = User.find_by(id: params[:user_id])
            if @user 
                @books = @user.books.uniq
            end
        end
    end

    def edit
        if current_user.role == "admin"
            find_book
        else
            redirect_to user_path(current_user)
        end
    end

    def update
        find_book
        if @book 
            @book.update(book_params)
            redirect_to book_path(@book)
        else
            render :edit
        end    
    end

    def destroy
        find_book
        @book.delete
        redirect_to books_path
    end

    private 

    def book_params 
        params.require(:book).permit(
            :title, 
            :genre_id, 
            :summary, 
            :number_of_pages, 
            :author, 
            :price
        )
    end

    def find_book
        @book = Book.find_by(id: params[:id])
    end
end
