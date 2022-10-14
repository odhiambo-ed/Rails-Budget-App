class UsersController < ApplicationController
    def Index
        @user = current_user
    end

end
