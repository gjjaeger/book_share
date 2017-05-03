class Story < ApplicationRecord
  has_many :sentences, dependent: :destroy
  belongs_to :user
  has_many :votes, as: :voteable, dependent: :destroy

  # default_scope { order('votes DESC')}
  def up_votes
    votes.where(value: 1).count
  end
  def down_votes
    votes.where(value: -1).count
  end
  def points
    votes.sum(:value)
  end
  def update_rank
    new_rank = points
    update_attribute(:rank, new_rank)
  end
end
