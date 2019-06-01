#array=[10,5,15,25,45,15,15,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,2,2,10,25,25,2,1,8,7,10,6,20,15,20,20,20,21,5]
require "./worst_range.rb"

puts  "****************** Start data ****************************************"
p array = [1,2,31,4,5,10,2]
frame_percent = 10
frame_size_max = 3

array_improved = Hash.new
array_improved = {
#       arr: array,          # if you need to see values in calculated array
      start: 0,              # begin point of frame
        cnt: 0,              # frame size
      ratio: array.mean      # goal ratio, method from `worst_range.rb` file
    }


puts "Ratio before is #{array_improved[:ratio]}"
puts

(1..frame_size_max).each do |cnt|                      # Each => count of elements in frame
        (0..array.size-cnt).each do |start|            # Each => start position
             mass = array.clone
#              new_ratio = mass.slice!(start, cnt).mean # Выдавало значение стартовой позиции
             mass.slice!(start, cnt)
             new_ratio = mass.mean
# ---------------- Debug information --------------------------
#             puts "---->>>><<<<<---"
#             p "mass =>#{mass}"
#             p "ratio => #{new_ratio}"
#             puts
#----------------- Debug block end ____________________________
             if new_ratio > array_improved[:ratio]
                 array_improved = {
                     ratio: new_ratio,
                     start: start,
                       cnt: cnt
                 }
             end
        end

    end
puts "=============== Result block =============="
puts array_improved
puts "==================== end =================="
puts


# frame_size_max = (array.length*frame_percent/100)
# puts "Max size of push out frame is  #{frame_size_max.to_s}"
puts "___________________ Wrost_range funtion ______________________________"
puts worst_range(array, frame_percent)
puts