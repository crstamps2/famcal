require 'rails_helper'

RSpec.describe API::EventsController, type: :controller do

  let(:valid_attributes) {
    JSON.parse(file_fixture("invitee_created.json").read)
  }

  let(:invalid_attributes) { {} }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Event.create!(payload: valid_attributes)
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      event = Event.create!(payload: valid_attributes)
      get :show, params: {id: event.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, params: valid_attributes, session: valid_session
        }.to change(Event, :count).by(1)
      end
    end
  end
end
