require 'spec_helper'

describe "answers/edit.html.erb" do
  before(:each) do
    @answer = assign(:answer, stub_model(Answer,
      :content => "MyText",
      :correct => false,
      :question => nil
    ))
  end

  it "renders the edit answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => answers_path(@answer), :method => "post" do
      assert_select "textarea#answer_content", :name => "answer[content]"
      assert_select "input#answer_correct", :name => "answer[correct]"
      assert_select "input#answer_question", :name => "answer[question]"
    end
  end
end
