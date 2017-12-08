"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = y[op[0] & 2 ? "return" : op[0] ? "throw" : "next"]) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [0, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
var _ = require("lodash");
var camelcase = require("camelcase");
var pluralize = require("pluralize");
var graphql_1 = require("graphql");
var graphql_relay_1 = require("graphql-relay");
// tslint:disable-next-line:no-reserved-keywords
function mutationName(model, type) {
    switch (type) {
        case 'create': {
            return camelcase(type + "_" + getTableName(model));
        }
        case 'update': {
            return camelcase(type + "_" + pluralize.plural(getTableName(model)));
        }
        case 'updateOne': {
            return camelcase("update_" + getTableName(model));
        }
        case 'delete': {
            return camelcase(type + "_" + pluralize.plural(getTableName(model)));
        }
        case 'deleteOne': {
            return camelcase("delete_" + getTableName(model));
        }
        default: {
            console.warn('Unknown mutation type: ', type);
            return camelcase(type + "_" + getTableName(model));
        }
    }
}
exports.mutationName = mutationName;
function convertFieldsFromGlobalId(model, data) {
    // Fix Relay Global ID
    var rawAttributes = attributesForModel(model);
    _.each(Object.keys(data), function (key) {
        if (key === "clientMutationId") {
            return;
        }
        // Check if reference attribute
        var attr = rawAttributes[key];
        if (!attr) {
            return;
        }
        if (attr.references || attr.primaryKey) {
            var id = graphql_relay_1.fromGlobalId(data[key]).id;
            // Check if id is numeric.
            if (!_.isNaN(_.toNumber(id))) {
                data[key] = parseInt(id);
            }
            else {
                data[key] = id;
            }
        }
    });
}
exports.convertFieldsFromGlobalId = convertFieldsFromGlobalId;
function convertFieldsToGlobalId(model, fields) {
    // Fix Relay Global ID
    var rawAttributes = attributesForModel(model);
    _.each(Object.keys(rawAttributes), function (key) {
        if (key === "clientMutationId") {
            return;
        }
        // Check if reference attribute
        var attr = rawAttributes[key];
        if (!attr) {
            return;
        }
        if (attr.references) {
            // console.log(`Replacing ${getTableName(Model)}'s field ${k} with globalIdField.`);
            var modelName = attr.references.model;
            fields[key] = globalIdInputField(modelName);
        }
        else if (attr.primaryKey) {
            fields[key] = globalIdInputField(getTableName(model));
            // Make primaryKey optional (allowNull=True)
            fields[key].type = graphql_1.GraphQLID;
        }
    });
}
exports.convertFieldsToGlobalId = convertFieldsToGlobalId;
function connectionNameForAssociation(model, associationName) {
    return camelcase(getTableName(model) + "_" + associationName);
}
exports.connectionNameForAssociation = connectionNameForAssociation;
function attributesForModel(model) {
    return model.rawAttributes;
}
exports.attributesForModel = attributesForModel;
// tslint:disable-next-line:no-reserved-keywords
function queryName(model, type) {
    switch (type) {
        case 'findAll': {
            return camelcase(pluralize.plural(getTableName(model)));
        }
        case 'findById': {
            return camelcase(getTableName(model));
        }
        default: {
            console.warn('Unknown query type: ', type);
            return camelcase(type + "_" + getTableName(model));
        }
    }
}
exports.queryName = queryName;
function getTableName(model) {
    return model.name;
}
exports.getTableName = getTableName;
function globalIdInputField(modelName) {
    return {
        name: 'id',
        description: "The ID for " + modelName,
        type: new graphql_1.GraphQLNonNull(graphql_1.GraphQLID),
    };
}
exports.globalIdInputField = globalIdInputField;
function createNonNullList(modelType) {
    return new graphql_1.GraphQLNonNull(new graphql_1.GraphQLList(new graphql_1.GraphQLNonNull(modelType)));
}
exports.createNonNullList = createNonNullList;
function createNonNullListResolver(resolver) {
    // tslint:disable-next-line:max-func-args
    return function (source, args, context, info) {
        return Promise.resolve(resolver(source, args, context, info))
            .then(function (results) {
            if (results === null || results === undefined) {
                return [];
            }
            else if (Array.isArray(results)) {
                return results;
            }
            return [results];
        });
    };
}
exports.createNonNullListResolver = createNonNullListResolver;
function createResolver(resolver) {
    var _this = this;
    var baseResolver = resolver;
    baseResolver.createResolver = function (childResolver) {
        var newResolver = function (source, args, context, info) { return __awaiter(_this, void 0, void 0, function () {
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, resolver(source, args, context, info)];
                    case 1:
                        _a.sent();
                        return [2 /*return*/, childResolver(source, args, context, info)];
                }
            });
        }); };
        return createResolver(newResolver);
    };
    return baseResolver;
}
exports.createResolver = createResolver;
;
//# sourceMappingURL=utils.js.map