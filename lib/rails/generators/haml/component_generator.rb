# frozen_string_literal: true

require "rails/generators/erb/component_generator"

module Haml
  module Generators
    class ComponentGenerator < Erb::Generators::ComponentGenerator
      source_root File.expand_path("templates", __dir__)
      class_option :sidecar, type: :boolean, default: false

      def copy_view_file
        if !options["inline"]
          template "component.html.haml", destination
        end
      end

      private

      def destination
        if options["sidecar"]
          File.join("app/components", class_path, "#{file_name}", "#{file_name}.html.haml")
        else
          File.join("app/components", class_path, "#{file_name}.html.haml")
        end
      end
    end
  end
end
