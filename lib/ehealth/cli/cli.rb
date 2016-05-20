module Ehealth
  module Cli
    class << self
      def handle_input(input)
        result = eval(input)
        puts(" => #{result}")
      end

      def repl(prompt)
          print prompt
          handle_input(gets.chomp!)
      end

      def start
        loop do
            repl(">> ")
        end
      end
    end
  end
end
