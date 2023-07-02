class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :valid_admin?

  def valid_admin?
    current_user.admin?
  end
end
