const cds = require('@sap/cds')

module.exports = cds.service.impl (function (){
  this.after ('READ', 'Reviews', reviews => {
    reviews.forEach(review => {
        review.criticality = 0
        if(review.status == 2) review.criticality = 3
        if(review.status == 1 && review.rating <= 5) review.criticality = 2
        if(review.status == 1 && review.rating <= 3) review.criticality = 1
    })
  })
})