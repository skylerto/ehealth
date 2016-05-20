module Ehealth

  ##
  # Keeps track fo many patients.
  class Patients
    attr_accessor :patients
    def initialize
      @patients = []
    end

    ##
    # add a +patient+ to the system given that the +patient.id+ is not already
    # in use.
    def add(patient)
      if has_id?(patient.id)
        raise PatientIdExistsError.new 'patient id already in use'
      else
        @patients << patient
      end
    end

    def to_s
      out = "[ "
      @patients.each_with_index { |pat, i|
        out << pat.to_s
        out << ", " unless i == @patients.size - 1
      }
      out << " ]"
    end

    def patient(patient)
      @patients.select{ |pat|
        pat.id == patient
      }.first
    end

    private

    def has_id?(id)
      @patients.select { |patient|
        patient.id == id
      }.size > 0 ? true : false
    end
  end
end

##
# A patient already has your id, sorry!
class PatientIdExistsError < StandardError
end
