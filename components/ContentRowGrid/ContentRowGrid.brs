sub init()
    m.top.translation = [0, 0]
    contentGrid = m.top.FindNode("contentGrid")
    contentGrid.Update({
        translation: [280, 100]
        itemComponentName: "ContentRowGridItem"
    })
    ' contentGrid.observeField("buttonSelected", "buttonObserver")
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    ' if back button is passed here View stack is done with Views operaion
    ' developer can override onKeyEvent to prevent closing channel and show exit dialog for example
    if press and key = "back"
        if m.top.GetScene().ComponentController.allowCloseChannelOnLastView
            m.top.GetScene().exitChannel = false
            m.top.GetScene().FindNode("leftSideBar").setFocus(true)
        end if
        return true
    end if
   
    return false
end function
