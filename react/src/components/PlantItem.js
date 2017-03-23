import React from 'react';
import Timer from './Timer'

const PlantItem = (props) => {
  return(
    <div className="list-item text-center small-4 columns">
      <h4><a href={`http://localhost:3000/plants/` + props.id}>{props.name}</a></h4>
      <p>Milliseconds Between Watering: {props.cycle}</p>
      <p>Last watered: {props.planted}</p>
      <p>Expect to water me: {props.expect}</p>
      <p>Present time: {props.present}</p>
      <p>Days you have left: {props.time_left}</p>

      <Timer/>
    </div>
  )
}

export default PlantItem;
