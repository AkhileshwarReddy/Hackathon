module ChallengesHelper
  def challenge_tags(challenge_id)
    TaggedChallenge.tags(challenge_id)
  end

  def challenge_collaborators(challenge_id)
    Challenge.collaborators(challenge_id)
  end

  def is_a_collaborator?(challenge_id, user_id)
    Challenge.collaborators(challenge_id).any? { |collaborator| collaborator.id == user_id }
  end

  def voted?(challenge_id, user_id)
    Challenge.find(challenge_id).votes.any? { |vote| vote.user.id == user_id }
  end
end
