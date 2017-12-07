/// <reference path="../../../graphql-sequelize-crud/src/@types/graphql-sequelize/index.d.ts" />
/// <reference types="sequelize" />
import { GraphQLSchema } from 'graphql';
import { Sequelize } from "sequelize";
export declare function getSchema(sequelize: Sequelize): GraphQLSchema;
