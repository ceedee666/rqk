const cds = require('@sap/cds')

module.exports = cds.service.impl (function (){
  this.on ('submitReview', async req => {
    const {reviewID,rating, review} = req.data
    const {Reviews} = cds.entities
    const n = await UPDATE (Reviews, reviewID)
        .set({
            rating: rating,
            text: review,
            status: 1 
        })
        .where({
            status: {'=': 0}
        })
    n > 0 || req.error (409,`Review ${reviewID} could not be updated.`)
  }),

  this.before ('READ', 'Reviews', req => {
    const [ID] = req.params
    if (ID === undefined) req.error(400, 'A reviewID needs to be provided --->.')
  }),

  this.after ('READ', 'Reviews', (reviews, req) => {
    reviews.forEach(review => {
        if(review.status > 0) req.error(400, `The review ${review.ID} has already been submitted.`)
    })
  })
})
