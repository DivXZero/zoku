require 'zoku/common'

module Zoku
  module Commands
    class New < Common
      def initialize(target_path = '')
        super
      end

      def init
        exec "rails new #{@target_path} -q --database=postgresql --skip-bundle"
        exec "cd #{@target_path} && \
              git init --quiet && git add -A && \
              git commit -m \"Project setup with Zoku :paw_prints:\" --quiet"
      end
    end
  end
end
