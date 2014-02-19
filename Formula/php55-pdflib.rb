require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php55Pdflib < AbstractPhp55Extension
  init
  homepage 'http://www.pdflib.com'
  url 'http://pecl.php.net/get/pdflib-3.0.4.tgz'
  sha1 'a6efda4b2532d979c508a23be845720663433c58'

  depends_on "pdflib-lite"

  def install
    Dir.chdir "pdflib-#{version}"

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/pdf.so"
    write_config_file unless build.include? "without-config-file"
  end
end
