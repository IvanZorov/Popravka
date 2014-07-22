require_relative "HTML_PDFGen"

class Main
	@@hpGen = HTMLPDFGen.new
	@@numOfTests = 0
	
	def Run
		GetInput()
		@@numOfTests.to_i.times do |i|
			@@hpGen.GenTests
			@@hpGen.PDFGen ((i+1).to_s + ".pdf")
			@@hpGen.PDFGenAnswers ( (i+1).to_s + ".pdf")
			@@hpGen.HTMLGen ( (i+1).to_s + ".html" )
			@@hpGen.HTMLGenAnswers ( (i+1).to_s + ".html" )
		end

	end

	def GetInput()
		@@numOfTests = ""
		puts "Enter number of tests to be generated: "
		@@numOfTests = gets.chomp
		if(@@numOfTests.to_i < 0)
			puts "ERROR: Number must be a positive integer"
		end
 	end
end

main = Main.new
main.Run
