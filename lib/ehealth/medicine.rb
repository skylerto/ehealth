module Ehealth
  class Medicine
    attr_accessor :id, :name, :interactions

    def initialize(id, name)
      if id < 0
        raise InvalidMedicineIdError.new 'medication id must be a positive integer'
      end

      @id = id
      @name = name
      @interactions = []
    end

    def to_s
      "#{@id}: #{@name}"
    end

    def interacts_with(medicine)
      if @interactions.include?(medicine)
        raise InteractionExistsError.new 'interaction already exists'
      end
      @interactions << medicine
    end
  end
end

class InvalidMedicineIdError < StandardError
end

class InteractionExistsError < StandardError

end
