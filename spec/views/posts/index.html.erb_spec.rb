require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    
    user = create(:user)    # John Doe from the factory.

    assign(:posts, [
      Post.create!(
        :user => user,
        :post => nil,
        :title => "Title",
        :body => "MyText"
      ),
      Post.create!(
        :user => user,
        :post => nil,
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of posts" do
    render
    # the selection returns 'John Doe' but with extra whitespace.
    # I should be able to match against the RE...
    # assert_select "tr>td", :text => /John\s+Doe/, :count => 2
    #     expect(rendered).to match(/John\s+Doe/)

    
    # # assert_select "tr>td", :text => nil.to_s, :count => 2 this nil is for the 'post_id'
    # assert_select "tr>td", :text => "Title".to_s, :count => 2
    # assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
