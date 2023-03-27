proc reverse (s: string): string =
    for i in 0..<s.len:
        result = s[i] & result

proc isPalindrome (s: string): bool =
    return s == reverse(s)

echo isPalindrome("racecar")
echo isPalindrome("hello")
echo reverse("hello")