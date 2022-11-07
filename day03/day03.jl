# day03 of AOC 2020
cd("../day03/")

# Part 1

## find the number of trees encountered when moving right 3 and down 1

# read in the data
# f = open("day03_test.txt", "r")
f = open("day03_input.txt", "r")
data = readlines(f)

# find the number of trees encountered when moving right 3 and down 1
num_trees = 0
pos = 1

for i in 1:length(data)
    # check if the current position is a tree
    if data[i][pos] == '#'
        num_trees += 1
    end
    
    # move right 3 and down 1
    pos += 3
    if pos > length(data[i])
        pos -= length(data[i])
    end
end

println("The number of trees encountered when moving right 3 and down 1 is $num_trees")

# Part 2

## find the product of the number of trees encountered when moving right 1 and down 1, right 3 and down 1, right 5 and down 1, right 7 and down 1, and right 1 and down 2
num_trees = [0, 0, 0, 0, 0]
pos = [1, 1, 1, 1, 1]

for i in 1:length(data)
    # check if the current position is a tree
    for j in 1:5
        if data[i][pos[j]] == '#'
            num_trees[j] += 1
        end
    end
    
    # move right 1 and down 1
    pos[1] += 1
    if pos[1] > length(data[i])
        pos[1] -= length(data[i])
    end
    
    # move right 3 and down 1
    pos[2] += 3
    if pos[2] > length(data[i])
        pos[2] -= length(data[i])
    end
    
    # move right 5 and down 1
    pos[3] += 5
    if pos[3] > length(data[i])
        pos[3] -= length(data[i])
    end
    
    # move right 7 and down 1
    pos[4] += 7
    if pos[4] > length(data[i])
        pos[4] -= length(data[i])
    end
    
    # move right 1 and down 2
    if i % 2 == 0
      pos[5] += 1
      if pos[5] > length(data[i])
          pos[5] -= length(data[i])
      end
    end
end

println("The product of the number of trees encountered when moving right 1 and down 1, right 3 and down 1, right 5 and down 1, right 7 and down 1, and right 1 and down 2 is $(prod(num_trees))")