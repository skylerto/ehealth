module Ehealth
  module Cli
    class << self
      attr_accessor :physicians, :patients, :medications, :interations

      ##
      # Add a new physician with the given +id+, +name+, and +type+.
      def add_physician(id, name, type)
        "Adding new #{type}: #{name}"
      end

      ##
      # Add a new patient with the given +id+, and +name+.
      def add_patient(id, name)
        "Adding new patient #{name}"
      end

      ##
      # Add a new +medicine+
      def add_medication(id, medicine)
        "Adding #{medicine}"
      end

      ##
      # Add a new interaction between +m1+ and +m2+
      def add_interaction(m1, m2)
        "New Interaction between #{m1} and #{m2}"
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
        result = eval(input)
        puts(" => #{result}")
      end

      def repl(prompt)
          print prompt
          handle_input(gets.chomp!)
      end

    end
  end
end

Ehealth::Cli.start
