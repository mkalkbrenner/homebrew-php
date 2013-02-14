require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php53Xhgui < AbstractPhp53Extension
  init
  homepage 'https://github.com/preinheimer/xhprof'
  url 'https://github.com/preinheimer/xhprof/tarball/58ceef1a59e89eb44a932e767d04e2340521cd77'
  sha1 'bfd2e5b6e97a07c8bc17fa5f569244a6883aed7c'
  head 'https://github.com/preinheimer/xhprof.git'
  version '58ceef1'

  conflicts_with 'php53-xhprof'

  depends_on 'pcre'

  def install
    Dir.chdir "extension" do
      ENV.universal_binary if build.universal?

      safe_phpize
      system "./configure", "--prefix=#{prefix}",
                            phpconfig
      system "make"
      system("cp modules/xhprof.so modules/xhgui.so")
      prefix.install "modules/xhgui.so"
    end

    prefix.install %w(xhprof_html xhprof_lib external)
    write_config_file unless build.include? "without-config-file"
  end
end
