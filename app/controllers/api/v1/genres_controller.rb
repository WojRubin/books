module Api
  module V1
    class GenresController < ApplicationController
      respond_to :json
      def index
        genres = Genre.all

        respond_with genres, status: 200
      end
    end
  end
end