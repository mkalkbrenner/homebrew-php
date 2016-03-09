require File.expand_path("../../Abstract/abstract-php-phar", __FILE__)

class Phploc < AbstractPhpPhar
  init
  desc "Tool for quickly measuring the size of a PHP project"
  homepage "https://github.com/sebastianbergmann/phploc"
  url "https://phar.phpunit.de/phploc-3.0.0.phar"
  sha256 "2d5ed6990f056c7cfbfadf03c926b39370ac9afde66747c30f50d2594bff6dca"

  bottle do
    cellar :any_skip_relocation
    sha256 "31e704690f7f364e2db91e276dd163e906100721db7bff020a62903242e8394a" => :el_capitan
    sha256 "31d7a0a48a7b38c9bae423371225127620a411657c2bfeca40e294f84a12ad9f" => :yosemite
    sha256 "8cb7901655ec30a4de41fa95a9480194f59915eeef6eb935882003b9245047ca" => :mavericks
  end

  def phar_file
    "phploc-#{version}.phar"
  end

  test do
    system "phploc", "--version"
  end
end
