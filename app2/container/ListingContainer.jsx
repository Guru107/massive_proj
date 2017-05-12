import React from 'react'
import Listing from 'listing'
export default class ListingContainer extends React.Component {
  render() {
	return (
	 	<div style={{textAlign: 'center'}}>
			<h1>Header</h1>
			<Listing />
	  </div>
		)
  }
}