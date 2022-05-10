require 'rails_helper'

describe 'User' do

  describe 'Validate' do

    it 'should not create new user with differen passowrd and password confirmation field' do      
      @user = User.new(firstname:'James', lastname: 'Daniels', email: 'test1@test.com', password: 'test', password_confirmation: 'test2')
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should not create new user with blank passowrd and password confirmation field' do      
      @user = User.new(firstname:'James', lastname: 'Daniels', email: 'test1@test.com', password: nil, password_confirmation: 'test2')
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should not create new user with password length less then minimum three characters' do      
      @user = User.new(firstname:'James', lastname: 'Daniels', email: 'test1@test.com', password: 'bl', password_confirmation: 'bl')
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end


    describe '.authenticate_with_credentials' do
      it 'should return user object with valid login details' do      
        @user = User.new(firstname:'James', lastname: 'Daniels', email: 'test@tester.com', password: 'test123', password_confirmation: 'test123')
        @user.save
        @user = User.authenticate_with_credentials('test@tester.com', 'test123');
        expect(@user.firstname).to eq('James')
      end

      it 'should return nil with invalid login details' do      
        @user = User.new(firstname:'James', lastname: 'Daniels', email: 'test@tester.com', password: 'test123', password_confirmation: 'test123')
        @user.save
        @user = User.authenticate_with_credentials('test@tester.com', 'test1234');
        expect(@user).to eq(nil)
      end

      it 'should authenticate user with blank spaces in front and back of the email field' do
        @user = User.new(firstname:'James', lastname: 'Daniels', email: 'test@tester.com', password: 'test123', password_confirmation: 'test123')
        @user.save
        @user = User.authenticate_with_credentials('      test@tester.com        ', 'test123');
        expect(@user.firstname).to eq('James')
      end

      it 'should authenticate user with wrong case email field' do
        @user = User.new(firstname:'James', lastname: 'Daniels', email: 'test@tester.com', password: 'test123', password_confirmation: 'test123')
        @user.save
        @user = User.authenticate_with_credentials('TEST@TESTER.COM', 'test123');
        expect(@user.firstname).to eq('James')
      end

    end

  end

end
