FROM node:18-alpine

WORKDIR /var/www/html

CMD ["npm", "run", "dev"]