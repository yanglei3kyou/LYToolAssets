Pod::Spec.new do |s|

  s.name         = "LYToolAssets"
  s.version      = "1.0.1"
  s.summary      = "LYToolAssets is asset of Tools."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
                  LYToolAssets is assets of Tools. From review my iOS Knowledge, i decide to make it.
                   DESC

  s.homepage     = "https://github.com/yanglei3kyou/LYToolAssets"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "Levis" => "yanglei3kyou@126.com" }



  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/yanglei3kyou/LYToolAssets.git", :tag => "1.0.1" }


  s.source_files  = "LYToolAssets", "LYToolAssets/**/*"
  s.public_header_files = "LYToolAssets/**/*.h"

  s.requires_arc = true

end
