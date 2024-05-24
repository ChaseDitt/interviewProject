class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:login, :create] # Ensure user is authenticated for all actions except login and create
  before_action :set_trading_card, only: [:edit_card, :update_card, :destroy_card] # Set the trading card for specified actions

  layout 'base', only: [:home, :card_create, :show_card] # Ensures the header is showing on the pages it is needed (home page, card creation page, and user cards page)

  # Method for get call when user logs in
  def login
    if user_signed_in? # Ensures redirect only if there is a successful login
      redirect_to home_path
    else
      @resource = User.new # Initialize a new user resource for the login form
      @resource_name = :user
      render 'login'
    end
  end

  # Method for get call when user clicks new account
  def create
    if user_signed_in? # Ensures redirect only if there is a successful login
      redirect_to home_path
    else
      @resource = User.new # Initialize a new user resource for the sign up form
      @resource_name = :user
      render 'create'
    end
  end

  def home
    @recent_cards = TradingCard.includes(:user).order(created_at: :desc).limit(10) # Fetches the most recent 10 cards
  end

  def card_create
    @trading_card = TradingCard.new # Initialize a new trading card for the form
  end

  def create_card
    @trading_card = current_user.trading_cards.build(trading_card_params) # Build a new trading card associated with the current user
    if @trading_card.save
      redirect_to trading_card_path(@trading_card), notice: 'Trading card was successfully created.' # Redirect to the created card's show page, notice doesnt show yet needs to be added in html
    else
      render :card_create # Render the card creation form again if save fails
    end
  end

  def show_card
    @recent_cards = current_user.trading_cards.order(created_at: :desc).limit(10).offset(params[:page].to_i * 10) # Renders the most recent 10 cards, the functionality is set to be used with pages but ran out of time to implement pages
  end

  def update_card
    if @trading_card.update(trading_card_params) # Using new params updates the current card
      redirect_to trading_card_path, notice: 'Trading card was successfully updated.' # Redirect to the show_cards page, notice doesnt show yet needs to be added in html
    else
      render :edit_card # Render the edit card form again if update fails
    end
  end

  def destroy_card
    @trading_card = TradingCard.find(params[:id]) # Find the card using its ID
    @trading_card.destroy # Remove card from the database
    redirect_to home_path, notice: 'Trading card was successfully deleted.' # Redirect to the home page, notice doesnt show yet needs to be added in html
  end


  helper_method :resource, :resource_name # Make resource and resource_name available as helper methods

  private

  def resource
    @resource
  end

  def resource_name
    @resource_name
  end

  def set_trading_card
    @trading_card = TradingCard.find(params[:id])
  end

  def trading_card_params
    params.require(:trading_card).permit(:name, :front_image, :back_image, :move1_name, :move1_description, :move2_name, :move2_description, :color) # Permit these parameters for trading card
  end

end
