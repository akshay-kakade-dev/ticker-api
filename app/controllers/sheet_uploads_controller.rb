class SheetUploadsController < ApplicationController

  def create
    sheet_upload = SheetUpload.new(sheet_params)
    if sheet_upload.save
      SheetProcessingJob.perform_later(sheet_upload.company, sheet_upload.object_key)
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