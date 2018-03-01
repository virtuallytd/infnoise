VERSION=$1
ARCH=$2

PATH=$PATH:/sbin/

mkdir -p SOURCES
tar -czf SOURCES/infnoise.tar.gz . --exclude="*.sh" --exclude="SOURCES"

mkdir -p BUILD SPECS RPMS SRPMS

cp infnoise.spec SPECS
sed -i -- 's/__VERSION__/'$VERSION'/g' SPECS/infnoise.spec

rpmbuild --define "_topdir `pwd`" -ba SPECS/infnoise.spec

