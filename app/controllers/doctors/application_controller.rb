Class Users::ApplicationController  < ApplicationController
    before_action :authenticate_doctor!, except: :index
end