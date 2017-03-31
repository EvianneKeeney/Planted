import React from 'react';

const PlantItem = (props) => {

    return(
        <div className={props.shadowName}  onClick={props.handleClick(props.id)} >
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
            <button className={props.className} onClick={props.handleClick(props.id)}>
            <a href={`http://localhost:3000/plants/` + props.id}> {props.name} </a>
              <p>Days you have left: </p>
              <p>{props.time_left}</p>

              </button>
            </div>
          </div>
        </div>

      )
    }


export default PlantItem;
