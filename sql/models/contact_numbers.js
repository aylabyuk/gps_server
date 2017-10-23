/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('contactNumbers', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    number: {
      type: DataTypes.INTEGER(30),
      allowNull: false,
      field: 'number'
    },
    staffId: {
      type: DataTypes.INTEGER(30),
      allowNull: false,
      references: {
        model: 'people',
        key: 'id'
      },
      field: 'staff_id'
    }
  }, {
    tableName: 'contact_numbers'
  });
};
