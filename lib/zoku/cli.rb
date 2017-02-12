require 'thor'

module Zoku
  class Generator < Thor
    #desc "version", "Print Zoku Version"
    #long_desc "Print out the currently installed Zoku gem version"
    #def version
      #puts "Zoku v#{Zoku::VERSION}"
      #puts 'o_O'
    #end

    desc "new PROJECT", "Generate a new rails project"
    long_desc <<-NEW_PROJECT
      `new PROJECT` will generate a new opinionated rails project
    NEW_PROJECT
    def new(project)
      exec "rails new #{project} --database=postgresql --skip-bundle && \
            cd #{project} && \
            git init --quiet && git add -A --quiet && \
            git commit -m \"Project setup with Zoku :paw_prints:\" --quiet"
    end
  end
end
