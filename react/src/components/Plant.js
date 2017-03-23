import React, { Component } from 'react';
import PlantItem from './PlantItem';

class Plant extends Component {
  constructor(props) {
  super(props)
    this.state = {
      plants: [],
    }
    this.getData = this.getData.bind(this);
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
      let utc_date = new Date(planted_date).getTime()
      let cycle_in_ms = plant.cycle * 86400000
      let expected_to_water = utc_date + cycle_in_ms
      let date_expected_to_water = new Date(expected_to_water).toUTCString();
      let days_left_before_next_water = (expected_to_water - date)/86400000
      if (days_left_before_next_water < 0){
        plant.name = "Water Me"
      }
      return (
        <div>
          <PlantItem
            id={plant.id}
            planted={utc_date}
            name={plant.name}
            cycle={cycle_in_ms}
            present = {date}
            expect = {date_expected_to_water}
            time_left = {days_left_before_next_water}
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
