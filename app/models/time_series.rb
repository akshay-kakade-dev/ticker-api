class TimeSeries < ApplicationRecord
  belongs_to :company

  # method will return data in the both cases hours and daily
  # we can split this method into two different methods.
  # we can remove the while logic in differnt method.
  def self.get_graph_data(graph_params)
    company = Company.find_by(symbol: graph_params[:symbol])
    first_timestamp = company.time_series.first.value_at
    time_duration = graph_params[:display_type] == 'hours' ? 1.hour : 1.day
    last_timestamp = first_timestamp + time_duration
    end_timestamp = company.time_series.last.value_at
    data = []
    records = company.time_series.where(value_at: first_timestamp..last_timestamp)

    while(records.present? || last_timestamp < end_timestamp)
      if records.present?
        time_range = "#{first_timestamp.strftime("%D")} - #{last_timestamp.strftime("%D")}"
        average = records.average(:price)
        data.push({x: time_range, y: average})
      end
      first_timestamp = last_timestamp
      last_timestamp = first_timestamp + time_duration
      records = company.time_series.where(value_at: first_timestamp..last_timestamp)
    end
    data
  end
end
