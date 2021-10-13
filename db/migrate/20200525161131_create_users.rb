class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :username
      t.text :email
      t.text :password_digest 
      t.integer :credit
      t.text :role
      t.timestamps
    end
  end
end
