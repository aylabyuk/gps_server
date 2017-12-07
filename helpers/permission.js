import { createResolver } from '../graphql-sequelize-crud-aylabyuk/src'

export const requiresAuth = createResolver((parent, args, context) => {
    if (!context.user || !context.user.id) {
        throw new Error('Not authenticated');
    }
});
  
export const requiresStaff = requiresAuth.createResolver((parent, args, context) => {
    if(!context.user.type === "STAFF") {
        throw new Error('Action not permitted for non-GPS staff')
    }
})
  
export const requiresAdmin = requiresAuth.createResolver(
    (parent, args, context) => {
        if (!context.user.type === "ADMIN") {
            throw new Error('Requires admin access');
        }
    },
);
  