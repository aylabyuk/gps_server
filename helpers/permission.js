import { createResolver } from '../graphql-sequelize-crud-aylabyuk/src'

export const requiresAuth = createResolver((source, args, context, info) => {
    if (!context.user || !context.user.id) {
        throw new Error('Not authenticated');
    }
});
  
export const requiresStaff = requiresAuth.createResolver((source, args, context, info) => {
    if(!context.user.access_level_id === 2) {
        throw new Error('Action not permitted for non-GPS staff')
    }
})
  
export const requiresAdmin = requiresAuth.createResolver(
    (source, args, context, info) => {
        if (!context.user.access_level_id === 1) {
            throw new Error('Requires admin access');
        }
    },
);
  