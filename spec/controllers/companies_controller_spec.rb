require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  let!(:company) { Company.create!(name: "Test Company", latitude: 40.7128, longitude: -74.0060) }

  describe "GET #get_companies" do
    it "returns a list of companies" do
      get :get_companies
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).length).to eq(1)
    end
  end

  describe "POST #create" do
    context "when valid attributes are provided" do
      it "creates a new company" do
        expect {
          post :create, params: { company: { name: "New Company", latitude: 34.0522, longitude: -118.2437 } }
        }.to change(Company, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['name']).to eq("New Company")
      end
    end

    context "when invalid attributes are provided" do
      it "returns an error" do
        post :create, params: { company: { name: nil, latitude: nil, longitude: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['error']).to be_present
      end
    end
  end

  describe "PATCH #update" do
    context "when valid attributes are provided" do
      it "updates the company" do
        patch :update, params: { id: company.id, company: { name: "Updated Company" } }
        company.reload
        expect(company.name).to eq("Updated Company")
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['name']).to eq("Updated Company")
      end
    end

    context "when invalid attributes are provided" do
      it "returns an error" do
        put :update, params: { id: company.id, company: { name: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['error']).to be_present
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the company" do
      expect {
        delete :destroy, params: { id: company.id }
      }.to change(Company, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end

  describe "GET #index" do
    it "returns a 200 status" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
