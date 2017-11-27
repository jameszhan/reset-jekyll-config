# frozen_string_literal: true

require "reset-jekyll-config/version"
require "jekyll"

module ResetJekyllConfig

  DEFAULTS = Jekyll::Configuration.DEFAULTS

  class << self

    def reset(site)
      config = site.config
      site.config = Utils.deep_merge_hashes(DEFAULTS, config).fix_common_issues.add_default_collections
    end

  end

end

Jekyll::Hooks.register :site, :after_reset do |site|
  ResetJekyllConfig.set(site)
end

puts "ResetJekyllConfig Loaded (#{__FILE__})."