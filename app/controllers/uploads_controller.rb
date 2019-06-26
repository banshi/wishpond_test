class UploadsController < ApplicationController
  before_action :set_upload, only: [:update]

  def index
    @uploads = Upload.all
  end

  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_upload
      @upload = Upload.find(params[:id])
    end

    def upload_params
      params.fetch(:upload, {})
    end
end
