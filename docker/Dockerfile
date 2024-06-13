FROM eclipse-temurin:21-jre

# Install wget before using it
RUN apt-get update && apt-get install -y wget

WORKDIR /minecraft

# Download the specified version of the Minecraft server jar file
RUN wget -O minecraft_server.jar https://piston-data.mojang.com/v1/objects/145ff0858209bcfc164859ba735d4199aafa1eea/server.jar

EXPOSE 25565

COPY start.sh start.sh

# Ensure the script is executable
RUN chmod +x start.sh

CMD ["./start.sh"]
