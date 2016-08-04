class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :delete]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy, :index]

  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.paginate(page: params[:page], :per_page => 15)
    @review  = current_user.reviews.build
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #create cart
      @cart = Cart.create!(user_id: @user.id)
      log_in @user
      flash[:success] = 'Welcome to Redmart!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated Successfully"
      redirect_to @user
    else
      render 'edit'
    end
    end

  def destroy
    User.find(params[:id]).destroy
   flash[:success] = "User deleted"
   redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
    #Before filters

    # Confirms the correct user.
        def correct_user
          @user = User.find(params[:id])
          redirect_to root_url unless current_user?(@user)
        end

    # Confirms an admin user.
        def admin_user
         redirect_to root_url unless current_user.admin?
       end

end
