# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = t('not_authorized')
    redirect_back_or_to(root_path)
  end
end
