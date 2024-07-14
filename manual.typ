#import "tengwar_proto.typ" as tengwar
#import "@preview/showybox:2.0.1": showybox

// Define the fonts
#let font_serif = "New Computer Modern"
#let font_sans = "New Computer Modern Sans"
#let font_mono = "New Computer Modern Mono"
#let font_math = "New Computer Modern Math"

// Other useful definitions
#let font_stroke_width = 0pt
#let paragraph-indent = 1em
#let par_skip_bis = 0.5em
#let subsec_skip = 1em
#let link_color = color.rgb(0, 100, 200)
#let smallspace = h(0.2em)

// Document metadata
#let title = "Manual for tengwar-proto"
#let author = "Florent Michel"
#let keywords = ("Tengwar", "Typst")
#set document(
  title: title,
  author: author,
  keywords: keywords,
  date: auto)
  
// Page format
#set page (
  width: 21cm,
  height: 29.7cm,
  margin: (
    top: 2cm,
    bottom: 2cm,
    inside: 2cm,
    outside: 2cm),
  numbering: "1")
  
// Main font
#set text (
  font: font_serif,
  weight: 500,
  fallback: false,
  stroke: font_stroke_width,
  size: 10.5pt)

// Math font
#show math.equation: set text(
  font: font_math,
  weight: 500, 
  stroke: font_stroke_width)

// Paragraph format
#set par(
  justify: true,
  leading: 0.5em,
  first-line-indent: paragraph-indent)
#show par: set block(spacing: 0.67em)

// Link format
#show link: set text(
  link_color,
  stroke: font_stroke_width + link_color)

// Headings format
#set heading(numbering: "1.")
#show heading: set text(font: font_sans)
#show heading: it => {
  v(subsec_skip)
  it
  v(0.5em)
}

// Outline format
#set outline(
  indent: true, 
  depth: 2)
#show outline: set text(
  font: font_sans,
  link_color, 
  stroke: link_color + font_stroke_width)
#show outline.entry.where(level: 1): it => {
  v(12pt, weak: true)
  strong(it)
}
 
// List format
#set list(
  tight: false,
  marker: ([•], [‣], [–]),
  indent: 1em,
  spacing: 0.5em)

// Footnote format
#set footnote.entry(indent: 0pt)
#show footnote: set text(link_color)

// Citation format
#show cite: it => {
  show regex("\d+"): set text(fill: link_color)
  it
}

// Code snippet
#let tengwar-snippet(code) = context {
  let inset = 3pt
  set text(bottom-edge: "baseline")
  set text(top-edge: "bounds")
  let y = eval("tengwar." + code, mode: "code", scope: (tengwar: tengwar))
  let dy = calc.max(
    measure([
      #set text(bottom-edge: "bounds")
      #y]).height - measure(box(y, clip: true)).height,
    measure([
      #set text(bottom-edge: "bounds")
      #code]).height - measure(box(code, clip: true)).height)
  let code-block = raw(code, block: true, lang: "Typst")
  let box-l = box(code-block, 
                  inset: (bottom: dy+inset, top: inset, left: inset, right: inset))
  let dy2 = measure([
      #set text(bottom-edge: "bounds")
      #box-l]).height - 2*inset - measure([
      #set text(bottom-edge: "bounds")
      #y]).height
  if dy2 < 0pt { dy2 = 0pt }
  let box-r = box(y, fill: white, 
                  inset: (bottom: dy+inset, top: dy2+inset, left: inset, right: inset - 1pt))
  box(box-l + box-r,
    inset: 0pt,
    fill: luma(200),
    stroke: luma(200),
    baseline: 28%)
}


#if (title != none) {
  align(
    center,
    text(17pt, font: font_sans)[#strong(title)]
    + v(0.5em)
    + if (author != "") { text(15pt, font: "Latin Modern Sans")[#author] }
  )
}

#outline(title: text("Contents" + v(-0.25em)))

= Introduction

= How to use

== Design principles

== Quenya

The implementation of the Quenya mode follows Reference @tengwar-eruantalince.

=== Basic examples

#tengwar-snippet("quenya[aha]")

#tengwar-snippet("quenya[namárië]")

=== N mode

=== H mode

=== Y mode

=== S mode

=== Punctuation

End-of-paragraph symbols can be obtained by combining commas and periods: \
#tengwar-snippet("quenya[.,]") #h(1em)
#tengwar-snippet("quenya[..]") #h(1em)
#tengwar-snippet("quenya[,.,]")

*Note:* Generally, parentheses in Quenya are denoted by the sungle symbol #tengwar.quenya[/]—there is no distinction between opening and closing parentheses. 
We deviate from this convention by mabbing the symbol ‘(’ to #tengwar.quenya[(] and ‘)’ to #tengwar.quenya[)]. 
The proper Tengwar parenthesis is mapped to ‘/’.

=== Number system

*Example:*
#tengwar-snippet("quenya[123]") 

=== Example: Namárië

One of the most famous texts written in Quenya is the poem _Namárië_ (#tengwar.quenya[Namárië]), originally written in @lotr #footnote[Book 2, ch. 8 "Farewell to Lórien"] and available for instance in Reference @namarie.
Below we show the same text without (left) and with (right) the `#show: quenya` command.
We use a spacing between line of 0.7em to clearly separate them (some tengwar have a relatively large vertical extension).

#[
#show: rest => columns(2, rest)
#set par(
  justify: false,
  leading: 0.7em,
  first-line-indent: 0em)
#show par: it => it + v(0.5em)

#set text(size: 12pt)

#let txt = [

*Namárië*

Ai! laurië lantar lassi súrinen, \
yéni únótimë ve rámar aldaron! \
Yéni ve lintë yuldar avánier \
mi oromardi lisse-miruvóreva \
Andúnë pella, Vardo tellumar \
nu luini yassen tintilar i eleni \
ómaryo airetári-lírinen.

Sí man i yulma nin enquantuva?

An sí Tintallë Varda Oiolossëo \
ve fanyar máryat Elentári ortanë, \
ar ilyë tier undulávë lumbulë, \
ar sindanóriello caita mornië \
i falmalinnar imbë met, ar hísië \
untúpa Calaciryo míri oialë. \
Sí vanwa ná, Rómello vanwa, Valimar!

Namárië! Nai hiruvalyë Valimar. \
Nai elyë hiruva. Namárië!
]

#txt

#colbreak()

#set text(size: 11pt)
#show: tengwar.quenya

#txt

]

== Sindarin—Mode of Gondor

*Not yet implemented*

== Sindarin—Mode of Beleriand

*Not yet implemented*

== Black Speech

*Not yet implemented*

= How to contribute

Any kind of contribution is warmly welcome! Here are a few ways you can help: 

- *Bug reports:* Some text rendering incorrectly in Tengwar? Unexpected formatting? Any other issue with the code or documentation? Please report it! This module was only tested on a very small corpus so far, and identifying any corner case where it does not work as intended is very useful!

- *Language help:* My knowledge of Tengwar and the languages invented by J. R. R. Tolkien is quite superficial, and I may well have missed or misunderstood some of the rules for writing in Tengwar. If you spot anything that looks wrong, please let me know!

- *Implementation:* The Typst code is likely not quite as efficient as could be. If you can see better ways to implement something, please feel free to let me now or to submit a pull request with an improved version!

- *Feature requests:* Any feature request is welcome. I can't promise I'll have the time and knowledge to implement everything that would be nice to have; but if you'd like to see something implemented please let me know—or submit a pull request if you've already implemented it!

#v(1em)

#align(right)[#tengwar.quenya[Hantanyel!]]

#bibliography("biblio.yml")
