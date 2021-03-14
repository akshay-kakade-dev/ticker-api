class SheetProcessingJob < ApplicationJob
  def perform(company_id, object_key)
    Rails.logger.info "hi, configuration is right"
    import_service = ImportSharePrice.new(command_id, object_key)
    import_service.import

    if import_service.errors.present?
      # you can update import is failed.
      # we need to add is_success attribute in sheet_uploads table
    end
  end
end