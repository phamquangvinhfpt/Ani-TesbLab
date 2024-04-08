# Sử dụng .NET Core SDK làm môi trường xây dựng
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

# Copy toàn bộ dự án vào thư mục làm việc /app
COPY . ./

# Xây dựng ứng dụng
RUN dotnet publish -c Release -o published

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
ENV ASPNETCORE_URLS=http://+:80
WORKDIR /app

# Copy các file đã được build từ bước trước
COPY --from=build-env /app/published .
EXPOSE 80

# Chạy ứng dụng khi container được khởi chạy
ENTRYPOINT ["dotnet", "Ani-TestlabApplication.dll"]