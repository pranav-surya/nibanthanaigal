module Nibanthanaigal
  module Operand
    class Array
      include Nibanthanaigal::Operand::Validations

      attr_reader :value, :type

      def initialize(value, type)
        @value = value
        @type = type
        raise ArgumentError unless TYPES.keys.include?(type)
        validate_array!(TYPES[:array], type)
      end

      def op_inc(other)
        if other.is_a?(Array)
          validate_array!(other)
          (other - value).empty?
        else
          validate_value!(other)
          value.include?(other)
        end
      end
    end
  end
end
