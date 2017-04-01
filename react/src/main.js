import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import Plant from './components/Plant';

$(function() {
  if (window.location.pathname == "/") {
    ReactDOM.render(
      <Plant /> ,document.getElementById('main-app'));
  };
});
