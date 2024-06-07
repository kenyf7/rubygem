# lib/symbolic_differentiation.rb

require 'symbolic_differentiation/version'
require 'symbolic_differentiation/parser'

module SymbolicDifferentiation
  class Differentiator
    def self.differentiate(expression, variable)
      terms = Parser.parse(expression)
      differentiated_terms = terms.map { |term| differentiate_term(term, variable) }
      differentiated_terms.compact.join('+')
    end

    private

    def self.differentiate_term(term, variable)
      coefficient, var, exponent = term.values_at(:coefficient, :variable, :exponent)

      return nil if var && var != variable

      if exponent.nil?
        return coefficient if var.nil?
        return nil
      end

      new_coefficient = coefficient * exponent
      new_exponent = exponent - 1

      if new_exponent == 0
        "#{new_coefficient}"
      elsif new_exponent == 1
        "#{new_coefficient}*#{variable}"
      else
        "#{new_coefficient}*#{variable}^#{new_exponent}"
      end
    end
  end
end
