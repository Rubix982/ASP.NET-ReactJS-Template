#!/bin/bash
newTestName=''
read -p "Enter new test name: " newTestName
	
dotnet new classlib -o $newTestName

mv ./$newTestName/Class1.cs $newTestName.cs

cat > ./$newTestName/$newTestName.cs <<- EOM
	using System;

	namespace Prime.Services
	{
		public class PrimeService
		{
			public bool IsPrime(int candidate)
			{
				throw new NotImplementedException("Not implemented.");
			}
		}
	}	
EOM

echo -e "\e[31mChange namespace and class names as needed\e[0m"

dotnet sln add ./$newTestName/$newTestName.csproj
dotnet new xunit -o $newTestName.Tests
dotnet add ./$newTestName.Tests/$newTestName.Tests.csproj reference ./$newTestName/$newTestName.csproj
dotnet sln add ./$newTestName.Tests/$newTestName.Tests.csproj