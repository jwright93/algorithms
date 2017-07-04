class MyHash
  attr_reader :buckets

  def intitialize
    @buckets = []
  end

  def insert(k,v)
    index = assign_find_key(k)
    buckets[index] ||= []
    buckets[index] << [k,v]
  end

  def find(k)
    index = assign_find_key(k)

    buckets[index].each do |pair|
      return pair[1] if pair[0] == k
    end
  end

  def symbolize_key(k)
    k = k.to_sym
    k.object_id
  end

  def assign_find_key(k)
    symbolize_key(k) % 100
  end

end
