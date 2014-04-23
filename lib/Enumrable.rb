require 'pry'
class Array
	def partial_inject(initial_value,&block)
		self.inject([initial_value,[initial_value]]) do |(accumulated, output),element|
			new_value = yield(element)
			[new_value,output << new_value]
		end[1]
	end

	def mash(&block)
		self.inject({}) do |output,item|
			key,value = block_given? ? yield(item) : item
			output.merge(key => value)
		end
	end
end

natural_numbers = Enumerator.new do |yielder|
	(1..1.0/0).each do |number|
		yielder.yield number
	end
end

fib = Enumerator.new do |y|
	a = b = 1
	loop do
		y << a
		a,b = b, a + b
	end
end

lengths = ["nil","dsda"].partial_inject(0) do |dog_name|
	dog_name.length
end

hash = ["gaogao","pockycat","function","programmer"].mash{|s|[s,s.length]}

#natural_collection = natural_numbers.take(10)

natural_collection = natural_numbers.map{|x| 2*x}.take(10)

p lengths
p hash
p natural_collection
p fib.take(10)
