class ListingsController < ApplicationController
  before_action :set_user, only: [:show]

  include Response
  include ExceptionHandler

  def index
    @users = []
    User.all.each { |user| @users << user.as_string }
    @users.join("\n")
    json_response(@users)
  end

  def show
    json_response(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
