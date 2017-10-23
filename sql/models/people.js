/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('people', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    firstName: {
      type: DataTypes.STRING(35),
      allowNull: false,
      field: 'first_name'
    },
    lastName: {
      type: DataTypes.STRING(35),
      allowNull: false,
      field: 'last_name'
    },
    nickName: {
      type: DataTypes.STRING(35),
      allowNull: false,
      field: 'nick_name'
    },
    officeLocationId: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'office_locations',
        key: 'id'
      },
      field: 'office_location_id'
    },
    birthdate: {
      type: DataTypes.DATE,
      allowNull: true,
      field: 'birthdate'
    },
    siteId: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'sites',
        key: 'id'
      },
      field: 'site_id'
    },
    positionId: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'positions',
        key: 'id'
      },
      field: 'position_id'
    },
    divisionId: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'divisions',
        key: 'id'
      },
      field: 'division_id'
    },
    profilePhoto: {
      type: "BLOB",
      allowNull: true,
      field: 'profile_photo'
    },
    personTypeId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'person_types',
        key: 'id'
      },
      field: 'person_type_id'
    },
    nonStaffPositionId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'non_staff_positions',
        key: 'id'
      },
      field: 'non_staff_position_id'
    }
  }, {
    tableName: 'people'
  });
};
