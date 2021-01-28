module BaseService
  class Status
    attr_accessor :success

    def success?
      @success
    end
  end

  class Success < Status
    attr_accessor :data

    def initialize(params)
      @success = true
      @data = params
    end
  end

  class Failure < Status
    attr_accessor :errors

    def initialize(params)
      @success = false
      @errors = params
    end
  end
end
