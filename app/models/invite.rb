# -*- encoding : utf-8 -*-
# email, relationship, code
class Invite < ActiveRecord::Base

  require 'random_attribute'
  include RandomAttribute

  belongs_to :user
  has_one :response

  before_validation :generate_code, on: :create

  validates_uniqueness_of :code
  validates_format_of :code, with: /\A[a-fA-F0-9]{40}\Z/

  private

  def generate_code
    generate_unique_random_hex(:code, 40) if self.code.blank?
  end
end
