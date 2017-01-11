---
---
@EqualHeightMaintainer =
  resizer: null
  equateHeight: () ->
    $('.equal-height-contianer').each ->
      children = $(@).find('.equal-height-item')
      children.css({height: 'auto'})
      allHeights = $.map(children, (ele) -> $(ele).height())
      console.log allHeights
      maxHeight = Math.max(allHeights...)
      children.height(maxHeight)
  handleResize: () ->
    setTimeout((-> EqualHeightMaintainer.equateHeight()), 1000)
    $(window).resize ->
      clearTimeout(EqualHeightMaintainer.resizer) if EqualHeightMaintainer.resizer
      EqualHeightMaintainer.resizer = setTimeout((-> EqualHeightMaintainer.equateHeight()), 500)

$ ->
  EqualHeightMaintainer.handleResize()
