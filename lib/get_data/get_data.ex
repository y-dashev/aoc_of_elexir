defmodule GetData do
  # Import HTTPoison library
  use HTTPoison.Base


  def get_advent_by_day(day) do
    case HTTPoison.get(construct_url(day), headers()) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        to_string(body)

      {:ok, %HTTPoison.Response{status_code: code, body: body}} ->
        {:error, "Request failed with status code #{code}: #{body}"}

      {:error, error} ->
        {:error, "Request failed: #{inspect(error)}"}
    end
  end


  defp construct_url(day) do
    "https://adventofcode.com/2023/day/#{day}/input"
  end

  defp headers,
    do: [
      {'Cookie', 'YOU COOKIE SESSIOn'}
    ]
end
