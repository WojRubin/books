module API::V1
  class BooksController < ApplicationController
    respond_to :json
    
    def index
      books = Book.all
      respond_with books
    end
  end
end
