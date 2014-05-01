# Numbers to Words

A personal Ruby challenge I wanted to take on.

This was made into an independent class as an extension to the String and Integer(Fixnum) classes. This makes it more compatible.

##Usage

**NumbersToWords Class**

    require './Numbers-To-Words/lib/NumbersToWords.module.rb'
    require './Numbers-To-Words/lib/NumbersToWords.rb'
    puts converter = NumberToWords.new.convert(123)

**String**

    require './Numbers-To-Words/lib/NumbersToWords.module.rb'
    require './Numbers-To-Words/lib/String.rb'
    puts "123".NumberToWords #=>

**Integer**

    require './Numbers-To-Words/lib/NumbersToWords.module.rb'
    require './Numbers-To-Words/lib/Fixnum.rb'
    puts 123.NumberToWords
