class ImportSharePrice
  def initialize(company_id, object_key)
    @object_key = object_key
    @share_data = CSV.open("#{Rails.public_path.to_s}/ticker_data/#{object_key}", col_sep: "\t", headers: :first_row).map {|row| row.to_h.slice("timestamp", "price").merge(company_id: company_id)}
  end

  def import
    TimeSeries.insert_all(@share_data)
  end
end