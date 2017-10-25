export default {
    Query: {
        singleSite: (parent, args, { models }) => {
            return models.Site.findById(args.id, { include: [{ all: true }] })
        },
        allSite: (parent, args, { models }) => {
            return models.Site.findAll({ include: [{ all: true }] })
        }
    },
    Site: {
        surveyType(site) {
            return site.getSurveyType()            
        },
        marker(site) {
            return site.getMarker()
        }
    }
}