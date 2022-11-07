## day02 of AOC 2020
using DelimitedFiles
using Printf

cd("../day02/")

# Part 1

## find the number of valid passwords
## a valid password is one where the number of times a given letter appears in the password is between the two numbers given

# read in the data
f = open("day02_input.txt", "r")
# f = open("day02_test.txt", "r")
data = readlines(f)

# find the number of valid passwords
valid_passwords = 0

for i in 1:length(data)
    # split the data into the policy and the password
    policy, password = split(data[i], ": ")
    
    # split the policy into the number of times the letter must appear and the letter
    num_times, letter = split(policy, " ")
    
    # split the number of times the letter must appear into the minimum and maximum number of times the letter must appear
    min_times, max_times = split(num_times, "-")
    
    # count the number of times the letter appears in the password
    num_letter = count(letter, password)
    
    # check if the number of times the letter appears in the password is between the minimum and maximum number of times the letter must appear
    if num_letter >= parse(Int, min_times) && num_letter <= parse(Int, max_times)
        valid_passwords += 1
    end
end

println("The number of valid passwords is $valid_passwords")

# Part 2

## find the number of valid passwords
## a valid password is one where the letter appears in exactly one of the two positions given

# find the number of valid passwords
valid_passwords = 0

for i in 1:length(data)
    # split the data into the policy and the password
    policy, password = split(data[i], ": ")
    
    # split the policy into the number of times the letter must appear and the letter
    num_times, letter = split(policy, " ")
    
    # split the number of times the letter must appear into the minimum and maximum number of times the letter must appear
    pos1, pos2 = split(num_times, "-")
    
    # check if the letter appears in exactly one of the two positions given
    if (password[parse(Int, pos1)] == letter[1]) != (password[parse(Int, pos2)] == letter[1])
        valid_passwords += 1
    end
end

println("The number of valid passwords is $valid_passwords")