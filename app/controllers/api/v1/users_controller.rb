class Api::V1::UsersController < Api::V1::ApiController
    before_action :authenticate_user!

	def index
      return render json: {status: 200, data: {user: User.all}, :message =>"Successfuly Signup"} 

	end
end
