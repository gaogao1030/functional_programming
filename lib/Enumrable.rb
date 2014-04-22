require 'pry'
class Array
	def partial_inject(initial_value,&block)
					binding.pry
		self.inject([initial_value,[initial_value]]) do |(accumulated, output),element|
			new_value = yield(element)
			[new_value,output << new_value]
		end[1]
	end
end

lengths = ["nil","dsda"].partial_inject(0) do |dog_name|
	dog_name.length
end

p lengths
