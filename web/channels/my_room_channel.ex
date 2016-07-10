defmodule MyChatEx.MyRoomChannel do
  use Phoenix.Channel

  require Logger

  def join("my_room:" <> room_id, _payload, socket) do
    Logger.debug "join into my_room:#{room_id}"
    {:ok, assign(socket, :room_id, room_id)}
  end

  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  def handle_in("new_message", payload, socket) do
    Logger.debug "new_message"
    IO.inspect(payload)

    with :ok <- broadcast(socket, "new_message", payload) do
      {:noreply, socket}
    else
      _ ->
        Logger.debug "else case in handle_in"
        {:noreply, socket}
    end
  end
end
