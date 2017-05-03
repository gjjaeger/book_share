class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :voteable, polymorphic: true
  after_save :update_voteable

  private
  def update_voteable
    voteable.update_rank
  end
end
