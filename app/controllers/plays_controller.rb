class PlaysController < ApplicationController
  def index
    @plays = Play.all
    @images = ActiveStorage::Blob.order('RANDOM()').first(10)
    @image_urls = @images.map{ |image| rails_blob_url(image) }.to_json
  end

  def create
    @play = Play.new(play_params)

    if @play.save
      render json: { status: :ok }
    else
      render json: { status: :unprocessable_entity }
    end
  end

  private
    def play_params
      params.require(:play).permit(:timer, :url)
    end
end
