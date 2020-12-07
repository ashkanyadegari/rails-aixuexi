class Api::V1::CompaniesController < Api::V1::BaseController
    skip_before_action :verify_authenticity_token, only: [:getcolleagues]

  def getcolleagues
    company_id = 1
    @users = User.where(company_id: company_id)
    render json: {users: @users}
  end

end
