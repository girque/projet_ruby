require 'spec_helper'

describe RagesController, :type => :controller do

describe "routing to rages", :type => :routing do
  it "routes /rages to rages#index" do
    expect(:get => "/rages").to route_to(
      :controller => "rages",
      :action => "index"
    )
  end

end

end
