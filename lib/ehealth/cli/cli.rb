module Ehealth
  class Cli
    attr_accessor :physicians, :patients, :medications, :interations

    def initialize
      @physicians = Ehealth::Physicians.new
      @patients = Ehealth::Patients.new
      @medications = Ehealth::Medications.new
      @interations = Ehealth::Interactions.new
      start
    end

    ##
    # Add a new physician with the given +id+, +name+, and +type+.
    def add_physician(id, name, type)
      begin
        phys = Ehealth::Physician.new(id, name, type)
        @physicians.add(phys)
      rescue Exception => e
        puts e.message
      end
    end

    ##
    # Add a new patient with the given +id+, and +name+.
    def add_patient(id, name)
      patient = Ehealth::Patient.new(id, name)
      @patients.add(patient)
    end

    ##
    # Add a new +medicine+
    def add_medication(id, medicine)
      begin
        med = Ehealth::Medicine.new(id, medicine)
        @medications.add(med)
      rescue Exception => e
        puts e.message
      end
    end

    ##
    # Add a new interaction between +m1+ and +m2+
    def add_interaction(m1, m2)
      begin
        fail 'A test exception.'
        @interactions.add_interaction(m1, m2)
      rescue Exception => e
        puts e.message
      end
    end

    ##
    # Add a new prescription for +patient+, from +doctor+
    def new_prescription(id, doctor, patient)
      "Add new prescription for #{patient} from #{doctor}"
    end

    ##
    # Remove a medication from the system
    def remove_medicine(id, medicine)
      "removing #{medicine}"
    end

    ##
    # Display all the prescriptions of a given +medicine+
    def prescriptions(medicine)
      "all prescriptions involving #{medicine}"
    end

    ##
    # Dangerous prescription report: show all dangerous prescriptions
    def dpr
      "Oh no!"
    end

    ##
    # Start the REPL
    def start
      loop do
          repl(">> ")
      end
    end

    private

    def handle_input(input)
      begin
        eval(input)
      rescue Exception
        puts 'user input error'
      else
        # other exception
      ensure
        # always executed
      end

    end

    def repl(prompt)
        print prompt
        handle_input(gets.chomp!)
        out
    end

    def out
      puts "Physicians: #{@physicians}"
      puts "Patients: #{@patients}"
      puts "Medication: #{@medications}"
      puts "Interactions: #{@interactions}"
    end
  end
end
