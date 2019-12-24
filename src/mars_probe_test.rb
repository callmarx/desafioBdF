class MarsProbe

  def initialize(x_max:, y_max:)
    @x_max = x_max
    @y_max = y_max
    @wind_rose = ['N', 'E', 'S', 'W']
    @errors = []
  end 

  def start(x:, y:, direction:)
    if !@wind_rose.include? direction
      @errors << "#{direction} not included in #{@wind_rose}"
      puts "ERROR:: #{@errors.last}"
      false
    elsif set_point(x, y)
      @x, @y = x, y
      @direction = direction
      puts "DEBUG:: start on #{get_status}"
      true
    else
      false
    end
  end

  def proceed_commands(commands_string:)
    if commands_string.match /[^MLR]/
      @errors << "Allowed only 'M', 'L' or 'R' in commands string"
      puts "ERROR:: #{@errors.last}"
      return false
    end
    if !@x or !@y or !@direction
      @errors << "Need to set start position"
      puts "ERROR:: #{@errors.last}"
      return false
    end
    commands_string.each_char do |ch|
      case ch
      when 'M'
        move
      when 'L'
        left_rotate
      when 'R'
        right_rotate
      end
    end
    true
  end

  def get_status
    "#{@x} #{@y} #{@direction}"
  end

  def get_errors
    @errors
  end

  private
    def set_point(x, y)
      if x < 0 or y < 0 or x > @x_max or y > @y_max
        @errors << "(#{x}, #{y}) is out of limit! Current status = #{get_status}"
        puts "ERROR:: #{@errors.last}"
        false
      else
        @x, @y = x, y
        puts "DEBUG:: move to: #{get_status}"
        true
      end
    end

    def move
      case @direction
      when 'N'
        set_point @x, @y + 1
      when 'E'
        set_point @x + 1, @y
      when 'S'
        set_point @x, @y - 1
      when 'W'
        set_point @x - 1, @y
      end
    end

    def left_rotate
      @direction = @wind_rose[@wind_rose.index(@direction) - 1]
      puts "DEBUG:: change direction to: #{@direction}"
    end

    def right_rotate
      @direction = @wind_rose[(@wind_rose.index(@direction) + 1) % @wind_rose.length]
      puts "DEBUG:: change direction to: #{@direction}"
    end
end
