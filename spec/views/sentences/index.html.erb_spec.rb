require 'rails_helper'

RSpec.describe "sentences/index", type: :view do
  before(:each) do
    assign(:sentences, [
      Sentence.create!(
        :content => "Content",
        :user_id => "User",
        : => 2
      ),
      Sentence.create!(
        :content => "Content",
        :user_id => "User",
        : => 2
      )
    ])
  end

  it "renders a list of sentences" do
    render
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
