class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_is_admin!
  before_action :set_user, except: [:index, :new, :create]

  def index
    @users = User.all
  end

  def edit
  end

  def new
    @user = current_user.users.new
  end

  def create
    @user = current_user.new(user_params)
    if @user.save
      redirect_to admin_index_path(@user)
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirct_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
