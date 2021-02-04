module VoteServices
  class Downvote
    include BaseService

    def initialize(params)
      @challenge = Challenge.find(params[:id])
      @user = params[:user]
    end

    def call
      raise StandardError if @user.nil? || @challenge.nil?

      return Failure.new({ message: 'You cannot vote your own challenge.' }) if @challenge.user == @user

      Vote.where(challenge: @challenge, user: @user).destroy_all
    rescue StandardError => e
      Failure.new({ message: e.message })
    else
      Success.new({ message: 'Your vote has been removed for the challenge successfully.' })
    end

    private

    attr_reader :challenge, :user
  end
end
