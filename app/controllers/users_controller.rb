class UsersController < Clearance::UsersController

  before_action :set_user, only: [:create, :show, :edit, :update, :destroy]

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def show
    @user = current_user
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :birthdate, :gender, :image)
  end

end
