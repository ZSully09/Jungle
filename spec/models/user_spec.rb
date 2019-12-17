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
end
