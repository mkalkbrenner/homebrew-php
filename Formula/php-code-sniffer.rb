require File.expand_path("../../Requirements/php-meta-requirement", __FILE__)

class PhpCodeSniffer < Formula
  desc "Check coding standards in PHP, JavaScript and CSS"
  homepage "http://pear.php.net/package/PHP_CodeSniffer"
  url "http://download.pear.php.net/package/PHP_CodeSniffer-2.7.1.tgz"
  sha256 "60a649d9db28b5fc3e5fa4651644ce4e4b82b56ab9a4e4829c23ea68314434d6"

  bottle do
    cellar :any_skip_relocation
    sha256 "93f921707a67d8a34107fe2b945530fdd38466add6864d3afe5021c0ded087c7" => :sierra
    sha256 "93f921707a67d8a34107fe2b945530fdd38466add6864d3afe5021c0ded087c7" => :el_capitan
    sha256 "93f921707a67d8a34107fe2b945530fdd38466add6864d3afe5021c0ded087c7" => :yosemite
  end

  depends_on PhpMetaRequirement

  def phpcs_standards
    etc+name+"Standards"
  end

  def phpcs_script_name
    "phpcs"
  end

  def phpcbf_script_name
    "phpcbf"
  end

  def install
    prefix.install Dir["PHP_CodeSniffer-#{version}/*"]
    if File.symlink? libexec+phpcs_script_name
      File.delete libexec+phpcs_script_name
    end
    libexec.install_symlink prefix+"scripts"+phpcs_script_name

    if File.symlink? bin+phpcs_script_name
      File.delete bin+phpcs_script_name
    end
    bin.install_symlink prefix+"scripts"+phpcs_script_name

    if File.symlink? libexec+phpcbf_script_name
      File.delete libexec+phpcbf_script_name
    end
    libexec.install_symlink prefix+"scripts"+phpcbf_script_name

    if File.symlink? bin+phpcbf_script_name
      File.delete bin+phpcbf_script_name
    end
    bin.install_symlink prefix+"scripts"+phpcbf_script_name

    # Make sure the config file is preserved on upgrades. We do that
    # be substituting @data_dir@ with #{etc} and making sure the
    # folder #{etc}/PHP_CodeSniffer exists.
    (etc+"PHP_CodeSniffer").mkpath
    inreplace "#{prefix}/CodeSniffer.php", /@data_dir@/, etc

    # Create a place for other formulas to link their standards.
    phpcs_standards.mkpath

    # Configure installed_paths, but don't overwrite it if already set
    # (preserve config).
    `#{bin+phpcs_script_name} --config-show | grep -q installed_paths`
    unless $?.to_i.zero?
      system bin+phpcs_script_name, "--config-set", "installed_paths", phpcs_standards
    end
  end

  def caveats; <<-EOS.undent
    Verify your installation by running:

      #{phpcs_script_name} --version

    You can read more about phpcs by running:

      brew home #{name}

    EOS
  end

  test do
    (testpath/"test.php").write <<-EOS.undent
      <?php
      echo "foo"."bar"
    EOS
    system bin+phpcs_script_name, "--standard=Zend", "test.php"
    system "#{bin}/#{phpcs_script_name} --standard=PEAR --report=emacs test.php | grep -q 'error - Missing file doc comment'"
  end
end
