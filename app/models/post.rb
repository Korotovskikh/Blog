class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :commentators, through: :comments, source: :user

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 90 }
  validates :body, presence: true, length: { maximum: 5_000 }

  scope :by_moderators, -> { joins(:user).where(users: {moderator: true}) }

  has_one :seo, as: :seoable
end
