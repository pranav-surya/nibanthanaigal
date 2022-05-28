module Nibanthanaigal
  module Operand
    class String
      include Nibanthanaigal::Operand::Validations

      attr_reader :value

      def initialize(value)
        @value = value
        validate_value!(value, TYPES[:string])
      end

      def op_eq(other)
        validate_value!(other, TYPES[:string])
        value == other
      end

      def op_not_eq(other)
        !op_eq(other)
      end

      def op_inc(other)
        validate_array!(other, TYPES[:string])
        other.include?(value)
      end

      def op_not_inc(other)
        !op_inc(other)
      end
    end
  end
end
