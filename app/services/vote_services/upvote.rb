module VoteServices

  class Upvote
    include BaseService

    def initialize(params)
      @challenge = Challenge.find(params[:id])
      @user = params[:user]
      @how = params[:how]
    end

    def call
      if Vote.exists?(challenge: @challenge, user: @user)
        Failure.new({ message: "You've voted this challenge already" })
      else
        begin
          @vote = Vote.new(challenge: @challenge, user: @user)
          raise StandardError unless @vote.save
        rescue StandardError => e
          Failure.new({ message: e.message })
        else
          Success.new({})
        end
      end
    end

    private

    attr_reader :challenge, :user, :how
  end
end
