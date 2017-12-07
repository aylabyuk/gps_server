import { refreshTokens, tryLogin } from '../helpers/auth'
import { SECRET } from '../index'
import { User } from '../sql/connector'

export const resolvers = {
    Query: {
        developer: "Oriel Vinci Absin"
    },
    Mutation: {
        register: async (_, args) => {
            const user = args;
            user.password = await bcrypt.hash(user.password, 12);
      
            console.log('Register user: ', user)
            return User.create(user)
        },

        login: async (parent, { username, password }, { SECRET }) => tryLogin(username, password, SECRET),

        refreshTokens: (parent, { token, refreshToken }, { SECRET }) => refreshTokens(token, refreshToken, SECRET),
    }
}