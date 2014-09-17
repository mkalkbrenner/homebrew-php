require "formula"

class Drush < Formula
  homepage "https://github.com/drush-ops/drush"
  url "https://github.com/drush-ops/drush/archive/6.3.0.tar.gz"
  sha1 "90fde5acfbd6feefad02453ee9f31a0ac6d2f80e"

  head do
    url "https://github.com/drush-ops/drush.git"

    depends_on "Homebrew/php/composer" => :build
  end

  def install
    system "composer", "install" if build.head?

    prefix.install_metafiles
    File.delete "drush.bat"
    libexec.install Dir["*"]
    (bin+"drush").write <<-EOS.undent
      #!/bin/sh

      export ETC_PREFIX=${ETC_PREFIX:=#{HOMEBREW_PREFIX}}
      export SHARE_PREFIX=${SHARE_PREFIX:=#{HOMEBREW_PREFIX}}

      exec "#{libexec}/drush" "$@"
    EOS
    bash_completion.install libexec/"drush.complete.sh" => "drush"
  end
end
