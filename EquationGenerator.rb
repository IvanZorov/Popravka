class EquationGenerator

	def Kvadratno
		a = NumGen 1,7
		b = NumGen 2,11
		c = NumGen 3,14

		d = (b ** 2) - (4 * a * c)
		
		if ( d >= 0 ) 
 			root1 = ( -b + Math.sqrt( d ) ) / (2 * a)
  			root2 = ( -b - Math.sqrt( d ) ) / (2 * a)
  		else
  			root1 = root2 = "Nqma koreni"
  		end

  		uslovie = ""

  		uslovie << ". #{a}*x*x + #{b}*x + #{c}\n\n" 

  		return root1.to_s,root2.to_s,uslovie

	end

	def NumGen n,n1
		rand(n1) + n	
	end
	
end
