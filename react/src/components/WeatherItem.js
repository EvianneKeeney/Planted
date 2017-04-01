import React from 'react';

const WeatherItem = (props) => {

  return(
    <div className="weather-item">
      <p className="weather-info">{props.temp}</p>
    </div>
  )
}

export default WeatherItem;
