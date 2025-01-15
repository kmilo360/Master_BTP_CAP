using {salesOrders as projection} from '../service';

annotate projection.AvailabilitySet with {
    code @title : 'Code';
    name @title : 'Status';
};