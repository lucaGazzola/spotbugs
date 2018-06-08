
# ![SpotBugs](https://spotbugs.github.io/images/logos/spotbugs_logo_300px.png)

[![Build Status](https://travis-ci.org/spotbugs/spotbugs.svg?branch=master)](https://travis-ci.org/spotbugs/spotbugs)
[![Documentation Status](https://readthedocs.org/projects/spotbugs/badge/?version=latest)](http://spotbugs.readthedocs.io/en/latest/?badge=latest)
[![Coverage Status](https://sonarcloud.io/api/badges/measure?key=com.github.spotbugs.spotbugs&metric=coverage)](https://sonarcloud.io/component_measures?id=com.github.spotbugs.spotbugs&metric=coverage)
[![Maven Central](https://maven-badges.herokuapp.com/maven-central/com.github.spotbugs/spotbugs/badge.svg)](https://maven-badges.herokuapp.com/maven-central/com.github.spotbugs/spotbugs)
[![Javadocs](http://javadoc.io/badge/com.github.spotbugs/spotbugs.svg)](http://javadoc.io/doc/com.github.spotbugs/spotbugs)

[![Coverage on New Code](https://sonarcloud.io/api/badges/measure?key=com.github.spotbugs.spotbugs&metric=new_coverage&template=FLAT)](https://sonarcloud.io/dashboard?id=com.github.spotbugs.spotbugs)
[![New Debt](https://sonarcloud.io/api/badges/measure?key=com.github.spotbugs.spotbugs&metric=new_sqale_debt_ratio&template=FLAT)](https://sonarcloud.io/component_measures/domain/Maintainability?id=com.github.spotbugs.spotbugs)

[SpotBugs](https://spotbugs.github.io/) is the spiritual successor of [FindBugs](https://github.com/findbugsproject/findbugs), carrying on from the point where it left off with support of its community.

SpotBugs is licensed under the [GNU LESSER GENERAL PUBLIC LICENSE](https://github.com/spotbugs/spotbugs/blob/master/spotbugs/licenses/LICENSE.txt).

More information at the [official website](https://spotbugs.github.io/). A lot of things can still be found at the [old FindBugs website](http://findbugs.sourceforge.net).

# Build

SpotBugs is built using [Gradle](https://gradle.org). The recommended way to obtain it is to simply run the `gradlew` (or `gradlew.bat`) wrapper, which will automatically download and run the correct version as needed (using the settings in `gradle/wrapper/gradle-wrapper.properties`).

To see a list of build options, run `gradle tasks` (or `gradlew tasks`). The `build` task will perform a full build and test.

To build the SpotBugs plugin for Eclipse, you'll need to create the file `eclipsePlugin/local.properties`, containing a property `eclipseRoot.dir` that points to an Eclipse installation's root directory (see `.travis.yml` for an example), then run the build.
To prepare Eclipse environment only, run `./gradlew eclipse`. See also [detailed steps](https://github.com/spotbugs/spotbugs/blob/master/eclipsePlugin/doc/building_spotbugs_plugin.txt).

# Questions?
You can contact us using [our general purpose mailing list](https://github.com/spotbugs/discuss/issues?q=).

# Fork
The aim of this forked project is to implement runtime testing for the spotbugs plugin. This is achieved through AspectJ aspects that use JUnit runners to run a set of parameterized test cases and collect their results.

## Quick-and-dirty
To work with junit within the plugin testing at runtime you need to convert the eclipse project to aspectj (*right click > configure > convert to aspectj project*) and copy the needed junit jars libraries in the `lib` directory of the `eclipsePlugin` project, after that right click on the project in eclipse and select *build path > configure build path* then *add jars* and add the junit jars in the `lib` folder. Now open `MANIFEST.MF` and add the jars you need (following is my configuration as an example)

```
 lib/junit-4.12.jar,
 lib/hamcrest-all-1.3.jar,
 lib/jdepend-2.0.1.jar
 ```
 
 paying attention to the trailing space for each line.
 
 
 
