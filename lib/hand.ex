defmodule Blackjack.Hand do
  @doc """
  Convert the value of our hand.

  (This doesn't fully take into account aces!)
  """
  @spec to_value(Blackjack.Types.hand) :: [non_neg_integer()]
  def to_value(hand) when is_list(hand) do
    {aces, non_aces} = Enum.partition(hand, fn({_suit, rank}) ->
      rank == :ace
    end)

    # Getting the count before we consider aces.
    count_before_aces = Enum.reduce(non_aces, 0, fn({_suit, rank}, acc) ->
      acc + rank_to_value(rank, false)
    end)

    count_with_aces_as_ones = count_before_aces + Enum.count(aces)

    Enum.reduce(aces, [count_with_aces_as_ones], fn(_, [previous_value | _] = acc) ->
      [previous_value + 10 | acc]
    end)
    |> Enum.sort()
  end

  @spec rank_to_value(Blackjack.Types.rank, boolean()) :: non_neg_integer()
  def rank_to_value(number, _is_bust) when is_integer(number) do
    number
  end

  def rank_to_value(:jack, _is_bust), do: 10
  def rank_to_value(:queen, _is_bust), do: 10
  def rank_to_value(:king, _is_bust), do: 10
  def rank_to_value(:ace, true), do: 1
  def rank_to_value(:ace, false), do: 11
end
