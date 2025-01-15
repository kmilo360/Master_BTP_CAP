using {com.salesorders as entities} from '../db/schema';

service salesOrders {
    entity OrdersSet       as projection on entities.Orders;
    entity ItemsSet        as projection on entities.Items;
    entity AvailabilitySet as projection on entities.Availability;
};
