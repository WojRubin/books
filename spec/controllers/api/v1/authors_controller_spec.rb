require 'spec_helper'

describe Api::V1::AuthorsController, :type => :controller do
  before :each do
      authors = create_list(:author, 5)
      get :index, format: :json
    end

  describe "GET #index" do
    it "returns a succesful 200 response" do
      expect(response.status).to eq(200)
    end

    it "returns a count of authors" do
      expect((json(response.body)[:authors]).size).to eq(Author.count)
    end

    it "return response in JSON format" do
      expect(response.content_type).to eq(Mime::JSON)
    end
  end

  describe "GET #new" do
    before :each do
      post :create, format: :json, author: attributes_for(:author)
    end

    it "returns a succesful 201 response" do
      expect(response.status).to eq(201)
    end

    it "returns a response in Json format" do
      expect(response.content_type).to eq(Mime::JSON)
    end

    it "returns location" do
      id = json(response.body)[:author][:id]
      expect(response.location).to eq(api_v1_author_url(id))
    end
  end

  describe "delete author" do
    before do
      @author = create(:author)
    end

    it "returns a 204 response" do  
      delete :destroy, id: @author
      expect(response.status).to eq(204)
    end
  end

  describe "update author" do
    before :each do
      @author = create(:author)
      @attr = attributes_for(:author)
      patch :update, format: :json, id: @author, :author => @attr
    end

    it "returns a successful response" do 
      expect(response).to be_successful
    end
  
  end
end