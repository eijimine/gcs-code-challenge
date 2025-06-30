class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ update destroy ]
  layout "companies"

  def index
    @companies = Company.all
  end

  def create
    company = Company.new(company_params)
    if company.save
      render json: company, status: :created
    else
      render json: company.errors, status: :unprocessable_entity
    end
  end

  def update
    if @company.update(company_params)
      render json: @company, status: :ok
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy!
      head :no_content
  end

  private
    def set_company
      @company = Company.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Company not found" }, status: :not_found
    end

    def company_params
      params.require(:company).permit(:name, :latitude, :longitude)
    end
end
