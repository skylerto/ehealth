module Ehealth
  class Prescription
    attr_accessor :patient, :medication, :physician

    def initialize(patient, medication, physician)
      @patient = patient
      @medication = medication
      @physician = physician
    end
  end
end
