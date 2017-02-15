class MagicSet < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_many :magic_cards

  def slug_candidates
    [
      [:code, :name]
    ]
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
