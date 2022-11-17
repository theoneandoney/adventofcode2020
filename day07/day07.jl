# day07 of AOC 2020
using Chain
using Combinatorics: permutations, combinations
using LinearAlgebra: dot, transpose
using Primes: factor
using StatsBase: countmap, rle
using Statistics
using Graphs
using DataFrames, DataFramesMeta

cd("../day07/")


# Part 1

dat = open("day07_test.txt") do file
    readlines(file)
end


bags = []
contents = []
for i in 1:length(dat)
    bag, content = split(dat[i], " bags contain ")
    push!(bags, bag)
    push!(contents, content)
end



## find the number of bags that can eventually contain a shiny gold bag

# create a graph
g = SimpleGraph(0)

# add the nodes
for i in 1:594
    add_vertex!(g)
end

# add the edges
for line in eachline("day07_test.txt")
    # split the line into the bag and the contents
    bag, contents = split(line, " bags contain ")
    # # get the index of the bag
    # bag_idx = findfirst(x -> x == bag, g.vertices)
    # # split the contents into the individual bags
    # contents = split(contents, ", ")
    # # loop over the contents
    # for content in contents
    #     # get the number of bags
    #     num_bags = parse(Int, content[1])
    #     # get the bag name
    #     bag_name = content[3:end-4]
    #     # get the index of the bag
    #     bag_idx = findfirst(x -> x == bag_name, g.vertices)
    #     # add the edge
    #     add_edge!(g, bag_idx, bag_idx)
    # end
end

# find the number of bags that can eventually contain a shiny gold bag


∑(g, 1)



4 ∈ [3:10]
[3:10]