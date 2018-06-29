# clone-by-path
A small CLI tool to infer the clone URL by the current path and arguments.

## Setup

Linux, place the `cbp` file in `/usr/bin/` and make it executable with `sudo chmod +x /usr/bin/cbp`.

Windows, save `cbp.exe` somewhere and expose its location to your system PATH environment variable.

## Usage

The best way to understand how this works is to read the source code. It can be a little confusing otherwise.

```
cbp <repo> [args...]
```

CBP assumes that each repository URL is three parts. The domain, the author, and the repository name.
It is also assumed that these are delimited by a forward-slash (`/`). All arguments after the `<repo>` position are passed as arguments to the subsequent `git clone` command.

There are several cases that can be explained to help you understand how the command works.

 1. If `<repo>` contains no `/` and no whitespace.
     - The program will assume the argument is the repository name.
     - The program will look at the two parent directories to the current working directory.
     - The program will assume that `../` is the author's name.
     - The program will assume that `../../` is the domain.
     
 2. If `<repo>` contains one `/` and no whitespace.
     - The program will assume the argument is the author and repository name.
     - The program will assume that the first part of the argument before the `/` is the author.
     - The program will assume that after the `/` is the repo name.
     - The program will look at the parent directory to the current working directory.
     - The program will assume that `../` is the domain.
 
 3. If `<repo>` contains two `/`'s and no whitespace.
     - The program will assume that the argument is the domain, author, and repository name.
     - The program will assume that the text before the first `/` is the domain.
     - The program will assume that the text after the first `/` and before the second `/` is the author.
     - The program will assume that the text after the last `/` is the repository name.
