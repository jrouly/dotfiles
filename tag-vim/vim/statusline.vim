" Statusline configuration
set laststatus=2 " enable statusline
set statusline=  " clear the statusline

function! StatuslineEncoding()
  " file encoding if defined and not 'utf-8'
  let fenc = (strlen(&fenc) && &fenc !=? "utf-8") ? &fenc : ''

  " file format if defined and not 'unix'
  let ff = (strlen(&ff) && &ff !=? "unix") ? &ff : ''

  " all non-empty atoms, joined into a string
  let atoms = [fenc, ff]
  let atoms = filter(atoms, 'strlen(v:val)')
  let line = join(atoms, ', ')

  " if it's non-empty, return it
  return strlen(line) > 0 ? ' ['.line.']' : ''
endfunction

function! StatuslineGitBranch()
  let branch = FugitiveHead()
  return strlen(branch) ? '['.branch.'] ' : ''
endfunction

set statusline+=%{StatuslineGitBranch()}
set statusline+=%{expand('%')} " relative filename
set statusline+=\ %m%r%w " modified, readonly, preview
set statusline+=%= " switch to right side
set statusline+=\ %y " file type
set statusline+=%{StatuslineEncoding()} " file encoding
set statusline+=\ %3l:%-3c " cursor position
