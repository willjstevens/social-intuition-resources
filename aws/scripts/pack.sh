
mv si-app-server-1.0.war ROOT.war
unzip ROOT.war -d ./working-dir
rm working-dir/r/si-app.js
rm working-dir/r/si-controllers.js
rm working-dir/r/si-directives.js
rm working-dir/r/si-filters.js
rm working-dir/r/si-services.js
rm working-dir/r/si-validate.js
rm ROOT.war
cd working-dir
zip -r ../ROOT.war . -x *.DS_Store
cd ..
rm -R working-dir
echo 'DONE.'
