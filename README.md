A simple module to write [tengwar](https://en.wikipedia.org/wiki/Tengwar) in [Typst](https://typst.app/).

## Requirements

- [Typst](https://github.com/typst/typst) version 1.11.1 or up
- The [Tengwar Annatar](https://www.fontspace.com/tengwar-annatar-font-f2244) fonts version 1.20

For use with the [Typst web app](https://typst.app/), you need to upload the font files.

## Usage

The main functionality of this module is provided by the function `quenya` taking content and converting all text in Tenwar using the Quenya mode. The original text is used as a phonetic transcription. (This module does not translate English into Quenya.) See the [manual](manual.pdf) for more information.

The following line may be used to convert the whole document below to Tengwar in Quenya mode (other `show` rules might interfere with it):
```
#show: quetta.quenya
```

**Example:**

```
#import "@preview/quetta:0.1.0"

// Use the function `quenya` to write a small amount of text in Tengwar (Quenya mode)
#quetta.quenya[Namárië!]

// A `show` rule may be more convenient for larger contents; beware that it may interfere with other ones, though
#show: quetta.quenya

Namárië!

#h(1em) _Namárië!_

#h(1em) *Namárië!*
```

## Roadmap

* Number conversion: done
* Support for the Quenya mode: in progress
* Support for the mode of Gondor: backlog
* Support for the mode of Beleriand: backlog
* Support for the Black Speech: backlog

## How can I contribute?

I (the original author) am definitely not en expert in either Typst nor Tengwar. I could thus use some help in every area. I would especially welcome contributions or suggestions on the following: 

* Identify and resolve inefficiencies in the Typst code.
* Identify cases where the result differs from the expected one. (In particular, there are probably rules for writing in Tengwar that I either am not aware of or have not properly understood. Any advice on that is warmly welcome!)
* References on Tengar, Quenya, and Sidarin.
* Support for other Tengwar fonts. 
