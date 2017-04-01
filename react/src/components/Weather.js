import React, { Component } from 'react';
import WeatherItem from './WeatherItem';

class Weather extends Component {
  constructor(props) {
  super(props);
    this.state = {
      weather: [],
    };
    this.getData = this.getData.bind(this);
  }

  getData() {
    let url = "https://api.darksky.net/forecast/d058df138642ee1510e8fba90d13f2e/42.3601,-71.0589?lang=zh-tw&units=si";

    fetch(url, { mode: 'no-cors' } )
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} ($response.statusText)`,
          error = new Error(errorMessage);
        throw(error);
      }
  })
  .then(response => {
    return response.json();
  })
  .then(body => {
    this.setState({weather: body.results});
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getData();
  }

  render() {
    let newWeather = this.state.weather.map((weather, index) => {

      return (
        <WeatherItem
          key = {index}
          temp = {weather.temperature}
        />
      )
    });
    return(
      <div className="weather-index">
        {newWeather}
      </div>
    )
  }
};

export default Weather;
