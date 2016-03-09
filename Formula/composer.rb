require File.expand_path("../../Abstract/abstract-php-phar", __FILE__)

class Composer < AbstractPhpPhar
  init
  desc "Dependency Manager for PHP"
  homepage "http://getcomposer.org"
  url "https://getcomposer.org/download/1.0.0-beta1/composer.phar"
  version "1.0.0-beta1"
  sha256 "4344038a546bd0e9e2c4fa53bced1c7faef1bcccab09b2276ddd5cc01e4e022a"
  head "https://getcomposer.org/composer.phar"

  bottle do
    cellar :any_skip_relocation
    sha256 "b3f411e48ce3f2609317dc4935f509198eeb16251214ff3808d8aa3708a19b48" => :el_capitan
    sha256 "d5b0717a03f9e1059a1724fc8d27bde1d7af16ea1e2edde1f2e71e4de8b88c8c" => :yosemite
    sha256 "15b9ebfdf2df4c95197f3c7b6213f360daaa8a81ea250ed64e7b6e9cb42c9f22" => :mavericks
  end

  test do
    system "composer", "--version"
  end
end
