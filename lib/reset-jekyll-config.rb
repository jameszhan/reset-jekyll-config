# frozen_string_literal: true

require "reset-jekyll-config/version"
require "jekyll"

module ResetJekyllConfig

  DEFAULTS = Jekyll::Configuration::DEFAULTS

  class << self

    def reset(site)
      site.config["plugins_dir"] = "_plugins"
      site.safe = false
    end

  end

end

Jekyll::Hooks.register :site, :after_reset do |site|
  ResetJekyllConfig.reset(site)
end