# DocRipper
[![Gem Version](https://badge.fury.io/rb/doc_ripper.svg)](http://badge.fury.io/rb/doc_ripper)

Grab the text from common document formats with 1 command. DocRipper is an extremely lightweight Ruby wrapper that can be used to parse text contents from common file formats (currently .doc, .docx and .pdf) without the need for a large number of dependencies like an OCR library or OpenOffice/LibreOffice.

For simple parsing, you'll likely see a large performance improvement with DocRipper over solutions that rely on OpenOffice/LibreOffice for .doc/.docx conversion.

Need OCR support or in-image text parsing? Take a look at [Docsplit](https://github.com/documentcloud/docsplit).

## Quickstart

```
  gem install doc_ripper
```
### Specify a file path of a file

```
  require 'doc_ripper'

  DocRipper::rip('/path/to/file')
```

#### If the file cannot be read, nil will be returned.

```
  DocRipper::rip('/path/to/missing/file')
  => nil
```

#### Want to raise an exception? Use #rip!
\#rip! will raise an exception if rip returns nil or the file type isn't supported

```
  # invalid file type
  DocRipper::rip!('/path/to/invalide/file.type')
  => DocRipper::UnsupportedFileType

  # missing file
  DocRipper::rip!('/path/to/missing/file.doc')
  => DocRipper::FileNotFound
```



## Dependencies
 - Ruby version >= 1.9.2
 - [Poppler-utils/(pdftotext)](http://poppler.freedesktop.org/) (PDF)
 - [Antiword](http://www.winfield.demon.nl/) (docx) more info: http://linux.die.net/man/1/antiword
