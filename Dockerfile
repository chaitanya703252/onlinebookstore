FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build || echo "No build step"

EXPOSE 3000
CMD ["npm", "start"]
