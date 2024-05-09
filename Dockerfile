FROM oven/bun:latest AS base

FROM base AS builder

WORKDIR /app
COPY package*json bun.lockb tsconfig.json ./
RUN bun i --production  

FROM base AS runner

WORKDIR /app

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 hono

COPY --from=builder --chown=hono:nodejs /app/node_modules /app/node_modules
COPY ./src ./src

USER hono
EXPOSE 3000

CMD [ "bun", "run", "./src/index.ts" ]
