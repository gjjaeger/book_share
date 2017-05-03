require 'rails_helper'

RSpec.describe "sentences/edit", type: :view do
  before(:each) do
    @sentence = assign(:sentence, Sentence.create!(
      :content => "MyString",
      :user_id => "MyString",
      : => 1
    ))
  end

  it "renders the edit sentence form" do
    render

    assert_select "form[action=?][method=?]", sentence_path(@sentence), "post" do

      assert_select "input#sentence_content[name=?]", "sentence[content]"

      assert_select "input#sentence_user_id[name=?]", "sentence[user_id]"

      assert_select "input#sentence_[name=?]", "sentence[]"
    end
  end
end
