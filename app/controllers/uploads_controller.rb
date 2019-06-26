class UploadsController < ApplicationController
  def index
    @images = ActiveStorage::Blob.all
  end

  def create
    @upload = Upload.new(upload_params)

    if @upload.save
      redirect_to uploads_path, notice: 'Upload was successfully updated'
    else
      redirect_to uploads_path, error: 'An error occurred, please try again'
    end
  end

  private
    def upload_params
      params.require(:upload).permit(images: [])
    end
end
