class CreateAttractions < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions do |t|
      t.text :site
      t.text :comments
      t.integer :destination_id
      t.integer :category_id
    end
  end
end
