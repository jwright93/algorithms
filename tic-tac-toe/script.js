$(document).ready(() => {
  let game = new Game;
})


class Game {

  constructor() {
    this.player1 = 'player1';
    this.player2 = 'player2';
    this.board = new Board;
    this.currentPlayer = this.player1;
    this.handleClick();
  }

  handleClick() {
    $(".tile").on('click',(e) => {
      const id = e.currentTarget.id.split('-');
      const row = id[0];
      const col = id[1];
      if (this.board.markPosition(this.currentPlayer, row, col)) {
        if (this.currentPlayer === this.player1) {
          this.currentPlayer = this.player2;
        } else {
          this.currentPlayer = this.player1
        }
      }
    });
  }
}

class Board {
  constructor() {
    this.grid = this.buildGrid();
    this.count = 0;
  }

  buildGrid() {
    
    let grid = new Array(3);

    for (let i = 0; i < grid.length; i++) {
      grid[i] = new Array(3);
    }
    return grid;
  }

  markPosition(player, row, col) {
    if (this.grid[row][col] !== undefined) return false
    this.grid[row][col] = player;
    this.count++;
    $(`#${row}-${col}`).addClass(`${player}`)
    if (this.checkWinner(player, row, col)) {
      this.gameOver(player);
    } else {
      if (this.count === 9) this.gameOver('No one');
    }
    return true;
  }

  checkWinner(player, row, col) {

    // check row
    let rowWinner = true;
    let colWinner = true;
    let leftDiagonal = true;
    let rightDiagonal = true;

    for (var i = 0; i < this.grid.length; i++) {
      if (this.grid[row][i] !== player) {
        rowWinner = false;
        break;
      }
    }

    if (rowWinner === true) return true
    // check column

    for (var i = 0; i < this.grid.length; i++) {
      if (this.grid[i][col] !== player) {
        colWinner = false;
        break;
      }
    }

    if (colWinner === true) return true

    // check left diagonal

    for (var i = 0; i < this.grid.length; i++) {
      if (this.grid[i][i] !== player) {
        leftDiagonal = false;
        break;
      }
    }

    if (leftDiagonal === true) return true;
    // check right diagonal
    let j = this.grid.length - 1
    for (var i = 0; i < this.grid.length; i++) {
      if (this.grid[i][j] !== player) {
        rightDiagonal = false;
        break;
      }
      j--
    }

    if (rightDiagonal === true) return true;

    return false;
  }

  gameOver(player) {
    alert(`${player} has one the game!`);
    this.grid = this.buildGrid();
    $('.tile').removeClass('player1 player2');
  }
}
