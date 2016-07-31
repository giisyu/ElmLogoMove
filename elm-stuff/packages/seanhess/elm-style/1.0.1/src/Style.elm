module Style exposing (..)


{-| Functions to combine and compose for reusable inline styles

# Style
@docs Style

# Background
@docs background, backgroundColor, backgroundImage, backgroundPosition, backgroundSize, backgroundRepeat, backgroundAttachment, linearGradient, radialGradient, noRepeat, repeat, repeatX, repeatY

# Values
@docs px, pc, em, color', deg, rad, url

# Border
@docs border, borderColor, borderBottomColor, borderLeftColor, borderRightColor, borderTopColor, borderStyle, borderBottomStyle, borderLeftStyle, borderRightStyle, borderTopStyle, borderWidth, borderBottomWidth, borderLeftWidth, borderRightWidth, borderTopWidth, borderRadius, borderBottomRadius, borderLeftRadius, borderRightRadius, borderTopRadius, dashed, dotted, double, groove, ridge, solid

# Outline
@docs outline, outlineColor, outlineStyle, outlineWidth

# Cursor
@docs cursor

# Dimensions
@docs height, width, maxHeight, maxWidth, minHeight, minWidth, dimensions

# Display
@docs display, block, inlineBlock, table, tableCell, fixed, flex', inlineTable, runIn, hidden, visible, inlineFlex, listItem, tableCaption, tableColumn, tableColumnGroup, tableFooterGroup, tableHeaderGroup, tableRow, tableRowGroup

# Positioning
@docs position, bottom, left, right, top, clip, overflow, zIndex, absolute, relative, static, inline, block, scroll

# Align
@docs verticalAlign, baseline, center, textAlign, left', right'

# Flex
@docs flex, flexDirection, flexWrap, flexFlow, justifyContent, alignItems, alignContent, order, flexGrow, flexShrink, flexBasis, alignSelf, column, columnReverse, flexEnd, flexStart, justify, row, rowReverse, spaceAround, spaceBetween, wrap, wrapReverse

# Float
@docs float, clear, both, left', right'

# Margin
@docs margin, marginBottom, marginTop, marginLeft, marginRight

# Padding
@docs padding, paddingBottom, paddingTop, paddingLeft, paddingRight

# Font
@docs fontFamily, fontSize, fontStyle, fontVariant, fontWeight, italic, smallCaps

# Text
@docs color, direction, letterSpacing, lineHeight, textAlign, textDecoration, textIndent, unicodeBidi, whiteSpace, wordSpacing, bidiOverride, embed, justify, direction, rtl, ltr, nowrap, oblique, pre, preLine, preWrap, overline, underline, lineThrough

# List Style
@docs listStyleImage, listStylePosition, listStyleType, inside, outside, lineThrough

# Shadow
@docs boxShadow, textShadow, inset, outset

# Transform
@docs transform, translate, translate3d, perspective, rotate, rotate3d, scale, scale3d, skew, matrix

# Generic
@docs auto, none, normal

# Prefixing
@docs PrefixSet, prefixSet, prefixName, prefixValue

-}

import Color exposing (Color, toRgb)
import String
import Vendor


{-| Alias for inline styles

    myContainer : List Style
    myContainer =
      [ width (pc 100)
      , height (pc 100)
      , fontFamily "sans-serif"
      ]
-}
type alias Style =
  ( String, String )


{-| absolute -}
absolute : String
absolute =
  "absolute"


{-| relative -}
relative : String
relative =
  "relative"


{-| static -}
static : String
static =
  "static"


{-| auto -}
auto : String
auto =
  "auto"


{-| inline -}
inline : String
inline =
  "inline"


{-| block -}
block : String
block =
  "block"


{-| inline-block -}
inlineBlock : String
inlineBlock =
  "inline-block"


{-| flex -}
flex' : String
flex' =
  "flex"


{-| inline-flex -}
inlineFlex : String
inlineFlex =
  "inline-flex"


{-| list-item -}
listItem : String
listItem =
  "list-item"


{-| run-in -}
runIn : String
runIn =
  "run-in"


{-| table -}
table : String
table =
  "table"


{-| inline-table -}
inlineTable : String
inlineTable =
  "inline-table"


{-| table-caption -}
tableCaption : String
tableCaption =
  "table-caption"


{-| table-column-group -}
tableColumnGroup : String
tableColumnGroup =
  "table-column-group"


{-| table-header-group -}
tableHeaderGroup : String
tableHeaderGroup =
  "table-header-group"


{-| table-footer-group -}
tableFooterGroup : String
tableFooterGroup =
  "table-footer-group"


{-| table-row-group -}
tableRowGroup : String
tableRowGroup =
  "table-row-group"


{-| table-cell -}
tableCell : String
tableCell =
  "table-cell"


{-| table-column -}
tableColumn : String
tableColumn =
  "table-column"


{-| table-row -}
tableRow : String
tableRow =
  "table-row"


{-| baseline -}
baseline : String
baseline =
  "baseline"


{-| center -}
center : String
center =
  "center"


{-| flex-start -}
flexStart : String
flexStart =
  "flex-start"


{-| flex-end -}
flexEnd : String
flexEnd =
  "flex-end"


{-| space-between -}
spaceBetween : String
spaceBetween =
  "space-between"


{-| space-around -}
spaceAround : String
spaceAround =
  "space-around"


{-| column -}
column : String
column =
  "column"


{-| column-reverse -}
columnReverse : String
columnReverse =
  "column-reverse"


{-| row -}
row : String
row =
  "row"


{-| row-reverse -}
rowReverse : String
rowReverse =
  "row-reverse"


{-| wrap -}
wrap : String
wrap =
  "wrap"


{-| nowrap -}
nowrap : String
nowrap =
  "nowrap"


{-| wrap-reverse -}
wrapReverse : String
wrapReverse =
  "wrap-reverse"


{-| none -}
none : String
none =
  "none"


{-| left' -}
left' : String
left' =
  "left"


{-| right' -}
right' : String
right' =
  "right"


{-| both -}
both : String
both =
  "both"


{-| normal -}
normal : String
normal =
  "normal"


{-| italic -}
italic : String
italic =
  "italic"


{-| oblique -}
oblique : String
oblique =
  "oblique"


{-| small-caps -}
smallCaps : String
smallCaps =
  "small-caps"


{-| em -}
em : number -> String
em e =
  (toString e) ++ "em"


{-| px -}
px : number -> String
px p =
  (toString p) ++ "px"


{-| pc -}
pc : number -> String
pc p =
  (toString p) ++ "%"


{-| deg -}
deg : number -> String
deg d =
  (toString d) ++ "deg"


{-| rad -}
rad : number -> String
rad r =
  (toString r) ++ "rad"


{-| deminsions -}
dimensions : (number -> String) -> List number -> String
dimensions f xs =
  case xs of
    [] ->
      ""

    t :: [] ->
      (f t) ++ " " ++ (f t) ++ " " ++ (f t) ++ " " ++ (f t)

    t :: r :: [] ->
      (f t) ++ " " ++ (f r) ++ " " ++ (f t) ++ " " ++ (f r)

    t :: r :: b :: [] ->
      (f t) ++ " " ++ (f r) ++ " " ++ (f b) ++ " 0"

    t :: r :: b :: l :: [] ->
      (f t) ++ " " ++ (f r) ++ " " ++ (f b) ++ " " ++ (f l)

    t :: r :: b :: l :: _ ->
      (f t) ++ " " ++ (f r) ++ " " ++ (f b) ++ " " ++ (f l)


{-| color' -}
color' : Color -> String
color' c =
  let
    { red, green, blue, alpha } =
      toRgb c

    r =
      toString red

    g =
      toString green

    b =
      toString blue

    a =
      toString alpha
  in
    "rgba( "
      ++ r
      ++ ", "
      ++ g
      ++ ", "
      ++ b
      ++ ", "
      ++ a
      ++ " )"


{-| repeat -}
repeat : String
repeat =
  "repeat"


{-| repeat-x -}
repeatX : String
repeatX =
  "repeat-x"


{-| repeat-y -}
repeatY : String
repeatY =
  "repeat-y"


{-| no-repeat -}
noRepeat : String
noRepeat =
  "no-repeat"


{-| scroll -}
scroll : String
scroll =
  "scroll"


{-| visible -}
visible : String
visible =
  "visible"


{-| fixed -}
fixed : String
fixed =
  "fixed"


-- {-| local -}
-- local : String
-- local =
--   "local"


{-| hidden -}
hidden : String
hidden =
  "hidden"


{-| dotted -}
dotted : String
dotted =
  "dotted"


{-| dashed -}
dashed : String
dashed =
  "dashed"


{-| solid -}
solid : String
solid =
  "solid"


{-| double -}
double : String
double =
  "double"


{-| groove -}
groove : String
groove =
  "groove"


{-| ridge -}
ridge : String
ridge =
  "ridge"


{-| inset -}
inset : String
inset =
  "inset"


{-| outset -}
outset : String
outset =
  "outset"




{-| url(path) -}
url : String -> String
url path =
  "url( " ++ path ++ " )"



{-| linear-gradient(45deg, #FFF, #000) -}
linearGradient : number -> List Color -> String
linearGradient degrees colors =
  let
    colorString =
      String.join "," (List.map color' colors)

    degString =
      (deg degrees) ++ ", "
  in
    "linear-gradient( " ++ degString ++ colorString ++ " )"


{-| radial-gradient(#FFF, #000) -}
radialGradient : List Color -> String
radialGradient colors =
  let
    colorString =
      String.join "," (List.map color' colors)
  in
    "radial-gradient( " ++ colorString ++ " )"


{-| inside -}
inside : String
inside =
  "inside"


{-| outside -}
outside : String
outside =
  "outside"



{-| ltr -}
ltr : String
ltr =
  "ltr"


{-| rtl -}
rtl : String
rtl =
  "rtl"


{-| justify -}
justify : String
justify =
  "justify"


{-| underline -}
underline : String
underline =
  "underline"


{-| overline -}
overline : String
overline =
  "overline"


{-| line-through -}
lineThrough : String
lineThrough =
  "line-through"


{-| embed -}
embed : String
embed =
  "embed"


{-| bidi-override -}
bidiOverride : String
bidiOverride =
  "bidi-override"


{-| pre -}
pre : String
pre =
  "pre"


{-| pre-line -}
preLine : String
preLine =
  "pre-line"


{-| pre-wrap -}
preWrap : String
preWrap =
  "pre-wrap"



-- prefixing -------------------------------


{-| Prefixes for the various browsers. This is handled by the property functions for you -}
type alias PrefixSet =
  { ms : String
  , moz : String
  , o : String
  , webkit : String
  , default : String
  }


{-| construct a prefix set for the given browser -}
prefixSet : String -> PrefixSet
prefixSet default =
  { ms = default
  , moz = default
  , o = default
  , webkit = default
  , default = default
  }


{-| generate the correct style with prefix -}
prefixName : PrefixSet -> String -> Style
prefixName prefix value =
  case Vendor.prefix of
    Vendor.MS ->
      ( prefix.ms, value )

    Vendor.Moz ->
      ( prefix.moz, value )

    Vendor.O ->
      ( prefix.o, value )

    Vendor.Webkit ->
      ( prefix.webkit, value )

    _ ->
      ( prefix.default, value )


{-| get the prefix for the browser  -}
prefixValue : PrefixSet -> String
prefixValue prefix =
  case Vendor.prefix of
    Vendor.MS ->
      prefix.ms

    Vendor.Moz ->
      prefix.moz

    Vendor.O ->
      prefix.o

    Vendor.Webkit ->
      prefix.webkit

    _ ->
      prefix.default



-- BACKGROUND -------------------------------------


{-| background -}
background : String -> Style
background b =
  let
    needsPrefix =
      String.startsWith "linear-gradient" b
        || String.startsWith "radial-gradient" b

    value =
      prefixSet b

    value' =
      if needsPrefix then
        { value
          | ms = "-ms-" ++ b
          , webkit = "-webkit-" ++ b
          , moz = "-moz-" ++ b
          , o = "-o-" ++ b
        }
      else
        value
  in
    ( "background", prefixValue value' )


{-| background-color -}
backgroundColor : String -> Style
backgroundColor b =
  ( "background-color", b )


{-| background-image -}
backgroundImage : String -> Style
backgroundImage b =
  ( "background-image", b )


{-| background-position -}
backgroundPosition : String -> Style
backgroundPosition b =
  ( "background-position", b )


{-| background-size -}
backgroundSize : String -> Style
backgroundSize b =
  ( "background-size", b )


{-| background-repeat -}
backgroundRepeat : String -> Style
backgroundRepeat b =
  ( "background-repeat", b )


{-| background-attachment -}
backgroundAttachment : String -> Style
backgroundAttachment b =
  ( "background-attachment", b )



-- BORDER ----------------------------


{-| border -}
border : String -> Style
border b =
  ( "border", b )


{-| border-color -}
borderColor : String -> Style
borderColor b =
  ( "border-color", b )


{-| border-bottom-color -}
borderBottomColor : String -> Style
borderBottomColor b =
  ( "border-bottom-color", b )


{-| border-left-color -}
borderLeftColor : String -> Style
borderLeftColor b =
  ( "border-left-color", b )


{-| border-right-color -}
borderRightColor : String -> Style
borderRightColor b =
  ( "border-right-color", b )


{-| border-top-color -}
borderTopColor : String -> Style
borderTopColor b =
  ( "border-top-color", b )


{-| border-style -}
borderStyle : String -> Style
borderStyle b =
  ( "border-style", b )


{-| border-bottom-style -}
borderBottomStyle : String -> Style
borderBottomStyle b =
  ( "border-bottom-style", b )


{-| border-left-style -}
borderLeftStyle : String -> Style
borderLeftStyle b =
  ( "border-left-style", b )


{-| border-right-style -}
borderRightStyle : String -> Style
borderRightStyle b =
  ( "border-right-style", b )


{-| border-top-style -}
borderTopStyle : String -> Style
borderTopStyle b =
  ( "border-top-style", b )


{-| border-width -}
borderWidth : String -> Style
borderWidth b =
  ( "border-width", b )


{-| border-bottom-width -}
borderBottomWidth : String -> Style
borderBottomWidth b =
  ( "border-bottom-width", b )


{-| border-left-width -}
borderLeftWidth : String -> Style
borderLeftWidth b =
  ( "border-left-width", b )


{-| border-right-width -}
borderRightWidth : String -> Style
borderRightWidth b =
  ( "border-right-width", b )


{-| border-top-width -}
borderTopWidth : String -> Style
borderTopWidth b =
  ( "border-top-width", b )


{-| border-radius -}
borderRadius : String -> Style
borderRadius b =
  ( "border-radius", b )


{-| border-bottom-radius -}
borderBottomRadius : String -> Style
borderBottomRadius b =
  ( "border-bottom-radius", b )


{-| border-left-radius -}
borderLeftRadius : String -> Style
borderLeftRadius b =
  ( "border-left-radius", b )


{-| border-right-radius -}
borderRightRadius : String -> Style
borderRightRadius b =
  ( "border-right-radius", b )


{-| border-top-radius -}
borderTopRadius : String -> Style
borderTopRadius b =
  ( "border-top-radius", b )



-- CURSOR ---------------------------


{-| cursor -}
cursor : String -> Style
cursor c =
  let
    value =
      prefixSet c

    value' =
      if c == "grab" then
        { value | webkit = "-webkit-grab" }
      else if c == "zoom-in" then
        { value | webkit = "-webkit-zoom-in" }
      else if c == "zoom-out" then
        { value | webkit = "-webkit-zoom-out" }
      else
        value
  in
    ( "cursor", prefixValue value' )



-- DIMENSIONS ---------------------


{-| height -}
height : String -> Style
height h =
  ( "height", h )


{-| width -}
width : String -> Style
width w =
  ( "width", w )


{-| max-height -}
maxHeight : String -> Style
maxHeight m =
  ( "max-height", m )


{-| max-width -}
maxWidth : String -> Style
maxWidth m =
  ( "max-width", m )


{-| min-height -}
minHeight : String -> Style
minHeight m =
  ( "min-height", m )


{-| min-width -}
minWidth : String -> Style
minWidth m =
  ( "min-width", m )



-- DISPLAY --------------------------------


{-| display -}
display : String -> Style
display d =
  let
    value =
      prefixSet d

    value' =
      if d == "flex" then
        { value
          | webkit = "-webkit-flex"
          , ms = "-ms-flexbox"
        }
      else if d == "inline-flex" then
        { value
          | webkit = "-webkit-inline-flex"
          , ms = "-ms-inline-flexbox"
        }
      else
        value
  in
    ( "display", prefixValue value' )



-- FLEX -------------------------------------


{-| flex-direction -}
flexDirection : String -> Style
flexDirection f =
  let
    name =
      prefixSet "flex-direction"
  in
    prefixName
      { name
        | ms = "-ms-flex-direction"
        , webkit = "-webkit-flex-direction"
      }
      f


{-| flex-wrap -}
flexWrap : String -> Style
flexWrap f =
  let
    name =
      prefixSet "flex-wrap"
  in
    prefixName
      { name
        | ms = "-ms-flex-wrap"
        , webkit = "-webkit-flex-wrap"
      }
      f


{-| flex-flow -}
flexFlow : String -> Style
flexFlow f =
  ( "flex-flow", f )


{-| justify-content -}
justifyContent : String -> Style
justifyContent j =
  let
    name =
      prefixSet "justify-content"

    value =
      prefixSet j

    value' =
      if j == "flex-start" then
        { value | ms = "start" }
      else if j == "flex-end" then
        { value | ms = "end" }
      else if j == "space-between" then
        { value | ms = "justify" }
      else if j == "space-around" then
        { value | ms = "distribute" }
      else
        value
  in
    prefixName
      { name
        | ms = "-ms-flex-pack"
        , webkit = "-webkit-justify-content"
      }
      <| prefixValue value'


{-| align-items -}
alignItems : String -> Style
alignItems a =
  let
    name =
      prefixSet "align-items"

    value =
      prefixSet a

    value' =
      if a == "flex-start" then
        { value | ms = "start" }
      else if a == "flex-end" then
        { value | ms = "end" }
      else
        value
  in
    prefixName
      { name
        | ms = "-ms-flex-align"
        , webkit = "-webkit-align-items"
      }
      <| prefixValue value'


{-| align-content -}
alignContent : String -> Style
alignContent a =
  let
    name =
      prefixSet "align-content"

    value =
      prefixSet a

    value' =
      if a == "flex-start" then
        { value | ms = "start" }
      else if a == "flex-end" then
        { value | ms = "end" }
      else if a == "space-between" then
        { value | ms = "justify" }
      else if a == "space-around" then
        { value | ms = "distribute" }
      else
        value
  in
    prefixName
      { name
        | ms = "-ms-flex-line-pack"
        , webkit = "-webkit-flex-start"
      }
      <| prefixValue value'


{-| order -}
order : String -> Style
order o =
  let
    name =
      prefixSet "order"
  in
    prefixName
      { name
        | ms = "-ms-flex-order"
        , webkit = "-webkit-order"
      }
      o


{-| flex-grow -}
flexGrow : String -> Style
flexGrow f =
  let
    name =
      prefixSet "flex-grow"
  in
    prefixName
      { name
        | ms = "-ms-flex-positive"
        , webkit = "-webkit-flex-grow"
      }
      f


{-| flex-shrink -}
flexShrink : String -> Style
flexShrink f =
  let
    name =
      prefixSet "flex-shrink"
  in
    prefixName
      { name
        | ms = "-ms-flex-negative"
        , webkit = "-webkit-flex-shrink"
      }
      f


{-| flex-basis -}
flexBasis : String -> Style
flexBasis f =
  let
    name =
      prefixSet "flex-basis"
  in
    prefixName
      { name
        | ms = "-ms-flex-preferred-size"
        , webkit = "-webkit-flex-basis"
      }
      f


{-| align-self -}
alignSelf : String -> Style
alignSelf a =
  let
    name =
      prefixSet "align-self"

    value =
      prefixSet a

    value' =
      if a == "flex-start" then
        { value | ms = "start" }
      else if a == "flex-end" then
        { value | ms = "end" }
      else
        value
  in
    prefixName
      { name
        | ms = "-ms-flex-item-align"
        , webkit = "-webkit-align-self"
      }
      <| prefixValue value'


{-| flex -}
flex : String -> Style
flex f =
  let
    name =
      prefixSet "flex"
  in
    prefixName
      { name
        | ms = "-ms-flex"
        , webkit = "-webkit-flex"
      }
      f



-- FLOAT -----------------------------


{-| clear -}
clear : String -> Style
clear c =
  ( "clear", c )


{-| float -}
float : String -> Style
float f =
  ( "float", f )



-- FONT ------------------------------------


{-| font-family -}
fontFamily : String -> Style
fontFamily f =
  ( "font-family", f )


{-| font-size -}
fontSize : String -> Style
fontSize f =
  ( "font-size", f )


{-| font-style -}
fontStyle : String -> Style
fontStyle f =
  ( "font-style", f )


{-| font-variant -}
fontVariant : String -> Style
fontVariant f =
  ( "font-variant", f )


{-| font-weight -}
fontWeight : String -> Style
fontWeight f =
  ( "font-weight", f )



-- LIST STYLE ------------------------------


{-| list-style-image -}
listStyleImage : String -> Style
listStyleImage l =
  ( "list-style-image", l )


{-| list-style-position -}
listStylePosition : String -> Style
listStylePosition l =
  ( "list-style-position", l )


{-| list-style-type -}
listStyleType : String -> Style
listStyleType l =
  ( "list-style-type", l )



-- MARGIN ------------------------------------


{-| margin -}
margin : String -> Style
margin m =
  ( "margin", m )


{-| margin-bottom -}
marginBottom : String -> Style
marginBottom m =
  ( "margin-bottom", m )


{-| margin-left -}
marginLeft : String -> Style
marginLeft m =
  ( "margin-left", m )


{-| margin-right -}
marginRight : String -> Style
marginRight m =
  ( "margin-right", m )


{-| margin-top -}
marginTop : String -> Style
marginTop m =
  ( "margin-top", m )



-- OUTLINE -----------------------------------


{-| outline -}
outline : String -> Style
outline o =
  ( "outline", o )


{-| outline-color -}
outlineColor : String -> Style
outlineColor o =
  ( "outline-color", o )


{-| outline-style -}
outlineStyle : String -> Style
outlineStyle o =
  ( "outline-style", o )


{-| outline-width -}
outlineWidth : String -> Style
outlineWidth o =
  ( "outline-width", o )



-- PADDING --------------------------


{-| padding -}
padding : String -> Style
padding p =
  ( "padding", p )


{-| padding-bottom -}
paddingBottom : String -> Style
paddingBottom p =
  ( "padding-bottom", p )


{-| padding-left -}
paddingLeft : String -> Style
paddingLeft p =
  ( "padding-left", p )


{-| padding-right -}
paddingRight : String -> Style
paddingRight p =
  ( "padding-right", p )


{-| padding-top -}
paddingTop : String -> Style
paddingTop p =
  ( "padding-top", p )



-- POSITION ------------------------------


{-| clip -}
clip : String -> Style
clip c =
  ( "clip", c )


{-| bottom -}
bottom : String -> Style
bottom b =
  ( "bottom", b )


{-| left -}
left : String -> Style
left l =
  ( "left", l )


{-| overflow -}
overflow : String -> Style
overflow o =
  ( "overflow", o )


{-| position -}
position : String -> Style
position p =
  ( "position", p )


{-| right -}
right : String -> Style
right r =
  ( "right", r )


{-| top -}
top : String -> Style
top t =
  ( "top", t )


{-| z-index -}
zIndex : String -> Style
zIndex z =
  ( "z-index", z )



-- SHADOW -----------------------------------


{-| box-shadow -}
boxShadow : String -> Style
boxShadow b =
  ( "box-shadow", b )


{-| text-shadow -}
textShadow : String -> Style
textShadow t =
  ( "text-shadow", t )



-- TEXT -----------------------------------------


{-| color -}
color : String -> Style
color c =
  ( "color", c )


{-| direction -}
direction : String -> Style
direction d =
  ( "direction", d )


{-| letter-spacing -}
letterSpacing : String -> Style
letterSpacing l =
  ( "letter-spacing", l )


{-| line-height -}
lineHeight : String -> Style
lineHeight l =
  ( "line-height", l )


{-| text-align -}
textAlign : String -> Style
textAlign t =
  ( "text-align", t )


{-| text-decoration -}
textDecoration : String -> Style
textDecoration t =
  ( "text-decoration", t )


{-| text-indent -}
textIndent : String -> Style
textIndent t =
  ( "text-indent", t )


{-| unicode-bidi -}
unicodeBidi : String -> Style
unicodeBidi u =
  ( "unicode-bidi", u )


{-| white-space -}
whiteSpace : String -> Style
whiteSpace w =
  ( "white-space", w )


{-| word-spacing -}
wordSpacing : String -> Style
wordSpacing w =
  ( "word-spacing", w )

-- ALIGN --------------------------

{-| vertical-align -}
verticalAlign : String -> Style
verticalAlign t =
  ( "vertical-align", t )




-- TRANSFORM ----------------------


{-| transform -}
transform : String -> Style
transform t =
  let
    name =
      prefixSet "transform"
  in
    prefixName
      { name
        | ms = "-ms-transform"
        , webkit = "-webkit-transform"
      }
      t


{-| translate -}
translate : String -> Style
translate t =
  ( "translate", t )


{-| translate3d -}
translate3d : String -> Style
translate3d t =
  ( "translate3d", t )


{-| perspective -}
perspective : String -> Style
perspective p =
  ( "perspective", p )


{-| rotate -}
rotate : String -> Style
rotate r =
  ( "rotate", r )


{-| rotate3d -}
rotate3d : String -> Style
rotate3d r =
  ( "rotate3d", r )


{-| scale -}
scale : String -> Style
scale s =
  ( "scale", s )


{-| scale3d -}
scale3d : String -> Style
scale3d s =
  ( "scale3d", s )


{-| skew -}
skew : String -> Style
skew s =
  ( "skew", s )


{-| matrix -}
matrix : String -> Style
matrix m =
  ( "matrix", m )
