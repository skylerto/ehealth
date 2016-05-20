module Ehealth
  class Physicians
    attr_accessor :physicians

    def initialize
      @physicians = []
    end
    
    def add(physician)
      if has_id?(physician.id)
        raise PhysicianIdExistsError.new 'physician id already in use'
      end

      @physicians << physician
    end

    def to_s
      out = "[ "
      @physicians.each_with_index { |phy, i|
        out << phy.to_s
        out << ", " unless i == @physicians.size - 1
      }
      out << " ]"
    end

    private

    def has_id?(id)
      @physicians.select { |phys|
        phys.id == id
      }.size > 0 ? true : false
    end
  end
end

class PhysicianIdExistsError < StandardError

end
