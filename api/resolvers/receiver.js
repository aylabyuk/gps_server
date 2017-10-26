export default {
    Query: {
        singleReceiver: (parent, args, { models }) => {
            return models.Receiver.findById(args.id, { include: [{ all: true }] })
        },
        allReceiver: (parent, args, { models }) => {
            return models.Receiver.findAll({ include: [{ all: true }] })
        }
    },
    Receiver: {
        receiverModel(receiver) {
            return receiver.getReceiverModel()
        }
    },
    ReceiverModel: {
        equipmentBrand(receiver) {
            return receiver.getEquipmentBrand()
        }
    }
}