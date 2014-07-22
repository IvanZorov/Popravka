require "prawn"
require "cgi"
require_relative "EquationGenerator"

class HTMLPDFGen
	@@eqGen = EquationGenerator.new
	
	@@allTests


	def GenTests
		@@allTests = []
		10.times do |i|
			@@allTests << @@eqGen.Kvadratno
		end																
	end

	def PDFGen name
		pdf = Prawn::Document.new

		10.times do |i|
			pdf.text ((i+1).to_s + GetQuest( i, 2))
		end

		pdf.render_file ("Test_" + name)
	end

	def PDFGenAnswers name
		pdf = Prawn::Document.new

		10.times do |i|
			pdf.text ((i+1).to_s + GetQuest( i, 2))
			pdf.text (GetQuest i, 0)
			pdf.text (GetQuest i, 1)
			pdf.text "\n"
		end

		pdf.render_file ("Test_" + name.gsub(/.pdf/, "") + "Answers.pdf")
	end

	def HTMLGen name
		name+=".html"
		cgi = CGI.new("html4")

		file =  File.open("Test_" + name.gsub(/.html/, "") + ".html", "w")
		file.puts cgi.html{ cgi.body{ cgi.h2{"Test " + name.gsub(/.html/, "")} + "\n" + "\n" }  }
		10.times do |i|
			file.puts cgi.html {
				cgi.head{
					"\n" + cgi.title{"Test " + name.gsub(/.html/, "")}
				} +
				cgi.body{
					"\n" + 
					cgi.form{ 
						cgi.p{(i+1).to_s + GetQuest(i, 2)} + "\n"
					}
				}
			}
		end



	file.close()
	end

	def HTMLGenAnswers name
		name+=".html"
		cgi = CGI.new("html4")

		file =  File.open("Test_" + name.gsub(/.html/, "") + "Answers.html", "w")
		file.puts cgi.html{ cgi.body{ cgi.h2{"Test " + name.gsub(/.html/, "") + " Answers"} + "\n" + "\n" }  }
		10.times do |i|
			file.puts cgi.html {
				cgi.head{
					"\n" + cgi.title{"Test " + name.gsub(/.html/, "")}
				} +
				cgi.body{
					"\n" + 
					cgi.form{ 
						cgi.p{(i+1).to_s + GetQuest(i, 2)}  +
						cgi.p{GetQuest(i, 0)} + 
						cgi.p{GetQuest(i, 1)} + cgi.br
					}
				}
			}
		end



	file.close()
	end

	def GetQuest x, y												
		@@allTests[x][y]
	end
end
