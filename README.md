
# JDK8 S2I builder image using Redhat UBI8

## Getting started  

#### Create the builder image
The following command will create a builder image named s2i-jdk8 based on the Dockerfile that was created previously.
```
docker build -t s2i-jdk8 .
```
The builder image can also be created by using the *make* command since a *Makefile* is included.

Once the image has finished building, the command *s2i usage s2i-jdk8* will print out the help info that was defined in the *usage* script.

#### Creating the application image
The application image combines the builder image with your applications source code, which is served using whatever application is installed via the *Dockerfile*, compiled using the *assemble* script, and run using the *run* script.
The following command will create the application image:
```
s2i build test/test-app s2i-jdk8 s2i-jdk8-app
---> Building and installing application from source...
```
Using the logic defined in the *assemble* script, s2i will now create an application image using the builder image as a base and including the source code from the test/test-app directory. 

#### Running the application image
Running the application image is as simple as invoking the docker run command:
```
docker run -d -p 8080:8080 s2i-jdk8-app
```
The application, which consists of a simple static web page, should now be accessible at  [http://localhost:8080](http://localhost:8080).
