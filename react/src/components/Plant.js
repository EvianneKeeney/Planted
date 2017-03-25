import React, { Component } from 'react';
import PlantItem from './PlantItem';

class Plant extends Component {
  constructor(props) {
  super(props);
    this.state = {
      plants: [],
      last_watered : null
    }
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick(){
        this.setState( {last_watered: new Date().getTime()} )
  }


  getData() {
    fetch('http://localhost:3000/api/v1/plants.json')
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
    let date = new Date().getTime()
    let newPlant = this.state.plants.map((plant, index) => {

      let planted_date = plant.created_at
      let date_planted_date = new Date(planted_date).toUTCString();

      let last_watered = this.state.last_watered
      let date_last_watered_to_utc = new Date(last_watered).toUTCString();
      if(this.state.last_watered !== null){
        plant.date_last_watered = date_last_watered_to_utc;
      }
      let plant_last_watered_on = plant.date_last_watered

      let cycle_in_ms = plant.cycle * 86400000
      let expected_to_water = last_watered + cycle_in_ms
      let date_expected_to_water = new Date(expected_to_water).toUTCString();
      let utc_date = new Date(planted_date).getTime()

      let days_left_before_next_water = (expected_to_water - date)/86400000;
      if (days_left_before_next_water < 0){
        plant.name = "Water Me"
      }
      return (
        <div>
          <PlantItem
            id={plant.id}
            planted={date_planted_date}
            name={plant.name}
            cycle={cycle_in_ms}
            lastWaterDate = {plant_last_watered_on}
            expect = {date_expected_to_water}
            time_left = {days_left_before_next_water}
            profile_photo={plant.profile_photo.url}
            handleClick = {() => this.handleClick()}
          />
        </div>
      )
    });

    return(
      <div className="plant-index">
        {newPlant}
      </div>
    )
  }
};

export default Plant;
