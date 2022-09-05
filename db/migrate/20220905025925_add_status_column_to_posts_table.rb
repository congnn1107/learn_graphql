class AddStatusColumnToPostsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :status, :integer, nil: true, default: 0
  end
end
