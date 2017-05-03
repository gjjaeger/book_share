class AddColumnImageLink < ActiveRecord::Migration[5.0]
  def change
    add_column :sentences, :image, :string
  end
end
