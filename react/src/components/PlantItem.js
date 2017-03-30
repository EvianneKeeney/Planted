import React from 'react';

const PlantItem = (props) => {

    return(
        <div className="flip-container"  onClick={props.handleClick(props.id)} onTouchStart="this.classList.toggle('hover');">
          <div className="flipper" onClick="this.classList.toggle('flipped')">

            <div className="front" >
              {props.profile_photo ?
                <a >
                  <img src={props.profile_photo}  />
                </a> :
                <p > Photo Unavailable  </p>
              }
            </div>

            <div className="back">

            <button className={props.className} onClick={props.handleClick(props.id)}>
            <a href={`http://localhost:3000/plants/` + props.id}> {props.name} </a>
            <p>Last watered on: {props.lastWaterDate}</p>
              <p>Planted on: {props.planted}</p>
              <p>Cycle: {props.cycle}</p>

              <p>Expect to water me: {props.expect}</p>
              <p>Days you have left: {props.time_left}</p>
              </button>
            </div>
          </div>
        </div>

      )
    }


export default PlantItem;
