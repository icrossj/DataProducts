library(shiny)


shinyUI(pageWithSidebar(
  headerPanel("HTML: Converting to Hex and Inverting"),
  sidebarPanel(

    sliderInput('red', 'Input Red Value (0-255)',value = 0, min = 0, max = 255, step = 1),
    sliderInput('green', 'Input Green Value (0-255)',value = 0, min = 0, max = 255, step = 1),
    sliderInput('blue', 'Input Blue Value (0-255)',value = 0, min = 0, max = 255, step = 1)
  ),
  mainPanel(
    h3('Color Outputs'),
    h5('Color has many theories. One of them uses RGB. Depending on how much Red Green and Blue is applied, you can get different colors. Not only that, you can invert it by subtracting it from the value of white (#FFFFFF). They are typically displayed in hexadecimal format, with the values representing RRGGBB for R = Red, G = Green, and B = Blue.'),
    h4('How To Use'),
    h5('Simply just change the values on the left (red green blue) to get the colors to change on the right. The HTML code needed to use these colors will be displayed too.'),
    h4('HTML output is'),
    verbatimTextOutput("inputHex"),
    plotOutput('hexPlot'),
    h4('Inverted HTML input is'),
    verbatimTextOutput("invertHex"),
    plotOutput('ihexPlot')
  )
))
