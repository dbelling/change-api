require 'rails_helper'

RSpec.describe ChangeController, type: :controller do
  describe 'GET index' do
    it 'is successful' do
      get :index
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json['message']).to eq('Welcome to the Change API!')
    end
  end

  describe 'GET show' do
    it 'is successful' do
      get :show
      expect(response.status).to eq(200)
    end
  end

  describe 'POST create' do
    it 'is successful' do
      post :create
      expect(response.status).to eq(201)
    end
  end
end
