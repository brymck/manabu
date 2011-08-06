class ExamsController < ApplicationController
  def index
    @exams = Exam.find(:all)
  end

  def show
    @exam = Exam.find(params[:id])
    @title = @exam.name
    breadcrumbs.add @title, exam_path(@exam)
  end
end
