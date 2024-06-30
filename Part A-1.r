queue <- c("Steve", "Russell", "Alison", "Liam")
queue[length(queue)+1]="Barry" 
queue <- queue[queue != "Steve"] 
queue <- append(queue, "Pam", after = 0) 
queue <- queue[queue != "Barry"]
queue <- queue[queue != "Alison"]
which(queue=="Russell")
