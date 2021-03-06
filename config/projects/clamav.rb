# Encoding: UTF-8

name 'clamav'
maintainer 'Jonathan Hartman'
homepage 'https://github.com/RoboticCheese/clamav-omnibus'

install_dir '/opt/clamav'
build_version '0.98.4'
build_iteration 1

# creates required build directories
dependency 'preparation'

# clamav dependencies/components
dependency 'clamav'

# version manifest file
dependency 'version-manifest'

exclude '\.git*'
exclude 'bundler\/git'
