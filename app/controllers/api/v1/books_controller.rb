module Api
  module V1
    class BooksController < ApplicationController
      respond_to :json
      def index
        books = Book.all
        
        if author = params[:author]
          books = Book.where(author: author)
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

      def book_params
        params.require(:book).permit(:author, :genre)
      end

    end
  end
end
