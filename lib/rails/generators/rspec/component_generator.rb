# frozen_string_literal: true

module Rspec
  module Generators
    class ComponentGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      def create_test_file
        template "component_spec.rb", File.join("spec/components", class_path, "#{file_name}_spec.rb")
      end
    end
  end
end
