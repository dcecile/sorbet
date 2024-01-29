# typed: true

extend T::Sig

sig { params(x: [Integer, String]).returns([Integer, String]) }
def foo(x)
  []
end

foo([])

sig { params(x: [Integer, String]).void }
def bar(x: [1, ''])
end

h = T.let({}, T::Hash[Symbol, []])
bar(**h)

sig {params(blk: T.proc.params(x: [Integer]).returns([Integer])).void}
def baz(&blk)
end

p = T.let(T.unsafe(nil), T.proc.params(x: [Integer, String]).returns([Integer]))
baz(&p)

baz do
  []
end

class A
  extend T::Generic
  extend T::Sig

  X = type_member {{upper: [Integer], lower: [Integer, String] }}

  sig { overridable.params(x: [Integer], blk: T.proc.returns([Integer])).returns([Integer]) }
  def foo(x, &blk)
    [1]
  end
end

A[[String]]

class B < A
  extend T::Generic

  X = type_member {{upper: [Integer], lower: [Integer, String] }}

  sig { override.params(x: [String], blk: T.proc.returns([Integer, String])).returns([String]) }
  def foo(x, &blk)
    ['']
  end
end

a = [1]

loop do
  a = []
  break
end

class C
  extend T::Generic

  X = type_member {{ fixed: [Integer] }}
end

class D < C
  extend T::Generic

  X = type_member {{ fixed: [] }}
end

class E
  extend T::Generic

  X = type_member {{upper: [Integer], lower: [] }}
end
