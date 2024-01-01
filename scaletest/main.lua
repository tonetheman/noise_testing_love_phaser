
local fb = nil
local t = 0

--[[
    stolen from processing js
]]
function _map(value, istart, istop, ostart, ostop)
    return ostart + (ostop - ostart) * ((value - istart) / (istop - istart))
end

function draw_frame()
    --[[
        this is really from 0,31 and 0,31
        canvas is 640 x 640
        but scaled 20,20
    ]]
    for i=0,31 do
        for j=0,31 do
            local noi = love.math.noise(t+i,t+j)
            local noi2 = love.math.noise(t+i,t+j)
            local modNoi = 5 * math.sin(t*noi*100) + 5* math.sin(t*noi2*25)
            -- modNoi = math.abs(modNoi) -- i added this since I am getting negatives
            local col = _map(modNoi,0,10,0,255)
            local r,g,b,a = love.math.colorFromBytes(col,0,0,0)
            love.graphics.setColor(r,g,b)
            love.graphics.rectangle("fill",i,j,1,1)
        end
    end
end

function love.load()

    fb = love.graphics.newCanvas(640,640)
    love.graphics.setCanvas(fb)
    love.graphics.scale(20,20)

    draw_frame() 
    
    love.graphics.setCanvas()
end


function love.draw()
    -- draw once really
    -- love.graphics.draw(fb,0,0)

    -- draw every time
    love.graphics.push()
    love.graphics.scale(20,20)
    draw_frame()
    love.graphics.pop()


    t = t + 0.0001
end