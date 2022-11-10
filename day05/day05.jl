# day05 of AOC 2020
using Chain
using Combinatorics: permutations, combinations
using LinearAlgebra: dot, transpose
using Primes: factor
using StatsBase: countmap, rle
using Statistics
using Graphs
using DataFrames, DataFramesMeta

cd("../day05/")


# Part 1

## find the highest seat ID

# read in the input
function readinput(filepath)
  strs = open(filepath) do file
      split(strip(read(file, String)), "\n")
  end
  strs
end

passes = readinput("day05_input.txt")


function get_row(pass)
    range = pass[1:7]
    x = 0
    y = 127
    for i in 1:7
        if range[i] == 'F'
            y = floor(Int, y - (y-x)/2)
        else
            x = x + round(Int, (y-x)/2)
        end
    end
    row = y
end


function get_column(pass)
    range = pass[8:10]
    x = 0
    y = 7
    for i in 1:3
        if range[i] == 'L'
            y = floor(Int, y - (y-x)/2)
        else
            x = x + round(Int, (y-x)/2)
        end
    end
    column = y
end


function get_seat_id(pass)
    row = get_row(pass)
    column = get_column(pass)
    seat_id = row * 8 + column
end


get_seat_id(passes[3])




# find the highest seat ID
highest_seat_id = 0

for pass in passes
    seat_id = get_seat_id(pass)
    if seat_id > highest_seat_id
        highest_seat_id = seat_id
    end
end

highest_seat_id



# Part 2

## find the missing seat ID

# find the seat IDs
seat_ids = []

for pass in passes
    seat_id = get_seat_id(pass)
    push!(seat_ids, seat_id)
end

# find the missing seat ID
missing_seat_id = 0

for i in 1:1023
    if i ∉ seat_ids
        if i-1 ∈ seat_ids && i+1 ∈ seat_ids
            missing_seat_id = i
        end
    end
end

missing_seat_id