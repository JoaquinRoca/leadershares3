# -*- encoding : utf-8 -*-
class Response < ActiveRecord::Base

  belongs_to :invite

  serialize :scores, Hash

  attr_accessor :q1, :q2, :q3

  # TODO before save, store q1-qN in scores.
  # {
  #   raw_scores: {q1: 74, q2: 12},
  #   averages: { ... }
  # }
end
