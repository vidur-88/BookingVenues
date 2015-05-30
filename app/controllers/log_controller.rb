class LogController < ApplicationController
  def show
    @log = VizDoc.get_logs(params[:filename])
    render json: @log
  end
end
