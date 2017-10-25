const createResolver = (resolver) => {
const baseResolver = resolver;

baseResolver.createResolver = (childResolver) => {
        const newResolver = async (parent, args, context) => {
            await resolver(parent, args, context);
            return childResolver(parent, args, context);
        };
        return createResolver(newResolver);
    };
    return baseResolver;
};

export const requiresAuth = createResolver((parent, args, context) => {
    if (!context.user || !context.user.id) {
        throw new Error('Not authenticated');
    }
});

// export const requiresStaff = requiresAuth.createResolver((parent, args, context) => {
//     if(!context.user.isStaff) {
//         throw new Error('Action not permitted for non-GPS staff')
//     }
// })

// export const requiresAdmin = requiresAuth.createResolver(
//     (parent, args, context) => {
//         if (!context.user.isAdmin) {
//         throw new Error('Requires admin access');
//         }
//     },
// );