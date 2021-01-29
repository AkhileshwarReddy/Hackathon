module ChallengeServices
  class CreateChallenge
    include BaseService

    def initialize(params)
      @params = params.except(:tags)
      @raw_tags = params[:tags].split(', ')
    end

    def call
      @challenge = Challenge.new(@params)
      raise ActiveRecord::RecordInvalid unless @challenge.save

      create_tags
      create_tagged_challenges
    rescue ActiveRecord::RecordInvalid => e
      Failure.new({ message: e.message })
    rescue StandardError => e
      Failure.new({ message: e.message })
    else
      Success.new({ id: @challenge.id })
    end

    private

    attr_reader :params, :tags, :raw_tags

    def create_tags
      @tags = @raw_tags.map { |tag| Tag.find_or_create_by(name: tag) }
    end

    def create_tagged_challenges
      TaggedChallengeServices::CreateTaggedChallenges.new({ tags: @tags, challenge: @challenge }).call
    end
  end
end
