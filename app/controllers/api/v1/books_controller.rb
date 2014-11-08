module Api
  module V1
    class BooksController < ApplicationController

      def index
        books = Book.all
        

        if author = params[:author]
          books = Book.where(author: author)
        end

        respond_to do |format|
          format.json {render json: books, status: 200}
        end 
       
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
