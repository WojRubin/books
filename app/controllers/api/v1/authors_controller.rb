module Api
  module V1
    class AuthorsController < ApplicationController
      respond_to :json
      def index
        author = Author.all
        respond_with author, status: 200
      end
      def show
        author = Author.find(params[:id])
        respond_with author, status: 200
      end

      def create
        author = Author.new(author_params)
        if author.save
          respond_with author, status: 201, location: api_v1_author_url(author)
        else
          respond_with author.errors, status: 422
        end
      end

      def update
        author = Author.find(params[:id])
        if author.update_attributes(author_params)
          respond_with author, status: 200
        else
          respond_with author.errors, status: :unprocessable_entity
        end
      end

      def destroy
        author = Author.find(params[:id])
        author.destroy!
        render nothing:true, status: 204
      end

      def author_params
        params.require(:author).permit(:first_name, :last_name)
      end
    end
  end
end