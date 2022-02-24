module OrigenStandardSubblocks
  # Simple subblock for modeling RAM.
  # @note This currently assumes 32-bit addresses.
  # @note This currently assumes Big-Endian address space (e.g., the RAM grows upwards).
  class RAM
    include Origen::Model

    attr_reader :sim_config, :ecc

    # Create a new <code>OrigenStandardSubblocks::RAM</code> object.
    # @param [Hash] options Initializaton options.
    # @option options [Fixnum] :length The length of the RAM, in bytes.
    # @note The <code>length</code> option is a required option.
    # @raise [Origen::Error] When <code>length</code> is not given as an option.
    def initialize(options = {})
      @length = options[:length]
      @sim_config = options[:sim_config] || {}
      @ecc = options[:ecc] || false

      if @length.nil?
        Origen.app.fail(message: 'RAM subblock requires a :length option to be given!')
      end
    end

    # Returns the start address (frst usable address) in the RAM.
    # @return [Fixnum] Indicating the start address of the RAM.
    def start_addr
      base_address
    end
    alias_method :start_address, :start_addr
    alias_method :start, :start_addr
    alias_method :first_addr, :start_addr
    alias_method :first_address, :start_addr
    alias_method :first, :start_addr

    # Returns the length of the RAM
    # @return [Fixnum] Indicating the length of the RAM.
    def length
      @length
    end
    alias_method :size, :length

    # Returns the total number of RAM addresses available.
    # @note This assumes 32-bit addresses
    # @note This also functions as the number of 32-bit words.
    # @return [Fixnum] Indicating the number of RAM addresses available.
    def size
      @length / 4
    end

    def ecc?
      @ecc != false
    end

    # Returns the end address: i.e., the last usable address (not the length).
    # @note This assume 32-bit addresses
    # @return [Fixnum] Indicating the last usable address.
    def end_addr
      start_addr + length - 4
    end
    alias_method :end_address, :end_addr
    alias_method :end, :end_addr
    alias_method :last_addr, :end_addr
    alias_method :last_address, :end_addr
    alias_method :last, :end_addr
  end
end
