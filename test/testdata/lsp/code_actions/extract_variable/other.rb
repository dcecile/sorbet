# typed: true
# selective-apply-code-action: refactor.extract
# enable-beta-lsp-extract-to-variable: true

if 1 == 2
  1 + 1
#     ^ apply-code-action: [A] Extract Variable
else
  2 + 3
# ^ apply-code-action: [B] Extract Variable
end

y = 2
a = (x = 1; x + y)
#           ^ apply-code-action: [C] Extract Variable

while 1 == 2
  x = a + y
#     ^^^^^ apply-code-action: [D] Extract Variable
end

for i in 1..5
  puts i + 1
#      ^^^^^ apply-code-action: [E] Extract Variable
end
