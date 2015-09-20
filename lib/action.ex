defmodule Action do
  use Slack

  def hear("hear?", message, slack) do
    send_message("👂", message.channel, slack)
  end
  def head(_, _, _) do
  end

  def respond("respond?", message, slack) do
    send_message("📣", message.channel, slack)
  end
  def respond(_, _, _) do
  end
end
