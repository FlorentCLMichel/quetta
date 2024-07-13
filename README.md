A simple module to write [tengwar](https://en.wikipedia.org/wiki/Tengwar) in [Typst](https://typst.app/).

## Requirements

- [Typst](https://github.com/typst/typst) version 1.11.1 or up
- The [Tengwar Annatar](https://www.dafont.com/tengwar-annatar.font) fonts version 1.10

## How to use? 

The main functionality of this module is provided by the function `quenya` taking content and converting all text in Quenya. The original text is used as a phonetic transcription. (This module does not translate English into Quenya.) In general, the base text should have no capital letters. Accented voyels (with `'`) represent long voyels.

The following line may be used to convert the whole document below to Tengwar in Quanya mode (other `show` rules might interfere with it):
```
#show: quenya
```

## Roadmap

* Number conversion: done
* Support for Quenya: in progress
* Support for Sindarin: backlog
* Support for the mode of Beleriand: backlog
* Support for the Black Speech: backlog

## How can I contribute?

I (the original author) is definitely not en expert in either Typst nor Tengwar. I could thus use some help in every area. I would especially welcome contributions or suggestions on the following: 

* Identify and resolve inefficiencies in the Typst code.
* Cases where the result differs from the expected one. (In particular, there are probably rules for writing in Tengwar that I either am not aware of or have not properly understood. Any advice on that is warmly welcome!)
* Support for other Tengwar fonts. 
