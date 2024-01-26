# typed: true

extend T::Sig

sig { params(x: {a: Integer, b: String }).void }
def foo(x)
end

# too few keys
foo({})
foo({a: 1})

# missing keys
foo({a: 1, c: 1})
foo({c: 1, d: 1})

# mismatch in value types
foo({a: 1, b: 1})
foo({a: '', b: 1})

# mismatch in value types and missing keys
foo({a: '', c: 1})
