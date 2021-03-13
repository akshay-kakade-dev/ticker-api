class SheetProcessingJob < ApplicationJob
  def perform(company, object_key)
    Rails.logger.info "hi, configuration is right"
  end
end