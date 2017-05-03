require 'rails_helper'

RSpec.describe "votes/edit", type: :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :value => 1,
      :user_id => 1,
      :voteable_id => 1,
      :voteable_type => "MyString"
    ))
  end

  it "renders the edit vote form" do
    render

    assert_select "form[action=?][method=?]", vote_path(@vote), "post" do

      assert_select "input#vote_value[name=?]", "vote[value]"

      assert_select "input#vote_user_id[name=?]", "vote[user_id]"

      assert_select "input#vote_voteable_id[name=?]", "vote[voteable_id]"

      assert_select "input#vote_voteable_type[name=?]", "vote[voteable_type]"
    end
  end
end
