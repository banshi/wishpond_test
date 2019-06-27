require 'rails_helper'

RSpec.describe PlaysController, type: :controller do
  let!(:plays) { FactoryBot.create_list(:play, 5) }
  let!(:upload) do
    FactoryBot.create(:upload,
      images: [fixture_file_upload('spec/images/test.jpg', 'image/jpg')]
    )
  end

  let(:valid_attributes) { {
    play: { timer: 1, url: 'www.test.com/test.png' }
  } }

  let(:invalid_attributes) { { play: { timer: 1 } } }

  describe 'GET #index' do
    before { get :index }

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'assigns correctly plays' do
      expect(assigns(:plays).count).to eq(5)
      expect(assigns(:plays)).to eq(Play.all)
    end

    it 'assigns correctly images' do
      expect(assigns(:images).count).to eq(1)
      expect(assigns(:images)).to eq(ActiveStorage::Blob.all)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'POST #create' do

    context 'with valid params' do
      let(:create_request) { post :create, params: valid_attributes }

      it 'creates a new Play' do
        expect { create_request }.to change(Play, :count).by(1)
      end

      it 'returns a success response' do
        create_request
        expect(response).to be_successful
      end
    end

    context 'with invalid params' do
      let(:invalid_create_request) { post :create, params: invalid_attributes }

      it "doesn't create a new Play" do
        expect { invalid_create_request }.to_not change(Play, :count)
      end

      it 'returns a success response' do
        invalid_create_request
        expect(response).to have_http_status(422)
      end
    end
  end

end
