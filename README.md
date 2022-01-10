# tfref

Open terreaform reference easily.

### install

```bash
sudo curl -s https://raw.githubusercontent.com/kis9a/tfref/main/tfref > /usr/local/bin/tfref
```

### usage

```
USAGE:
  tfref [options] <resource|data>

OPTIONS:
  -h: help
  -f: open_read_file_line_up: tfref -e $file_path $line

SUPPORTED TYPE:
  aws, datadog, data_datadog, data_aws

EXAMPLE:
  tfref aws_instance
  tfref datadog_monitor
  tfref data.aws_instance
  tfref data.datadog_api_key
  tfref -e "./ec2.tf" 20
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

### dev

linter: https://github.com/koalaman/shellcheck  
formatter: https://github.com/mvdan/sh

### test

```bash
git clone https://github.com/kis9a/tfref
cd tfref
./tfref -t
```
