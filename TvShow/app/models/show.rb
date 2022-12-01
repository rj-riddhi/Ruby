class Show < ApplicationRecord
  belongs_to :channel

  validates :name, :start_time, :end_time, :channel_id, presence: true

  def self.search(search)
    joins(:channel).where('shows.name like (?) OR channels.name like (?)', "%#{search}%", "%#{search}%")
  end

  acts_as_favoritable

end
