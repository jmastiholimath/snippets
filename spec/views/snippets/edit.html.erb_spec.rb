require 'rails_helper'

RSpec.describe "snippets/edit", type: :view do
  before(:each) do
    @snippet = assign(:snippet, Snippet.create!(
      :description => "MyText",
      :private => false
    ))
  end

  it "renders the edit snippet form" do
    render

    assert_select "form[action=?][method=?]", snippet_path(@snippet), "post" do

      assert_select "textarea#snippet_description[name=?]", "snippet[description]"

      assert_select "input#snippet_private[name=?]", "snippet[private]"
    end
  end
end
