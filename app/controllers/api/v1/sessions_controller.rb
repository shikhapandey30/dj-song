class Api::V1::SessionsController < Api::V1::ApiController
  skip_before_action  :verify_authenticity_token 
  # before_action :authenticate_user!, only: [:destroy]
  before_action :authenticate_user!, except: [:create]

  # ====================Sign IN====================================
  
  def create
    begin
      return render json: {status: 401, data: {user: nil}, message: "Request Parameter not valid"} unless params[:user]
      email = params[:user][:email]
      password = params[:user][:password]
      return render json: {status: 401, data: {user: nil}, message: "The request must contain the email and password."} unless email && password
      @user = User.where(email: email).first
      return render json: {status: 401, data: {user: nil}, message: "Invalid email or password"} if @user.blank?
      return render json: {status: 401, data: {user: nil}, message: "Invalid email or password"} if not @user.valid_password?(password)
      return render json: {status: 200, data: {user: current_user}, message: "You have allready Login."} if current_user
      sign_in @user
     
      # @user = @user.as_json(only: [:id,:email, :email,:name,:address,:role,:authentication_token, :image, :created_at])
      return render json: {status: 200, data: {user: @user}, message: "Login Successful"}
    rescue
      rescue_section
    end
  end

  def destroy
  end
end
