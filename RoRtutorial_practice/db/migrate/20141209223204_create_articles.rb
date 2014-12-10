class CreateArticles < ActiveRecord::Migration
  def change
    #drop_table :articles
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
