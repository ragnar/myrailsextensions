class Array
  def fisher_yates_shuffle
    arr = self.dup
    (arr.size - 1).downto 1 do |i|
      j = Kernel.rand(i + 1)
      arr[i], arr[j] = arr[j], arr[i]
    end
    arr
  end
end

STDERR.puts "**   Loaded Array additions for ruby #{RUBY_VERSION.to_f}."
