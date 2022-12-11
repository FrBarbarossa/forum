class Moderation < ApplicationRecord
  belongs_to :account
  belongs_to :section
end
  