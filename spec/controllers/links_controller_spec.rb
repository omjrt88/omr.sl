require 'rails_helper'
require 'pry'

RSpec.describe LinksController, type: :controller do
  Link.delete_all
  Rails.application.load_seed
  context "Index action =>" do
    it 'returns 100 urls' do
      get :index
      expect(controller.instance_variable_get(:@top_links).count).to eq(100)
    end
  end

  context "Show action =>" do
    it 'Accesses changed' do
      link = Link.last
      get :show, params: {token: link.token}, format: :html
      expect(controller.instance_variable_get(:@link).accesses).not_to eq(link.accesses)
    end

    it 'Accesses Incremented' do
      link = Link.last
      get :show, params: {token: link.token}, format: :html
      expect(controller.instance_variable_get(:@link).accesses).to eq(link.accesses+1)
    end
  end

  context "Create action =>" do
    it 'Adding new url' do
      headers = {
        "ACCEPT" => "application/json",     # This is what Rails 4 accepts
        "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
      }
      post  "create", :params => {:link => {:in_url => "www.youtube.com"}}, :headers => headers
      expect(response).to redirect_to(assigns(:link))
    end
  end
end