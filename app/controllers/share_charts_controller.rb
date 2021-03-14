class ShareChartsController < ApplicationController
  def show
    data = TimeSeries.get_graph_data(graph_params)
    render json: { data: data }, status: 200
  end

  private

  def graph_params
    params.permit(:display_type, :symbol)
  end
end