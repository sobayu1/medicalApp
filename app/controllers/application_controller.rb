class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        added_attrs = [ :name, :sex, :birth_date, :name, :email, :password, :password_confirmation, :image, tag_ids: []]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end

    #ログイン後に遷移するpathを設定
    def after_sign_in_path_for(resource)
        case resource
        when User
            user_path(resource.id)
        when Doctor
            doctor_path(resource.id)
        end

    end

    #ログアウト後に遷移するpathを設定
    def after_sign_out_path_for(resource)
        root_path
        
    end

    # def user_redirect_session
    #     redirect_to new_user_session_path unless user_signed_in?
    # end

    # def doctor_redirect_session
    #     redirect_to new_doctor_session_path unless doctor_signed_in?
    # end
        

end
