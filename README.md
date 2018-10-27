# Issue - a tiny simple tool for solving pharo issues

Issue is a set of simple bash and pharo scripts for helping you by automating the setup of the working environment to solve issues.

## Installation
Create a folder for issue in your harddrive. Place `issue` and `issue-pharo.st` files in your new folder.
Setup your ISSUE_HOME global variable and source the command issue in your bashrc. 
 
Setup the 
Source `issue` at your bashrc.

```
$ cd ~/bin
$ mkdir issue
$ wget https://raw.githubusercontent.com/sbragagnolo/issue/master/issue -P .
$ wget https://raw.githubusercontent.com/sbragagnolo/issue/master/issue-pharo.st -P .
$ echo "export ISSUE_HOME=~/bin/issue"  >> .bashrc  # or .zshrc
$ echo "export ISSUE_PROTOCOL=ssh"  >> .bashrc  # or .zshrc
$ echo "export ISSUE_USER=<YOUR-GIT-HUB-USER>"  >> .bashrc  # or .zshrc
$ echo "source \$ISSUE_HOME/issue" >> .bashrc  # or .zshrc
$ source .bashrc
```

## Usage

Issue installs different aliases and functions in your system. 

### Get a new pharo image configured for an specific issue 

Step first to the directory where you want to download the image


```
$ cd [my-directory]
```

Then execute `issue` for downloading a new image

```
$ issue [issue number]
```
This will:  
	* download an image
	* checkout pharo from YOUR github account (you must have pharo forked)
	* repair the iceber repository creating a branch for the given issue
	* save the image as the issue title.



### Get a new pharo image  

Step first to the directory where you want to download the image

```
$ cd [my-directory]
```
Then execute `gph` for downloading a new image

```
$ gph [version | version+vm]
```


### Get a and open new pharo image 

Step first to the directory where you want to download the image. 

```
$ cd [my-directory]
```

Then execute `gpo` for downloading a new image, and opening afterwords.
```
$ gpo [version | version+vm]
```
### Aliases for opening existing pharo images

This two aliases are only for writing faster, but they are not really powerful.

Step first to the directory where your image is located. 

```
$ cd [my-directory]
```

Then execute `ph`.

```
$ ph 
```
or execute  `phl` for running in headless mode.

```
$ phl 
```


This two aliases are defined as

```
alias ph = ./pharo-ui Pharo.image 
```
```
alias phl = ./pharo Pharo.image 
```



