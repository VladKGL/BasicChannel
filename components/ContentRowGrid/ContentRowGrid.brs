sub init()
    m.top.translation = [0, 0]
    contentGrid = m.top.FindNode("contentGrid")
    contentGrid.Update({
        translation: [280, 100]
        itemComponentName: "ContentRowGridItem"
    })

    contentGrid.ObserveField("rowItemSelected", "ItemSelectedObserver")
    contentGrid.ObserveField("rowItemFocused", "ItemFocusedObserver")
end sub

sub ItemSelectedObserver(event as object)
    print event
end sub

sub ItemFocusedObserver(event as object)
    itemSelected = event.GetData()
    focusedChild = m.top.FindNode("contentGrid").focusedChild
    focusedChild.titlerepeatCount = -1
    focusedChild.descrrepeatCount = -1
    print m.top.FindNode("contentGrid").children
end sub