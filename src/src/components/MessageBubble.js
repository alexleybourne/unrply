import React from 'react'
import { resolvePreset } from '@babel/core'

export default function MessageBubble(props) {

  var largeEmoji = () => {
    let maxEmoji
    if(props.emojis.length > 0)
      maxEmoji = props.emojis.reduce((acc, val) => {
        if(val.value > acc.value)
          acc = val
        return acc
      })
    if(maxEmoji && maxEmoji.value >= props.emojiLimit)
      return maxEmoji
  }

  var otherEmojis = () => {
    let largestEmoji = largeEmoji()
    if(props.emojis.length > 0)
      return props.emojis.filter(el => el !== largestEmoji)
  }

  return (
    <div
      className={`messageBubbleContainer${props.emojis.length > 0 ? ' hasEmojis' : ''}`}
    >
      <div className='messageRating'>
        <div className='rating' ><i class='fas fa-sort-up'></i></div>
        <div className='rating' ><i class='fas fa-caret-down'></i></div>
      </div>
      <div className='messageBubbleEmojis' >
        <div
          className={
            `messageBubble${props.first ? ' first' : ''}${props.last ? ' last' : ''}${largeEmoji() ? ' hasImage' : ''}`
          }
        >
          <span className='content' >{props.content}</span>
          {largeEmoji() && (
            <div className='commonEmojiWrapper' >
              <img src={largeEmoji().content} className='commonEmoji' />
              <span className='emojiCount' >
                {largeEmoji().value}
              </span>
            </div>
          )}
        </div>
        <div className='emojiList'>
          {otherEmojis() && otherEmojis().map(emoji => (
            <div className='emojiIcon' >
              {<img src={emoji.content} />}
              <span>{emoji.value}</span>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}