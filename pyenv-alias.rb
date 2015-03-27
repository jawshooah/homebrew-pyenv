class PyenvAlias < Formula
  homepage "https://github.com/s1341/pyenv-alias"
  head "https://github.com/s1341/pyenv-alias.git"

  depends_on "pyenv"

  def install
    prefix.install Dir["*"]
  end

  test do
    assert shell_output("pyenv hooks install").include?("alias.bash")
  end
end
