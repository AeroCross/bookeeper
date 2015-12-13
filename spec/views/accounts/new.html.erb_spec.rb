require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  before(:each) do
    assign(:account, Account.new(
      :user_id => "",
      :type => "",
      :balance => 1
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input#account_user_id[name=?]", "account[user_id]"

      assert_select "input#account_type[name=?]", "account[type]"

      assert_select "input#account_balance[name=?]", "account[balance]"
    end
  end
end
