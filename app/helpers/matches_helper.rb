module MatchesHelper
  def socks_options
  # [["", 1],["", 2],["", 3]]
  @socks.map do |sock|
    [sock.name, sock.id]
    end
  end
end
