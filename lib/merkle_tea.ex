defmodule MerkleTea do
  
  def build(content) when length(content) > 1 do
    base = hash_base(content)
    hash_elements(base, [])
  end

  def build([content]) do
    hash(content)
  end

  def hash(element) do
    :crypto.hash(:sha256, element) |> Base.encode16
  end

  defp hash_base(elements) do
    Enum.map(elements, fn(x) -> hash(x) end)
  end

  defp hash_elements([fst, snd | tail], result) do
    #IO.puts 'take two'
    newElem = hash(fst <> snd)
    hash_elements(tail, (result ++ [newElem]))
  end

  defp hash_elements([last], result) do
    #IO.puts 'take last'
    newElem = hash(last)
    hash_elements([], (result ++ [newElem]))
  end

  defp hash_elements([], result) when length(result) > 1 do
    #IO.puts 'take result'
    hash_elements(result, [])
  end

  defp hash_elements([], [result]) do
    result
  end

end
