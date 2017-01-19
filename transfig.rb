class Transfig < Formula
  desc "Translates figures generated by xfig to other formats"
  homepage "http://mcj.sourceforge.net"
  url "https://downloads.sourceforge.net/project/mcj/fig2dev-3.2.6a.tar.xz"
  sha256 "5e61a3d9a4f83db4b3199ee82dd54bb65b544369f1e8e38a2606c44cf71667a7"

  bottle do
    sha256 "d316d4d0adf33708b08bec8e9e1087d3043b08a43c6e3a7d9729b4d62c6b3e78" => :sierra
    sha256 "70dd98beb1910d774b6a1734f8bdcbdc07a9d6e2ddf8c0534a5d1e8680472442" => :el_capitan
    sha256 "0bf504206ba10a08d2841e176488b3f0981ee03f621ffd67e19fe5d78b072dca" => :yosemite
    sha256 "78b384f95a560aab4113e4d1bc4f5a3a9802f4ef200873b5048dfa0df79cc741" => :x86_64_linux
  end

  depends_on :x11
  depends_on "libpng"
  depends_on "ghostscript"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--enable-transfig"
    system "make"
    system "make", "install"

    # Install a fig file for testing
    pkgshare.install "fig2dev/tests/data/patterns.fig"
  end

  test do
    system "#{bin}/fig2dev", "-L", "png", "#{pkgshare}/patterns.fig", "patterns.png"
  end
end
