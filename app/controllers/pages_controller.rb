# -*- encoding : utf-8 -*-
class PagesController < ApplicationController

  before_filter :authenticate_user!, only: [:waitlist]

  def home
    # debugger
    # true
  end

  def waitlist
  end
end
