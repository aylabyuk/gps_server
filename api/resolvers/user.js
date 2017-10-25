import { refreshTokens, tryLogin } from '../auth'
import bcrypt from 'bcrypt'

export default {
    Mutation: {
        register: async (parent , args, { models }) => {
            const user = args;
            user.password = await bcrypt.hash(user.password, 12);
      
            console.log('Register user: ', user)
            return models.User.create(user)
        },
        login: async (parent, { username, password }, { SECRET }) => tryLogin(username, password, SECRET),
        refreshTokens: (parent, { token, refreshToken }, { SECRET }) => refreshTokens(token, refreshToken, SECRET),
    }
}
