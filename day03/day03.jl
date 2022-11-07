# day03 of AOC 2020
cd("../day03/")

# Part 1

## find the number of trees encountered when moving right 3 and down 1

# read in the data
# f = open("day03_test.txt", "r")
f = open("day03_input.txt", "r")
data = readlines(f)

# find the number of trees encountered when moving right 3 and down 1
# num_trees = 0
# pos = 1

#for i in 1:length(data)
#    # check if the current position is a tree
#    if data[i][pos] == '#'
#        num_trees += 1
#    end
#    
#    # move right 3 and down 1
#    pos += 3
#    if pos > length(data[i])
#        pos -= length(data[i])
#    end
#end

# println("The number of trees encountered when moving right 3 and down 1 is $num_trees")

# Part 2

## find the product of the number of trees encountered when moving right 1 and down 1, right 3 and down 1, right 5 and down 1, right 7 and down 1, and right 1 and down 2

# try to do this via function, that takes the data input, as well as x and y values, and returns the number of trees encountered
function find_num_trees(data, x, y)
    num_trees = 0
    pos = 1

    for i in 1:y:length(data)
        # check if the current position is a tree
        if data[i][pos] == '#'
            num_trees += 1
        end
        
        # move right x and down y
        pos += x
        if pos > length(data[i])
            pos -= length(data[i])
        end
    end
    
    return num_trees
end


num_trees = [0, 0, 0, 0, 0]
num_trees[1] = find_num_trees(data, 1, 1)
num_trees[2] = find_num_trees(data, 3, 1)
num_trees[3] = find_num_trees(data, 5, 1)
num_trees[4] = find_num_trees(data, 7, 1)
num_trees[5] = find_num_trees(data, 1, 2)

println("The product of the number of trees encountered when moving right 1 and down 1, right 3 and down 1, right 5 and down 1, right 7 and down 1, and right 1 and down 2 is $(prod(num_trees))")