class ChangeConfirmedToSentences < ActiveRecord::Migration[5.0]
  def change
    change_column_default :sentences, :confirmed, false
  end
end
