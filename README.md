# greple

Cheat better at Wordle!  This is a small dockerized container that lets you interactively whittle down the remaining possible words until you have 1 left

```bash
# pull the image from Docker Hub and run it interactively
~/greple$ docker run -it --rm jasonincanada/greple
```

Or if you prefer to clone the repo and build the image locally:

```bash
# clone this repo locally
~$ git clone https://github.com/jasonincanada/greple.git
~$ cd greple

# build docker image
~/greple$ docker build -t greple .

# run the image interactively and remove the container after exiting
~/greple$ docker run -it --rm greple
```


## Commands

| Command     | Description                                         |
| ----------- | --------------------------------------------------- |
| `has ...it` | The last two letters are `it`                       |
| `has a`     | There's an `a` somewhere in the word                |
| `no f r u`  | There's no `f`, `r`, and `u` in the word            |
| `no ...a.`  | There's no `a` in the second-last position          |
| `new`       | Start the session over again with a fresh word file |


## Example

Example session for Wordle 246 (20 Feb 2022):

```bash
~/greple$ docker run -it --rm greple
```

```
/greple 4570 > has ...it
admit
audit
await
... 21 other words elided
unfit
visit
vomit

/greple 27 > no f r u
admit
await
davit
debit
digit
habit
legit
licit
limit
pipit
plait
posit
split
tacit
visit
vomit

/greple 16 > has a
admit
await
davit
habit
plait
tacit

/greple 6 > no p e d l
await
habit
tacit

/greple 3 > has .a...
habit
tacit

/greple 2 > no h b
tacit

/greple 1 > new

/greple 4570 > exit

```

