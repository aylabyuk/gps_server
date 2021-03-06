/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('positions', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    name: {
      type: DataTypes.STRING(100),
      allowNull: false,
      field: 'name'
    }
  }, {
    tableName: 'positions'
  });
};
