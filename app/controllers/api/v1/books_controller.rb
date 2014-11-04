module Api
  module V1
    class BooksController < ApplicationController

      def index
        books = Book.all
        

        if author = params[:author]
          books = Book.where(author: author)
        end
        
        render json: books, status: 200
      end
    end
  end
end
