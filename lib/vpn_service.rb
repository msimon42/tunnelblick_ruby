class VpnService
  def self.connect(address)
     system(
        %x{
            osascript <<APPLESCRIPT
            tell application "Tunnelblick"
	             connect "#{address}"
	             get state of first configuration where name = "#{address}"
	             repeat until result = "CONNECTED"
		              delay 1
		              get state of first configuration where name = "#{address}"
	             end repeat
            end tell
            APPLESCRIPT}
      )

    return "Connected to #{address}"
  end

  def self.disconnect(address)
    raise 'No connection exists' unless connected?
    system(
      %x{
          osascript <<APPLESCRIPT
          tell application "Tunnelblick"
             disconnect "#{address}"
          end tell
          APPLESCRIPT}
    )
    return 'Disconnected'
  end

  def self.switch(address)
    raise 'No connection exists' unless connected?
    self.disconnect
    self.connect(address)
    return "Connected to #{address}"
  end

  def self.connected?

      output = `
          osascript <<APPLESCRIPT
          tell application "Tunnelblick"
             get state of first configuration
             return result
          end tell
          APPLESCRIPT
      `

    return output == "CONNECTED\n"
  end
end
