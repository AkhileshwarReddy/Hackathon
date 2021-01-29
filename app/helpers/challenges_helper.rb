module ChallengesHelper
  def challenge_tags(challenge)
    TaggedChallenge.tags(challenge)
  end

  def challenge_votes(challenge)
    Challenge.vote_count(challenge)
  end

  def challenge_collaborators(challenge)
    Challenge.collaborators(challenge)
  end

  def is_a_collaborator?(challenge, user)
    Challenge.collaborators(challenge).any? { |collaborator| collaborator.id == user.id }
  end

  def has_voted?(challenge, user)
    challenge.votes.any? { |vote| vote.user == user }
  end
end
