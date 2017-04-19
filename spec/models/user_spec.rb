require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    user_example = User.create(
      first_name: 'Jan',
      last_name: 'Wong',
      email: 'jan@test.com',
      password: 'testtest',
      password_confirmation: 'testtest'
    )
    user_example.save
  end

  describe 'Validations' do
    it 'should not save without a first name' do
      user = User.create(
        first_name: nil,
        last_name: 'test',
        email: 'test@test.com',
        password: 'test'
      )
      expect(user).to_not be_persisted
    end

    it 'should not save without a last name' do
      user = User.create(
        first_name: 'test',
        last_name: nil,
        email: 'test@test.com',
        password: 'test'
      )
      expect(user).to_not be_persisted
    end

    it 'should not save without an email' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: nil,
        password: 'test'
      )
      expect(user).to_not be_persisted
    end

    it 'should not save without a password' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: 'test@test.com',
        password: 'test'
      )
      expect(user).to_not be_persisted
    end

    it 'should not save if password and password confirmation dont match' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: 'test@test.com',
        password: 'helo',
        password_confirmation: 'helllo'
      )
      expect(user).to_not be_persisted
    end

    it 'must have a unique email' do
      user1 = User.create(
        first_name: 'test',
        last_name: 'test',
        email: 'janwong94@gmail.com',
        password: 'test',
      )

      user1.save

      user2 = User.create(
        first_name: 'test',
        last_name: 'test',
        email: 'janwong94@gmail.com',
        password: 'test',
      )
      expect(user2).to_not be_persisted
    end

    it 'should not save if password has less than 8 characters' do
      user = User.create(
        first_name: 'test',
        last_name: 'test',
        email: 'test@test.com',
        password: '1234567'
      )
      expect(user).to_not be_persisted
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should return user if email and password are correct' do
      user = User.authenticate_with_credentials('jan@test.com', 'testtest')

      expect(user).to be_instance_of User
    end

    it 'should return nil if email and password are incorrect' do
      user = User.authenticate_with_credentials('jan@test.com', 'wrong')

      expect(user).to be_nil
    end

    it 'should return user even if email has white spaces' do
      user = User.authenticate_with_credentials('  jan@test.com', 'testtest')

      expect(user).to be_instance_of User
    end


    it 'should return user even if email has wrong case' do
      user = User.authenticate_with_credentials('jAn@tESt.com', 'testtest')

      expect(user).to be_instance_of User
    end

  end

end
