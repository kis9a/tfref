# tfref

Open terraform documentation easily.

## Installation

```
sudo curl -s https://raw.githubusercontent.com/kis9a/tfref/main/tfref >/usr/local/bin/tfref
chmod +x /usr/local/bin/tfref
```

## Usage

```
USAGE:
  tfref [options] <resource|data>

OPTIONS:
  -h: help
  -t: test: bash tfref_test
  -f: open_read_file_line_up: tfref -f $file_path $line

SUPPORTED TYPE:
  aws, datadog, data_datadog, data_aws, onepassword, data_onepassword

EXAMPLE:
  tfref aws_instance
  tfref datadog_monitor
  tfref data.aws_instance
  tfref data.datadog_api_key
  tfref -f "./ec2.tf" 20
```

### vim

```bash
function! s:tfref()
  let fullpath=expand('%:p')
  let cursorline=line('.')
  let cmd = "!tfref -f \"" . fullpath . "\" " . cursorline
  silent execute cmd
endfunction

nnoremap <silent> <Leader>tf :call <SID>tfref()<CR>
```

## Devtools

**Style guide**

> Indentation
> Indent 2 spaces. No tabs. Use blank lines between blocks to improve readability. Indentation is two spaces. Whatever you do, don’t use tabs. For existing files, stay faithful to the existing indentation.
> <https://google.github.io/styleguide/shellguide.html>

Linter: [GitHub - koalaman/shellcheck](https://github.com/koalaman/shellcheck)  
Formatter: [GitHub - mvdan/sh](https://github.com/mvdan/sh)
