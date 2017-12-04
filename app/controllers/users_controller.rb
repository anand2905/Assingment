class UsersController < ApplicationController
	def index
		@users = User.all
		@users_with_active_add=User.joins(:addresses).where('addresses.is_active=?',true)
		@users_with_non_active_add=User.joins(:addresses).where('addresses.is_active=?',false)
		@user_without_address=[]
         @users.each do |u|
         if u.addresses.empty?
          @user_without_address<<u
        end
      end
	end

	def new
		@user=User.new
		@user.addresses.build		
	end
	def show
		
		@user=User.find(params[:id])
		@addresses=@user.addresses
	end

	def create
		
		 @user=User.new(user_params)
		 if @user.save
		 	redirect_to users_path
		 end
	end

	def edit
		@user = User.find_by(id: params[:id])
        @addresses=@user.addresses
	end

	def destroy
		@user=User.find_by(id: params[:id])
        if @user
		@user.destroy
		redirect_to users_path
	end
	end
	def update
     @user = User.find(params[:id]).update(user_params)
    
    redirect_to users_path
  end
	private
	def user_params
		params.require(:user).permit(:name, :image, :addresses_attributes => [:id, :country, :state, :city, :is_active])
		
	end
end
