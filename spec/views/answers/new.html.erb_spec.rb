require 'spec_helper'

describe "answers/new.html.erb" do
  before(:each) do
    assign(:answer, stub_model(Answer,
      :content => "MyText",
      :correct => false,
      :question => nil
    ).as_new_record)
  end

  it "renders new answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => answers_path, :method => "post" do
      assert_select "textarea#answer_content", :name => "answer[content]"
      assert_select "input#answer_correct", :name => "answer[correct]"
      assert_select "input#answer_question", :name => "answer[question]"
    end
  end
end
