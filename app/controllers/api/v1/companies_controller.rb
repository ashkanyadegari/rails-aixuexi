class Api::V1::CompaniesController < Api::V1::BaseController
    skip_before_action :verify_authenticity_token, only: [:getcolleagues, :getcompany]

  def getcompany
    p params
    p params["code"]
    @company = Company.where(code: params["code"])
    @user = User.find(params["user"].to_i)
    @user.company_id = @company[0].id
    @user.save
    render json: {company: @company[0], status: :ok}
  end

  def getcolleagues
    company_id = params["company_id"]
    p company_id
    p company_id
    p company_id

    @users = User.where(company_id: company_id.to_i)
    @users = @users.order("user_points desc")
    render json: {users: @users}
  end

end
