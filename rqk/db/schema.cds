using { cuid, managed } from '@sap/cds/common';

namespace de.fhaachen.rqk;

entity Reviews : cuid, managed {
  rating : Integer;
  text   : String(500);
  status : Integer enum {
              initial = 0;
              submitted = 1;
              completed = 2;
           };
  orderNumber : Integer;
  orderDate : Date;
}