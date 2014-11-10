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
        book = Book.create(book_params)
        if book.save
          render json: book, status: 201, location: api_v1_book_url(book)
        end

        else
      end

      def book_params
        params.require(:book).permit
      end

    end
  end
end
