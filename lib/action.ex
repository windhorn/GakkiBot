defmodule Action do
  use Slack

  def hear("hear?", message, slack) do
    send_message("👂", message.channel, slack)
  end
  def hear(_, _, _) do
  end

  def respond("respond?", message, slack) do
    send_message("📣", message.channel, slack)
  end
  def respond(_, _, _) do
  end
  def respond("画像ください", message, slack) do
    send_message("🐱", message.channel, slack)
  end
end
