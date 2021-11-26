sub Init()
    m.sideBarBttns = m.top.FindNode("leftSideBarButtonGroup")
    m.sideBarBttns.buttons = ["Live", "Artists", "Podcasts"]
    m.sideBarBttns.observeField("buttonSelected", "buttonObserver")
end sub

function buttonObserver()
    ' OK button
    print m.sideBarBttns.buttonFocused
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    ' LEFT RIGHT BUTTONSS
    handled = false

    if press then
        print key
        if (key = "OK") then
            category_name = m.sideBarBttns.buttonSelected
            print category_name
            handled = true
        end if
    end if
    return handled
  end function