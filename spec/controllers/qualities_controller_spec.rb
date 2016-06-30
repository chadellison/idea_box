require "rails_helper"

RSpec.describe Api::V1::QualitiesController do
  it "returns all ideas in descending order filtered by the quality" do
    Idea.create(title: "this idea", body: "beautimous", quality: 1)
    Idea.create(title: "adsfad", body: "swift", quality: 0)
    Idea.create(title: "rocks", body: "throw them", quality: 1)
    Idea.create(title: "thing", body: "fast", quality: 2)

    get :index, format: :json, quality: "1"
    expect(response).to have_http_status(:success)
    ideas = JSON.parse(response.body, symbolize_names: true)
    expect(ideas.count).to eq 2
    expect(ideas.first[:title]).to eq "rocks"
    expect(ideas.last[:body]).to eq "beautimous"
  end
end
