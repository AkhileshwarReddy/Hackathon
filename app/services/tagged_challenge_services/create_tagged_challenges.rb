require_relative '../base_service'

module TaggedChallengeServices
  include BaseService

  class CreateTaggedChallenges
    def initialize(params)
      @tags = params[:tags]
      @challenge = params[:challenge]
    end

    def call
      @tags.map { |tag| TaggedChallenge.find_or_create_by(challenge: @challenge, tag: tag) }
    rescue StandardError => e
      BaseService::Failure.new({ message: e.message })
    else
      BaseService::Success.new({})
    end

    private

    attr_reader :tags, :challenge
  end
end
