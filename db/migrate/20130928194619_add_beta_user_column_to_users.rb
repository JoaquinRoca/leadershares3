class AddBetaUserColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :beta_user, :boolean, default: false
  end
end
