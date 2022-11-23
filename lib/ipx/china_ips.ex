defmodule Ipx.ChinaIPs do

  def load() do
      [__DIR__, "../../china_ips_ipv4.txt"]
      |> Path.join()
      |> File.stream!([], :line)
      |> Enum.to_list()
      |> Enum.map(&CIDR.parse/1)
  end

  def is_from_china(ip_address, db) when is_binary(ip_address) do
     {:ok, ip} = ip_address |> String.to_charlist() |> :inet.parse_address()
     ip |> is_from_china(db)
  end

  def is_from_china(ip, [h | t]), do: CIDR.match!(h, ip) or is_from_china(ip, t)
  def is_from_china(_ip, []), do: false
end
