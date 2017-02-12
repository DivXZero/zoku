require 'zoku/commands/new'

$thor_runner = nil

module Zoku
  class Generator < Thor

    # Prints the currently installed Zoku version
    #
    desc "version", "Print Zoku Version"
    long_desc "Print out the currently installed Zoku gem version"
    def version
      puts "Zoku #{Zoku::VERSION}"
    end

    # Generates a new rails project and performs the opinionated setup steps
    #
    desc "new PROJECT", "Generate a new rails project"
    long_desc <<-NEW_PROJECT
      `new PROJECT` will generate a new opinionated rails project
    NEW_PROJECT
    option :build
    def new(target_path)
      Commands::New.new(target_path).init
      if options[:build]
        exec "docker-compose build && \
              docker-compose run web bundle exec \
              rake db:create db:migrate db:seed"
      end
    end

    # Initializes a new or existing project
    #
    desc "init [PATH]", "Initialize a new project"
    long_desc "meh"
    def init(path)
      puts path
    end

    # Checks to see if the internet is still down
    #
    # @option packets [Integer] :packets packet count to test with
    # @return [String] a string containing the current status
    desc "check", "Check to see if the internet is still down"
    long_desc "sigh"
    option :packets
    def check
      puts 'Checking to see if you are online...'
      count = options[:packets] ? options[:packets] : 2
      result = (`ping 8.8.8.8 -c #{count} | grep transmitted`).to_s
      if result.include?('100.0% packet loss')
        puts 'womp womp'
      else
        puts 'hooray, it looks like you may be online!'
      end
    end

  end
end
