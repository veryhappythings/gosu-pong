class GameObject
  attr_reader :x, :y
  def self.image_filename
    "images/paddle.png"
  end

  def initialize(window, x, y)
    @window = window
    @image = Gosu::Image.new(@window, self.class.image_filename)
    @x = x
    @y = y
  end

  def height
    @image.height
  end

  def width
    @image.width
  end

  def top
    @y
  end

  def bottom
    @y + height
  end

  def left
    @x
  end

  def right
    @x + width
  end

  def draw
    @image.draw @x, @y, 0
  end

  def update(dt)

  end

  def collides_with? other
    if not other.kind_of? GameObject
      false
    elsif other == self
      false
    else
      !(bottom < other.top ||
        top > other.bottom ||
        right < other.left ||
        left > other.right)
    end
  end

  def notify(message, options={})

  end
end
