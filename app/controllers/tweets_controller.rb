class TweetsController < ApplicationController

  def tweet
    @listing = Tweet.new(twitter_params[:message])
    Twitterbot.update(@listing.tweet)
  end

  def twitter_params
    params.require(:tweet).permit(:message)
  end

end