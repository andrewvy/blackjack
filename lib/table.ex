defmodule Blackjack.Table do
  @moduledoc """
  This module represents the state of the table.
  """

  defstruct [
    dealer: %Blackjack.Player{},
    players: [],
    player_bets: %{},
    deck: [],
    state: :waiting
  ]

  @type state :: :waiting_for_players |
    :bet_phase |
    :deal_phase |
    :player_phase |
    :payout_phase

  @type t :: %__MODULE__{
    dealer: Blackjack.Player.t,
    players: [Blackjack.Player.t] | [],
    player_bets: map(),
    deck: Blackjack.Types.deck,
    state: state
  }

  @doc """
  Returns a new table with a randomly generated deck.
  """
  @spec new() :: t
  def new() do
    %Blackjack.Table{
      deck: Blackjack.Deck.generate_random()
    }
  end

  @spec add_player(t, Blackjack.Player.t) :: t
  def add_player(table, player) do
    %{
      table |
      players: [player | table.players],
      player_bets: Map.put(table.player_bets, player.name, 0)
    }
  end

  @spec remove_player(t, Blackjack.Player.t) :: t
  def remove_player(table, player_to_remove) do
    %{
      table |
      players: Enum.reject(table.players, fn(player) ->
        player.name == player_to_remove.name
      end),
      player_bets: Map.delete(table.player_bets, player_to_remove.name)
    }
  end
end
