require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:bank_accounts)}
    #this is to test the association
    #must create both user and bank acct before run this test
    #long way to do this is test user and account and see if they have the same id
  end
end
