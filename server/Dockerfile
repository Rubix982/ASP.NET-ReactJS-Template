FROM microsoft/aspnetcore
CMD [ "dotnet", 'publish', '-c', 'Release']
COPY ./bin/Release/net5.0/publish App/
WORKDIR /App
ENTRYPOINT [ "dotnet", "NetCore.Docker.dll" ]