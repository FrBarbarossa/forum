class Moderation < ApplicationRecord
  belongs_to :account
  belongs_to :section
  
  validates :account_id, uniqueness: { scope: :section_id }
end
  