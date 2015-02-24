
fillwithzero <- function(hexstring,num_char){
  #used a quick hack instead of looping
  num_zero <- num_char - nchar(hexstring)
  if (num_zero == 5){
    hexstring <- paste0("00000",hexstring)
  }
  if (num_zero == 4){
    hexstring <- paste0("0000",hexstring)
  }
  if (num_zero == 3){
    hexstring <- paste0("000",hexstring)
  }
  if (num_zero == 2){
    hexstring <- paste0("00",hexstring)
  }
  if (num_zero == 1){
    hexstring <- paste0("0",hexstring)
  }
  return(hexstring)
}

createHex <- function(red,green,blue){
  redHex <- fillwithzero(sprintf('%X',red),2)
  blueHex <- fillwithzero(sprintf('%X',blue),2)
  greenHex <- fillwithzero(sprintf('%X',green),2)
  mergedHex <- paste0(redHex,greenHex,blueHex)
  colorHex <- paste0("#",mergedHex)
  return(colorHex)
}

invertHex <- function(hexstring){
  #assuming it has # attached
  max <- strtoi("0xFFFFFF")
  value <- strtoi(gsub("#","0x",hexstring))
  invertedValue <- max - value
  invertHex <- fillwithzero(sprintf('%X',invertedValue),6)
  colorHex <- paste0("#",invertHex)
  return(colorHex)
}


library(shiny)
shinyServer(
  function(input, output) {
    output$inputHex <- renderPrint({createHex(input$red,input$blue,input$green)})
    output$invertHex <- renderPrint({invertHex(createHex(input$red,input$blue,input$green))})
    output$hexPlot <- renderPlot({
      plot(c(100, 200), c(300, 450), type= "n", xlab = "", ylab = "", main="Color of Input")
      rect(100, 200, 300, 450, col = createHex(input$red,input$green,input$blue), border = "black")
    })

    output$ihexPlot <- renderPlot({
    plot(c(100, 200), c(300, 450), type= "n", xlab = "", ylab = "", main="Color of Inverted Input")
    rect(100, 200, 300, 450, col = invertHex(createHex(input$red,input$green,input$blue)), border = "black")
    })
  }
)
