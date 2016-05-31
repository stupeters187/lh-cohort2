var bankRoll = 100;
var playerWager;
var playerGuess;
var randomNum;

$(function() {
  $('#submitWager').on('click', function(ev){
    ev.preventDefault();
    playerWager = $('#wager').val();
    playerGuess = $('#number').val();
    game();
  });


function game(){
  randomNum = parseInt((Math.random) * 10) + 1;

  if (playerGuess === randomNum) {
    bankRoll += parseInt(playerWager);

    alert("Correct! Your new bankroll is " + bankRoll)
  
  } else if (Math.abs(playerGuess - randomNum) === 1) {

    alert("Close!")
  
  } else {

   bankRoll -= parseInt(playerWager);

    alert("Incorrect! Your new bankroll is " + bankRoll)

  }
  if (bankAmount <= 0) {
      alert("You are out of funds. Game Over!");
    }
}
});

