SortHeaders
===========

Intro
-----
Sortheaders is a Vim plugin that sorts the header files includes in a source file. Sorted header files look aesthetically pleasant and conform to coding conventions. You don't need this plugin if you always insert new header file includes chronologically in source files, but great programmers don't do it anyways!

Installation
------------
* Use pathogen?  
  Clone it from Git.
* Old School?  
  Copy the sortheaders.vim file to your .vim/plugin directory.

Usage
-----
Add a mapping to your ~/.vimrc file (that suits your fingers & personality):  
  `nnoremap <F9> :SortHeaders<CR>`

Make sure that filetype detection is ON. Following lines in .vimrc will help:  
  `:filetype on`

Use the SortHeaders command in normal mode or the mapped key (if you configured one) and your header includes will be sorted in-place. SortHeaders respect the grouping of various header includes, so if there is a newline between two groups of header includes, the grouping will be preserved.

Yes, it's that simple!

Author
------
Wishlists?
Need to hunt down the culprit if the plugin is too buggy?

**Ashish Anand**
ashishb4u on Google's free mail service

Version Changelog
-----------------
**0.1.0**
Debut.
Supports C/C++ only for now, more to add.

