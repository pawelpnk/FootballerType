class UsersController < ApplicationController
    def index
        @users_top = User.all.order("rate DESC").take(10)
    end
end
