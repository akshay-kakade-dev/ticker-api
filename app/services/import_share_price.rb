require 'csv'

class ImportSharePrice
  def initialize(company_id, object_key)
    @object_key = object_key
    @company_id = company_id
  end

  def import
    @share_data = CSV.open("#{Rails.public_path.to_s}/ticker_data/#{@object_key}", col_sep: "\t", headers: :first_row).map do |row|
      row = row.to_h
      {
        price: row["price"].to_f,
        value_at: Time.at(row["value_at"].to_i),
        company_id: @company_id,
        created_at: DateTime.now,
        updated_at: DateTime.now
      }
    end
    @share_data.sort_by! {|share_data| share_data[:value_at]}
    TimeSeries.insert_all!(@share_data)
  end
end