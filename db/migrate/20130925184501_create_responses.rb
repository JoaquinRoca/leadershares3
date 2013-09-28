# -*- encoding : utf-8 -*-
class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :invite, null: false, index: true
      t.text       :scores
      t.timestamps
    end
  end
end
