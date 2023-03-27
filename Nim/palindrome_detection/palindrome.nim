proc reverse (s: string): string =
    var n: int = 0
    for i in s:
        if n > s.len - 1:
            break

        result = result & s[^(n+1)]
        n += 1

proc isPalindrome (s: string): bool =
    return s == reverse(s)

echo isPalindrome("racecar")
echo isPalindrome("hello")
echo reverse("hello")