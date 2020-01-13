class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.text :country
      t.text :city
      t.integer :user_id
    end
  end
end
