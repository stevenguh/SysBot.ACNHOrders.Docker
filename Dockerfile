# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build

RUN git clone --depth 1 https://github.com/berichan/SysBot.ACNHOrders.git
RUN dotnet publish /SysBot.ACNHOrders/SysBot.ACNHOrders.csproj \
		-p:PublishSingleFile=true \
		-p:DebugType=None \
		--configuration release \
		--framework net8.0 \
		--self-contained \
		--use-current-runtime \
		-o /opt/acnh-orders

# Stage 2: Create the image
FROM mcr.microsoft.com/dotnet/runtime-deps:8.0-alpine

# Install ICU to required by JSON serialization in .NET
RUN apk add --no-cache icu
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

COPY --from=build /opt/acnh-orders /opt/acnh-orders
WORKDIR /opt/acnh-orders
CMD ["./SysBot.ACNHOrders"]
