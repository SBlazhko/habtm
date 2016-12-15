class CreatePostAndCategory < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps null: false
    end
 
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.timestamps null: false
    end
 
    create_table :categories_posts, id: false do |t|
      t.belongs_to :post, index: true
      t.belongs_to :category, index: true
    end
  end
end
