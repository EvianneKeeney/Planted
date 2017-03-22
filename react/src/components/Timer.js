import React from 'react';

const Timer = (props) => {
  let countDownDate = new Date("Jan 5, 2018 15:37:25").getTime();
  let x = setInterval(function() {
    let now = new Date().getTime();
    let distance = countDownDate - now;
    let days = Math.floor(distance / (1000 * 60 * 60 * 24));
    let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    let seconds = Math.floor((distance % (1000 * 60)) / 1000);
  }, 1000);

  if (distance > 0) {
    return(
      <div className="timer"><p>days + "d " + hours + "h "+ minutes + "m " + seconds + "s "</p>  </div>
    )
  }

  else {
    clearInterval(x)
    return( <div className="timer"><p> "EXPIRED" </p></div>
    )
  }
}

export default Timer;
