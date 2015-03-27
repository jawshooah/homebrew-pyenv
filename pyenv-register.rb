class PyenvRegister < Formula
  homepage "https://github.com/doloopwhile/pyenv-register"
  head "https://github.com/doloopwhile/pyenv-register.git"

  depends_on "pyenv"

  def install
    prefix.install Dir["*"]
  end

  test do
    assert shell_output("eval \"$(pyenv init -)\" && pyenv help register")
  end
end
