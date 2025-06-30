class CompaniesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_company, only: %i[ update destroy ]
  layout "companies"

  def index
  end

  def get_companies
    companies = Company.order(created_at: :desc)
    render json: companies, status: :ok
  end

  def create
    company = Company.new(company_params)
    if company.save
      render json: company, status: :created
    else
      render json: { error: company.errors }, status: :unprocessable_entity
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
