require 'rails_helper'

RSpec.describe "votes/show", type: :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :value => 2,
      :user_id => 3,
      :voteable_id => 4,
      :voteable_type => "Voteable Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Voteable Type/)
  end
end
