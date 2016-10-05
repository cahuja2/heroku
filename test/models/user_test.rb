require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "test", email: "foo@bar.com", password: "12345", password_confirmation: "12345")
  end
  
  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.name = " "
    assert_not @user.valid?  
  end
  
    test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  
  test "email should be unique" do
    dupli = @user.dup
    @user.save
    assert_not dupli.valid?
  end  

  # test "email validation should accept valid addresses" do
  #   valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
  #                        first.last@foo.jp alice+bob@baz.cn]
  #   valid_addresses.each do |valid_address|
  #     @user.email = valid_address
  #     assert @user.valid?, "#{valid_address.inspect} should be valid"
  #   end
  # end
end
