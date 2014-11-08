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
      expect(Book.count).to eq(json(response.body).size)
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
      expect(json(response.body).size).to eq(json(response.body).size)
    end

    it "return response in JSON format" do
      expect(response.content_type).to eq(Mime::JSON)
    end
  end

  describe "add new book" do
    before do
      valid_attributes = FactoryGirl.build(:book).attributes
      post :create, {:book => valid_attributes}
    end

    it "returns a successful 201 response" do  
      expect(response.status).to eq(201)
    end

    it "return response in JSON format" do
      expect(response.content_type).to eq(Mime::JSON)
    end

    it "returns location" do
      book = json(response.body)
      expect(api_v1_book_url(book)).to eq(response.location)
    end
  end
end
