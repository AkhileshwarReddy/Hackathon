module CollaborationServices
  class RemoveCollaborator
    include BaseService

    def initialize(params)
      @challenge_id = params[:id]
      @user = params[:user]
    end

    def call
      raise StandardError if @user.nil? || @challenge_id.nil?

      @challenge = Challenge.find(@challenge_id)
      Collaboration.where(challenge: @challenge, user: @user).destroy_all
    rescue StandardError => e
      Failure.new({ message: e.message })
    else
      Success.new({ message: 'Your collaboration has been removed for this challenge.' })
    end

    private

    attr_reader :challenge, :challenge_id, :user
  end
end
