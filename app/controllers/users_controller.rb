class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy ]
  before_action :authorize, except: %i[new create]
  before_action :no_authorize, only: %i[new create]

  def show
    @users = User.all
    render xml: @users
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)    
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Добро пожаловать, #{@user.name}!"
      redirect_to root_path
    else
      redirect_to new_user_path, notice: 'Ошибка во вводе данных или вы уже зарегистрированы'
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
