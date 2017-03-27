require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :user => nil,
      :post => nil,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_user_id[name=?]", "post[user_id]"

      assert_select "input#post_post_id[name=?]", "post[post_id]"

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "textarea#post_body[name=?]", "post[body]"
    end
  end
end
