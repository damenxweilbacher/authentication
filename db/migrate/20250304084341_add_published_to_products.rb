class AddPublishedToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :user, :published, :boolean
  end
end
