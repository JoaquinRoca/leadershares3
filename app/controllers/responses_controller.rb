# -*- encoding : utf-8 -*-
class ResponsesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_beta_user
  before_filter :ensure_self_assessment, only: [:show]

  def new
  end

  def show
  end

  protected
  def ensure_beta_user
    redirect_to waitlist_path unless current_user.beta_user?
  end

  def ensure_self_assessment
    redirect_to new_response_path unless current_user.assessment_done?
  end

end
