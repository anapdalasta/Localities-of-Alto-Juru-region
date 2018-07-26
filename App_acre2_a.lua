import("publish")

local description = [[
   <table style="width:100%"><tr>
    <td style="width: 100%">This aplication presents the urban gradient of the localities sampled by Lana et al. (2017).
   A set of 40 localities in the Alto Juruá region (Acre) was characterized based on a household survey (n = 520) carried out in 2015. The survey investigated the contribution of household and locality level traits on the prevalence of malaria and the results suggested that a more complex urban-rural taxonomy would be useful for classifying areas with different risks for malaria. Adopting an urbanization classification method based on the perspective of a gradient, the localities were classified in terms of landscape (System of Objects) and its social content (System of Values). Data from the household survey by Lana et al. (2017) and land use and land cover by TerraClass Project allowed the classification each locality in a gradient of intensities measured in relation to the Mâncio Lima city. The results showed that localities officially classified as rural are inserted in contexts that are not essentially urban or rural, corroborating with the argument that the close relationship between rural populations and urban centers is an observable phenomenon in the Amazonia.<p><p> <b>References:</b><br>Lana, R.M.; Riback, T. I. S.; Lima, T. F. M., da Silva-Nunes, M.; Cruz, O. G.; Oliveira, F. G. S.; Moresco, G. G.; Honório, N. A.; Codeço, C. T. Socioeconomic and demographic characterization of an endemic malaria region in Brazil by multiple correspondence analysis. Malar J. 2017;16:1. doi: 10.1186/s12936-016-1650-6.<p><p>
   Dal'Asta, A.P.; Lana, R.M.; Amaral, S.; Codeço, C.T.; Monteiro, A.M.V. The Urban Gradient in Malaria-Endemic Municipalities in Acre: Revisiting the Role of Locality. Int. J. Environ. Res. Public Health 2018, 15(6), 1254; doi:10.3390/ijerph15061254.</td>
    <tr>
<td style="width: 100%" align="left"><p><p> <b>Coordination</b><br>Raquel Martins Lana (PROCC/FIOCRUZ) & Cláudia Torres Codeço (PROCC/FIOCRUZ)

<tr>
<table style="width:100%"><tr>
<td style="width: 15%" align="left"> <p><p> <b>Realização</b><br> <img src="A_figTab2.png"/></td>
<td style="width: 85%" align="left"> <p><p> <b>Apoio</b><br> <img src="A_figTab3.png"/></td>
</tr></table>
   ]]

Application{
	project = "loc_acre1.tview",
	description = description,
	clean = true,
	output = "App_acre2_a",
	villages = View{
		download = true,
		description = "Rural and urban localities sampled in the Mâncio Lima (ML) and Rodrigues Alves (RA) municipalities.",
		select = {"nome", "tipo"},
		icon = {"a4_blu.png", "a3_ver.png"},
		label = {"ML", "RA"},
        report = function(cell)
			local mreport = Report{
				title = cell.nome,
                author = "Lana et. al (2017)"
              }

           if cell.dist == 0 then
				mreport:addText(" "..cell.nome.." is an urban locality.")
           elseif cell.dist > 0 then
				mreport:addText(" The "..cell.nome.." locality is "..cell.dist.."km from the nearest city.")

           end

            if cell.Acesso == 1 then
				mreport:addText(" Access is provided by small boats.")
			elseif cell.Acesso == 2 then
				mreport:addText(" The locality is accessible by a network of dirt roads.")

           end

            if cell.PA == 1 then
				mreport:addText(" Belongs to Projeto de Desenvolvimento Sustentável São Salvador - PDSSS")
			elseif cell.PA == 2 then
				mreport:addText(" Belongs to Projeto de Assentamento Paraná dos Moura.")
			elseif cell.PA == 3 then
				mreport:addText(" Belongs to Projeto de Assentamento Treze de Maio.")
			elseif cell.PA == 4 then
				mreport:addText(" Belongs to Projeto de Assentamento Alberto Santiago.")

          end

          mreport:addImage(cell.nome..".JPG")

			 return mreport
		end
		}
}
