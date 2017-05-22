import React from 'react'
import Listing from 'listing'
import New from 'new'

export default class ListingContainer extends React.Component {
  render() {
		return (
			<div>
			 <Listing />

			 <New />
		 </div>
		)
  }
}