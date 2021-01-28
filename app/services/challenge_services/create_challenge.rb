require_relative '../base_service'

module ChallengeServices
  include BaseService

  class CreateChallenge
    attr_reader :params, :tags, :raw_tags

    def initialize(params)
      @params = params.except(:tags)
      @raw_tags = params[:tags].split(', ')
    end

    def call
      begin
        @challenge = Challenge.new(@params)
        @challenge.save

        create_tags
        create_tagged_challenges
      rescue StandardError => e
        BaseService::Failure.new({ message: e.message })
      else
        BaseService::Success.new({ id: @challenge.id })
      end
    end

    private

    def create_tags
      @tags = @raw_tags.map { |tag| Tag.find_or_create_by(name: tag) }
    end

    def create_tagged_challenges
      TaggedChallengeServices::CreateTaggedChallenges.new({ tags: @tags, challenge: @challenge }).call
    end
  end
end
