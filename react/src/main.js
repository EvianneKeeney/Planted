import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import Plant from './components/Plant';
import Weather from './components/Weather';

$(function() {
  if (window.location.pathname == "/") {
    ReactDOM.render(
      <Plant /> ,document.getElementById('main-app'));
    ReactDOM.render(
      <Weather />, document.getElementById('weather-index'));
  };
});
