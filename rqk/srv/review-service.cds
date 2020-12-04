using { de.fhaachen.rqk as rqk } from '../db/schema';

service ReviewService {
    @readonly entity Reviews as projection on rqk.Reviews
      excluding { createdBy, createdAt, modifiedBy, modifiedAt };

    action submitReview(reviewID: Reviews:ID, rating: Integer, review: String(500));
}