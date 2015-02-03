" Run tests
nnoremap <leader>t :call RunTestFile()<cr>
nnoremap <leader>T :call RunNearestTest()<cr>
nnoremap <leader>a :call RunAllTests()<cr>

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  call RunTests(@% . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

function! RunAllTests()
  call RunTests("spec")
endfunction

function! RspecCommand()
  return "bundle exec rspec"
endfunction

function! RunTests(...)
  let rspec_arguments = a:1
  exec ":!" . RspecCommand() . " --color " . rspec_arguments
endfunction
