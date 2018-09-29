require "rails_helper"

RSpec.describe "articles", :type => :request do
  it "creates an article and get the response as json" do
    headers = {
      "ACCEPT" => "application/json"
    }
    post "/articles", :params => {:article => {:title => "test title", :text => "test text"}}, :headers => headers
    article_response = JSON.parse(response.body)

    expect(article_response["title"]).to eq("test title")
    expect(article_response["text"]).to eq("test text")
    expect(Article.exists?(id: article_response["id"])).to eq(true)
  end
end
