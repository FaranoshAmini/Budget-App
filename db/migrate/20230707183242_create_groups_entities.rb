class CreateGroupsEntities < ActiveRecord::Migration[7.0]
  def change
    create_join_table :entities, :groups do |t|
      t.index [:entity_id, :group_id], unique: true
      t.foreign_key :entities
      t.foreign_key :groups
    end
  end
end
