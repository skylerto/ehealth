module Ehealth
  class Physician
    attr_accessor :id, :name, :type

    def initialize(id, name, type)
      if id < 0
        raise InvalidPhysicianIdError.new 'physician id must be a positive integer'
      elsif !valid_type? type
        raise InvalidPhysicianTypeError.new 'must be either a specialist or generalist'
      end

      @id = id
      @name = name
      @type = type
    end

    def to_s
      "#{@id}: #{@name} - #{@type}"
    end

    private

    def valid_type?(type)
      type == 'specialist' || type == 'generalist'
    end
  end
end

class InvalidPhysicianIdError < StandardError

end

class InvalidPhysicianTypeError < StandardError

end
