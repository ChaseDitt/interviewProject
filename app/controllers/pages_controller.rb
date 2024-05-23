class PagesController < ApplicationController
  def login
    if user_signed_in?
      redirect_to home_path
    else
      @resource = User.new
      @resource_name = :user
      render 'login'
    end
  end

  def create
    if user_signed_in?
      redirect_to home_path
    else
      @resource = User.new
      @resource_name = :user
      render 'create'
    end
  end

  def home
    render 'home'
  end

  def card_create
    render 'card_create'
  end

  helper_method :resource, :resource_name

  private

  def resource
    @resource
  end

  def resource_name
    @resource_name
  end
end
