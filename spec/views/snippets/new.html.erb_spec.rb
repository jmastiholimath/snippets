require 'rails_helper'

RSpec.describe "snippets/new", type: :view do
  before(:each) do
    assign(:snippet, Snippet.new(
      :description => "MyText",
      :private => false
    ))
  end

  it "renders new snippet form" do
    render

    assert_select "form[action=?][method=?]", snippets_path, "post" do

      assert_select "textarea#snippet_description[name=?]", "snippet[description]"

      assert_select "input#snippet_private[name=?]", "snippet[private]"
    end
  end
end
