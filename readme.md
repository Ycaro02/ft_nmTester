
---
## $${\color{orange}Procedure\space at\space the\space Root\space of\space Your\space FT\space NM\space Repository}$$
```
git clone https://github.com/Ycaro02/ft_nmTester.git
./ft_nmTester/call_tester.sh
```
## $${\color{red}Supported\space Arguments}$$

## $${\color{orange}Display\space help}$$
### $${\color{Cyan}No\space arguments\space given\space or\space first -h}$$
```
./ft_nmTester/call_tester.sh
./ft_nmTester/call_tester.sh -h
```

## $${\color{orange}Valgrind\space Option}$$
### Choose '1' to enable, leave empty, or use any other value to disable.
### $${\color{Cyan}Test:\space Invalid\space read\space write,\space conditional\space jump,\space memory\space leak,\space and\space fd\space leak}$$
```
./ft_nmTester/call_tester.sh 1
```
## $${\color{orange}Bonus\space Option}$$
### Choose '1' to enable, leave empty, or use any other value to disable.
### $${\color{Cyan}Test:\space -u,\space -g,\space -a,\space -p,\space -r\space}$$
```
./ft_nmTester/call_tester.sh x 1
```
## $${\color{orange}Verbose\space Option}$$
### Choose '1' to enable, leave empty, or use any other value to disable.
```
./ft_nmTester/call_tester.sh x x 1
```
Of course, all options can be combined like this:
```
./ft_nmTester/call_tester.sh 1 1 1
```
---
