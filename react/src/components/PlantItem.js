import React from 'react';
import Timer from './Timer';

const PlantItem = (props) => {

  return(
    <div className="list-item text-center small-4 columns">
        <h4><a href={`http://localhost:3000/plants/` + props.id}>{props.name}</a></h4>
      <p>{props.cycle}</p>
    </div>
  )
}

export default PlantItem;
