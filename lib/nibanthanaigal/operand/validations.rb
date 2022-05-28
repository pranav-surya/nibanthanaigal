module Nibanthanaigal
  module Operand
    module Validations
      private

      def validate_array!(values, klass)
        raise ArgumentError unless values.is_a?(Array)
        values.each { |value| validate_value!(value, klass) }
      end

      def validate_value!(value, klass)
        raise ArgumentError unless value.is_a?(klass)
      end
    end
  end
end
