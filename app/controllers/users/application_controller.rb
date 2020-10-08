Class Users::ApplicationController  < ApplicationController
    before_action :authenticate_user!, except: 
end
