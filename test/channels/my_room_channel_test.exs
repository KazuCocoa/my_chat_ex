defmodule MyChatEx.MyRoomChannelTest do
  use MyChatEx.ChannelCase, async: true

  alias MyChatEx.UserSocket

  setup do
    user_id = "123"
    token = Phoenix.Token.sign(@endpoint, "user", user_id)

    {:ok, socket} = connect(UserSocket, %{"token" => token})
    {:ok, _reply, socket} = subscribe_and_join(socket, "my_room:lobby")

    {:ok, socket: socket, user: user_id}
  end

  test "join to my_room:lobby", %{socket: socket, user: user_id} do
    assert socket.topic == "my_room:lobby"
    assert socket.assigns.room_id == "lobby"
    assert socket.assigns.user_id == user_id
  end

  test "ping replies with status ok", %{socket: socket} do
    ref = push socket, "ping", %{}
    assert_reply ref, :ok, %{}
  end

  test "new_message broadcasts to my_room:lobby", %{socket: socket} do
    push socket, "new_message", %{"name" => "user_id", "message" => "hello world"}
    assert_broadcast "new_message", %{"name" => "user_id", "message" => "hello world"}
  end

  test "broadcasts are pushed to the client", %{socket: socket} do
    broadcast_from! socket, "new_message", %{"name" => "user_id", "message" => "hello world"}
    assert_push "new_message", %{"name" => "user_id", "message" => "hello world"}
  end
end
