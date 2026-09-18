#!/usr/bin/env ruby
require "yaml"

config_path = ARGV.fetch(0)
branding_path = ARGV.fetch(1)

def deep_merge(base, overlay)
  overlay.each do |key, value|
    if base[key].is_a?(Hash) && value.is_a?(Hash)
      base[key] = deep_merge(base[key], value)
    else
      base[key] = value
    end
  end
  base
end

config = YAML.load_file(config_path, aliases: true) || {}
branding = YAML.load_file(branding_path, aliases: true) || {}

File.write(config_path, deep_merge(config, branding).to_yaml)
