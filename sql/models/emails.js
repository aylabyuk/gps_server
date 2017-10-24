/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('emails', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    address: {
      type: DataTypes.STRING(255),
      allowNull: false,
      unique: true,
      field: 'address'
    }
  }, {
    tableName: 'emails'
  });
};
