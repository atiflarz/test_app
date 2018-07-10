class OrganizationsController < ApplicationController

  # GET /organizations/new

  def index

  end
  def new
    @organization = Organization.new
    @organization.build_address
    @organization.build_profile
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)
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

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:org_name, :org_idetifier, address_attributes: [:line1, :line2, :city, :state, :country, :zip], profile_attributes: [:first_name, :last_name])
    end
end
