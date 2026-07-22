FROM node:16-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install

FROM node:16-alpine
WORKDIR /app
COPY --from=build /app/node_modules ./node_modules
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]
