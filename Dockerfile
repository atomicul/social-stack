FROM mikefarah/yq:4.45.1-githubaction AS yq
RUN cp "$(which yq)" /yq

FROM node:22.4 AS builder
WORKDIR /app

RUN apt-get update -qq && apt-get upgrade -qq -y
RUN apt-get install -qq -y gawk
COPY --from=yq /yq /usr/local/bin/yq
COPY . .
RUN yarn
RUN ./bin/compile-html

FROM nginx:alpine AS runner
WORKDIR /usr/share/nginx/html/
COPY --from=builder /app/build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
