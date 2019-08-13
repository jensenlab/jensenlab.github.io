
library(shiny)
library(magrittr)

# website image dimensions are 160 x 213 px

people <- tibble::tribble(
  ~name,          ~title,                   ~image,
  "Paul Jensen",  "Principal Investigator", "Paul_Jensen.jpg",
  
  "Kenan Jijakli", "Graduate Student", "Kenan_Jijakli.png",
  "Ryan Wyllie", "Graduate Student", "Ryan_Wyllie.png",
  "Walden Li", "Graduate Student", "Walden_Li.png",
  "Adam Dama", "Data Scientist", "Adam_Dama.png",
  "Deepthi Suresh", "Graduate Student", "Deepthi_Suresh.png",
  
  "Soham Saha", "Undergraduate Student", "Soham_Saha.png",
  "Pranith Bottu", "Undergraduate Student", "Pranith_Bottu.png"
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

  <h2>Alumni</h2>
    <h4>Graduate Students</h4>
    <ul>
      <li>Dikshant Pradhan (Bioinformaticist at Koch Institute, MIT)</li>
      <li>Jeremy Kemball (Bioinformatics Research Scientist at Air Force Research Laboratory)</li>
    </ul>

    <h4>Undergraduate Students</h4>
    <ul>
      <li>Noah Schmid (Grad student at Illinois BIOE)</li>
      <li>William Herbert (Grad student at Mayo Clinic BME)</li>
      <li>Matthew Tang (Engineer at Google)</li>
      <li>Thomas Keaty (Technical Problem Solver at Epic Systems)</li>
      <li>Joshua Au (Trainee at FTTA)</li>
      <li>Mia Sales (Grad student at UCSD Bioinf. & Comp. Bio)</li>
      <li>Garrett Chou (Engineer at Fellowes)</li>
      <li>Caroline Blassick (Grad student at Boston Univ. BME)</li>
    </ul>

    <h4>Technicians</h4>
    <ul>
      <li>Zach Quicksall (Informatics Specialist at Mayo Clinic)</li>
      <li>Brent Wu (Medical student at St. Louis Univ.)</li>
      <li>Megan Griebel (Grad student at Boston Univ. BME)</li>
      <li>Audra Storm (Medical student at Southern Illinois Univ.)</li>
    </ul>
                  
</div>
')

writeLines(lines, con="people/index.html")
