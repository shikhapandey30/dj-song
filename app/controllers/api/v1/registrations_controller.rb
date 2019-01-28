class Api::V1::RegistrationsController < Api::V1::ApiController
  skip_before_action  :verify_authenticity_token 

	def create
    user = User.new(registration_params)
     if user.save
   
      # user = user.as_json(only: [:id,:email, :username,:name,:address,:role,:authentication_token, :image, :created_at])
      return render json: {status: 200, data: {user: user}, :message =>"Successfuly Signup"} 
    else
      warden.custom_failure!
      return render json: {status: 401, data: {user: nil, errors: user.errors}, :message =>"SignUp Rollback"} 
    end
  end

  
   private
  
    def registration_params
      params.require(:user).permit(:email, :first_name, :second_name, :name_label, :country, :state, :facebook_url, :instagram_url, :twitter_url, :name_club, :role, :password, :password_confirmation, :first_name, :last_name, :image, :name, :description, :address, :role, :status)
    end
end
