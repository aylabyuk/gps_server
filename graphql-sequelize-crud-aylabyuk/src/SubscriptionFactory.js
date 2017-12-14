"use strict";
// tslint:disable-next-line:no-reference
/// <reference path="./@types/graphql-sequelize/index.d.ts" />
Object.defineProperty(exports, "__esModule", { value: true });
var utils_1 = require("./utils");
var utils_2 = require("./utils");
var SubscriptionFactory = /** @class */ (function () {
    function SubscriptionFactory(config) {
        this.pubsub = config.pubsub;
    }
    SubscriptionFactory.prototype.created = function (_a) {
        var _this = this;
        var subscriptions = _a.subscriptions, model = _a.model, modelType = _a.modelType;
        var newSubscriptionName = utils_1.subscriptionName(model, 'created');
        subscriptions[newSubscriptionName] = {
            type: modelType,
            resolve: function (payload) {
                return payload;
            },
            subscribe: function () { return _this.pubsub.asyncIterator(newSubscriptionName); }
        };
    };
    SubscriptionFactory.prototype.updated = function (_a) {
        var _this = this;
        var subscriptions = _a.subscriptions, model = _a.model, modelType = _a.modelType;
        var newSubscriptionName = utils_1.subscriptionName(model, 'updated');
        subscriptions[newSubscriptionName] = {
            type: utils_2.createNonNullList(modelType),
            resolve: function (payload) {
                return payload;
            },
            subscribe: function () { return _this.pubsub.asyncIterator(newSubscriptionName); }
        };
    };
    SubscriptionFactory.prototype.deleted = function (_a) {
        var _this = this;
        var subscriptions = _a.subscriptions, model = _a.model, modelType = _a.modelType;
        var newSubscriptionName = utils_1.subscriptionName(model, 'deleted');
        subscriptions[newSubscriptionName] = {
            type: utils_2.createNonNullList(modelType),
            subscribe: function () { return _this.pubsub.asyncIterator(newSubscriptionName); }
        };
    };
    SubscriptionFactory.prototype.updatedOne = function (_a) {
        var _this = this;
        var subscriptions = _a.subscriptions, model = _a.model, modelType = _a.modelType;
        var newSubscriptionName = utils_1.subscriptionName(model, 'updatedOne');
        subscriptions[newSubscriptionName] = {
            type: modelType,
            subscribe: function () { return _this.pubsub.asyncIterator(newSubscriptionName); }
        };
    };
    SubscriptionFactory.prototype.deletedOne = function (_a) {
        var _this = this;
        var subscriptions = _a.subscriptions, model = _a.model, modelType = _a.modelType;
        var newSubscriptionName = utils_1.subscriptionName(model, 'updatedOne');
        subscriptions[newSubscriptionName] = {
            type: modelType,
            subscribe: function () { return _this.pubsub.asyncIterator(newSubscriptionName); }
        };
    };
    return SubscriptionFactory;
}());
exports.SubscriptionFactory = SubscriptionFactory;
//# sourceMappingURL=SubscriptionFactory.js.map