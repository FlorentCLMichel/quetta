#let tengwar-font = "Tengwar Annatar";
#let tengwar-font-alt = "Tengwar Annatar Alt";

#let to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(to-string).join("")
  } else if content.has("body") {
    to-string(content.body)
  } else if content == [ ] {
    " "
  }
}

#let array-to-string(it) = {
  let res = ""
  for x in it {
    res += x
  }
  res
}

#let array-to-string-or(it) = {
  let res = ""
  for x in it.slice(0,-1) {
    res += x + "|"
  }
  res + "[" + it.last() + "]" // using brakets for the last element to escape the `?`
}

#let tinco = "\u{0031}"
#let tinco-alt = "\u{0021}"
#let ando = "\u{0032}"
#let ando-alt = "\u{0040}"
#let sule = "\u{0033}"
#let anto = "\u{0034}"
#let numen = "\u{0035}"
#let ore = "\u{0036}"
#let romen = "\u{0037}"
#let silme = "\u{0038}"
#let silme-alt = "\u{002a}"
#let hyarmen = "\u{0039}"
#let parma = "\u{0071}"
#let parma-alt = "\u{0051}"
#let umbar = "\u{0077}"
#let umbar-alt = "\u{0057}"
#let formen = "\u{0065}"
#let ampa = "\u{0072}"
#let malta = "\u{0074}"
#let vala = "\u{0079}"
#let arda = "\u{0075}"
#let silmenuquerna = "\u{0069}"
#let silmenuquerna-alt = "\u{0049}"
#let halla = "\u{00bd}"
#let calma = "\u{0061}"
#let calma-alt = "\u{0041}"
#let anga = "\u{0073}"
#let anga-alt = "\u{0053}"
#let aha = "\u{0064}"
#let anca = "\u{0066}"
#let noldo = "\u{0067}"
#let anna = "\u{0068}"
#let lambe = "\u{006a}"
#let lambe-alt = "\u{ffff}\u{006a}\u{fffe}"
#let esse = "\u{006b}"
#let esse-alt = "\u{004b}"
#let iglide = "\u{006c}"
#let quesse = "\u{007a}"
#let quesse-alt = "\u{005a}"
#let ungwe = "\u{0078}"
#let ungwe-alt = "\u{0058}"
#let hwesta = "\u{0063}"
#let unque = "\u{0076}"
#let nwalme = "\u{0062}"
#let wilya = "\u{006e}"
#let alda = "\u{006d}"
#let essenuquerna = "\u{002c}"
#let essenuquerna-alt = "\u{003c}"
#let uglide = "\u{002e}"
#let carrier-i = "\u{0060}"
#let carrier-j = "\u{007e}"
#let comma = "\u{003d}"
#let period = "\u{002d}"
#let period = "\u{002d}"
#let en-dash = "\u{005c}"
#let em-dash = "\u{00c2}"
#let exclamationmark = "\u{00c1}"
#let questionmark = "\u{00c0}"
#let tehta-a = "\u{0043}"
#let tehta-e = "\u{0056}"
#let tehta-i = "\u{0042}"
#let tehta-o = "\u{004e}"
#let tehta-u = "\u{004d}"
#let tehta-y = "\u{00cf}"
#let tehta-aa = "\u{ffff}\u{0043}\u{fffe}"
#let tehta-ee = "\u{ffff}\u{0056}\u{fffe}"
#let tehta-ii = "\u{ffff}\u{0042}\u{fffe}"
#let tehta-oo = "\u{ffff}\u{004e}\u{fffe}"
#let tehta-uu = "\u{ffff}\u{004d}\u{fffe}"
#let l-paren = "\u{0152}"
#let r-paren = "\u{0153}"
#let tilde = "p"
#let slash = "\u{203a}"

// TODO: check all combinations
#let map-quenya = (
  "£t"   : tinco-alt,            "£T"   : tinco-alt,
  t      : tinco,                T      : tinco,
  "£nd"  : ando-alt,             "£Nd"  : ando-alt,
  nd     : ando,                 Nd     : ando,
  "£ss"  : esse-alt,             "£Ss"  : esse-alt,
  "£s"   : silme-alt,            "£S"   : silme-alt,
  ss     : esse,                 Ss     : esse,
  s      : silme,                S      : silme,
  th     : sule,                 Th     : sule,
  nt     : anto,                 Nt     : anto,
  "£ngw" : ungwe-alt,            "£Ngw" : ungwe-alt,
  "£n"   : noldo,                "£N"   : noldo,
  nqu    : unque,                Nqu    : unque,
  ngw    : ungwe,                Ngw    : ungwe,
  n      : numen,                N      : numen,
  rd     : arda,                 Rd     : arda,
  "£r"   : romen,                "£R"   : romen,
  r      : ore,                  R      : ore,
  "£p"   : parma-alt,            "£P"   : parma-alt,
  p      : parma,                P      : parma,
  "£mb"  : umbar-alt,            "£Mb"  : umbar-alt,
  mb     : umbar,                Mb     : umbar,
  f      : formen,               F      : formen,
  mp     : ampa,                 Mp     : ampa,
  m      : malta,                M      : malta,
  v      : vala,                 V      : vala,
  "£qu"  : quesse-alt,           "£Qu"  : quesse-alt,
  qu     : quesse,               Qu     : quesse,
  "£kw"  : quesse,               "£Kw"  : quesse,
  kw     : quesse-alt,           Kw     : quesse-alt,
  "£k"   : calma,                "£K"   : calma,
  k      : calma-alt,            K      : calma-alt,
  "£c"   : calma-alt,            "£C"   : calma-alt,
  c      : calma,                C      : calma,
  "£ng"  : anga-alt,             "£Ng"  : anga-alt, 
  ng     : anga,                 Ng     : anga, 
  h      : aha,                  H      : aha,
  nc     : anca,                 Nc     : anca,
  nq     : anca,                 Nq     : anca,
  nk     : anca,                 Nk     : anca,
  y      : anna,                 Y      : anna,
  ld     : alda,                 Ld     : alda,
  "£l"   : lambe-alt,            "£L"   : lambe-alt,
  l      : lambe,                L      : lambe,
  hw     : hwesta,               Hw     : hwesta,
  w      : wilya,                W      : wilya,
  ai     : iglide + tehta-a,     Ai     : iglide + tehta-a,
  ei     : iglide + tehta-e,     Ei     : iglide + tehta-e,
  oi     : iglide + tehta-o,     Oi     : iglide + tehta-o,
  ui     : iglide + tehta-u,     Ui     : iglide + tehta-u,
  au     : uglide + tehta-a,     Au     : uglide + tehta-a,
  eu     : uglide + tehta-e,     Eu     : uglide + tehta-e,
  iu     : uglide + tehta-i,     Iu     : uglide + tehta-i,
  ou     : uglide + tehta-o,     Ou     : uglide + tehta-o,
  a      : tehta-a,              A      : tehta-a,
  e      : tehta-e,              E      : tehta-e,
  i      : tehta-i,              I      : tehta-i,
  o      : tehta-o,              O      : tehta-o,
  u      : tehta-u,              U      : tehta-u,
  á      : carrier-j + tehta-a,  Á      : carrier-j + tehta-a,
  é      : carrier-j + tehta-e,  É      : carrier-j + tehta-e,
  í      : carrier-j + tehta-i,  Í      : carrier-j + tehta-i,
  ó      : carrier-j + tehta-o,  Ó      : carrier-j + tehta-o,
  ú      : carrier-j + tehta-u,  Ú      : carrier-j + tehta-u,
  ä      : tehta-a,              Ä      : tehta-a,
  ë      : tehta-e,              Ë      : tehta-e,
  ï      : tehta-i,              Ï      : tehta-i,
  ö      : tehta-o,              Ö      : tehta-o,
  ü      : tehta-u,              Ü      : tehta-u,
  ô      : tehta-oo,             Ô      : tehta-oo,
  ","    : comma,
  "."    : period,
  "--"   : em-dash,
  "—"    : em-dash,
  "-"    : en-dash,
  "!"    : exclamationmark,
  "("    : l-paren,
  ")"    : r-paren,
  "­"    : tilde,
  "/"    : slash,
  "«"    : "\u{ffff}«\u{fffe}",
  "»"    : "\u{ffff}»\u{fffe}",
  ":"    : "\u{fffd}",
  "?"    : questionmark,
)

#let quenya-consonants = (
  tinco,
  tinco-alt,
  ando,
  ando-alt,
  sule,
  anto,
  numen,
  ore,
  romen,
  silme,
  "\\" + silme-alt,
  hyarmen,
  parma,
  parma-alt,
  umbar,
  umbar-alt,
  formen,
  ampa,
  malta,
  str(vala),
  arda,
  silmenuquerna,
  silmenuquerna-alt,
  halla,
  calma,
  calma-alt,
  anga,
  anga-alt,
  aha,
  anca,
  noldo,
  anna,
  lambe,
  lambe-alt,
  esse,
  esse-alt,
  quesse,
  quesse-alt,
  ungwe,
  ungwe-alt,
  hwesta,
  unque,
  nwalme,
  wilya,
  alda,
  essenuquerna,
  essenuquerna-alt,
  iglide,
  uglide,
)

#let quenya-voyels = (
  carrier-i,
  carrier-j,
  tehta-a,
  tehta-e,
  tehta-i,
  tehta-o,
  tehta-u,
  tehta-y,
)

#let letter-shapes = (
  str(tinco)            : "y",
  str(tinco-alt)        : "y",
  str(ando)             : "yy",
  str(ando-alt)         : "yy",
  str(sule)             : "b",
  str(anto)             : "bb",
  str(numen)            : "m",
  str(ore)              : "n",
  str(romen)            : "y",
  str(silme)            : "y",
  str(silme-alt)        : "y",
  str(hyarmen)          : "b",
  str(parma)            : "y",
  str(parma-alt)        : "y",
  str(umbar)            : "yy",
  str(umbar-alt)        : "yy",
  str(formen)           : "b",
  str(ampa)             : "bb",
  str(malta)            : "m",
  str(vala)             : "n",
  str(arda)             : "y",
  str(silmenuquerna)    : "y",
  str(silmenuquerna-alt): "y",
  str(halla)            : "b",
  str(calma)            : "y",
  str(calma-alt)        : "y",
  str(anga)             : "yy",
  str(anga-alt)         : "yy",
  str(aha)              : "n",
  str(anca)             : "b",
  str(noldo)            : "m",
  str(anna)             : "o",
  str(lambe)            : "O",
  str(lambe-alt)        : "O",
  str(esse)             : "d",
  str(esse-alt)         : "d",
  str(uglide)           : "o",
  str(quesse)           : "y",
  str(quesse-alt)       : "y",
  str(ungwe)            : "yy",
  str(ungwe-alt)        : "yy",
  str(hwesta)           : "b",
  str(unque)            : "bb",
  str(nwalme)           : "m",
  str(wilya)            : "n",
  str(alda)             : "yy",
  str(essenuquerna)     : "y",
  str(essenuquerna-alt) : "y",
  str(iglide)           : "n",
  str(uglide)           : "o",
)

#let quenya-tehtar = (
  str(tehta-a),
  str(tehta-e),
  str(tehta-i),
  str(tehta-o),
  str(tehta-u),
  str(tehta-y),
)

#let quenya-voyels-shifted = (
  tehta-a + "m" : "\u{0023}",
  tehta-e + "m" : "\u{0024}",
  tehta-i + "m" : "\u{0025}",
  tehta-o + "m" : "\u{005e}",
  tehta-u + "m" : "\u{0026}",
  tehta-y + "m" : "\u{00cc}",
  tehta-a + "O" : "\u{0023}",
  tehta-e + "O" : "\u{0024}",
  tehta-i + "O" : "\u{0025}",
  tehta-o + "O" : "\u{005e}",
  tehta-u + "O" : "\u{0026}",
  tehta-y + "O" : "\u{00b4}",
  tehta-a + "yy" : "\u{0023}",
  tehta-e + "yy" : "\u{0024}",
  tehta-i + "yy" : "\u{0025}",
  tehta-o + "yy" : "\u{005e}",
  tehta-u + "yy" : "\u{0026}",
  tehta-y + "yy" : "\u{00cc}",
  tehta-a + "bb" : "\u{0023}",
  tehta-e + "bb" : "\u{0024}",
  tehta-i + "bb" : "\u{0025}",
  tehta-o + "bb" : "\u{005e}",
  tehta-u + "bb" : "\u{0026}",
  tehta-y + "bb" : "\u{00cc}",
  tehta-a + "n" : "\u{0045}",
  tehta-e + "n" : "\u{0052}",
  tehta-i + "n" : "\u{0054}",
  tehta-o + "n" : "\u{0059}",
  tehta-u + "n" : "\u{0055}",
  tehta-y + "n" : "\u{00cd}",
  tehta-a + "o" : "\u{0044}",
  tehta-e + "o" : "\u{0046}",
  tehta-i + "o" : "\u{0047}",
  tehta-o + "o" : "\u{0048}",
  tehta-u + "o" : "\u{004a}",
  tehta-y + "o" : "\u{00ce}",
  tehta-a + "b" : "\u{0044}",
  tehta-e + "b" : "\u{0046}",
  tehta-i + "b" : "\u{0047}",
  tehta-o + "b" : "\u{0048}",
  tehta-u + "b" : "\u{004a}",
  tehta-y + "b" : "\u{00cd}",
  tehta-a + "y" : "\u{0045}",
  tehta-e + "y" : "\u{0052}",
  tehta-i + "y" : "\u{0054}",
  tehta-o + "y" : "\u{0059}",
  tehta-u + "y" : "\u{0055}",
  tehta-y + "y" : "\u{00cd}",
  tehta-a + "d" : "\u{0045}",
  tehta-e + "d" : "\u{0046}",
  tehta-i + "d" : "\u{0047}",
  tehta-o + "d" : "\u{0048}",
  tehta-u + "d" : "\u{004a}",
  tehta-y + "d" : "\u{00cd}",
)

#let quenya-voyels-shifted-it = (
  tehta-o + "y" : "\u{0048}",
)

#let undertilde = (
  "m"  : "\u{003a}",
  "O"  : "\u{00b0}",
  "n"  : "\u{003b}",
  "b"  : "\u{003b}",
  "y"  : "\u{003b}",
  "bb" : "\u{003a}",
  "yy" : "\u{003a}",
)

#let overtilde = (
  "m"  : "\u{0050}",
  "O"  : "\u{0050}",
  "n"  : "\u{0070}",
  "b"  : "\u{0070}",
  "y"  : "\u{0070}",
  "bb" : "\u{0050}",
  "yy" : "\u{0050}",
)

#let quenya-s-hooks = (
  str(tinco)      : "\u{002b}",
  str(tinco-alt)  : "\u{002b}",
  str(ando)       : "\u{002b}",
  str(ando-alt)   : "\u{002b}",
  str(sule)       : "\u{002b}",
  str(anto)       : "\u{002b}",
  str(numen)      : "\u{002b}",
  str(ore)        : "\u{002b}",
  str(parma)      : "\u{00a1}",
  str(parma-alt)  : "\u{00a1}",
  str(umbar)      : "\u{00a1}",
  str(umbar-alt)  : "\u{00a1}",
  str(formen)     : "\u{00a1}",
  str(ampa)       : "\u{00a1}",
  str(malta)      : "\u{00a1}",
  str(vala)       : "\u{00a1}",
  str(calma)      : "\u{007c}",
  str(calma-alt)  : "\u{007c}",
  str(anga)       : "\u{007c}",
  str(anga-alt)   : "\u{007c}",
  str(aha)        : "\u{007c}",
  str(anca)       : "\u{007c}",
  str(noldo)      : "\u{007c}",
  str(anna)       : "\u{007c}",
  str(quesse)     : "\u{007c}",
  str(quesse-alt) : "\u{007c}",
  str(ungwe-alt)  : "\u{007c}",
  str(hwesta)     : "\u{007c}",
  str(unque)      : "\u{007c}",
  str(nwalme)     : "\u{007c}",
  str(wilya)      : "\u{007c}",
)

#let quenya-numbers-shifted = (
  "0"  : "\u{fff0}",
  "1"  : "\u{fff1}",
  "2"  : "\u{fff2}",
  "3"  : "\u{fff3}",
  "4"  : "\u{fff4}",
  "5"  : "\u{fff5}",
  "6"  : "\u{fff6}",
  "7"  : "\u{fff7}",
  "8"  : "\u{fff8}",
  "9"  : "\u{fff9}",
  "10" : "\u{fffa}",
  "11" : "\u{fffb}",
)

#let quenya-numbers-unshift = (
  "\u{fff0}" : "\u{00f0}",
  "\u{fff1}" : "\u{00f1}",
  "\u{fff2}" : "\u{00f2}",
  "\u{fff3}" : "\u{00f3}",
  "\u{fff4}" : "\u{00f4}",
  "\u{fff5}" : "\u{00f5}",
  "\u{fff6}" : "\u{00f6}",
  "\u{fff7}" : "\u{00f7}",
  "\u{fff8}" : "\u{00f8}",
  "\u{fff9}" : "\u{00f9}",
  "\u{fffa}" : "\u{00fa}",
  "\u{fffb}" : "\u{00fb}",
)

#let number-to-quenya(txt) = {
  let n_base_10 = int(txt)
  if n_base_10 == 0 {
    return quenya-numbers-shifted.at("0")
  }
  let n_base_12 = ()
  while n_base_10 > 0 {
    n_base_12.push(calc.rem-euclid(n_base_10, 12))
    n_base_10 = calc.div-euclid(n_base_10, 12)
  }
  n_base_12.map(m => quenya-numbers-shifted.at(str(m))).join()
}


#let quenya-str(txt, style: "normal") = { 
  // Set the font to Tengwar Annatar
  set text(font: tengwar-font, fallback: false)

  // Extract numbers, convert them to quenya, and shift the glyphs to avoid conflicts
  txt = txt.replace(regex("([0-9]+)"),
                    m => number-to-quenya(m.captures.first()))

  // Map symbols from the Latin alphabet to Tengwar glyphs
  txt = txt.replace(regex("(" + array-to-string-or(map-quenya.keys()) + ")"),
                    m => map-quenya.at(m.captures.first(), default: m.captures.first()))
  
  // Undo the number glyph shifts
  txt = txt.replace(regex("(" + array-to-string-or(quenya-numbers-unshift.keys()) + ")"),
                    m => quenya-numbers-unshift.at(m.captures.first()))
  
  // Replace aha by halla if followed by ore, romen, or lambe
  txt = txt.replace(regex(aha + "(" + ore + "|" + romen + "|" + lambe + "|" + lambe-alt + ")"), 
                    m => halla + m.captures.first())

  // Replace aha by hyarmen and add two dots below anna at start of word
  txt = txt.replace(regex("(\ +)" + aha), m => m.captures.first() + hyarmen)
  txt = txt.replace(regex("(\ +)" + anna), m => m.captures.first() + anna + tehta-y)
  txt = txt.replace(regex("(.)"), 
                    m => if m.captures.first() == aha { 
                      hyarmen 
                    } else if m.captures.first() == anna {
                      anna + tehta-y
                    } else { 
                      m.captures.first() 
                    }, 
                    count: 1)

  // If anna follows a consonant, replace it by two dots under the tengwa
  txt = txt.replace(regex("(" + array-to-string-or(quenya-consonants) + ")" + "(\u{fffe}?)" + anna),
                    m => m.captures.at(0) + m.captures.at(1) + tehta-y)
  
  // If órë is followed by a voyel or by anna and a voyel, replace it with rómen, and conversely
  txt = txt.replace(regex("([" + ore + romen + "])" + "(" + array-to-string-or(quenya-voyels) + ")"),
                    m => {if m.captures.at(0) == ore { romen } else { ore }} + m.captures.at(1))
  txt = txt.replace(regex("([" + ore + romen + "])" + anna + "(" + array-to-string-or(quenya-voyels) + ")"),
                    m => {if m.captures.at(0) == ore { romen } else { ore }} + anna + m.captures.first())
   
  // Use S-hooks if possible, and move the following tehtar if needed
  txt = txt.replace(regex("(" + array-to-string-or(quenya-consonants) + ")" 
                          + "(\u{fffe}?)" + silme
                          + "([" + array-to-string-or(quenya-tehtar) + "]?)"),
    m => if quenya-s-hooks.keys().contains(m.captures.at(0)) {
      m.captures.at(0) + m.captures.at(1) + m.captures.at(2) + quenya-s-hooks.at(m.captures.at(0))
    } else {
      m.captures.at(0) + m.captures.at(1) + sule + m.captures.at(2)
    }
  )

  // Use alternate versions of silme and esse if followed by a short voyel
  txt = txt.replace(regex(silme + "(" + array-to-string-or(quenya-tehtar) + ")"), 
                    m => silmenuquerna + m.captures.first())
  txt = txt.replace(regex(esse + "(" + array-to-string-or(quenya-tehtar) + ")"), 
                    m => essenuquerna + m.captures.first())
  txt = txt.replace(regex("\\" + silme-alt + "(" + array-to-string-or(quenya-tehtar) + ")"), 
                    m => silmenuquerna-alt + m.captures.first())
  txt = txt.replace(regex(esse-alt + "(" + array-to-string-or(quenya-tehtar) + ")"), 
                    m => essenuquerna-alt + m.captures.first())

  // If a tehta is not on a consonnant nor preceded by \u{ffff}, add a carrier (exclude theta-y)
  txt = txt.replace(regex("(.?)(\u{fffe}?)(\u{ffff}?)(" + array-to-string-or(quenya-tehtar.slice(0,-1)) + ")"),
    m => if (quenya-consonants + (carrier-i, carrier-j, tehta-y)).contains(m.captures.at(0)) {
      m.captures.at(0) + m.captures.at(1) + m.captures.at(2) + m.captures.at(3)
    } else {
      m.captures.at(0) + m.captures.at(1) + m.captures.at(2) + carrier-i + m.captures.at(3)
    })

  // Fix the tilde width
  txt = txt.replace(regex("(" + array-to-string-or(quenya-consonants) + ")([" + array-to-string-or(quenya-voyels) + "]?)" + tilde),
    m =>  m.captures.at(0) + m.captures.at(1) + overtilde.at(letter-shapes.at(m.captures.at(0))))

  // Adjust the positions of tehtars
  txt = txt.replace(
    regex("(" + array-to-string-or(quenya-consonants) 
           + ")(\u{fffe}?)"
           + "(\u{ffff}?)("
           + tehta-y + "?)("
           + array-to-string-or(quenya-voyels) + ")"),
    m => {
      let shifted-a = quenya-voyels-shifted.at(
        m.captures.at(3) + letter-shapes.at(m.captures.at(0)),
        default: m.captures.at(3)) 
      let shifted-b = quenya-voyels-shifted.at(
        m.captures.at(4) + letter-shapes.at(m.captures.at(0)),
        default: m.captures.at(4))
      m.captures.at(0) + m.captures.at(1) + m.captures.at(2) + if (letter-shapes.keys().contains(m.captures.at(0))) {
        if style == "italic" {
          quenya-voyels-shifted-it.at(
            m.captures.at(3) + letter-shapes.at(m.captures.at(0)),
            default: shifted-a) + quenya-voyels-shifted-it.at(
            m.captures.at(4) + letter-shapes.at(m.captures.at(0)),
            default: shifted-b)
        } else {
          shifted-a + shifted-b
        }
      } else {
        m.captures.at(3) + m.captures.at(4)
      }
    })

  // Combine repeated consonants
  txt = txt.replace(regex("(" + array-to-string-or(quenya-consonants) + ")(" + array-to-string-or(quenya-consonants) + ")"),
    m => if (m.captures.at(0) == m.captures.at(1)) {
      m.captures.first() + undertilde.at(letter-shapes.at(m.captures.at(0)))
    } else {
      m.captures.at(0) + m.captures.at(1)
    })

  // Use alt font for text between \u{ffff} and \u{fffe}
  let re-alt-font = regex("\u{ffff}(.?)\u{fffe}")
  show re-alt-font : it => {
    let m = it.text.match(re-alt-font).captures.first()
    text(font: tengwar-font-alt, fallback: false, m)
  }

  // Remove \u{fffd}
  show "\u{fffd}": ""
  
  txt
}

#let quenya(it, style: "normal") = { 
  
  // Adjust the spacing between some letters in italic mode
  let re-esse-adjust = regex(esse + "(" + array-to-string-or(quenya-consonants) + ")")
  show re-esse-adjust: it => {
    let m = it.text.match(re-esse-adjust).captures.first()
    if (text.style == "italic") and ("n", "m", "o").contains(letter-shapes.at(m)) {
      esse + h(-0.15em) + m
    } else {
      esse + m
    }
  }

  if it.has("text") {
    text(quenya-str(it.text, style: style), style: style)
  } else if it.has("body") {
    if (repr(it.func()) == "emph") {
      set text(style: "italic")
      quenya(it.body, style: "italic")
    } else {
      it.func()(quenya(it.body, style: style))
    }
  } else if it.has("children") {
    it.children.map(it => quenya(it, style: style)).join()
  } else if it.has("child") {
    set text(fill: text.fill)
    quenya(it.child, style: style)
  } else {
    it
  }
}

// TODO: add Sindarin and Beleriand modes
