module Ehealth
  class Medicine
    attr_accessor :id, :name

    def initialize(id, name)
      if id < 0
        raise InvalidMedicineIdError.new 'medication id must be a positive integer'
      end

      @id = id
      @name = name
    end
  end
end

class InvalidMedicineIdError < StandardError
end
