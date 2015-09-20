GakiBot.start_link(Application.get_env(:GakiBot, :api_key), [])

case System.get_env("API_KEY") do
  nil -> Application.get_env(:GakiBot, :api_key)
  s -> s
end |> GakiBot.start_link([])
