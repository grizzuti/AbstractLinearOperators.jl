using AbstractLinearOperators, Test

# Linear operator
input_size = (2^7, 2^8)
padding = ((1, 2), (3, 4))
T = Float64
A = repeat_padding_operator(T, input_size, padding)

# Zero padding test
rtol = T(1e-6)
u = randn(T, input_size)
Au = A*u
@test all(Au[padding[1][1]+1:end-padding[1][2], padding[2][1]+1:end-padding[2][2]] .== u)

# Adjoint test
rtol = T(1e-6)
@test adjoint_test(A; rtol=rtol)