class WelcomeController < ActionController::Base
  def index
    # @instagram = Instagram.user_recent_media("38536423", {:count => 1})
    # @instagram = Instagram.user_media_feed
    @instagram = Instagram.media_popular
  end
end