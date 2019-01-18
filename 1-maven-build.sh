if [ -z "$JENKINS_URL" ]; then
  # if not set in environment use default
  JENKINS_URL=https://ci.eclipse.org/xtext/
fi
if [ -z "$WORKSPACE" ]; then
  # if not set in environment use default
  WORKSPACE=.
fi

mvn \
  --batch-mode \
  --update-snapshots \
  -fae \
  -PuseJenkinsSnapshots \
  -DJENKINS_URL=$JENKINS_URL \
  -Dmaven.test.failure.ignore=true \
  -Dmaven.repo.local=${WORKSPACE}/.m2/repository \
  -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn \
  $@

