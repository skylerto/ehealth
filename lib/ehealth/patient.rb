module Ehealth

  ##
  # Represents a patient within the system.
  class Patient
    attr_accessor :id, :name

    def initialize(id, name)
      if id < 0
        raise InvalidPatientIdError.new 'Invalid id'
      end
      @id = id
      @name = name
    end

    def to_s
      "#{@id}: #{@name}"
    end

  end
end

##
# Raised when a patient is created with an invalid id
class InvalidPatientIdError < StandardError
end

