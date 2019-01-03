Pattern.create do
  # Registers should never be written directly from here, always call API methods
  # that are defined by your controllers
  dut.ram.do_something
end
