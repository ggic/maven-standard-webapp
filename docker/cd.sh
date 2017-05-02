GIT_CLONE_URL=$1
echo "arg1:$1"
if  [ ! -n "$GIT_CLONE_URL" ] ;then  
    echo "intput arg[GIT_CLONE_URL] is null !"  
    exit 0
else  
    echo "GIT_CLONE_URL:$GIT_CLONE_URL"  
fi  
ROOT=/usr/local
PROJECT=default_project
BUILD_HOME=$ROOT/build
TOMCAT_HOME=$ROOT/app/tomcat
#kill tomcat
ps -ef|grep  '/usr/local/app/tomcat/bin/bootstrap.jar' | grep -v grep |awk '{print $1}'|xargs kill -9

#remove history data
rm -rf  $BUILD_HOME/*

cd $ROOT/build
git clone $GIT_CLONE_URL $PROJECT

if  [ ! -d "$ROOT/build/$PROJECT" ] ; then  
    echo "git clone Failed !"  
     exit 0
fi  
cd $BUILD_HOME/$PROJECT
mvn clean package -Ddir=$BUILD_HOME/$PROJECT -DwarName=$PROJECT
rm -rf $TOMCAT_HOME/webapps/* && mkdir $TOMCAT_HOME/webapps/ROOT
unzip $PROJECT'.war' -d $TOMCAT_HOME/webapps/ROOT

$TOMCAT_HOME/bin/startup.sh
 tail -f $TOMCAT_HOME/logs/catalina.out
