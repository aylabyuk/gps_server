import { apolloUploadExpress } from 'apollo-upload-server';

export default apolloUploadExpress({
  uploadDir: '/fileUploads',
});