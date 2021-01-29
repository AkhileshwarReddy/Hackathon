module ChallengesHelper
  def challenge_tags(challenge)
    TaggedChallenge.tags(challenge)
  end

  def challenge_votes(challenge)
    Challenge.vote_count(challenge)
  end
end
