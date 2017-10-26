export default {
    Query: {
        singleAntenna: (parent, args, { models }) => {
            return models.Antenna.findById(args.id, { include: [{ all: true }] })
        },
        allAntenna: (parent, args, { models }) => {
            return models.Antenna.findAll({ include: [{ all: true }] })
        }
    },
    Antenna: {
        antennaModel(antenna) {
            return antenna.getAntennaModel()
        }
    },
    AntennaModel: {
        equipmentBrand(antenna) {
            return antenna.getEquipmentBrand()
        }
    }
}