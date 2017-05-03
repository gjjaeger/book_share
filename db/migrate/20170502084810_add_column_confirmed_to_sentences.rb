class AddColumnConfirmedToSentences < ActiveRecord::Migration[5.0]
  def change
    add_column :sentences, :confirmed, :boolean
  end
end
