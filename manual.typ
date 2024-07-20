#import "tengwar_proto.typ" as tengwar

// Define the fonts
#let font-serif = "New Computer Modern"
#let font-sans = "New Computer Modern Sans"
#let font-mono = "New Computer Modern Mono"
#let font-math = "New Computer Modern Math"

// Other useful definitions
#let font-stroke-width = 0pt
#let paragraph-indent = 1em
#let subsec-skip-1 = 0.5em
#let subsec-skip-2 = 0.5em
#let link-color = color.rgb(0, 100, 200)

// Document metadata
#let title = "Manual for the quetta (" + tengwar.quenya[Quetta] + ") module"
#let author = "Florent Michel"
#let keywords = ("Tengwar", "Typst")
#let version = "0.0.1"
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
  font: font-serif,
  weight: 500,
  fallback: false,
  stroke: font-stroke-width,
  size: 10.5pt)

// Math font
#show math.equation: set text(
  font: font-math,
  weight: 500, 
  stroke: font-stroke-width)

// Paragraph format
#set par(
  justify: true,
  leading: 0.5em,
  spacing: 0.67em,
  first-line-indent: paragraph-indent)

// Link format
#show link: set text(
  link-color,
  stroke: font-stroke-width + link-color)

// Headings format
#set heading(numbering: "1.")
#show heading: set text(font: font-sans)
#show heading: it => {
  v(subsec-skip-1)
  it
  v(subsec-skip-2)
}

// Outline format
#set outline(
  indent: true, 
  depth: 2)
#show outline: set text(
  font: font-sans,
  link-color, 
  stroke: link-color + font-stroke-width)
#show outline.entry.where(level: 1): it => {
  v(12pt, weak: true)
  strong(it)
}
 
// List format
#set list(
  tight: false,
  marker: ([•], [‣], [–]),
  indent: 1em,
  spacing: 1em)

// Footnote format
#set footnote.entry(indent: 0pt)
#show footnote: set text(link-color)

// Citation format
#show cite: it => {
  show regex("\d+"): set text(fill: link-color)
  it
}

// Code snippet
#let tengwar-snippet(code, margin: 0pt) = context {
  let inset = 3pt
  let radius = 5pt
  set text(bottom-edge: "bounds", top-edge: "bounds")
  let y = eval("tengwar." + code, mode: "code", scope: (tengwar: tengwar))
  let code-block = raw(code, block: true, lang: "Typst")
  let height-l-t = measure([
      #set text(top-edge: "bounds", bottom-edge: "baseline")
      #box(code-block, inset: 0pt)]).height
  let height-l-b = measure([
      #set text(top-edge: "baseline", bottom-edge: "bounds")
      #box(code-block, inset: 0pt)]).height
  let height-r-t = measure([
      #set text(top-edge: "bounds", bottom-edge: "baseline")
      #box(y, inset: 0pt)]).height
  let height-r-b = measure([
      #set text(top-edge: "baseline", bottom-edge: "bounds")
      #box(y, inset: 0pt)]).height
  let box-l = box(code-block,
                  inset: (top: inset + {if height-r-t > height-l-t {height-r-t - height-l-t} else {0pt}}, 
                          bottom: inset + {if height-r-b > height-l-b {height-r-b - height-l-b} else {0pt}}, 
                          left: inset, 
                          right: inset))
  let box-r = box(y, fill: white, radius: radius,
                  inset: (top: inset + {if height-l-t > height-r-t {height-l-t - height-r-t} else {0pt}}, 
                          bottom: inset + {if height-l-b > height-r-b {height-l-b - height-r-b} else {0pt}}, 
                          left: inset + margin, 
                          right: inset + margin - 1pt))
  box(box-l + box-r,
    inset: 0pt,
    radius: radius, 
    fill: luma(200),
    stroke: luma(200),
    baseline: 28%)
}

// // Code snippet
// #let tengwar-snippet(code) = context {
//   let inset = 3pt
//   set text(bottom-edge: "baseline")
//   set text(top-edge: "bounds")
//   let y = eval("tengwar." + code, mode: "code", scope: (tengwar: tengwar))
//   let dy = calc.max(
//     measure([
//       #set text(bottom-edge: "bounds")
//       #y]).height - measure(box(y, clip: true)).height,
//     measure([
//       #set text(bottom-edge: "bounds")
//       #code]).height - measure(box(code, clip: true)).height)
//   let code-block = raw(code, block: true, lang: "Typst")
//   let box-l = box(code-block, 
//                   inset: (bottom: dy+inset, top: inset, left: inset, right: inset))
//   let dy2 = measure([
//       #set text(bottom-edge: "bounds")
//       #box-l]).height - 2*inset - measure([
//       #set text(bottom-edge: "bounds")
//       #y]).height
//   if dy2 < 0pt { dy2 = 0pt }
//   let box-r = box(y, fill: white, radius: 5pt,
//                   inset: (bottom: dy+inset, top: dy2+inset, left: inset, right: inset - 1pt))
//   box(box-l + box-r,
//     inset: 0pt,
//     radius: 5pt, 
//     fill: rgb(200, 200, 200),
//     stroke: luma(200),
//     baseline: 28%)
// }


#if (title != none) {
  align(
    center,
    text(17pt, font: font-sans)[#strong(title)]
    + if (author != "") { v(.5em) + text(15pt, font: "Latin Modern Sans")[#author] }
    + if (version != "") { v(.5em) + text(12pt, font: "Latin Modern Sans")[version #version] }
  )
}

#outline(title: text(fill: black, "Contents" + v(-0.25em)))

= Introduction

== ‘Quetta’?

_‘Quetta’_ (#tengwar.quenya[Quetta]) means ‘word’ in Quenya @elfdict, one of the fictional languages invented by British writer and philologist J. R. R. Tolkien. 
It thus seemed fitting for a module aimed at making the process of typing these languages easier. 

Words are also, loosely speaking, the base units this module works on, as we shall see in more detailes below. 
While its general philosophy is to map each symbol used in Tolkien's elvish languages to letters from the Latin alphabet, a few word-wise substitution rules were implemented so that, in _most_ (but probably not all) cases the correct spelling can be obtained by typing the word phonetically. 
For the same reason, the mapping generally works on groups of letters when there is no natural one-to-one mapping between individual symbols.

== The Tengwar script

A proper introduction to Tengwar is way beyond the scope of this document. 
We refer interested readers to Appendix E of Reference @lotr and online references such as #link("https://en.wikipedia.org/wiki/Tengwar")[wikipedia] #link("https://tolkiengateway.net/wiki/Tengwar")[tolkiengateway.net], #link("https://www.omniglot.com/conscripts/tengwar.htm")[omniglot.com], or #link("https://www.tecendil.com/tengwar-handbook/")[tecendil.com].

In short, Tengwar (#tengwar.quenya[tengwar] in Quenya mode) is one of the scripts invented by Tolkien, primarily consisting of 36 letters (called _tengwar_; singular: _tengwa_ (#tengwar.quenya[tengwa])) and diacritics (_tehtar_ (#tengwar.quenya[tehtar]; singular: _tehta_ (#tengwar.quenya[tehta]))). 
There are several ways to relate tengwar to sounds, called _modes_.
This module primarily focuses on the Quenya (#tengwar.quenya[Quenya]), or ‘classical’, mode, in universe the original way to write tengwar.
Support for the other modes described by Tolkien is planned for a future version.

= How to use

== Design principles

The module provides one main command for each supported mode (in the curr).

\*\*\*

Alternative glyphs, when they exist, can be obtained with the symbol `£`.
For instance, typing `n` produces the tengwa #tengwar.quenya[n] (_numen_) while typing `£n` produces #tengwar.quenya[£n] (_noldo_): 

#v(1em)

#tengwar-snippet("quenya[n]") #h(1em) #tengwar-snippet("quenya[£n]") 

#v(1em)

#tengwar-snippet("quenya[s]") #h(1em) #tengwar-snippet("quenya[£s]") 
#h(1em) #tengwar-snippet("quenya[ss]") #h(1em) #tengwar-snippet("quenya[£ss]") 

#v(1em)

#tengwar-snippet("quenya[sa]") #h(1em) #tengwar-snippet("quenya[£sa]") 
#h(1em) #tengwar-snippet("quenya[ssa]") #h(1em) #tengwar-snippet("quenya[£ssa]") 

== Quenya

The implementation of the Quenya mode follows Reference @tengwar-eruantalince.

Here are a few basic examples: 

#tengwar-snippet("quenya[aha]")

#tengwar-snippet("quenya[namárië]")

// === N mode
// 
// === H mode
// 
// === Y mode
// 
// === S mode
// 
// === L mode

=== Punctuation

End-of-paragraph symbols can be obtained by combining commas and periods:

#v(1em)

#tengwar-snippet("quenya[.-]") #h(1em)
#tengwar-snippet("quenya[.,]") #h(1em)
#tengwar-snippet("quenya[..]") #h(1em)
#tengwar-snippet("quenya[,.,]")

#v(1em)

#h(-paragraph-indent) *Note:* Generally, parentheses in Quenya are denoted by the single symbol #tengwar.quenya[/]—there is no distinction between opening and closing parentheses. 
We deviate from this convention by mabbing the symbol ‘(’ to #tengwar.quenya[(] and ‘)’ to #tengwar.quenya[)]. 
The proper Tengwar parenthesis is mapped to ‘/’.

#v(1em)

#h(-paragraph-indent) The decorations #h(0.5em)#tengwar.quenya[»] and #tengwar.quenya[«]#h(0.5em) are obtained using the French quotation marks ‘»’ and ‘«’:

#v(1em)

#tengwar-snippet("quenya[»quenya«]", margin: 4pt)

#v(1em)

#h(-paragraph-indent) The symbol ‘:’ can be used to prevent glyph combination: 

#v(1em)

#tengwar-snippet("quenya[nn n:n]") #h(1em)
#tengwar-snippet("quenya[na n:a]")

=== Number system

*Example:*
#tengwar-snippet("quenya[123]") 

#pagebreak()

=== Example: Namárië

One of the most famous texts written in Quenya is the poem _Namárië_ (#tengwar.quenya[Namárië]), originally written in @lotr #footnote[Book 2, ch. 8 "Farewell to Lórien"] and available for instance in Reference @namarie.
Below we show the same text without (left) and with (right) the `#show: quenya` command.
We use a spacing between line of 0.7em to clearly separate them (some tengwar have a relatively large vertical extension).

#v(1em)

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

#pagebreak()

== Black Speech

Although the Black Speech is not implemented yet, the One Ring inscription can be reproduced using the Quenya mode as follows:#footnote[This is obviously a bit of a hack, meant only to show how the limitations of hwving only one mode implemented can be circumvented. This example is not supposed to be stable and might render differently in a later version.]

#v(0.5em)

```
quenya[
  _»£Ka:nssangw:nd£rombta£lokwô, £Ka:nssangw:ngwmbe­talo« 
  #linebreak()#v(0.7em) 
  £Ka:nssangw:s£rquata£lokwô, £Ngwa:mb£rossmo£kii:qu£rpe­talo_
]
```

#v(0.5em)

Obviously, that's not quite how the ring inscription is supposed to sound.
One reason is simply that the Quenya and Black Speech modes have different relations between symbols and sounds: to obtain the same written result, one has to ‘transcribe’ the phonetic description to how it would be read in the Quenya mode. 
Another difference is that some of the tengwa forms used in the ring inscription are generally not used in Quenya; we thus use the symbol `£` to get variants. 
We also use `£` to switch between #tengwar.quenya[r] and #tengwar.quenya[£r].
Finally, words are separated with `:` to avoid repeated consonants being combined.
Here is the result, with a color gradient in the background to mimic a golden surface:

#v(1em)

#[
#set text(top-edge: "ascender", bottom-edge: "descender")
#align(center, block(
  fill: gradient.linear(rgb(157,103,7), rgb(250,250,152), rgb(157,103,7), space: rgb, angle: 80deg),
  inset: (top: 0.5em, left: 1em, right: 0.5em, bottom: 1.5em),
  radius: 5pt,
  tengwar.quenya[
    _»£Ka:nssangw:nd£rombta£lokwô, £Ka:nssangw:ngwmbe­talo« 
    #linebreak()#v(0.7em) 
    £Ka:nssangw:s£rquata£lokwô, £Ngwa:mb£rossmo£kii:qu£rpe­talo_
  ]))
]

#v(1em)

*Not yet implemented*

#pagebreak()

= How to contribute

Any kind of contribution is warmly welcome! Here are a few ways you can help: 

#v(0.5em)

- *Bug reports:* Some text rendering incorrectly in Tengwar? Unexpected formatting? Any other issue with the code or documentation? Please report it! This module was only tested on a very small corpus so far, and identifying any corner case where it does not work as intended is very useful!

- *Language help:* My knowledge of Tengwar and the languages invented by J. R. R. Tolkien is quite superficial, and I may well have missed or misunderstood some of the rules for writing in Tengwar. If you spot anything that looks wrong, please let me know!

- *Implementation:* The Typst code is likely not quite as efficient as could be. If you can see better ways to implement something, please feel free to let me now or to submit a pull request with an improved version!

- *Feature requests:* Any feature request is welcome. I can't promise I'll have the time and knowledge to implement everything that would be nice to have; but if you'd like to see something implemented please let me know—or submit a pull request if you've already implemented it!

#v(1em)

#align(right)[#tengwar.quenya[Hantanyel!]]

#bibliography("biblio.yml")
