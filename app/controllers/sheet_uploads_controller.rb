class SheetUploadsController < ApplicationController

  # uploads sheet from UI with company id, sidekiq job will process the sheet pload part.
  # before going to process the sheet, we should check the headers first. That is not implemeted yet
  def create
    sheet_upload = SheetUpload.new(sheet_params)
    if sheet_upload.save
      SheetProcessingJob.perform_later(sheet_upload.company_id, sheet_upload.object_key)
      render json: { message: 'Sheet uploaded, wait we will process the sheet and let you know' }, status: 201
    else
      render json: { message: sheet_upload.errors.full_messages.flatten.presence }, status: :unprocessable_entity
    end
  end

  private

  def sheet_params
    params.require(:sheet_params).permit(:company_id, :object_key)
  end
end