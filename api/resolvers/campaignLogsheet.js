export default {
    Query: {
        singleCampaignLogsheet: (parent, args, { models }) => {
            return models.CampaignLogsheet.findById(args.id, { include: [{ all: true }] })
        },
        allCampaignLogsheet: (parent, args, { models }) => {
            return models.CampaignLogsheet.findAll({ include: [{ all: true }] })
        }
    },
    CampaignLogsheet: {
        observers(campaignLogsheet) {
            return campaignLogsheet.getPeople()
        }
    }
}