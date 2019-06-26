require 'rails_helper'

RSpec.describe UploadsController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Upload.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Upload" do
        expect {
          post :create, params: {upload: valid_attributes}, session: valid_session
        }.to change(Upload, :count).by(1)
      end

      it "redirects to the created upload" do
        post :create, params: {upload: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Upload.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {upload: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested upload" do
        upload = Upload.create! valid_attributes
        put :update, params: {id: upload.to_param, upload: new_attributes}, session: valid_session
        upload.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the upload" do
        upload = Upload.create! valid_attributes
        put :update, params: {id: upload.to_param, upload: valid_attributes}, session: valid_session
        expect(response).to redirect_to(upload)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        upload = Upload.create! valid_attributes
        put :update, params: {id: upload.to_param, upload: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

end
