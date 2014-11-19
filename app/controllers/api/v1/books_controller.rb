module Api
  module V1
    class BooksController < ApplicationController
      respond_to :json
      def index
        books = Book.includes(:genre).all
        
        if author = params[:author]
          books = Book.joins(:authors).where(:authors.name => author)
        end
   
        respond_with books, status: 200      
      end

      def show
        book = Book.find(params[:id])

        respond_with book, status: 200
      end

      def create
        book = Book.new(book_params)
        if book.save
          respond_with book, status: 201, location: api_v1_book_url(book)
        else
          respond_with book.errors, status: 422
        end
      end

      def update
        book = Book.find(params[:id])
        if book.update_attributes(book_params)
          respond_with book, status: 200
        else
          respond_with book.errors, status: :unprocessable_entity
        end
      end

      def destroy
        book = Book.find(params[:id])
        book.destroy!
        render nothing:true, status: 204
      end

      def book_params
        params.require(:book).permit(:name, :description, :isbn)
      end

    end
  end
end
