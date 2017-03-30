import React from 'react';

const PlantItem = (props) => {

  return(

        <div className="flip-container" ontouchstart="this.classList.toggle('hover');">
          <div className="flipper" onclick="this.classList.toggle('flipped')">

            <div className="front" >
              {props.profile_photo ?
                <a >
                  <img src={props.profile_photo}  />
                </a> :
                <p > Photo Unavailable  </p>
              }
            </div>

            <div className="back">

            <button onClick={props.handleClick}>
            <p>Last watered on: {props.lastWaterDate}</p>

            </button>
              <a href={`http://localhost:3000/plants/` + props.id}> {props.name} </a>
              <p>Planted on: {props.planted}</p>
              <p>Cycle: {props.cycle}</p>

              <p>Expect to water me: {props.expect}</p>
              <p>Days you have left: {props.time_left}</p>
            </div>
          </div>
        </div>

  )
}

export default PlantItem;
