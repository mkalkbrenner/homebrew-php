require File.expand_path("../../Abstract/abstract-php-phar", __FILE__)

class Phpunit < AbstractPhpPhar
  init
  desc "Programmer-oriented testing framework for PHP"
  homepage "http://phpunit.de"
  url "https://phar.phpunit.de/phpunit-5.4.6.phar"
  sha256 "f1aa125103a91f573ed43bb8fea42b5e087e5d67d570e84cb4ab2215a40ecbf8"

  bottle do
    cellar :any_skip_relocation
    sha256 "d90cbd3c850a65f7b995ec7feb587c83d51ec259e8642dab41a4ed5a313d6420" => :el_capitan
    sha256 "16404bde5106a73a8b81c675115930fc35eea3dee799d888f2a638f18918a596" => :yosemite
    sha256 "2598268dfca4ff73f16919e3cf9ea1ebbb1a34463b56f23653c415d8377741b3" => :mavericks
  end

  def phar_file
    "phpunit-#{version}.phar"
  end

  test do
    shell_output("phpunit --version").include?(version)
  end
end
