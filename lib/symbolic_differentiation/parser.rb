# lib/symbolic_differentiation/parser.rb

module SymbolicDifferentiation
    class Parser
      TERM_REGEX = /(?<coefficient>-?\d*)(?<variable>[a-z])(?:\^(?<exponent>\d+))?/
  
      def self.parse(expression)
        terms = expression.split('+')
        terms.map { |term| parse_term(term) }
      end
  
      def self.parse_term(term)
        match = TERM_REGEX.match(term)
        {
          coefficient: match[:coefficient].empty? ? 1 : match[:coefficient].to_i,
          variable: match[:variable],
          exponent: match[:exponent] ? match[:exponent].to_i : (match[:variable] ? 1 : nil)
        }
      end
    end
  end
  