local society = {}

function society.load()
    society = {
        month = 0,
        population = (math.random(-30, 30) + 100) / 100, -- million
    }
end

function society.update(dt)

end

function society.report()
    return "hello motherfucker economy is bad and you should feel bad"
end

return society