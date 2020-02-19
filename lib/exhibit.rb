class Exhibit

  attr_reader :name,
              :cost
              
    def initialize(arguments)
      @name = arguments[:name]
      @cost = arguments[:cost]
    end

end
