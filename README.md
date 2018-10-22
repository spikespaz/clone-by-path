# clone-by-path
A small CLI tool to infer the clone URL by the current path and arguments.

## Setup

There are now two versions. One is in Python, one is in D. If you're a static-typed guy, follow the instructions below. But if you have Python, just run `pip install cbp` and continue to the next section, [Usage](#usage).

Linux, place the `cbp` file in `/usr/bin/` and make it executable with `sudo chmod +x /usr/bin/cbp`.

Windows, save `cbp.exe` somewhere and expose its location to your system PATH environment variable.

## Usage

The best way to understand how this works is to read the source code. It can be a little confusing otherwise.

```
cbp <repo> [args...]
```

CBP assumes that each repository URL is three parts. The domain, the author, and the repository name.
It is also assumed that these are delimited by a forward-slash (`/`). All arguments after the `<repo>` position are passed as arguments to the subsequent `git clone` command.

There are several examples to help you understand how the command works.
Pay attention to the current working directory, the generated clone command, and the directory to clone into.

```
spikespaz@jacob-linux:~$ cbp github.com/spikespaz/clone-by-path
> git clone https://github.com/spikespaz/clone-by-path.git github.com/spikespaz/clone-by-path
Cloning into 'github.com/spikespaz/clone-by-path'...
...
```

```
spikespaz@jacob-windows:~/github.com$ cbp spikespaz/clone-by-path
> git clone https://github.com/spikespaz/clone-by-path.git spikespaz/clone-by-path
Cloning into 'spikespaz/clone-by-path'...
...
```

```
spikespaz@jacob-windows:~/github.com/spikespaz$ cbp clone-by-path
> git clone https://github.com/spikespaz/clone-by-path.git clone-by-path
Cloning into 'clone-by-path'...
...
```

```
spikespaz@jacob-windows:~/github.com/spikespaz/clone-by-path$ cbp .
> git clone https://github.com/spikespaz/clone-by-path.git .
Cloning into '.'...
...
```

## Donations

If you would like to show appreciation for my work, I would gladly accept a small donation!

I will accept donations through PayPal.Me, Buy Me a Coffee, or Patreon.

[![Buy Me a Coffee](https://i.imgur.com/fN422E7.png)](https://buymeacoffee.com/spikespaz)
[![PayPal.Me](https://i.imgur.com/JWkunGi.png)](https://paypal.me/spikespaz)
[![Patreon](https://i.imgur.com/K05b2RO.png)](https://patreon.com/spikespaz)
