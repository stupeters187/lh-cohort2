'use strict';


$(function(){
  var PLAYER_BANK = 100;
  var bankAmount = 100;
  
  $('#submitWager').on('click', function(ev) {
    ev.preventDefault();

    var playerWager = $('#wager').val();
    var playerGuess = $('#number').val();

    if (playerWager > bankAmount) {
      alert("You don't have enough funds to make that wager.")
      return false
    }

    var results = game(playerGuess, playerWager, bankAmount);
    console.log(results);
    bankAmount = results.amount;

    $('#bankAmount').text(bankAmount);
    alert(results.message);
  
    if (bankAmount <= 0) {
      alert("You are out of funds. Game Over!");
      location.reload();

    } 
  });

  $('.reload').click(function(){
    location.reload();
  })  
});


function game(playerGuess, playerWager, initialBank) {
  var randomNum = parseInt(Math.random() * 10) + 1;

  if (parseInt(playerGuess) === randomNum) {

    var amount = initialBank + parseInt(playerWager);

    return {
      amount: amount,
      message: `Correct! Your new balance is ${amount}`
    };

  } else if (Math.abs(playerGuess - randomNum) === 1) {

    return {
      amount: initialBank,
      message: `Close`
    };

  } else {

    var bankAmount = initialBank - playerWager;
    return {
      amount: bankAmount,
      message: `Incorrect, your new balace is ${bankAmount}`}
    }

  }

