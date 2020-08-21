# jdlv

An implementation of **Game of Life** in **Ruby**.

From [Wikipedia](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life):

The **Game of Life** (**Juego de la vida** in spanish), also known simply as **Life**, is a
[cellular automaton](https://en.wikipedia.org/wiki/Cellular_automaton) devised by the British
mathematician [John Horton Conway](https://en.wikipedia.org/wiki/John_Horton_Conway) in 1970.
It is a [zero-player game](https://en.wikipedia.org/wiki/Zero-player_game), meaning that its
evolution is determined by its initial state, requiring no further input. One interacts with
the Game of Life by creating an initial configuration and observing how it evolves.

## Usage

- Clone this repository:

      $ git clone https://github.com/nihilismus/jdlv

- Set up the project with `./bin/setup` or `make setup`

- Execute `bundle exec exe/jdlv <Position> <Pattern> <Ticks>` to run the game, where:

  - `<Position>` is an string of numbers separated by a comma, to stablish the last position
    available in the game and at the same time the area of the grid.
  - `<Pattern>` is an string of `<Position>` separated by `|`., to stablish the initial pattern
    of the game.
  - `<Ticks>` is a number, to stablish the number of *tick* events to see printed.

  - Example:

        $ bundle exec exe/jdlv "10,10" "2,2|3,2|4,2|4,3|3,4" 5
        Tick: 1, Pattern: 3,2|4,2|4,3|2,3|3,1
        Tick: 2, Pattern: 4,2|4,3|3,1|2,2|4,1
        Tick: 3, Pattern: 4,2|3,1|4,1|3,3|5,2
        Tick: 4, Pattern: 3,1|4,1|5,2|4,3|5,1
        Tick: 5, Pattern: 4,1|5,2|5,1|3,2|4,0

## Desing

Based on a *Grid* of enough area, an initial *Pattern* of *occupied positions* and a number of
*tick events*, the main idea is to produce a *tick event* on the *Grid* so it can analise its
current state to get new generations at the end of each *tick event*.

## Implementation

- `Grid` class: keeps track of the *occupied positions* and its *cells* with a *Hash* of
  `Position` as key and a `Cell` as value.
- `Position` class: as a value to identify an *occupied* position in the grid.
- `Cell` class: keeps track of its current and next states.

The `Grid` class relies on two modules to *load* and *locate* positions but implements the
logic to identify positions to be occupied at the end of a *tick*.

As part of an **optimization**, there is no need to keep track of *free positions* in the grid,
since part of the logic is to *"revive"* or *"occupy"* relevant positions which are just the
neighbours cells of current occupied positions, 

## Tools

- `ruby` & `bundle` for setup.
- `rspec` for testing.
- `rubocop` for linting and formatting.
- `rubycritic` for best-practices.
- `pry` for interactive evaluation and development.
- `make` for running tasks (alternative to `rake`).

## Challenges

I found some dificulties:

- Understand the behaviour at runtime of the game.
- Keep in mind the performance penalties in operations such as finding and comparition.
- Do enough refactoring to amend any problem detected by `rubocop` and `rubycritic`.
- Test the game behaviour, wich is a *"living"* object during its execution.

## Improvements

In my opinion:

- The desing is quite *open* to interpretation for a command line game. Maybe separate the
  logic of the game as a *gem* and create another one to implement the command line interface.
- Being a game, there are much more things to **spec**ify in the game. The only test of the *tick*
  event is not enough.
- The *CLI* could be better, in options and output.
