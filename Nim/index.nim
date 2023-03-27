import macros
# Nim is inspired by Python, Ruby, Perl 6, Smalltalk, CLU,
# ML, Haskell, Icon, Eiffel, and Oberon.

# Some of the features of Nim are:
# * static typing

echo "STATIC TYPING"
echo "-----------------"
var string_var: string = "Hello, World!"
echo string_var
echo "-----------------"

# * multiple paradigms (imperative, functional, object-oriented, generic)
# Imperative example:
echo "IMPERATIVE EXAMPLE"
echo "-----------------"
var x = 0
while x < 10:
  echo x
  x += 1
echo "-----------------"

# Functional example:
echo "FUNCTIONAL EXAMPLE"
echo "-----------------"
let mapit = proc (a: openArray[int], f: proc (x: int): int): seq[int] =
  result = newSeq[int](a.len)
  for i in 0..<a.len:
    result[i] = f(a[i])
echo mapit(@[1, 2, 3], proc (x: int): int = x * 2)
echo "-----------------"
# Object-oriented example:
echo "OBJECT-ORIENTED EXAMPLE"
echo "-----------------"
type
  Person = ref object
    name: string
    age: int

proc newPerson(name: string, age: int): Person =
    new(result)
    result.name = name
    result.age = age

proc greet(p: Person) =
    echo "Hello, ", p.name, "!"

var p = newPerson("John", 42)
p.greet()
echo "-----------------"
# Generic example:
echo "GENERIC EXAMPLE"
echo "-----------------"
proc identity[T](x: T): T = x
echo identity(42)
echo identity("Hello, World!")
echo "-----------------"

# * compile-time evaluation
echo "COMPILE-TIME EVALUATION"
echo "-----------------"
const
  a = 10
  b = 20
  c = a + b
echo c
echo "-----------------"

# * macros
echo "MACROS"
echo "-----------------"
macro hello(): untyped =
  result = newLit("Hello, World!")
echo hello()
echo "-----------------"

# A more complex macro example:
echo "A MORE COMPLEX MACRO EXAMPLE"
echo "-----------------"
macro myMacro(a, b: int): untyped =
  result = newStmtList()
  result.add newCall(bindSym"echo", newLit("a = "))
  result.add newCall(bindSym"echo", a)
  result.add newCall(bindSym"echo", newLit("b = "))
  result.add newCall(bindSym"echo", b)
  result.add newCall(bindSym"echo", newLit("a + b = "))
  result.add newCall(bindSym"echo", newCall(bindSym"+", a, b))
let variable_one = 10
let variable_two = 20
myMacro(variable_one, variable_two)
echo "-----------------"

# * operator overloading

echo "OPERATOR OVERLOADING"
echo "-----------------"
type
  Vector2 = object
    x, y: float

proc `+`(a, b: Vector2): Vector2 =
    result.x = a.x + b.x
    result.y = a.y + b.y

proc `+=`(a: var Vector2, b: Vector2) =
    a = a + b

var v1 = Vector2(x: 1.0, y: 2.0)
var v2 = Vector2(x: 3.0, y: 4.0)
echo v1, v2
var v3 = v1 + v2
echo v3
v1 += v2
echo v1
echo "-----------------"

# * first-class functions

echo "FIRST-CLASS FUNCTIONS"
echo "-----------------"
proc add(x, y: int): int = x + y
proc sub(x, y: int): int = x - y
proc mul(x, y: int): int = x * y

proc apply(f: proc (x, y: int): int, x, y: int): int =
  f(x, y)

echo apply(add, 10, 20)
echo apply(sub, 10, 20)
echo apply(mul, 10, 20)
echo "-----------------"


# * closures

echo "CLOSURES"
echo "-----------------"
proc makeAdder(x: int): proc (y: int): int =
  proc (y: int): int = x + y

var adder = makeAdder(10)
echo adder(20)

var adder2 = makeAdder(100)
echo adder2(200)

echo adder(adder2(300))
echo "-----------------"

# * iterators

echo "ITERATORS"
echo "-----------------"
iterator iota(n: int): int =
  var i = 0
  while i < n:
    yield i
    i += 1

for i in iota(10):
    echo i

echo "-----------------"
echo "PRIME SIEVE"
echo "-----------------"
proc fill[T](s: var seq[T], val: T) =
  for i in 0 ..< s.len:
    s[i] = val
iterator primeSieve(n: int): int =
  var sieve = newSeq[bool](n + 1)  # Allocate an extra element to include `n`.
  fill(sieve, true)  # Set all elements to true initially.
  sieve[0] = false  # 0 is not a prime number.
  sieve[1] = false  # 1 is not a prime number.
  sieve[n] = false  # `n` is not a prime number.

  for i in 2 ..< n:  # Iterate from 2 to n - 1.
    if i == n-1:  # If `i` is `n`, then `n` is not a prime number.
      break  # Break out of the loop.
    if sieve[i]:  # If `i` is still marked as prime.
      yield i  # Yield the prime number `i`.
      for j in countup(i * i, n, i):  # Start marking multiples of `i` from `i * i` up to `n`.
        sieve[j] = false  # Mark the multiple of `i` as not prime.


for i in primeSieve(1):
    echo i
echo "-----------------"
# You can rename functions like echo to print like this:
import strutils

proc print*(x: varargs[string, `$`]) =
  for line in x:
    echo line

print("Hello, World!")

# Nim is kinda cool idk. How safe is it tho?