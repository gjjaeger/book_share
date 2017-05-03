require 'rails_helper'

RSpec.describe "votes/index", type: :view do
  before(:each) do
    assign(:votes, [
      Vote.create!(
        :value => 2,
        :user_id => 3,
        :voteable_id => 4,
        :voteable_type => "Voteable Type"
      ),
      Vote.create!(
        :value => 2,
        :user_id => 3,
        :voteable_id => 4,
        :voteable_type => "Voteable Type"
      )
    ])
  end

  it "renders a list of votes" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Voteable Type".to_s, :count => 2
  end
end
