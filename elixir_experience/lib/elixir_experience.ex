defmodule ElixirExperience do

    # add(1, 2) #=> 3
    def add(a, b) do
        a + b
    end

    # num_to_list(10) #=> "1,2,3,4,5,6,7,8,9,10"
    def num_to_list(n) do
        # String.slice(List.foldl(Enum.to_list(1..n), "", fn value, acc-> "#{acc},#{value}" end), 1, 1500)

        # num_to_list = fn n -> Stream.iterate(1, &(&1 + 1)) |> Enum.take(n) |> Enum.join(",") end
        # num_to_list.(10)

        1..n |> Enum.join(",")
    end

    # fib(5) #=> [1, 1, 2, 3, 5]
    # defp fib_calc(0), do: 0
    # defp fib_calc(1), do: 1
    # defp fib_calc(n) do
    #   fib_calc(n-1) + fib_calc(n-2)
    # end
    #
    # def fib(n) do
    #   Enum.map(Enum.to_list(1..n), fn(x)->fib_calc(x) end)
    # end
    def fib(n) do
        Stream.unfold({1,1}, fn({a,b}) -> {a, {b, a+b}} end) |> Enum.take(n)
    end


    def concat(str1, str2) do
        str1 <> str2
    end

    @doc """
    Write a function palindrome? that checks if a given string is a palindrome. A palindrome is a word, phrase, number, or other sequence of characters which reads the same backward or forward, ignoring non-word characters (like spaces, comma, exclamation marks, etc.) e.g

    palindrome?("123,21") #=> true
    palindrome?("Madam, I’m Adam.") #=> true
    """
    def palindrome?(str) do
        fn_reverse_y = fn([x,y]) -> ([x, Enum.reverse(y)]) end

        fn_start_with? = fn([x, y]) -> String.starts_with?(x, y) end

        str |> String.downcase() |> String.split(",") |> Enum.map(&String.codepoints(&1)) |> fn_reverse_y.() |> Enum.map(&(List.to_string(&1))) |> fn_start_with?.()
    end

    @doc """
    Write a function anagram? that checks if two given strings are anagrams, An anagram is a type of word play, the result of rearranging the letters of a word or phrase to produce a new word or phrase, using all the original letters exactly once

    anagram?("rose", "sore") #=> true
    """
    def anagram?(str1, str2) do
        str_convert(str1) == str_convert(str2)
    end

    defp str_convert(str) do
        str |> String.codepoints() |> Enum.sort()
    end

    @doc """
    Write an extract_bytes function that takes a binary and a non-negative integer and extracts the number of bytes specified by the integer, e.g:

    extract_bytes(<<102, 111, 111, 32, 98, 97, 114, 0, 0, 0, 1>>, 4) #=> "foo "
    """
    def extract_bytes(bytes, n) do
        String.slice(bytes, 0..n-1)
    end

end
