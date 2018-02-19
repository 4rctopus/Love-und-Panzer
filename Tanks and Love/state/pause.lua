pauseState = {}

function pauseState.update( dt )
end


local function pauseDrawPause()
    -- we are drawing ui so we reset the thing
    love.graphics.origin()

    -- darkening thing over the game
    love.graphics.setColor( 0, 0, 0, 150 )
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight() )


    -- continue
    local w = love.graphics.getWidth() / 2.5
    local h = bigFont:getHeight() * 2
    local sy = love.graphics.getHeight() / 6
    local sx = love.graphics.getWidth() / 2 - w / 2
    local continueButton = ui.button( "cntb", sx, sy, w, h, "continue", bigFont )
    if( continueButton.released[1] > 0 ) then
        ui.clear()
        state = gameState
    end
    -- settings
    local sy = sy + h + 10
    local w = love.graphics.getWidth() / 3
    --
    local sx = love.graphics.getWidth() / 2 - w / 2
    local settingsButton = ui.button( "stsbt", sx, sy, w, h, "settings", bigFont )
    if( settingsButton.released[1] > 0 ) then
        ui.clear()
        state = settings2State
    end
    -- back to menu
    local h = bigFont:getHeight()
    local sy = love.graphics.getHeight() - h - 10
    local menuButton = ui.button( "mnubt", sx, sy, w, h, "back to menu", bigFont )
    if( menuButton.released[1] > 0 ) then
        ui.clear()
        state = menuState
    end



end

function pauseState.draw()
    gameState.draw()
    pauseDrawPause()
    --settingsDraw()
end

function pauseState.keypressed( key, scancode, isrepeat )
    if( key == "escape" ) then
        state = gameState
    end
end