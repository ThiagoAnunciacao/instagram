class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def instagram
    client = Instagram.client(:access_token => request.env["omniauth.auth"]["credentials"]["token"])
    user = client.user

    @user = User.find_for_instagram_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Instagram") if is_navigational_format?
    else
      session["devise.instagram_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end