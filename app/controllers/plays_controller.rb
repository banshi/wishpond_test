class PlaysController < ApplicationController
  def index
    @plays = Play.all
    @images = ActiveStorage::Blob.order('RANDOM()').first(10)
  end

  def create
    @play = Play.new(play_params)

    if @play.save
      format.json { status: :ok }
    else
      format.json { status: :unprocessable_entity }
    end
  end

  private
    def play_params
      params.require(:play).permit(:timer, :url)
    end
end
