require 'vpn_service'

class Tunnelblick
  :attr_reader

  def initialize
    @service = VpnService.new
  end
end
