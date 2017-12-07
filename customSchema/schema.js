export const typeDefs = `
    type AuthPayload {
        token: String!
        refreshToken: String!
    }

    type Mutation {

        register(
            username: String!
            password: String
        ) : User!

        login( username: String!, password: String) : AuthPayload!
        
        refreshTokens(token: String!, refreshToken: String!) : AuthPayload!
    }
`