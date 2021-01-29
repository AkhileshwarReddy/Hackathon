module CollaborationServices
  class RemoveCollaborator
    include BaseService

    def initialize(params)
      @challenge = Challenge.find(params[:id])
      @user = params[:user]
    end

    def call
      Collaboration.where(challenge: @challenge, user: @user).destroy_all
    rescue StandardError => e
      Failure.new({ message: e.message })
    else
      Success.new({})
    end

    private

    attr_reader :challenge, :user
  end
end
