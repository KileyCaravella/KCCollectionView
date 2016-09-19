#
# Be sure to run `pod lib lint KCCollectionView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KCCollectionView'
  s.version          = '0.0.1'
  s.summary          = 'KCCollectionView does all of the hard work for you to set up a Collection View.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
KCCollectionView

An easier way to work with Collection Views
KCCollectionView does all of the hard work for you! It sets up the collection view and configures the cell for the user based on the specifications the user gives it (There are defaults if the user does not wish to enter all the information).

What is required to add to your project:
•	in the ViewController's viewDidLayoutSubviews, add 'collectionViewName.collectionViewLayout = collectionViewName.layout' (This is to be fixed in future updates)
•	set the view controller as the delegate and data source of the collection view (if wish to use those features)
•	add cellForItemAtIndexPath and numberOfItemsInSection the the view controller (if it is the data source), and have the cell equal the collectionViewName.cellForItemAtIndexPath or collectionViewName.numberOfItemsInSection respectively. This way you can add subviews to the cell but the main layout is already done for you.

Features
- `numberCellsPerRow`: Int
- 'numberCellsInView`: Int
- 'equalCellsInRowsAndColumns': Bool (used instead of `numberCellsPerRow` if this is desired)
- 'cellCornerRadius': CGFloat
- 'cellBorderWidth': CGFloat
- 'cellBorderColor': CGColor
- 'minimumColumnSpacing': CGFloat (spacing between columns of cells)
- 'minimumRowSpacing': CGFloat (spacing between rows of cells)

                       DESC

  s.homepage         = 'https://github.com/KileyCaravella/KCCollectionView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kiley' => 'kiley@intrepid.io' }
  s.source           = { :git => 'https://github.com/KileyCaravella/KCCollectionView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KCCollectionView/Classes/**/*'

  # s.resource_bundles = {
  #   'KCCollectionView' => ['KCCollectionView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
