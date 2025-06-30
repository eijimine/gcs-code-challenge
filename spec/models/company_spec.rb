require 'rails_helper'

RSpec.describe Company, type: :model do
  describe "validations" do
    it "is valid with a name, latitude, and longitude" do
      company = Company.new(name: "Test Company", latitude: 35.0, longitude: -95.0)
      expect(company).to be_valid
    end

    describe "name" do
      it "is invalid without a name" do
        company = Company.new(name: nil, latitude: 35.0, longitude: -95.0)
        company.valid?
        expect(company.errors[:name]).to include("can't be blank")
      end
    end

    describe "latitude" do
      it "is invalid without latitude" do
        company = Company.new(name: "Test Company", latitude: nil, longitude: -74.0060)
        company.valid?
        expect(company.errors[:latitude]).to include("can't be blank")
      end

      it "is invalid with latitude less than -90" do
        company = Company.new(name: "Test Company", latitude: -100, longitude: -74.0060)
        company.valid?
        expect(company.errors[:latitude]).to include("must be greater than or equal to -90")
      end

      it "is invalid with latitude greater than 90" do
        company = Company.new(name: "Test Company", latitude: 100, longitude: -74.0060)
        company.valid?
        expect(company.errors[:latitude]).to include("must be less than or equal to 90")
      end
    end

    describe "longitude" do
      it "is invalid without longitude" do
        company = Company.new(name: "Test Company", latitude: 40.7128, longitude: nil)
        company.valid?
        expect(company.errors[:longitude]).to include("can't be blank")
      end

      it "is invalid with longitude less than -180" do
        company = Company.new(name: "Test Company", latitude: 40.7128, longitude: -181)
        company.valid?
        expect(company.errors[:longitude]).to include("must be greater than or equal to -180")
      end

      it "is invalid with longitude greater than 180" do
        company = Company.new(name: "Test Company", latitude: 40.7128, longitude: 181)
        company.valid?
        expect(company.errors[:longitude]).to include("must be less than or equal to 180")
      end
    end
  end
end
