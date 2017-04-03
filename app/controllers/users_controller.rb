class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @plants = @user.plants
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    @plants = @user.plants
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to home_index_path
      flash[:notice] = "Welcome! You have signed up successfully."
    else
      flash[:notice] = @user.errors.full_messages
      render :new
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :string, :last_name, :username, :string, :email, :string)
    end
end
