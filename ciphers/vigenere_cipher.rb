#!/usr/bin/ruby

print "enter the alphabet being used in this cipher: "
alphabet = gets.chomp
alphabetLen = alphabet.length
puts "\n\n1 = Encrypt the message using the key"
puts "2 = Decrypt the message using the key"
puts "3 = try to recover the key from the Plaintext and Ciphertext"
print "enter the program mode: "
input = gets.chomp.to_i

if (input == 1)
    # Read plaintext from the user
    print "Please enter the plaintext: "
    pt = gets.chomp
    ptLen = pt.length

    # Read the key from the user
    print "Now enter the key: "
    key = gets.chomp
    keyLen = key.length

    # Calculate the ciphertext
    ct = ""
    (0...ptLen).each { |k|
        puts "Current index, running through the plaintext: #{k}"
        shiftLetter = key[(k % keyLen)]
        shiftNum = alphabet.index(shiftLetter)
        if (shiftNum)
            nextNum = alphabet.index(pt[k]) + shiftNum
            if nextNum > (alphabet.length-1)
                nextNum -= alphabetLen
            end
            ct += alphabet[nextNum]
        else
            ct += "?"
        end
    }
    puts ct
elsif (input == 2)
    # Read ciphertext from the user
    print "Please enter the ciphertext: "
    ct = gets.chomp
    ctLen = ct.length

    # Read the key from the user
    print "Now enter the key: "
    key = gets.chomp
    keyLen = key.length

    # Calculate the plaintext
    pt = ""
    (0...ctLen).each { |k|
        shiftLetter = key[(k % keyLen)]
        shiftNum = alphabet.index(shiftLetter)
        if (shiftNum)
            nextNum = alphabet.index(ct[k]) - shiftNum
            if nextNum < 0
                nextNum += alphabetLen
            end
            pt += alphabet[nextNum]
        else
            pt += "?"
        end
    }
    puts pt
elsif (input == 3)
    # Read plaintext from the user
    pt = gets.chomp
    ptLen = pt.length

    # Read ciphertext from the user
    ct = gets.chomp
    ctLen = ct.length

    recKey = ""
    (0...ptLen).each { |j|
        diffNum = (alphabet.index(ct[j])) - (alphabet.index(pt[j]))
        if diffNum < 0
            diffNum += alphabetLen
        end
        recKey[j] = alphabet[diffNum]
    }
    puts recKey
else
    puts "program mode not recognized."
end
