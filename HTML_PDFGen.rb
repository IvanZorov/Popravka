require "prawn"
require_relative "EquationGenerator"

class HTMLPDFGen
	@@eqGen = EquationGenerator.new
	
	@@allTests = []


	def GenTests
		10.times do |i|
			@@allTests << @@eqGen.Kvadratno
		end																
	end
	
	def PDFGen name
		pdf = Prawn::Document.new

		10.times do |i|
			pdf.text ((i+1).to_s + GetQuest( i-1, 2))
		end

		pdf.render_file ("Test_" + name)
	end

	def PDFGenAnswers name
		pdf = Prawn::Document.new

		10.times do |i|
			pdf.text ((i+1).to_s + GetQuest( i-1, 2))
			pdf.text (GetQuest i-1, 0)
			pdf.text (GetQuest i-1, 1)
			pdf.text "\n"
		end

		pdf.render_file ("Test_" + name.gsub(/.pdf/, "") + "Answers.pdf")
	end
	
	def GetQuest x, y												
		@@allTests[x][y]
	end
	
end
