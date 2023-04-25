defmodule ListFilter do
  def call(list), do: count_odd_numbers(list)

  defp count_odd_numbers(list) do
    list
    |> Enum.map(&parse_to_integer(&1))
    |> Enum.filter(&(is_integer(&1) == true))
    |> Enum.reduce(0, fn number, acc -> sum_value(number, acc) end)
  end

  defp parse_to_integer(string) do
    case Integer.parse(string) do
      {number, _} -> number
      :error -> "String not possible to convert to integer"
    end
  end

  defp sum_value(number, acc) do
    case rem(number, 2) != 0 do
      true -> acc + 1
      false -> acc
    end
  end
end
