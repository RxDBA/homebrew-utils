# "2048" is not a valid class name
class Ncurses2048 < Formula
  desc "Animated console version of 2048 game"
  homepage "https://github.com/alewmoose/2048-in-terminal"
  head "https://github.com/alewmoose/2048-in-terminal.git"

  conflicts_with "c2048",
    because: "both install a '2048' executable"

  def install
    system "make"
    bin.mkpath
    system "make", "install", "DESTDIR=#{bin}"
  end

  test do
    # FIXME: override HOME (setting ENV doesn't work, nor supplying a hash as
    # the first arg of popen3)
    home = File.expand_path "~"
    save = "#{home}/.2048"
    backup = "#{testpath}/_2048"
    mv save, backup if File.exist? save
    pipe_output("#{bin}/2048", "q")
    rm_f save
    mv backup, save if File.exist? backup
  end
end
