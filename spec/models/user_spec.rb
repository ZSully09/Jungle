require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do @user = User.new(first_name: 'Bob', last_name: 'Saget', email: 'therealbob@saget.com', password: 'IAmBobSaget', password_confirmation: 'IAmBobSaget')
  end
  describe 'Validations' do

    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it "is not valid without a first name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without a last name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without a email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "is not valid with an email that has already been used" do
      @user.save
      user1 = User.new(first_name: 'Bob', last_name: 'Saget', email: 'therealbob@saget.com', password: 'IAmBobSaget', password_confirmation: 'IAmBobSaget')
      expect(user1).to_not be_valid
    end

    it "is not valid without a password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it "is not valid with a short password" do
      @user.password = 'bob'
      expect(@user).to_not be_valid
    end

    it "is not valid without a password confirmation" do
      @user.password_confirmation = nil
      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    
    it 'should return the correct user given their credentials' do
      @user.save
      expect(
        User.authenticate_with_credentials('therealbob@saget.com', 'IAmBobSaget')
      ).to be_a(User)
    end

    it 'should ignore whitespace on login' do
      @user.save
      expect(
        User.authenticate_with_credentials('   therealbob@saget.com  ', 'IAmBobSaget')
      ).to be_a(User)
    end

    it 'should ignore uppercase on login' do
      @user.save
      expect(
        User.authenticate_with_credentials('therealbob@SAGET.com', 'IAmBobSaget')
      ).to be_a(User)
    end
  end
end
