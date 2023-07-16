class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_entities, dependent: :destroy
  has_many :groups, through: :group_entities
  validates :name, :author, :amount, presence: true

  def date
    date = ''
    date += "#{created_at.day} "
    date += "#{Date::ABBR_MONTHNAMES[created_at.month]} "
    date += created_at.year.to_s
    date
  end
end
