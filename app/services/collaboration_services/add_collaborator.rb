module CollaborationServices
  include BaseService

  class AddCollaborator
    def initialize(params)
      @challenge = Challenge.find(params[:id])
      @user = params[:user]
    end

    def call
      if Collaboration.exists?(user: @user, challenge: @challenge)
        BaseService::Failure.new({ message: 'You are already a collaborator to that challenge' })
      else
        begin
          collaboration = Collaboration.new(challenge: @challenge, user: @user)
          raise ActiveRecord::ActiveRecordError unless collaboration.save
        rescue StandardError => e
          BaseService::Failure.new({ message: e.message })
        else
          BaseService::Success.new({})
        end
      end
    end

    private

    attr_reader :challenge, :user
  end
end