# day08 of AOC 2020
using Chain
using Combinatorics: permutations, combinations
using LinearAlgebra: dot, transpose
using Primes: factor
using StatsBase: countmap, rle
using Statistics
using Graphs
using DataFrames, DataFramesMeta

cd("./day08/")
# cd("../day08/")


dat = open("day08_input.txt") do file
  readlines(file)
end

# Part 1

# parse the data
accumulator = 0
idx = 1
instructions = []

for line in dat
  # split the line into the instruction and the argument
  instruction, argument = split(line, " ")
  # push the instruction and argument to the instructions array
  push!(instructions, (instruction, parse(Int, argument)))
end

# create a set to store the indices that have been visited
visited = Set()

# loop over the instructions
while !(idx in visited)
  # add the index to the set of visited indices
  push!(visited, idx)
  # get the instruction and argument
  instruction, argument = instructions[idx]
  # execute the instruction
  if instruction == "acc"
    accumulator += argument
    idx += 1
  elseif instruction == "jmp"
    idx += argument
  elseif instruction == "nop"
    idx += 1
  end
end

# print the accumulator
println(accumulator)


# Part 2
instructions = []
for line in dat
  # split the line into the instruction and the argument
  instruction, argument = split(line, " ")
  flag = false
  # push the instruction and argument to the instructions array
  push!(instructions, (instruction, parse(Int, argument), flag))
end

# address of last line of instructions
eop = length(instructions)
# addresses of lines where instruction == nop and argument != 0
nops = [i for i in 1:eop if instructions[i][1] == "nop" && instructions[i][2] != 0]
# addresses of lines where instruction == jmp
jmps = [i for i in 1:eop if instructions[i][1] == "jmp"]

# loop over the nops
for nop in nops
  # reset the instructions
  instructions = []
  for line in dat
    # split the line into the instruction and the argument
    instruction, argument = split(line, " ")
    flag = false
    # push the instruction and argument to the instructions array
    push!(instructions, (instruction, parse(Int, argument), flag))
  end
  # change the instruction
  instructions[nop] = ("jmp", instructions[nop][2], false)
  # reset the accumulator
  accumulator = 0
  # reset the index
  idx = 1
  # create a set to store the indices that have been visited
  visited = Set()
  # loop over the instructions
  while !(idx in visited)
    # add the index to the set of visited indices
    push!(visited, idx)
    # get the instruction and argument
    instruction, argument, flag = instructions[idx]
    # execute the instruction
    if instruction == "acc"
      accumulator += argument
      idx += 1
    elseif instruction == "jmp"
      idx += argument
    elseif instruction == "nop"
      idx += 1
    end
    # check if the index is the end of the program
    if idx == eop + 1
      # print the accumulator
      println(accumulator)
      break
    end
  end
end

# loop over the jmps
for jmp in jmps
  # reset the instructions
  instructions = []
  for line in dat
    # split the line into the instruction and the argument
    instruction, argument = split(line, " ")
    flag = false
    # push the instruction and argument to the instructions array
    push!(instructions, (instruction, parse(Int, argument), flag))
  end
  # change the instruction
  instructions[jmp] = ("nop", instructions[jmp][2], false)
  # reset the accumulator
  accumulator = 0
  # reset the index
  idx = 1
  # create a set to store the indices that have been visited
  visited = Set()
  # loop over the instructions
  while !(idx in visited)
    # add the index to the set of visited indices
    push!(visited, idx)
    # get the instruction and argument
    instruction, argument, flag = instructions[idx]
    # execute the instruction
    if instruction == "acc"
      accumulator += argument
      idx += 1
    elseif instruction == "jmp"
      idx += argument
    elseif instruction == "nop"
      idx += 1
    end
    # check if the index is the end of the program
    if idx == eop + 1
      # print the accumulator
      println(accumulator)
      break
    end
  end
end