import React from 'react';

const PlantItem = (props) => {

  return(
    <button onClick={props.handleClick} className="btn btn-primary" className= "squarebutton">
      <div className="column" >
        <div className="flip-container" ontouchstart="this.classList.toggle('hover');">
          <div className="flipper">

            <div className="front" >
              {props.profile_photo ?
                <a >
                  <img src={props.profile_photo}  />
                </a> :
                <p > Photo Unavailable  </p>
              }
            </div>

            <div className="back">

              <a href={`http://localhost:3000/plants/` + props.id}> {props.name} </a>
              <p>Planted on: {props.planted}</p>
              <p>Last watered on: {props.lastWaterDate}</p>
              <p>Cycle: {props.cycle}</p>

              <p>Expect to water me: {props.expect}</p>
              <p>Days you have left: {props.time_left}</p>

            </div>
          </div>
        </div>
      </div>
    </button>
  )
}

export default PlantItem;
