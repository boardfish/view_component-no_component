# frozen_string_literal: true

module Preview
  module Generators
    class ComponentGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      check_class_collision suffix: "Preview"

      def create_preview_file
        preview_paths = Rails.application.config.view_component.preview_paths
        return if preview_paths.count > 1

        path_prefix = preview_paths.one? ? preview_paths.first : "test/components/previews"
        template "component_preview.rb", File.join(path_prefix, class_path, "#{file_name}_preview.rb")
      end
    end
  end
end
