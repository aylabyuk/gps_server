/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('continuousObservers', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    continuousLogsheetId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'continuous_logsheets',
        key: 'id'
      },
      field: 'continuous_logsheetId'
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
    tableName: 'continuous_observers'
  });
};
