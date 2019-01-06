
library(shiny)
library(magrittr)

# website image dimensions are 160 x 213 px

people <- tibble::tribble(
  ~name,          ~title,                   ~image,
  "Paul Jensen",  "Principal Investigator", "Paul_Jensen.jpg",
  
  "Kenan Jijakli", "Graduate Student", "Kenan_Jijakli.png",
  "Ryan Wyllie", "Graduate Student", "Ryan_Wyllie.png",
  "Dikshant Pradhan", "Graduate Student", "Dikshant_Pradhan.png",

  "Walden Li", "Lab Technician", "Walden_Li.png",
  
  "Joshua Au", "Undergraduate Student", "Joshua_Au.png",
  "Thomas Keaty", "Undergraduate Student", "Thomas_Keaty.png",
  "Mia Sales", "Undergraduate Student", "Mia_Sales.png",
  "William Herbert", "Undergraduate Student", "Will_Herbert.png",
  "Matthew Tang", "Undergraduate Student", "Matthew_Tang.png",
  "Adam Dama", "Undergraduate Student", "Adam_Dama.png",
  "Deepthi Suresh", "Undergraduate Student", "Deepthi_Suresh.png",
  "Soham Saha", "Undergraduate Student", "Soham_Saha.png"
)

width <- 3
n <- nrow(people)
j <- 1
lines <- '---\nlayout: default\n---\n\n<div class="main">\n<h2>People</h2>\n<table class="ppl">\n'
for (i in 1:n) {
  if (j == 1) {
    img_lines <- "<tr>"
    txt_lines <- "<tr>"
  }
  
  img_lines %<>% append(sprintf(
    '<td class="ppl-image"><img src="/img/people/%s" width=160px></td>',
    people$image[i]
  ))
  txt_lines %<>% append(sprintf(
    '<td class="ppl-title">%s <p class="ppl-title">%s</p></td>',
    people$name[i], people$title[i]
  ))
  
  if (j == width || i == n) {
    lines %<>% append(c(img_lines, "</tr>"))
    lines %<>% append(c(txt_lines, "</tr>"))
    j <- 1
  } else {
    j <- j + 1
  }
}

lines %<>% append('
  </table>

  <br><br>

  <h4>Lab Alumni</h4>
	<ul>
    <li><i>Graduate Students</i>
    <ul>
      <li>Jeremy Kemball (Bioinformatics Research Scientist at Air Force Research Laboratory)</li>
    </ul>
    </li>

    <li><i>Undergraduate Students</i>
    <ul>
      <li>Garrett Chou (Engineer at Fellowes)</li>
      <li>Caroline Blassick (Graduate student at Boston Univ. BME)</li>
    </ul>
    </li>

    <li><i>Technicians</i>
    <ul>
      <li>Zach Quicksall (Informatics Specialist at Mayo Clinic)</li>
      <li>Brent Wu (Medical student at St. Louis Univ.)</li>
      <li>Megan Griebel (Graduate student at Boston Univ. BME)</li>
      <li>Audra Storm (Medical student at Southern Illinois Univ.)</li>
    </ul>
    </li>
  </ul>
                  
</div>
')

writeLines(lines, con="people/index.html")
