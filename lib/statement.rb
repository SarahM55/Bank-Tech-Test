require_relative '../lib/account'

class Statement

  def print(x)
    puts x.is_a?(String) ? x : x.join("\n")
  end

end
