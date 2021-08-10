require_relative 'vpn_service'

class TunnelblickRb
  def self.connected?
    VpnService.connected?
  end

  def self.start(address)
    VpnService.connect(address)
  end

  def self.switch_ip(address)
    VpnService.switch(address)
  end

  def self.stop(address)
    VpnService.disconnect(address)
  end
end
