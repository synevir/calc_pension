class Array
  def mean
    sum.to_f / size
  end
end

def worst_range(a, percent = 10)
# frame_size = a.size * percent / 100
# If you want to change `percent` value uncoment row above and comment row under
  frame_size = 3
  total_sum = a.sum
  total_cnt = a.count
  [].tap do |result|
    a.each_with_index do |i, ind|
      (1..[a.slice(ind, frame_size).size, frame_size].min).each do |c|
        frame = a.slice(ind, c)
        result << {
          start: ind,
          cnt: c,
          items: frame,
          value: ((total_sum - frame.sum).to_f / (total_cnt - c)).round(5)
        }
      end
    end 
  end.max { |a, b| a[:value] <=> b[:value] }
end
