require 'zoku/common'

module Zoku
  module Commands
    class New < Common
      def initialize(target_path = '')
        super
      end

      def init
        `rails new #{@target_path} -q --database=postgresql --skip-bundle`
        FileUtils.cd(@target_path)
        FileUtils.copy_entry "#{base_path}/templates/", '.'
        `git init --quiet && git add -A && \
        git commit -m \"Project setup with Zoku :paw_prints:\" --quiet`
      end
    end
  end
end
