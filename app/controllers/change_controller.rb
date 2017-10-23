class ChangeController < ApplicationController
  def show
    render json: {}, status: :ok
  end

  def create
    render json: {}, status: :created
  end

  def index
    render json: {'message': 'Welcome to the Change API!'}, status: :ok
  end
end
