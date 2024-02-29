FROM node:8 AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 5000
CMD ["npm", "start"]


FROM alpine
WORKDIR /sanjeev
RUN apk --no-cache add nodejs npm
COPY --from=builder /usr/src/app .
CMD ["npm", "start"]