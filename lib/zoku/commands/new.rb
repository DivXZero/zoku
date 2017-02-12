require 'zoku/common'
require 'zoku/util'

module Zoku
  module Commands
    class New < Common
      def initialize(target_path = '')
        super
      end

      def init
        create_project
        customize_project
        #{}`git init --quiet && git add -A && \
        #git commit -m \"Project setup with Zoku :paw_prints:\" --quiet`
      end

      private

      def create_project
        FileUtils.mkdir @target_path
        FileUtils.cd(@target_path)
        FileUtils.copy_entry "#{base_path}/templates/base", '.'
      end

      def customize_project
        replacements = set_replacements

        Dir.glob("./**/*", File::FNM_DOTMATCH) do |file|
          next if file == '.' || file == '..' || File.directory?(file)

          text = File.read(file)

          replacements.each do |key, value|
            text.gsub!(key.to_s, value)
          end

          File.open(file, 'w') { |f| f.puts text }
        end
      end

      def set_replacements
        project_name = @target_path.to_s.dup

        {
          'zoku_base' => Util.underscore(project_name),
          'ZokuBase'  => Util.classify(project_name),
          'VERSION'   => VERSION
        }
      end

    end
  end
end
