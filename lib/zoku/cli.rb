require 'thor'

$thor_runner = nil

module Zoku
  class Generator < Thor

    #
    # Version
    #
    # Print the currently installed Zoku version
    #
    desc "version", "Print Zoku Version"
    long_desc "Print out the currently installed Zoku gem version"
    def version
      puts "Zoku #{Zoku::VERSION}"
    end

    #
    # New
    #
    # Generates a new rails project and performs the opinionated setup steps
    #
    desc "new PROJECT", "Generate a new rails project"
    long_desc <<-NEW_PROJECT
      `new PROJECT` will generate a new opinionated rails project
    NEW_PROJECT
    def new(project)
      exec "rails new #{project} -q --database=postgresql --skip-bundle && \
            cd #{project} && \
            git init --quiet && git add -A && \
            git commit -m \"Project setup with Zoku :paw_prints:\" --quiet"
    end

    #
    # Init
    #
    # Initialize a new or existing project
    #
    desc "init [PATH]", "Initialize a new project"
    long_desc "meh"
    def init(path)
      puts path
    end

  end
end
