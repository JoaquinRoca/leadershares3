# -*- encoding : utf-8 -*-
class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :user, null: false, index: true
      t.string     :email
      t.string     :relationship
      t.string     :code, null: false
      t.timestamps
    end

    add_index :invites, :code, unique: true
  end
end
