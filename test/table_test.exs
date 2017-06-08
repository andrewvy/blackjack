defmodule Blackjack.TableTest do
  use ExUnit.Case, async: true

  test "Generating a table generates a random deck" do
    table1 = Blackjack.Table.new()
    table2 = Blackjack.Table.new()

    assert table1.deck != table2.deck
  end

  test "Can add a player to table" do
    table = Blackjack.Table.new()
    player = %Blackjack.Player{name: "Vy"}

    table_with_player = Blackjack.Table.add_player(
      table,
      player
    )

    assert Enum.count(table.players) == 0
    assert Enum.count(table_with_player.players) == 1
    assert [player] == table_with_player.players
  end

  test "Can remove a player from a table" do
    table = Blackjack.Table.new()
    player = %Blackjack.Player{name: "Vy"}

    table_with_player = Blackjack.Table.add_player(
      table,
      player
    )

    table_without_player = Blackjack.Table.remove_player(
      table_with_player,
      player
    )

    assert Enum.count(table.players) == 0
    assert Enum.count(table_with_player.players) == 1
    assert Enum.count(table_without_player.players) == 0
  end
end
