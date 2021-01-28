module ChallengesHelper
  def challenge_tags(challenge)
    TaggedChallenge.tags(challenge)
  end
end
