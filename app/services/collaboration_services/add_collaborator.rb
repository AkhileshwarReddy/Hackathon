module CollaborationServices
  class AddCollaborator
    include BaseService

    def initialize(params)
      @challenge = Challenge.find(params[:id])
      @user = params[:user]
    end

    def call
      if Collaboration.exists?(user: @user, challenge: @challenge)
        Failure.new({ message: 'You are already a collaborator to that challenge' })
      else
        begin
          collaboration = Collaboration.new(challenge: @challenge, user: @user)
          raise ActiveRecord::ActiveRecordError unless collaboration.save
        rescue StandardError => e
          Failure.new({ message: e.message })
        else
          Success.new({})
        end
      end
    end

    private

    attr_reader :challenge, :user
  end
end