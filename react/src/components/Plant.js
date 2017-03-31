import React, { Component } from 'react';
import PlantItem from './PlantItem';

class Plant extends Component {
  constructor(props) {
  super(props);
    this.state = {
      plants: [],
      last_watered: null
    }
    this.handleClick = this.handleClick.bind(this)
    this.postWaterDate = this.postWaterDate.bind(this)
  }

  handleClick(id) {
    return () => {
    this.postWaterDate(id)}
  }

  postWaterDate(id){
    fetch(`https://plant-a-garden.herokuapp.com/api/v1/plants/${id}`, {method:"PATCH"})
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} ($response.statusText)`,
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => this.getData())

    .catch(error => console.error(`Error in fetch: ${error.message}`));

  }

  getData() {
    fetch('https://plant-a-garden.herokuapp.com/api/v1/plants.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} ($response.statusText)`,
            error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({plants: body});
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }
  componentDidMount() {
    this.getData();
  }

  render() {
    let plantList = this.state.plants.map((plant, index) => {

//      DATE PLANTED
      let planted_date = plant.created_at
      let date_planted = new Date(planted_date).toUTCString();

//      CYCLE
      let cycle_in_ms = plant.cycle * 86400000

//      DATE WATERED

      this.state.last_watered = plant.date_last_watered;
      let ms_date_last_watered = new Date(this.state.last_watered).getTime();

//      NEEDS WATERING = date watered + cycle
      let expected_to_water = ms_date_last_watered + cycle_in_ms
      let date_expected_to_water = new Date(expected_to_water).toUTCString();
      let date = new Date().getTime()
      let days_left_before_next_water = (expected_to_water - date)/86400000;
      let className
      if (days_left_before_next_water < 0){
        className = "expired"
        days_left_before_next_water = "Click to start cycle"
      }
      else {className = "reactWaterButton"}

      return (
          <PlantItem
            id={plant.id}
            key={plant.id}
            name={plant.name}
            planted={date_planted}
            cycle={plant.cycle}
            lastWaterDate = {plant.date_last_watered}
            expect = {date_expected_to_water}
            time_left = {days_left_before_next_water}
            profile_photo={plant.profile_photo.url}
            handleClick = {this.handleClick}
            className = {className}
          />
      )
    });
    return(
        <div className="plant-index">
          {plantList}
      </div>
    )
  }
};

export default Plant;
