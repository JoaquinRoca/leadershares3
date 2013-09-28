# -*- encoding : utf-8 -*-
class SelfAssessmentsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :ensure_beta_user
  before_filter :ensure_self_assessment, only: [:show]
  before_filter :ensure_no_self_assessment, only: [:new, :create]

  def new
    @response = Response.new
  end

  def create
    @response = Response.new response_params

    if SelfAssessment.create @response, current_user
      redirect_to self_assessment_path
    else
      render :new
    end
  end

  def show
    # TODO load data for assessment chart.
  end

  protected

  def response_params
    params.require(:response).permit(:q1, :q2, :q3)
  end

  def ensure_beta_user
    redirect_to waitlist_path unless current_user.beta_user?
  end

  def ensure_self_assessment
    redirect_to new_self_assessment_path unless current_user.self_response
  end

  def ensure_no_self_assessment
    redirect_to self_assessment_path if current_user.self_response
  end
end
