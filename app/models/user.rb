# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base

  has_many :invites

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info

    user = User.where(email: data['email']).first

    # TODO store name, gender, etc.
    unless user
      user = User.create({
        email: data['email'],
        password: Devise.friendly_token[0, 20]
      })
    end

    user
  end

  def is_admin?
    User.admins.include? email
  end

  def self.admins
    ENV['LEADERSHARES_ADMINS'] ? ENV['LEADERSHARES_ADMINS'].split(/[,\s]+/) : []
  end

  def self_response
    find_or_create_self_invite.response
  end

  def find_or_create_self_invite
    invites.find_or_create_by(relationship: 'self')
  end
end
