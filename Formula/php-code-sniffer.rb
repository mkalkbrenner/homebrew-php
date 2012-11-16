require 'formula'
require File.join(HOMEBREW_LIBRARY, 'Taps', 'josegonzalez-php', 'Requirements', 'php-meta-requirement')

class PhpCodeSniffer < Formula
  homepage 'http://pear.php.net/package/PHP_CodeSniffer'
  url 'http://download.pear.php.net/package/PHP_CodeSniffer-1.4.0.tgz'
  sha1 '084042071211f925b4c67a55e2c601e983d25b1d'
  version '1.4.0'

  depends_on PhpMetaRequirement.new

  def install
    prefix.install Dir['PHP_CodeSniffer-1.4.0/*']
    sh = libexec + "phpcs"
    sh.write("/usr/bin/env php #{prefix}/scripts/phpcs $*")
    chmod 0755, sh
    bin.install_symlink sh
  end

  def caveats; <<-EOS.undent
    Verify your installation by running:
      "phpcs --version".

    You can read more about phpcs by running:
      "brew home phpcs".
    EOS
  end
end



