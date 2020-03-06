import React from 'react'
import MessageBubble from './MessageBubble'
import '../stylesheets/MessageBlock.scss'

export default function MessageBlock(props) {

  return (
    <div className={`messageBlockContainer${props.self ? ' self' : ' other'}`} >
      {!props.self && <img className='profilePic' src='http://lorempixel.com/50/50' />}
      <div className={`messageBlock${props.self ? ' self' : ' other'}`} >
      <div className='messageBlockName' >{props.self ? 'Me' : props.user.name}</div>
        {props.messages.map((messageData, i, arr) => (
          <MessageBubble key={i} first={i === 0} last={i === arr.length-1} {...messageData} />
        ))}
      </div>
      {props.self && <img className='profilePic' src='http://lorempixel.com/50/50' />}
    </div>
  )
}
