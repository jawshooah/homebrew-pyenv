class PyenvDefaultPackages < Formula
  homepage "https://github.com/jawshooah/pyenv-default-packages"
  head "https://github.com/jawshooah/pyenv-default-packages.git"
  url "https://github.com/jawshooah/pyenv-default-packages/archive/0.3.1.tar.gz"
  sha256 "b7a77308643b97f327b32f24e9a937c03b04923a17217227a9931cb38f6bb062"

  depends_on "pyenv"
  depends_on "pyenv-virtualenv" => :recommended

  def install
    ENV["PREFIX"] = prefix
    system "./install.sh"
  end

  test do
    assert shell_output("pyenv hooks install").include? "default-packages.bash"
    if build.with? "pyenv-virtualenv"
      assert shell_output("pyenv hooks virtualenv").include? "default-packages.bash"
    end
  end
end
