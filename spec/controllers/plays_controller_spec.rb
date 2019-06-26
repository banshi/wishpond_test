require 'rails_helper'

RSpec.describe PlaysController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Play.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested play" do
        play = Play.create! valid_attributes
        put :update, params: {id: play.to_param, play: new_attributes}, session: valid_session
        play.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the play" do
        play = Play.create! valid_attributes
        put :update, params: {id: play.to_param, play: valid_attributes}, session: valid_session
        expect(response).to redirect_to(play)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        play = Play.create! valid_attributes
        put :update, params: {id: play.to_param, play: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

end
