export const typeDefs = `
    type AuthPayload {
        token: String!
        refreshToken: String!
    }

    type Query {
        developer: String!
    }

    type Mutation {

        register(
            username: String!
            password: String
        ) : RegUser!

        login( username: String!, password: String) : AuthPayload!
        
        refreshTokens(token: String!, refreshToken: String!) : AuthPayload!
    }
`