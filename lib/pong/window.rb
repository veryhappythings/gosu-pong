class Window < Gosu::Window
  attr_reader :objects
  def initialize()
    super(800, 600, false)
    caption = 'Pong!'

    @current_time = Gosu::milliseconds
    @player = Player.new(self, 50, 10)
    @opponent = Player.new(self, 750, 10)
    @ball = Ball.new(self, 50, 50)
    @objects = [@player, @ball, @opponent]
  end

  def draw
    @objects.each do |object|
      object.draw
    end
  end

  def update
    dt = (Gosu::milliseconds - @current_time) / 1000.0
    @current_time = Gosu::milliseconds

    if button_down? Gosu::Button::KbUp
      @player.y -= 10
    end
    if button_down? Gosu::Button::KbDown
      @player.y += 10
    end

    @opponent.y = (@ball.y + @ball.height / 2) - @opponent.height/2

    @objects.each do |object|
      object.update(dt)
    end
  end

  def button_down(id)
    if id == Gosu::Button::KbEscape
      close
    end
  end
end
