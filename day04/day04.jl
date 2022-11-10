# day04 of AOC 2020
using Chain
using Combinatorics: permutations, combinations
using LinearAlgebra: dot, transpose
using Primes: factor
using StatsBase: countmap, rle
using Statistics
using Graphs
using DataFrames, DataFramesMeta

cd("../day04/")


# Part 1

## find the number of valid passports
## a valid passport is one where all of the required fields are present

const Passport = Dict{String,String}

function readinput(filepath)
    function parsepassport(str)
        p = Passport()
        ss = split(str, r"\s")
        for s in ss
            m = match(r"([a-z]{3}):(.+)$", s)
            p[m[1]] = m[2]
        end
        p
    end
    strs = open(filepath) do file
        split(strip(read(file, String)), "\n\n")
    end
    map(parsepassport, strs)
end

passports = readinput("day04_input.txt")

# find the number of valid passports
valid_passports = 0

# create a list of the required fields
required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

function check_fields(passport, required_fields)
    # check if all of the required fields are present
    all([r in keys(passport) for r in required_fields])
end


for passport in passports
    if check_fields(passport, required_fields)
        valid_passports += 1
    end
end

valid_passports




## part 2

## find the number of valid passports
## a valid passport is one where all of the required fields are present and valid

# create a list of the valid eye colors
valid_eye_colors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

# create a list of the valid hair colors
valid_hair_colors = ["a", "b", "c", "d", "e", "f", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

# create a list of the valid height units
valid_height_units = ["cm", "in"]

# create a list of the valid height values
valid_height_cmvalues = [150:193;]
valid_height_invalues = [59:76;]

# create a list of the valid passport ids
valid_passport_ids = [0:9;]

# create a list of the valid years
valid_byears = [1920:2002;]
valid_iyears = [2010:2020;]
valid_eyears = [2020:2030;]


# find the number of valid passports
valid_passports = 0

# create a list of the required fields
required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

function check_fields(passport, required_fields)
    # check if all of the required fields are present
    all([r in keys(passport) for r in required_fields])
end

function check_byr(passport)
    # check if the birth year is valid
    if length(passport["byr"]) == 4
        if parse(Int, passport["byr"]) in valid_byears
            return true
        end
    end
    return false
end

function check_iyr(passport)
    # check if the issue year is valid
    if length(passport["iyr"]) == 4
        if parse(Int, passport["iyr"]) in valid_iyears
            return true
        end
    end
    return false
end

function check_eyr(passport)
    # check if the expiration year is valid
    if length(passport["eyr"]) == 4
        if parse(Int, passport["eyr"]) in valid_eyears
            return true
        end
    end
    return false
end

function check_hgt(passport)
    # check if the height is valid
    if length(passport["hgt"]) == 5
        if passport["hgt"][4:5] == "cm"
            if parse(Int, passport["hgt"][1:3]) in valid_height_cmvalues
                return true
            end
        end
    elseif length(passport["hgt"]) == 4
        if passport["hgt"][3:4] == "in"
            if parse(Int, passport["hgt"][1:2]) in valid_height_invalues
                return true
            end
        end
    end
    return false
end

function check_hcl(passport)
    # check if the hair color is valid
    if passport["hcl"][1] == '#'
        if length(passport["hcl"]) == 7
            # if all([c in valid_hair_colors for c in passport["hcl"][2:7]])
            if !isnothing(match(r"([a-f0-9]{6})", passport["hcl"][2:7]))
                return true
            end
        end
    end
    return false
end

function check_ecl(passport)
    # check if the eye color is valid
    if passport["ecl"] in valid_eye_colors
        return true
    end
    return false
end

function check_pid(passport)
    # check if the passport id is valid
    if length(passport["pid"]) == 9
        # if all([c in valid_passport_ids for c in passport["pid"]])
        if !isnothing(match(r"^\d{9}$", passport["pid"]))
            return true
        end
    end
    return false
end

function check_valid(passport)
    # check if the passport is valid
    if check_fields(passport, required_fields)
        if check_byr(passport)
            if check_iyr(passport)
                if check_eyr(passport)
                    if check_hgt(passport)
                        if check_hcl(passport)
                            if check_ecl(passport)
                                if check_pid(passport)
                                    return true
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return false
end

valid_passports = 0
for passport in passports
    if check_valid(passport)
        valid_passports += 1
    end
end

valid_passports
