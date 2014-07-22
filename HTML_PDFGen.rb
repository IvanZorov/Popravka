require "prawn"
require_relative "EquationGenerator"

class HTMLPDFGen
	@@eqGen = EquationGenerator.new
	
	@@allTests = []


	def	GenTests
		10.times do |i|
			@@allTests << @@eqGen.Kvadratno
		end																
	end
	
	def GetQuest x, y												
		@@allTests[x][y]
	end
	
end
