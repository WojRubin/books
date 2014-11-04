require 'spec_helper'

describe API::V1::BooksController, :type => :controller do

  before :each do
    FactoryGirl.create_list(:book, 10)
    get :index, format: :json
  end

  it "returns a successful 200 response" do  
    expect(response.status).to eq(200)
  end

  it "returns a count of books" do
    parse_body = JSON.parse(response.body)
    expect(Book.count).to eq(parse_body.size)
  end

  it "return response in JSON format" do
    expect(response.content_type).to eq(Mime::JSON)
  end
end
