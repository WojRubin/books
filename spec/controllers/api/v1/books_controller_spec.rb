require 'spec_helper'

describe Api::V1::BooksController, :type => :controller do

  describe "GET #index" do
    before :each do
      FactoryGirl.create_list(:book, 10)
      get :index, format: :json
    end

    it "returns a successful 200 response" do  
      expect(response.status).to eq(200)
    end

    it "returns a count of books" do
      expect((json(response.body)[:books]).size).to eq(Book.count)
    end

    it "return response in JSON format" do
      expect(response.content_type).to eq(Mime::JSON)
    end
  end

  describe "filtered by author" do
    before do
      @books = create_list(:book, 10)
      get :index, author: '2author', format: :json
    end
    
    it "returns a successful 200 response" do  
      expect(response.status).to eq(200)
    end

    it "returns a count of books" do
      expect((json(response.body)).size).to eq(1)
    end

    it "return response in JSON format" do
      expect(response.content_type).to eq(Mime::JSON)
    end
  end

  describe "add new book" do
    before :each do
      post :create, format: :json, :book => {author: 'Alf', genre: 'sf'}
    end

    it "returns a successful 201 response" do  
      expect(response).to have_http_status(:created)
    end

    it "return response in JSON format" do
      expect(response.content_type).to eq(Mime::JSON)
    end

    it "returns location" do
      id = json(response.body)[:book][:id]
      expect(response.location).to eq(api_v1_book_url(id))
    end
  end
  
  describe "delete book" do
    before do
      @book = create(:book)
    end

    it "returns a 204 response" do  
      delete :destroy, id: @book
      expect(response.status).to eq(204)
    end


  
  end
end
