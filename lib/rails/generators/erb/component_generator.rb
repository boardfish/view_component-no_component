# frozen_string_literal: true

require "rails/generators/erb"

module Erb
  module Generators
    class ComponentGenerator < Base
      source_root File.expand_path("templates", __dir__)
      class_option :sidecar, type: :boolean, default: false
      class_option :inline, type: :boolean, default: false

      def copy_view_file
        unless options["inline"]
          template "component.html.erb", destination
        end
      end

      private

      def destination
        if options["sidecar"]
          File.join("app/components", class_path, "#{file_name}", "#{file_name}.html.erb")
        else
          File.join("app/components", class_path, "#{file_name}.html.erb")
        end
      end
    end
  end
end
