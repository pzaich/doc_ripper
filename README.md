DocRipper is an extremely lightweight Ruby wrapper that can be used to parse text contents from common file formats (currently .doc, .docx and .pdf) without the need for a large number of dependencies like an OCR library or OpenOffice/LibreOffice.

For simple parsing, you'll likely see a large performance improvement with DocRipper over solutions that rely on OpenOffice/LibreOffice for .doc/.docx conversion. I found

Need OCR support or in-image text parsing? Take a look at [Docsplit](https://github.com/documentcloud/docsplit).

## Quickstart

  ```
    gem install doc_ripper
  ```
  ### Specify a file to parse

  ```
    DocRipper::TextRipper.new('/path/to/file')
  ```

  ### Return the file's text
  ```
    dr = DocRipper::TextRipper.new('/path/to/file')
    dr.text
    => "Document's text"
  ```

  If the file cannot be read, nil will be returned.

  ```
    dr = DocRipper::TextRipper.new('/path/to/missing/file')
    dr.text
    => nil
  ```


## Dependencies
 - Ruby version >= 1.9.2
 - [Poppler-utils/(pdftotext)](http://poppler.freedesktop.org/) (PDF)
 - [Antiword](http://www.winfield.demon.nl/) (docx) more info: http://linux.die.net/man/1/antiword
