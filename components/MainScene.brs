sub Show(args as Object)
    m.top.Addfields({
        buttondid: 0,
    })
    m.top.backgroundColor = "#000000"
    customView = CreateObject("roSGNode", "ContentRowGrid")
    content = CreateObject("roSGNode", "ContentNode")
    content.AddFields({
        HandlerConfigGrid: {
            name: "APIContentHandler",
            query: "Live"
        }
    })

    ' SetUpButtonBar()
    ' sideBar = CreateObject("roSGNode", "SideBar")
    customView.content = content
    m.top.ComponentController.CallFunc("show", {
        view: customView
    })
end sub

function SetUpButtonBar()
    m.top.buttonBar.visible = true
    m.top.buttonBar.translation = [-100, 100]
    m.top.buttonBar.alignment = "left"
    m.top.buttonBar.overlay = true
    m.top.buttonBar.renderOverContent = true
    m.top.buttonBar.autoHide = false
    m.top.buttonBar.enableFootprint = true
    m.top.buttonBar.theme = {
        buttonColor: "#000000",
        
    }
    m.top.buttonBar.content = retrieveButtonBarContent()
    m.top.buttonBar.ObserveField("itemSelected", "OnButtonBarItemSelected")
    
    m.top.buttonBar.setFocus(true)
end function


function retrieveButtonBarContent() as Object
    buttonBarContent = CreateObject("roSGNode", "ContentNode")
    buttonBarContent.Update({
        children: [{
            title: "Live",
            id: "Live"
        }, {
            title: "Artists",
            id: "Artists"
        }, {
            title: "Podcasts",
            id: "Podcasts",
        },]
    }, true)

    return buttonBarContent
end function

sub OnButtonBarItemSelected(event as Object)
    ' This is where you can handle a selection event
    itemSelected = event.GetData()
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
    m.top.ComponentController.CallFunc("show", {
        view: customView
    })
end sub
