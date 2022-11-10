## day01 of AOC 2020
using DelimitedFiles

cd("./day01/")

# Part 1

## first find the two numbers that sum to 2020
## then multiply them together

# read in the data
data = readdlm("day01_input.txt", Int)
# data = readdlm("day01_test.txt", Int)

# find the two numbers that sum to 2020
for i in 1:length(data)
    for j in 1:length(data)
        if data[i] + data[j] == 2020
            println("The two numbers that sum to 2020 are $(data[i]) and $(data[j])")
            println("The product of these two numbers is $(data[i] * data[j])")
        end
    end
end

# Part 2

## find the three numbers that sum to 2020
## then multiply them together

# find the three numbers that sum to 2020
for i in 1:length(data)
    for j in 1:length(data)
        for k in 1:length(data)
            if data[i] + data[j] + data[k] == 2020
                println("The three numbers that sum to 2020 are $(data[i]), $(data[j]), and $(data[k])")
                println("The product of these three numbers is $(data[i] * data[j] * data[k])")
            end
        end
    end
end