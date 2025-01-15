const cds = require('@sap/cds');

class SalesOrders extends cds.ApplicationService {

    init () {

        // CREATE --> NEW
        // UPDATE --> UPDATE
        // DELETE --> DELETE

        const {OrdersSet} = this.entities;

        this.after('UPDATE', OrdersSet.drafts, async (req) =>{
            if (req.availability_code) {
                let code = req.availability_code;
                if (code === 'Acepted') {
                    await this.updateCriticality(req, OrdersSet, 3);
                } else if (code === 'Open') {
                    await this.updateCriticality(req, OrdersSet, 2);
                } else if (code === 'Rejected') {
                    await this.updateCriticality(req, OrdersSet, 1);
                }
            }
        });


        return super.init();
    }

    async updateCriticality (req, entity, criticality) {
        return await UPDATE.entity(entity.drafts).set({criticality: criticality}).where({ID: req.ID});
    }
}

module.exports = SalesOrders;