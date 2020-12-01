class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @users = User.all
    p @users
    p @users
    render json: @users #Just for testing
  end

  def show
    render json: @user #Just for testing
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {status: :created}
    else
      render_error
    end
  end

  def update
    if @user.update(user_params)
      render json: {user: @user, status: :updated}
    else
      render_error
    end
  end

  def destroy
    @user.destroy
    render json: {status: :deleted}
  end

  def get_id
    @user = User.where(open_id: params[:open_id])
    render json: @user #Just for testingg
  end

  private

  def user_params
    params.require(:user).permit(:open_id, :name, :company_id, :avatar, :user_points)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_user
    @user = User.find(params[:id])
  end
end
