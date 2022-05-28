require "nibanthanaigal/operand/operand"
require "nibanthanaigal/operand/validations"
require "nibanthanaigal/operand/array"
require "nibanthanaigal/operand/string"

module Nibanthanaigal
  class << self
    def check(instance, conditons)
      evaluation_trace = []
      conditons.each do |and_condtion|
        or_conditions_matched = false
        and_condtion.each do |or_condition|
          if check_condition(instance, or_condition)
            or_conditions_matched = true
            evaluation_trace << or_condition.merge(matched: true)
            break
          else
            evaluation_trace << or_condition.merge(matched: false)
          end
        end
        unless or_conditions_matched
          return [false, evaluation_trace]
        end
      end
      [true, evaluation_trace]
    end

    private

    def check_condition(instance, condition)
      operand =
        case condition[:type]
        when :string
          Operand::String.new(condition[:condition_operand])
        when :array
          Operand::Array.new(condition[:condition_operand], condition[:sub_type])
        else
          raise ArgumentError
        end

      if operand.respond_to?(condition[:operator])
        operand.send(condition[:operator], instance.public_send(condition[:message]))
      else
        raise ArgumentError
      end
    end
  end
end
