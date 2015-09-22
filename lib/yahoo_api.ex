defmodule YahooApi do
  require HTTPoison

  defp get_api_key do
    case System.get_env("YAHOO_API_KEY") do
      nil -> Application.get_env(:GakiBot, :yahoo_api_key)
      s -> s
    end
  end

  # APIから1時間後までの降水確率のデータを取得しJSONで返す．
  def get_weather_data(coordinates \\ "139.732293,35.663613", output_type \\ "json") do
    HTTPoison.start
    url = "http://weather.olp.yahooapis.jp/v1/place?coordinates=#{coordinates}&output=#{output_type}&appid=#{get_api_key}"
    json = case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> body
        |> Poison.decode!
    end
    head = hd(json["Feature"])
    result = head["Property"]["WeatherList"]["Weather"]
    Enum.map(result, fn(data) ->
      %{Date: extract_precipitate_data(data["Date"]), Rainfall: data["Rainfall"]}
    end)
  end

  # 与えられた数列から任意の時刻フォーマットに調整する．
  def extract_precipitate_data(numeric) do
    year = String.slice(numeric, 0..3)
    month = String.slice(numeric, 4..5)
    day = String.slice(numeric, 6..7)
    hour = String.slice(numeric, 8..9)
    min = String.slice(numeric, 10..11)
    "#{year}年#{month}月#{day}日 #{hour}時#{min}分"
  end
end
