class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home, :card_create, :create_card, :show_card]

  layout 'base', only: [:home, :card_create, :show_card]

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
    @recent_cards = TradingCard.includes(:user).order(created_at: :desc).limit(10)
  end

  def card_create
    @trading_card = TradingCard.new
  end

  def create_card
    @trading_card = current_user.trading_cards.build(trading_card_params)
    if @trading_card.save
      redirect_to trading_card_path(@trading_card), notice: 'Trading card was successfully created.'
    else
      render :card_create
    end
  end

  def show_card
    @recent_cards = current_user.trading_cards.order(created_at: :desc).limit(10).offset(params[:page].to_i * 10)
  end

  helper_method :resource, :resource_name

  private

  def resource
    @resource
  end

  def resource_name
    @resource_name
  end

  def trading_card_params
    params.require(:trading_card).permit(:name, :front_image, :back_image, :move1_name, :move1_description, :move2_name, :move2_description, :color)
  end

end
