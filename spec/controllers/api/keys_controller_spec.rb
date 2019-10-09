require 'rails_helper'

describe API::KeysController, type: :controller do

  let(:valid_attributes) { 
    {
      name: 'dad_api_key',
      value: 'somevaluehere'
    }
  }

  let(:other_valid_attributes) { 
    {
      name: 'mom_api_key',
      value: 'someothervaluehere'
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      value: nil
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Key.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #save_keys" do
    fit "returns a success response" do
      expect {
        post :save_keys, params: {keys: {dadAPIKey: valid_attributes, momAPIKey: other_valid_attributes}}, session: valid_session
      }.to change(Key, :count).by(2)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      key = Key.create! valid_attributes
      get :show, params: {id: key.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Key" do
        expect {
          post :create, params: {key: valid_attributes}, session: valid_session
        }.to change(Key, :count).by(1)
      end

      it "renders a JSON response with the new key" do

        post :create, params: {key: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.location).to eq(api_key_url(Key.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new key" do

        post :create, params: {key: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested key" do
        key = Key.create! valid_attributes
        put :update, params: {id: key.to_param, key: new_attributes}, session: valid_session
        key.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the key" do
        key = Key.create! valid_attributes

        put :update, params: {id: key.to_param, key: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the key" do
        key = Key.create! valid_attributes

        put :update, params: {id: key.to_param, key: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested key" do
      key = Key.create! valid_attributes
      expect {
        delete :destroy, params: {id: key.to_param}, session: valid_session
      }.to change(Key, :count).by(-1)
    end
  end

end
