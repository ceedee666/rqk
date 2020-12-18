using { de.fhaachen.rqk as rqk } from '../db/schema';

service ManageService @(requires: 'rqk-admin') {
    entity Reviews as projection on rqk.Reviews;
}
