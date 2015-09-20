defmodule Action do
  use Slack
  require HTTPoison
  require Floki

  def hear("hear?", message, slack) do
    send_message("👂", message.channel, slack)
  end
  def hear("lgtm", message, slack) do
    HTTPoison.start
    case URI.encode("http://www.lgtm.in/g") |> HTTPoison.get do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> body
        |> Floki.find("#imageUrl")
        |> Floki.attribute("value")
        |> hd
        |> send_message(message.channel, slack)
      {_, _} -> nil
    end
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
