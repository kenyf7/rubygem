require 'symbolic_differentiation'

RSpec.describe SymbolicDifferentiation do
  it 'given variable' do
    result = SymbolicDifferentiation::Differentiator.differentiate('x^2+4*x+3+y', 'x')
    expect(result).to eq('2*x+4')
  end

  it 'different variable' do
    result = SymbolicDifferentiation::Differentiator.differentiate('x^2+4*x+3+y', 'y')
    expect(result).to eq('1')
  end

  it 'returns nil' do
    result = SymbolicDifferentiation::Differentiator.differentiate('5+3', 'x')
    expect(result).to eq('')
  end
end
