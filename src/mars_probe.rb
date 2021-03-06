class MarsProbe

  def initialize(x_max:, y_max:)
    @x_max = x_max
    @y_max = y_max
    @wind_rose = ['N', 'E', 'S', 'W']
  end 

  def start(x:, y:, direction:)
    if set_point(x, y)
      @x, @y = x, y
      @direction = direction
      true
    else
      false
    end
  end

  # pressupõe que será chamada depois de #start
  def proceed_commands(commands_string:)
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
  end

  def get_status
    "#{@x} #{@y} #{@direction}"
  end

  private
    def set_point(x, y)
      if x < 0 or y < 0 or x > @x_max or y > @y_max
        false
      else
        @x, @y = x, y
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
    end

    def right_rotate
      @direction = @wind_rose[(@wind_rose.index(@direction) + 1) % @wind_rose.length]
    end
end
