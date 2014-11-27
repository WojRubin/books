require 'spec_helper'

describe Api::V1::GenresController, :type => :controller  do
    describe "GET #index" do
    before :each do
      genres = create_list(:genre_with_books, 10)
      get :index, format: :json
    end

    it "returns a successful 200 response" do  
      expect(response.status).to eq(200)
    end

    it "returns a count of genres" do
      expect((json(response.body)[:genres]).size).to eq(Genre.count)
    end

    it "return response in JSON format" do
      expect(response.content_type).to eq(Mime::JSON)
    end
  end

  describe "GET #new" do
    before :each do
      genre = create(:genre_with_books)
      post :create, format: :json, genre: attributes_for(:genre_with_books)
    end

    it "returns a successful 201 response" do  
      expect(response).to have_http_status(:created)
    end

    it "return response in JSON format" do
      expect(response.content_type).to eq(Mime::JSON)
    end

    it "returns location" do
      id = json(response.body)[:genre][:id]
      expect(response.location).to eq(api_v1_genre_url(id))
    end
  end
  
  describe "delete genre" do
    before do
      @genre = create(:genre_with_books)
    end

    it "returns a 204 response" do  
      delete :destroy, id: @genre
      expect(response.status).to eq(204)
    end
  end

  describe "update genre" do
    before :each do
      @genre = create(:genre_with_books)
 
      @attr = attributes_for(:genre_with_books)
      patch :update, format: :json, id: @genre, :genre => @attr
    end

    it "returns a successful response" do 
      expect(response).to be_successful
    end
  
  end
  
end