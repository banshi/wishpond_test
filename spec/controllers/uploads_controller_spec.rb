require 'rails_helper'

RSpec.describe UploadsController, type: :controller do
  let!(:upload) do
    FactoryBot.create(:upload,
      images: [fixture_file_upload('spec/images/test.jpg', 'image/jpg')]
    )
  end

  let(:valid_attributes) { {
    images: [fixture_file_upload('spec/images/test.jpg', 'image/jpg')]
  } }

  describe 'GET #index' do
    before { get(:index) }

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'returns all imges' do
      expect(assigns(:images).count).to eq(1)
      expect(assigns(:images)).to eq(ActiveStorage::Blob.all)
    end
  end

  describe 'POST #create' do
    let(:create_request) { post :create, params: {upload: valid_attributes} }

    it 'creates a new Upload' do
      expect { create_request }.to change(Upload, :count).by(1)
    end

    it 'creates new image' do
      expect { create_request }.to change(ActiveStorage::Blob, :count).by(1)
    end

    it 'redirects to the created upload' do
      create_request
      expect(response).to redirect_to(uploads_path)
    end
  end
end
