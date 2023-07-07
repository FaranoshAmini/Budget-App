class Group < ApplicationRecord
    belongs_to :user
    has_many :entities
    validates :name, :user, presence: true
    validates :icon, presence: true
end
