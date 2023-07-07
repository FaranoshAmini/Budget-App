require 'test_helper'

class GroupEntityTest < ActiveSupport::TestCase
  test 'should not be valid without a group and entity' do
    group_entity = groupentity.new

    assert_not group_entity.valid?
  end

  test 'should be valid and saved in the database' do
    group_entity = groupentity.new(group: group.first, entity: entity.first)

    assert group_entity.valid?
    assert group_entity.save
  end

  test 'should belong to the first group in the database' do
    group_entity = groupentity.first
    group = group.first
    assert_equal group_entity.group, group
  end

  test 'should belong to the first entity in the database' do
    group_entity = groupentity.first
    entity = entity.first
    assert_equal group_entity.entity, entity
  end
end