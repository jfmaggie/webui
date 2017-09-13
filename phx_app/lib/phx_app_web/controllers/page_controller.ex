defmodule PhxAppWeb.PageController do
  use PhxAppWeb, :controller

  def index(conn, params) do
    # case Map.get(params, "led") do
    #   "on" -> GrovePi.Digital.write(3, 1)
    #   "off" -> GrovePi.Digital.write(3, 0)
    #   _ -> :ok
    # end

    # sensor = GrovePi.Analog.read(1)
    sensor = Enum.random(0..1023)
    render conn, "index.html", sensor: sensor
  end
end
