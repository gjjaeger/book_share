class AddRankToSentences < ActiveRecord::Migration[5.0]
  def change
    add_column :sentences, :rank, :float
  end
end
