local gui = require "guilty.guilty"
local primitive = require "guilty.primitives"

local society = require "society"

function Window(x, y, w, h, otherColor)
    if otherColor==nil then otherColor=false end
    local win = gui.Container(x, y, w, h)
    local bg = win:attach(gui.Rectangle('center', 'center', win.w-2, win.h-2))
    if otherColor then
        bg.theme.color = function() return gui.RGBA(gui.theme.color.secondary) end
    end
    win:attach(gui.Border())
    return win
end

function love.load()
    love.keyboard.setKeyRepeat(true)

    window = Window('center', 'center', love.graphics.getWidth() - 10, love.graphics.getHeight() - 10)
    window:attach(gui.Text('center', 10, "Baby's first economy"))

    local report = window:attach(Window('center', window.h - 200, window.w, 200, true))
        local ltext = report:attach(gui.TextBoxScrollable(5, 5, report.w-10, report.h-10))
        ltext.text:set(society.report())

    local country = window:attach(Window(0, window.h - 200 - 300 + 1, window.h - 200, 300, true))
        society.land = country:attach(primitive.WidgetBase(1, window.h - 200 - 400 + 10 - 1, window.h - 200, 300))
end


function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.clear(gui.RGBA(gui.theme.color.secondary))
    window:draw()

    local x, y = society.land:absolute()

    love.graphics.push()

    for i = 0, 100 do
        love.graphics.setColor(0.2, 0.2, 1)
        love.graphics.rectangle("fill", x, y, society.land.w, society.land.h)
    end

    love.graphics.pop()
end



function love.update(dt) window:event{['delta']={dt}} end

function love.textinput(text) window:event{['textinput']={text}} end

function love.keypressed(key) window:event{['keypress']={key}} end

function love.mousepressed(x, y, button, istouch) window:event{['mousepress']={x, y, button, istouch}} end

function love.mousereleased(x, y, button, istouch) window:event{['mouserelease']={x, y, button, istouch}} end

function love.wheelmoved(x, y) window:event{['wheelmove']={x, y}} end

function love.mousemoved(x, y) window:event{['mousemove']={x, y}} end