require 'rails_helper'

RSpec.describe "sentences/show", type: :view do
  before(:each) do
    @sentence = assign(:sentence, Sentence.create!(
      :content => "Content",
      :user_id => "User",
      : => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/User/)
    expect(rendered).to match(/2/)
  end
end
