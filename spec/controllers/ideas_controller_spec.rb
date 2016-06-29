require "rails_helper"

RSpec.describe Api::V1::IdeasController do
  it "returns all ideas in descending order of their create time" do
    Idea.create(title: "this idea", body: "beautimous")
    Idea.create(title: "rocks", body: "throw them")
    get :index, format: :json
    expect(response).to have_http_status(:success)
    ideas = JSON.parse(response.body, symbolize_names: true)
    expect(ideas.first[:title]).to eq "rocks"
    expect(ideas.last[:body]).to eq "beautimous"
  end

  it "returns a single idea" do
    idea = Idea.create(title: "great idea", body: "this thing")

    get :show, id: idea.id, format: :json
    expect(response).to have_http_status(:success)
    item = JSON.parse(response.body, symbolize_names: true)
    expect(item[:title]).to eq "great idea"
  end

  it "deletes an idea" do
    idea = Idea.create(title: "delete me", body: "do it")

    expect(Idea.count).to eq 1

    delete :destroy, id: idea.id, format: :json
    expect(response).to have_http_status(:success)
    expect(Idea.count).to eq 0
  end

  it "creates an idea" do
    expect(Idea.count).to eq 0
    post :create, format: :json, idea: { title: "Idea", body: "this idea"}
    expect(response).to have_http_status(:success)

    expect(Idea.count).to eq 1
    expect(Idea.last.title).to eq "Idea"
  end

  it "updates an idea" do
    idea = Idea.create(title: "yoyo", body: "this is great")
    expect(idea.quality).to eq "swill"
    patch :update, format: :json, id: idea.id, quality: 1
    expect(response).to have_http_status(:success)
    expect(Idea.find(idea.id).quality).to eq "plausible"
  end
end
