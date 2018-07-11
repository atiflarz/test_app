class OrganizationsController < ApplicationController
  before_action :check_organization, only: [:new]
  before_action :set_pagination_params, only: [:index, :search]
  # GET /organizations/new

  def index
    @organizations = Organization.all.paginate(page: @page, per_page: @page_length)
  end

  def new
    @organization = current_user.build_organization if current_user.organization.blank?
    @organization.build_address
    @organization.build_profile
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = current_user.build_organization(organization_params)
    respond_to do |format|
      if @organization.save
        format.html { redirect_to root_path, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  def search

    @organizations = Organization.includes(:user, :address)
    @organizations = @organizations.where(org_name: params[:org_name]) if params[:org_name].present?
    @organizations = @organizations.where(users: {id: params[:user_id]}) if params[:user_id].present?
    @organizations = @organizations.where(addresses: {country: params[:country]}) if params[:country].present?
    @organizations = @organizations.paginate(page: @page, per_page: @page_length) if params[:page_length].present?
    render :index
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:org_name, :org_idetifier, address_attributes: [:line1, :line2, :city, :state, :country, :zip], profile_attributes: [:first_name, :last_name])
    end

    def check_organization
      redirect_to root_path, error: 'You have already created organization' if current_user.organization.present?
    end

    def set_pagination_params
      @page = params[:page].present? ? params[:page] : 1
      @page_length = params[:page_length].present? ? params[:page_length].to_i : 30
    end
end
