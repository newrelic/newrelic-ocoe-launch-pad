FROM node:14.15.4
ENV NODE_ENV=production
RUN npm install pm2 -g
WORKDIR /launchpad
COPY ecosystem.config.js ecosystem.config.js
COPY docs docs
CMD ["pm2-runtime","ecosystem.config.js"]
EXPOSE 8080