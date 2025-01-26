1. SIMPLE FLOW OF DOCKER: 

Step 1: Create a simple empty project of spring-boot

step 2 (Optional): change the build name 

	<build>
		<finalName>docker-java-configuration</finalName>
	</build>

step 3: create a build using:

	step 1: mvn clean
	step 2: mvn package 
	-> We can see the build file inside /target folder

step 5: run the jar and test it working fine.

	step 1: check the file path
	step 2: execute the command
		Syntax: java -jar {buildName}.jar
		example: java -jar target/docker-java-configuration.jar

step 6: create docker file: Dockerfile
	
	# Use the slim OpenJDK 21 image
	FROM openjdk:21-slim
	# Install Maven and clean up after installation to reduce image size
	RUN apt-get update \
    	&& apt-get install -y maven \
    	&& rm -rf /var/lib/apt/lists/*
	# Set the working directory
	WORKDIR /myapp
	# Copy the application files into the image
	COPY . .
	# Expose port 8080 for Spring Boot
	EXPOSE 8080
	# Default command to run the Spring Boot application using Maven
	CMD ["mvn", "spring-boot:run"]

step 7: open desktop docker

step 8: this step creates an image inside docker from the build

	step 1: check the file path 	
	step 2: 
		syntax: docker build -t {imageName:tagName} {current location of docker file}
		example: docker build -t dipakchauhan/docker-configuration-file:v1 .

step 9: check whether the image has been created in docker.

	docker images

step 10: this command is used to run the application

 	syntax: docker run  -v {AbsolutePath:containerPath} -p {host Port}:{container port} {imageName:tagName}
	example: docker run -v C:\Users\DELL1\OneDrive\Desktop\Dipak\docker-java-configuration:/myapp -p 8080:8080 dipakchauhan/docker-configuration-file:v1

Note: 

	=> Here we hole project match with image's hole project [/myapp] so whatever you will changes we can see reflect in few seconds.
	=> example : before i had create empty project 
		   : then run container
     		   : then i have create api in local 
	  	   : container restart
     		   : check api will works
	=> if you want to add this changes in container you need to make build and then create image.
	=> when you change in local if you want to see changes need to restat same container 

2. HOW TO CREATED IMAGE PUT INTO REGISTRY

Step 1: Create a repository in the docker and you will get a name

	Syntax: {NameSpace}/{repoName}
	example: dipakchauhan/docker-configuration-file

step 2: rename the images that you want to upload, and keep the name as the repository name 

	Syntax: docker tag {oldName:oldTag} {repoName}
	example: docker tag write-in-file-1:v1 dipakchauhan/docker-configuration-file:v1	

step 3: docker login

	docker push {repositoryName:tagname}
	docker push dipakchauhan/docker-configuration-file:v1

3. Now your images are on Hub

step 1: pull your own images

	docker pull dipakchauhan/docker-configuration-file:v1

step 2: Run it will work fine.

	docker run -v C:\Users\DELL1\OneDrive\Desktop\Dipak\docker-java-configuration:/myapp -p 8080:8080 dipakchauhan/docker-configuration-file:v1

4. images anyone can download and run this project will run properly and test it

5. How to test or developer take code and check it 

		step 1: get code from github
		step 2: some changed in files
		step 3: pushed in GitHub
		step 4: create .jar
		step 5: follow same steps 1 to 10

