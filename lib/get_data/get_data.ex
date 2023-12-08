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
      {'Cookie', 'session=53616c7465645f5f36996103e4cced8d9de8de1e4abf8e91c3afea87de9ab701d104c71fa27d28dd821a898baa2fccc1ac688c51710eb460a9b682d22426be42'}
    ]
end
