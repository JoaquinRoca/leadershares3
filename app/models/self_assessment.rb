class SelfAssessment

  def self.create(response, user)
    invite = user.find_or_create_self_invite
    response.invite = invite
    response.save
  end
end
