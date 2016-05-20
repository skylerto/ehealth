module Ehealth
  class Interactions

    attr_accessor :interactions

    def initialize
      @interactions = []
    end

    def add_interaction(medicine1, medicine2)
      medicine1.add_interaction(medicine2)
      medicine2.add_interaction(medicine1)
      @interactions << [medicine1, medicine2]
    end
  end
end
