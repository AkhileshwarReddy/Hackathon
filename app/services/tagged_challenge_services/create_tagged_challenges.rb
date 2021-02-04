module TaggedChallengeServices

  class CreateTaggedChallenges
    include BaseService

    def initialize(params)
      @tags = params[:tags]
      @challenge = params[:challenge]
    end

    def call
      @tags.map { |tag| TaggedChallenge.find_or_create_by(challenge: @challenge, tag: tag) }
    rescue StandardError => e
      Failure.new({ message: e.message })
    else
      Success.new({ message: 'Challenge is tagged' })
    end

    private

    attr_reader :tags, :challenge
  end
end
