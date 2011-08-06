class LevelsController < ApplicationController
  before_filter { get_exam(params[:exam_id]) }
  before_filter :add_breadcrumbs

  def index
    breadcrumbs.add t(:levels), exam_levels_path
    @levels = @exam.levels
  end

  def show
    @level = Level.find params[:id]
    breadcrumbs.add @level.name, exam_level_path(@exam, @level)
  end

  private

  def get_exam(exam_id)
    @exam = Exam.find exam_id
  end

  def add_breadcrumbs(*url_params)
    breadcrumbs.add @exam.name, exam_path(@exam)
  end
end
