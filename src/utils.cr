struct BytesIterator(I)
    include Iterator(UInt8)

    def initialize(@io : I, @buf_size : Int32 = 8192)
    end

    def next
      buffer = Bytes.new(@buf_size)
      bytes_read = @io.read(buffer)
      if bytes_read == 0
        stop
      else
        buffer[0, bytes_read]
      end
    end
end