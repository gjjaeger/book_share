class DeleteConfirmedFromSentences < ActiveRecord::Migration[5.0]
  def change
    remove_column :sentences, :confirmed
  end
end
