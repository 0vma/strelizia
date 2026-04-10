local Thread = {};
Thread.__index = Thread

function Thread.new(Callback, ...)
    return setmetatable({
        Function = nil
        Running = false, 
        Step = nil,
        Arguments = {...},
    }, Thread)
end 

return {new = Thread.new}