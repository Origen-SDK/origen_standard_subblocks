module OrigenStandardSubblocks
  class RAMController
    include Origen::Controller

    # Shortcut for <code>mem</code>, where the base address is added to the index.
    # @param [Fixnum] index Offset index in the RAM. Note that standard index notation is used.
    #   I.e., an index of 0 corresponds to the first usable address and an
    #   index of 1 corresponds to the second usable address.
    # @return [Origen:Registers::Reg]
    # @example Get a <code>Origen::Registers::Reg</code> object for the first usable memory location (indexes start at 0)
    #   r = dut.ram[0]
    #   r.class #=> Origen::Registers::Reg
    #   r.address.to_hex #=> '0x100'
    # @example Get a <code>Origen::Registers::Reg</code> object for the second usable memory location (indexes start at 0)
    #   # Assume base address is 0x100 and the length is 0x10
    #   r = dut.ram[1]
    #   r.class #=> Origen::Registers::Reg
    #   r.address.to_hex #=> '0x104'
    # @todo Add support for negative index notation & ranges.
    # @todo Add support for bounds checking.
    def [](index)
      dut.mem(start_addr + (4 * index))
    end

    # Shortcut for <code>mem.write!</code>, where the base address is added to the index.
    # @param [Fixnum] index Offset index in the RAM. Note that standard index notation is used.
    #   I.e., an index of 0 corresponds to the first usable address and an
    #   index of 1 corresponds to the second usable address.
    # @param [Fixnum] data Data to write to the RAM location indicated by the index.
    #   Or: <code>RAM[index] <= data</code>
    # @return [Origen::Registers::BitCollection]
    # @todo Add support for negative index notation & ranges.
    # @todo Add support for bounds checking.
    def []=(index, data)
      self[index].write!(data)
    end
  end
end
