require 'rails_helper'

RSpec.describe "sentences/new", type: :view do
  before(:each) do
    assign(:sentence, Sentence.new(
      :content => "MyString",
      :user_id => "MyString",
      : => 1
    ))
  end

  it "renders new sentence form" do
    render

    assert_select "form[action=?][method=?]", sentences_path, "post" do

      assert_select "input#sentence_content[name=?]", "sentence[content]"

      assert_select "input#sentence_user_id[name=?]", "sentence[user_id]"

      assert_select "input#sentence_[name=?]", "sentence[]"
    end
  end
end
