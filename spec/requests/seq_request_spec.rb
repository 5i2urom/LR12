# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Seqs', type: :request do
  describe 'GET /input' do
    it 'returns http success' do
      get '/input'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /show' do
    context 'returns http success' do
      let(:num_params) { 3 }
      let(:str_params) { '5 6 5' }
      before { post show_path, params: { num: num_params, str: str_params }, xhr: true }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders show templates' do
        expect(response).to render_template(:show)
      end

      it 'responds with turbo stream' do
        expect(response.content_type).to match(%r{text/vnd.turbo-stream.html})
      end

      it 'assigns valid model object' do
        expect(assigns(:seq).valid?).to be true
      end
    end
  end
end
