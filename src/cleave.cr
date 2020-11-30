require "clim"
require "./shamir.cr"
require "./cli.cr"


module Cleave
  VERSION = "0.1.0"

  def self.split(pieces : Int32, req_pieces : Int32, filename : String)
    # AES.encrypt(filename, "out.cleave")
    # encrypt file
    # encrypt key 
    # construct split files.
  end

  def self.fuse(files : Array(String))
    # AES.decrypt(files[0], files[1], File.read("password"))
  end

  Cli.start(ARGV)
end
