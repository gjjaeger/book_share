class Sentence < ApplicationRecord
  belongs_to :story
  belongs_to :user
  validates :content, :presence => true
  has_many :votes, as: :voteable, dependent: :destroy

  def up_votes
    votes.where(value: 1).count
  end
  def down_votes
    votes.where(value: -1).count
  end
  def points
    self.votes.sum(:value)
  end
  def update_rank
    new_rank = self.points
    story=self.story
    self.update_attribute(:rank, new_rank)
    if new_rank > 0
      self.update_attribute(:confirmed, true)
      sentences = story.sentences
      sentences.each do |sentence|
        if sentence.confirmed == nil
          sentence.update_attribute(:confirmed, false)
        end
      end
    end
  end
end
