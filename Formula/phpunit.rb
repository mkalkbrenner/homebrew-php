require File.expand_path("../../Requirements/php-meta-requirement", __FILE__)
require File.expand_path("../../Requirements/phar-requirement", __FILE__)

class Phpunit < Formula
  homepage "http://phpunit.de"
  url "https://phar.phpunit.de/phpunit-4.8.5.phar"
  sha256 "ce39f98b1b5c17a7e19bb89d61f33bd72baa53406e97342acb2a7b2c340dbdb0"

  bottle do
    cellar :any
    sha256 "9ba7d856c552c684681cee21410e8a08ee4798fc82ea9e99f00f54bbe6814fe8" => :yosemite
    sha256 "04ce8609a32c8ebbc4b0702831d0d3cb47d2a5717cb312fd26cfba5bb696d7db" => :mavericks
    sha256 "502343bca4c62dd2cced5b589e1d9ba51db64befd1e047ad335fc54e2ddc37d4" => :mountain_lion
  end

  def install
    libexec.install "phpunit-#{version}.phar"
    sh = libexec + "phpunit"
    sh.write("#!/usr/bin/env bash\n\n/usr/bin/env php -d allow_url_fopen=On -d detect_unicode=Off #{libexec}/phpunit-#{version}.phar $*")
    chmod 0755, sh
    bin.install_symlink sh
  end

  test do
    shell_output("phpunit --version").include?(version)
  end
end
