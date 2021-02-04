module CollaborationServices
  class AddCollaborator
    include BaseService

    def initialize(params)
      @challenge_id = params[:id]
      @user = params[:user]
    end

    def call
      if Collaboration.exists?(user: @user, challenge_id: @challenge_id)
        Failure.new({ message: 'You are already a collaborator to that challenge' })
      else
        begin
          @challenge = Challenge.find(@challenge_id)
          collaboration = Collaboration.new(challenge: @challenge, user: @user)
          raise StandardError unless collaboration.save
        rescue StandardError => e
          Failure.new({ message: e.message })
        else
          Success.new({ message: "You're now a collaborator to this challenge." })
        end
      end
    end

    private

    attr_reader :challenge, :challenge_id, :user
  end
end