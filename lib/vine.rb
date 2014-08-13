module Enumerable

  def segmentation(n)
    0.upto(size - 2).to_a.combination(n - 1).to_a.map do |s|
      [-1, * s, size - 1].each_cons(2).map {|i, j| self[(i + 1)..j] }
    end
  end

end


class Hash
  
  def access(path, default=nil)
    ret = self
    path.split('.').each do |p|
      if p.to_i.to_s == p
        ret = ret[p.to_i]
      else
        ret = ret[p.to_s] || ret[p.to_sym]
      end
      return default unless ret
    end
    ret
  end

  alias :vine :access

end