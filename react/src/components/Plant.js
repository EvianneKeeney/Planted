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
    let newPlant = this.state.plants.map((plant, index) => {
      return (
        <PlantItem
          id={plant.id}
          planted={plant.datetime}
          name={plant.name}
          cycle={plant.cycle}
        />
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
