require 'spec_helper'

describe "answers/show.html.erb" do
  before(:each) do
    @answer = assign(:answer, stub_model(Answer,
      :content => "MyText",
      :correct => false,
      :question => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
