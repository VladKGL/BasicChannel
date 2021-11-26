sub Init()
    m.sideBarBttns = m.top
    m.sideBarBttns.buttons = ["Live", "Artists", "Podcasts", "Settings"]
    m.sideBarBttns.observeField("buttonSelected", "buttonObserver")
    m.sideBarBttns.buttonFocused = m.top.GetScene().buttondid
end sub

function buttonObserver()
    ' OK button
    category_id = m.sideBarBttns.buttonSelected
    if category_id <> 3
        OnButtonBarItemSelected(category_id)
    end if
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    ' LEFT RIGHT BUTTONSS
    handled = false
    if press then
        if (key = "right") then
            Scene = m.top.GetScene()
            Scene.findNode("contentGrid").setFocus(true)
            print m.top
            handled = true
        end if
    end if
    return handled
  end function

sub OnButtonBarItemSelected(id as integer)
    ' This is where you can handle a selection event
    m.top.GetScene().buttondid = m.sideBarBttns.buttonFocused
    itemSelected = id
    buttonAA = [
        "Live",
        "Artists",
        "Podcasts"
    ]
    mode = buttonAA[itemSelected]
    customView = CreateObject("roSGNode", "ContentRowGrid")
    content = CreateObject("roSGNode", "ContentNode")
    content.AddFields({
        HandlerConfigGrid: {
            name: "APIContentHandler",
            query: mode
        }
    })
    customView.content = content
    m.top.GetScene().ComponentController.CallFunc("show", {
        view: customView
    })
end sub