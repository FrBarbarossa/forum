class Topic < ApplicationRecord
    belongs_to :section
    has_many :messages

end
