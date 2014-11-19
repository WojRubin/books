module Api
  module V1
    class GenresController < ApplicationController
      respond_to :json
      def index
        genre = Genre.all

        respond_with genre, status: 200
      end
      def show
        genre = Genre.find(params[:id])

        respond_with genre, status: 200
      end

      def create
        genre = Genre.new(genre_params)
        if genre.save
          respond_with genre, status: 201, location: api_v1_genre_url(genre)
        else
          respond_with genre.errors, status: 422
        end
      end

      def update
        genre = Genre.find(params[:id])
        if genre.update_attributes(genre_params)
          respond_with genre, status: 200
        else
          respond_with genre.errors, status: :unprocessable_entity
        end
      end

      def destroy
        genre = Genre.find(params[:id])
        genre.destroy!
        render nothing:true, status: 204
      end

      def genre_params
        params.require(:book).permit(:name)
      end
    end
  end
end