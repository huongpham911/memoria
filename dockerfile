# Stage 1: Build app
FROM node:20-alpine AS builder

WORKDIR /app

RUN apk add --no-cache git
RUN git clone https://github.com/xp4u1/memoria.git .

RUN npm install -g pnpm && pnpm install && pnpm build

# Stage 2: Serve with nginx
FROM nginx:alpine

# Copy build output
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
