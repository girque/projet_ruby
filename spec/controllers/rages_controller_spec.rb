require 'spec_helper'

describe RagesController, :type => :controller do

describe "Routage", :type => :routing do
  it "routage de / vers rages#index" do
    expect(:get => "/").to route_to(
      :controller => "rails/welcome",
      :action => "index"
    )
  end

  it "routage de /rages vers rages#index" do
    expect(:get => "/rages").to route_to(
      :controller => "rages",
      :action => "index"
    )
  end
  it "routage de /rages/new vers rages#new" do
    expect(:get => "/rages/new").to route_to(
      :controller => "rages",
      :action => "new"
    )
  end
  it "routage de /rages/1 vers rages#show" do
    expect(:get => "/rages/1").to route_to(
      :controller => "rages",
      :action => "show",
      :id => "1"
    )
  end
  it "routage de /rages/1/edit vers rages#edit" do
    expect(:get => "/rages/1/edit").to route_to(
      :controller => "rages",
      :action => "edit",
      :id => "1"
    )
  end
  it "routage de /rages vers rages#create" do
    expect(:post => "/rages").to route_to(
      :controller => "rages",
      :action => "create"
    )
  end
  it "routage de /rages/1 vers rages#update" do
    expect(:put => "/rages/1").to route_to(
      :controller => "rages",
      :action => "update",
      :id => "1"
    )
  end
  it "routage de /rages/1 vers rages#destroy" do
    expect(:delete => "/rages/1").to route_to(
      :controller => "rages",
      :action => "destroy",
      :id => "1"
    )
  end
end

end
