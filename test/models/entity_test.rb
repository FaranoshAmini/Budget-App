require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  test 'entity should not be valid without a name' do
    entity = entity.new(author: User.first, name: '', amount: 100)

    assert_not entity.valid?
  end

  test 'entity should not be valid without a user' do
    entity = entity.new(name: 'Buy shoe', amount: 100)

    assert_not entity.valid?
  end

  test 'entity should be valid and saved in the database' do
    entity = entity.new(author: User.first, name: 'Buy shoe', amount: 100)

    assert entity.valid?
    assert entity.save
  end

  test 'first entity belong to the first user' do
    entity = entity.first
    user = User.first

    assert_equal entity.author, user
  end

  test 'should have at least one group' do
    entity = entity.first

    assert entity.groups.length.positive?
  end
end
