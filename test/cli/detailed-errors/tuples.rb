# typed: true

extend T::Sig

sig { params(x: [Integer, String]).void }
def foo(x)
end

# too few items
foo([])
foo([1])

# mismatch in value types
foo([1, 1])
foo(['', 1])

# mismatch in value types and too few items
foo([''])
