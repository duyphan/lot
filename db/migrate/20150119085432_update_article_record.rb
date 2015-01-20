class UpdateArticleRecord < ActiveRecord::Migration
  def change
  	remove_column :articles, :type
  	add_column :articles, :a_type, :string
  end
end
