require 'pry'
class Array
	def partial_inject(initial_value,&block)
					binding.pry
		arr=self.inject([initial_value]) do |output,element|
			new_value = yield(element)
			output << new_value
		end
			#end[1]
		p arr
	end
end

lengths = ["nil","dsda"].partial_inject(0) do |dog_name|
	dog_name.length
end

p lengths
