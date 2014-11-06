require_relative '../../../kitchen/data/spec_helper'

describe 'cookbook-r::default' do

  it 'installs the required r packages with correct version' do
    expect(package 'r-base').to be_installed.with_version('3.1.2-1trusty0')
    expect(package 'r-base-core').to be_installed.with_version('3.1.2-1trusty0')
    expect(package 'r-base-dev').to be_installed.with_version('3.1.2-1trusty0')
    expect(package 'r-base-html').to be_installed.with_version('3.1.1-1trusty0')
    expect(package 'r-cran-boot').to be_installed.with_version('1.3-13-1trusty0')
    expect(package 'r-cran-class').to be_installed.with_version('7.3-11-1trusty0')
    expect(package 'r-cran-cluster').to be_installed.with_version('1.15.3-1trusty0')
    expect(package 'r-cran-codetools').to be_installed.with_version('0.2-9-1trusty0')
    expect(package 'r-cran-foreign').to be_installed.with_version('0.8.61-1trusty0')
    expect(package 'r-cran-kernsmooth').to be_installed.with_version('2.23-13-1trusty0')
    expect(package 'r-cran-lattice').to be_installed.with_version('0.20-29-1trusty0')
    expect(package 'r-cran-mass').to be_installed.with_version('7.3-34-1trusty0')
    expect(package 'r-cran-matrix').to be_installed.with_version('1.1-4-1trusty0')
    expect(package 'r-cran-mgcv').to be_installed.with_version('1.8-3-1trusty0')
    expect(package 'r-cran-nlme').to be_installed.with_version('3.1.117-1trusty0')
    expect(package 'r-cran-nnet').to be_installed.with_version('7.3-8-1trusty0')
    expect(package 'r-cran-rpart').to be_installed.with_version('4.1-8-1trusty0')
    expect(package 'r-cran-spatial').to be_installed.with_version('7.3-7-1trusty0')
    expect(package 'r-cran-survival').to be_installed.with_version('2.37-7-1')
    expect(package 'r-doc-html').to be_installed.with_version('3.1.1-1trusty0')
    expect(package 'r-recommended').to be_installed.with_version('3.1.2-1trusty0')
  end
end
