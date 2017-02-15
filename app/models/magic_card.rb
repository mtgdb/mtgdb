class MagicCard < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :magic_set

  def slug_candidates
    [
      [magic_set.name, :name]
    ]
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
