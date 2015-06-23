class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :facebook, :all

# Twitter ne fournit pas d'emails... qui est notre identifiant : on doit donc le traiter à part
  def twitter
    twitter_email_safe = true
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      if user.email.blank?
        flash.notice = "Complete your identity ( Twitter does'nt allow us to get your email )"
        twitter_email_safe = false
      end
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

end