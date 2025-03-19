# frozen_string_literal: true

module StringHelpers
  def self.underscore(str)
    str
      .to_s
      .gsub('::', '/')
      .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .tr('-', '_')
      .downcase
  end
end
