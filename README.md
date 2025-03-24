# odin-tic-tac-toe

This is a simple Tic Tac Toe game implemented in Ruby, built as part of [The Odin Project](https://www.theodinproject.com/) curriculum.

## Features

- Play against a human or computer opponent.
- Console-based gameplay.
- Win/draw detection.

## How to Run

1.  Clone the repository: `git clone <repository_url>`
2.  Navigate to the directory: `cd odin-tic-tac-toe`
3.  Run the game: `ruby main.rb`

## RSpec Tests

- Run tests with: `rspec spec/tic_tac_toe_spec.rb` (after installing RSpec: `gem install rspec`)

## Folder Structure

```
odin-tic-tac-toe/
├── lib/
│   ├── computer_player.rb
│   ├── game.rb
│   └── player.rb
├── main.rb
└── spec/
└── tic_tac_toe_spec.rb
```

## Files

- `lib/player.rb`: Contains the `Player` class.
- `lib/computer_player.rb`: Contains the `ComputerPlayer` class.
- `lib/game.rb`: Contains the `Game` class.
- `main.rb`: The main execution file that starts the game.
- `spec/tic_tac_toe_spec.rb`: RSpec tests.
