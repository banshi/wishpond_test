class PlaysController < ApplicationController
  before_action :set_play, only: [:update]

  def index
    @plays = Play.all
  end

  def create
    @play = Play.new(play_params)

    respond_to do |format|
      if @play.save
        format.html { redirect_to @play, notice: 'Play was successfully created.' }
        format.json { render :show, status: :created, location: @play }
      else
        format.html { render :new }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_play
      @play = Play.find(params[:id])
    end

    def play_params
      params.fetch(:play, {})
    end
end
