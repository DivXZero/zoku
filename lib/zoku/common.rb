require 'thor'

module Zoku
  class Common
    include Thor::Base
    include Thor::Shell
    include Thor::Actions

    def initialize(target_path = '')
      @target_path = target_path
    end

    def base_path
      File.join(File.expand_path(File.dirname(__FILE__)))
    end
  end
end
