module VoteService
  include BaseService

  class Upvote
    def initialize(params)
      @challenge = Challenge.find(params[:id])
      @user = params[:user]
      @how = params[:how]
    end

    def call
      @vote = Vote.new(challenge: @challenge, user: @user)
      raise StandardError unless @vote.save
    rescue StandardError => e
      BaseService::Failure.new({ message: e.message })
    else
      BaseService::Success.new({})
    end

    private

    attr_reader :challenge, :user, :how
  end
end
