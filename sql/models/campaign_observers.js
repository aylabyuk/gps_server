/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('campaignObservers', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    campaignLogsheetId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'campaign_logsheets',
        key: 'id'
      },
      field: 'campaign_logsheetId'
    },
    staffId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'people',
        key: 'id'
      },
      field: 'staffId'
    }
  }, {
    tableName: 'campaign_observers'
  });
};
