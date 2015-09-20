defmodule GakiBot do
  use Slack

  def handle_message(message = %{type: "message", text: _}, slack, state) do
    trigger = String.split(message.text, ~r{ |  })
    case String.starts_with?(message.text, "<@#{slack.me.id}>: ") do
      true -> Action.respond(Enum.fetch!(trigger, 1), message, slack)
      false -> Action.hear(hd(trigger), message, slack)
    end
    {:ok, state}
  end

  def handle_message(_message, _slack, state) do
    {:ok, state}
  end
end
