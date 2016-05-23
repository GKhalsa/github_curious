class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :avatar
      t.string :uid
      t.string :oauth_token

      t.timestamps null: false
    end
  end
end
