class Group < ApplicationRecord
    validates :name, :user, presence: true
    validates :icon, presence: true
end
