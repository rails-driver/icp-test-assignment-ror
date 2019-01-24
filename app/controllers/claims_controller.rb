class ClaimsController < ApplicationController
  include Companies
  before_action :set_claim, only: %i[show]

  # GET /companies/1/claims
  def index
    @claims = @company.claims.all

    render json: @claims
  end

  # GET0 /companies/1/claims/1
  def show
    render json: @claim
  end

  # POST /companies/1/claims
  def create
    @claim = @company.claims.build(claim_params)

    if @claim.save
      render json: @claim, status: :created, location: [@company, @claim]
    else
      render json: @claim.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_claim
    @claim = @company.claims.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def claim_params
    params.require(:claim).permit(:price_drop, :percentage_drop, :status, :cap_drop, :traded_inflation, :signed_losses, :total_potential_income, :current_potential_income, :data_provided, :likely_bookbuild)
  end
end
