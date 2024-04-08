#restore
restore:
	dotnet restore
#Build
build:
	dotnet build --no-restore
rebuild:
	dotnet build --no-incremental
clean:
	dotnet clean
#Run
run:
	dotnet run --project Ani-TestlabApplication
#Debug
debug:
	dotnet run --debug --project Ani-TestlabApplication