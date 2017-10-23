class ChangeController < ApplicationController
  before_action :parse_change

  def show
    render json: @quantities.to_json
  end

  def create
    render json: @quantities.to_json, status: :created
  end

  def index
    render json: {'message': 'Welcome to the Change API!'}, status: :ok
  end

  private

  def change_params
    params.permit(:amount)
  end

  def parse_change
    @change_amount = change_params[:amount].to_f
    @quantities = ChangeService.make_change(@change_amount)
  end
end
