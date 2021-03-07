time = 0
wave = {}

line = {1, 1}
function love.load()
    love.window.setMode(600, 400)
end

function love.update(dt)

end

function love.draw()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.translate(150, 200)
    x = 0
    y = 0

    for i = 0, 50, 1 do
        n = i * 2 + 1
        prevx = x
        prevy = y
        radius = 75 * (4 / (n * math.pi))
        x = x + radius * math.cos(n * time)
        y = y + radius * math.sin(n * time)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.circle("line", prevx, prevy, radius, radius)
        love.graphics.line(prevx, prevy, x, y)
    end
    wave = unshift(wave, y)
    love.graphics.translate(200, 0)

    love.graphics.line(x - 200, y, 0, wave[1])
    for i = 1, #wave, 1 do
        love.graphics.points(i, wave[i])
        table.insert(line, i)
        table.insert(line, wave[i])
    end
    love.graphics.line(line)
    line = {}
    love.graphics.setColor(0, 0, 0, 1)
    if #wave > 250 then
        table.remove(wave, #wave)
    end

    time = time + 0.003
    if love.mouse.isDown(1) then
        time = time + 0.05
    end
end

function unshift(wave, y)
    newTable = {}
    table.insert(newTable, y)
    for i = 1, #wave, 1 do
        table.insert(newTable, wave[i])
    end
    return newTable
end
