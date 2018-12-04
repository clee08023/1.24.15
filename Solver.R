# Load lpSolve
require(lpSolve)

# A resource allocation example
# A Biotech company produce two enzymes, triA and triB, with profit contributions of $150 and $160 per unit
# Both enzymes have high demand, the comapny can sell all the units they make
# The production has three steps: 
  #   Extraction
  ##  Purification 
  ### QualityAssurance and Packaging
# The maximum hours per week, the company can only dedicate for production steps are 5610, 2200 ,and 1200, respectively
# Each unit of the two enzymes requires the following proceesing times in these production steps
  # Enzyme:  Extraction:  Purification: QA and Packaging
  #  triA      4            1.5            1.0
  #  triB      5            2.0            0.8

## Set the coefficients of the decision variables : profit
profit <- c(150, 160)

## Create constraint martix: const.mat
A <- matrix(c(4, 5,
              1.5,2,
              1,0.8,
              1,0,
              0,1),  nrow=5, byrow=TRUE)

## define constraints
time_constraint <- 5610
manu_constraint <- 2200
resource_constraint <- 1200
mAXA <- 1
mAXB<- 1

## RHS for the constraints
const.rhs <- c(time_constraint,manu_constraint,resource_constraint, mAXA , mAXB)

## Constraints direction
const.dir  <- c("<=", "<=","<=",">",">")

## Find the optimal solution
optimum <-  lp(direction="max",  objective.in = profit, 
               const.mat = A, const.dir, const.rhs, all.int = T)
optimum$solution
