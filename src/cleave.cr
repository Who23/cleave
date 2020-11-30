require "clim"

module Cleave
  VERSION = "0.1.0"

  Cli.start(ARGV)
end

class Cli < Clim
  main do
    desc "Cleave - Encrypt a file and split its key into multiple parts"
    usage "cleave [subcommand] [options] [arguments]"
    run do |opts, args|
      puts opts.help_string
    end

    sub "fuse" do 
      desc "Fuse the original pieces of the file to obtain the original file"
      usage "cleave fuse <file1>...<fileN>"
      run do |opts, args|
        if args.unknown_args.size > 0
          puts "run fuse"
        else
          puts opts.help_string
        end
      end
    end

    sub "split" do 
      desc "Split a file into N encrypted pieces, requiring T pieces to reconstruct the file"
      usage "cleave split [options] <file>"
      option "-n PIECES", type: Int32, desc: "Number of pieces generated", default: 5
      option "-t REQ_PIECES", type: Int32, desc: "Number of pieces required to reconstruct the file", default: 3
      argument "file", type: String, desc: "File to split", required: true
      run do |opts, args|
        puts "run split"
      end
    end

  end
end