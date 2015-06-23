class AddAdminUser < ActiveRecord::Migration
  def self.up
    user = User.create!(:email => 'admin@admin.com', :password => 'password', :admin => true)
  end

  def self.down
    user = User.find(1)
    user.destroy
  end
end
