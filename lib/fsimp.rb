class Fsimp

  attr_reader :name, :perm
  def initialize(name, permission="a+")
    @name = name
    @perm = permission
    if File.file?(@name)
      puts "#{@name} exists!"
    else
      f = File.new(@name, @perm)
      puts "#{@name} created with #{@perm} permissions!"
      f.close
    end
  end

  def name
    puts "#{@name}"
  end

  def perm
    puts "#{@perm}"
  end

  def read 
    if File.readable?(@name)
      lnum = 1
      File.foreach(@name) do |line|
        puts "#{lnum}. #{line}"
        lnum += 1
      end
    else
      puts "you don't have permission to read #{@name}"
    end
  end

  def write(*text)
    def filter(text)
      case text
      when Array
        txt = text.to_s.gsub("[","").gsub("]","")
        filter(txt)
      when Hash
        txt = []
        text.each {|k, v| txt << "#{k}=>#{v}, "}
        filter(txt)
      else
        if File.writable?(@name)
          File.write(@name, " "+text+" \n", mode: "a+")
        else
          puts "you don't have permission to write to this file."
        end
      end
    end
    filter(text)
  end

  def delete
    if File.file?(@name)
      File.delete(@name)
      delete
    else
      puts "#{@name} deleted successfully!"
    end
  end
end

=begin    
d = Fsimp.new("test.txt")

d.write("hello")
d.write("world")

puts d.read

d.perm

d.name

d.delete
=end




