require 'rails_helper'

RSpec.describe "accounts/index", type: :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        :user_id => "",
        :type => "",
        :balance => 1
      ),
      Account.create!(
        :user_id => "",
        :type => "",
        :balance => 1
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
