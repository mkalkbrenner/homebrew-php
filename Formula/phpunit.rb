require File.expand_path("../../Requirements/php-meta-requirement", __FILE__)
require File.expand_path("../../Requirements/phar-requirement", __FILE__)

class Phpunit < Formula
  desc "PHPUnit is a programmer-oriented testing framework for PHP."
  homepage "http://phpunit.de"
  url "https://phar.phpunit.de/phpunit-5.0.0.phar"
  sha256 "f1d59163ceefd69f5969fb098d03c0adb07507a56f3bafd3cf4614bac93e457c"

  devel do
	url "https://phar.phpunit.de/phpunit-beta.phar"
	sha256 "977b3790fe712db1eb7cc04c554edfe5b6a4dc162143cd616c196fbbf6f7caeb"
  end

  bottle do
    cellar :any_skip_relocation
    revision 1
    sha256 "fa791958acb2f38ed465ae16cbf740f94d0ce5ce4091bb7bf77891a4eb104a09" => :el_capitan
    sha256 "3631cf2c006b26495d60d9d37128ae0b23b87da7fedc76a89f9702e3abe910e0" => :yosemite
    sha256 "c424876511abc620c92d39195fe868ad4904f033705fd5519232e94be6001ee9" => :mavericks
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
