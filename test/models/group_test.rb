require 'test_helper'

class groupTest < ActiveSupport::TestCase
  test 'should not be valid without a name' do
    group = group.new(author: User.first, name: '', icon: 'shopping')
    assert_not group.valid?
  end

  test 'should not be valid without an icon' do
    group = group.new(author: User.first, name: 'Shopping', icon: '')
    assert_not group.valid?
  end

  test 'should not be valid without a user' do
    group = group.new(name: 'Shopping', icon: 'shopping')
    assert_not group.valid?
  end

  test 'should be valid and saved in the database' do
    group = group.new(author: User.first, name: 'Rent', icon: 'rent')
    assert group.valid?
    assert group.save
  end

  test 'should have list of group in the database' do
    group = group.all
    assert_equal group.length, 2
  end

  test 'should have first group belong to the first user' do
    group = group.first
    user = User.first

    assert_equal group.author, user
  end

  test 'should have entities belong to the first group' do
    group = group.first

    assert group.entities.length.positive?
  end
end