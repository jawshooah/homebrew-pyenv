class PyenvDoctor < Formula
  homepage "https://github.com/yyuu/pyenv-doctor"
  head "https://github.com/yyuu/pyenv-doctor.git"

  depends_on "pyenv"

  def install
    prefix.install Dir["{.[^\.]*,*}"]
  end

  test do
    assert shell_output("eval \"$(pyenv init -)\" && pyenv help doctor")
  end
end
