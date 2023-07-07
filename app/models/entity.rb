class Entity < ApplicationRecord
  has_many :group_entities, foreign_key: :entity_id
  belongs_to :author, class_name: 'User'
  has_many :groups, through: :group_entities, foreign_key: :entity_id
  validates :name, :author, :group, :amount, presence: true

  def date
    date = ''
    date += "#{created_at.day} "
    date += "#{Date::ABBR_MONTHNAMES[created_at.month]} "
    date += created_at.year.to_s
    date
  end
end
