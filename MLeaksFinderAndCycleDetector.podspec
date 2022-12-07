Pod::Spec.new do |s|
  s.name         = "MLeaksFinderAndCycleDetector"
  s.version      = "0.1.0"
  s.summary      = "MLeaksFinder+FBRetainCycleDetector that helps with detecting retain cycles in iOS apps"
  s.homepage     = "https://github.com/whoyoung/MLeaksFinderAndCycleDetector"
  s.license      = "MIT"
  s.author       = { "Zeposhe" => "zeposhe@163.com", "Grzegorz Pstrucha" => "gricha@fb.com" }
  s.platform     = :ios, "7.0"
  s.source       = {
    :git => "https://github.com/whoyoung/MLeaksFinderAndCycleDetector.git",
    :tag => "0.1.0"
  }
  s.source_files  = "MLeaksFinder/**/*", "FBRetainCycleDetector", "{FBRetainCycleDetector,rcd_fishhook}/**/*.{h,m,mm,c}"

  mrr_files = [
    'FBRetainCycleDetector/Associations/FBAssociationManager.h',
    'FBRetainCycleDetector/Associations/FBAssociationManager.mm',
    'FBRetainCycleDetector/Layout/Blocks/FBBlockStrongLayout.h',
    'FBRetainCycleDetector/Layout/Blocks/FBBlockStrongLayout.m',
    'FBRetainCycleDetector/Layout/Blocks/FBBlockStrongRelationDetector.h',
    'FBRetainCycleDetector/Layout/Blocks/FBBlockStrongRelationDetector.m',
    'FBRetainCycleDetector/Layout/Classes/FBClassStrongLayoutHelpers.h',
    'FBRetainCycleDetector/Layout/Classes/FBClassStrongLayoutHelpers.m',
  ]

  files = Pathname.glob("FBRetainCycleDetector/**/*.{h,m,mm}")
  files = files.map {|file| file.to_path}
  files = files.reject {|file| mrr_files.include?(file)}

  s.requires_arc = files.sort + [
    'rcd_fishhook/**/*.{c,h}'
  ]
  s.public_header_files = [
    'FBRetainCycleDetector/Detector/FBRetainCycleDetector.h',
    'FBRetainCycleDetector/Associations/FBAssociationManager.h',
    'FBRetainCycleDetector/Graph/FBObjectiveCBlock.h',
    'FBRetainCycleDetector/Graph/FBObjectiveCGraphElement.h',
    'FBRetainCycleDetector/Graph/Specialization/FBObjectiveCNSCFTimer.h',
    'FBRetainCycleDetector/Graph/FBObjectiveCObject.h',
    'FBRetainCycleDetector/Graph/FBObjectGraphConfiguration.h',
    'FBRetainCycleDetector/Filtering/FBStandardGraphEdgeFilters.h',
    'MLeaksFinder/MLeaksFinder.h', 
    'MLeaksFinder/NSObject+MemoryLeak.h'
  ]

  s.framework = "Foundation", "CoreGraphics", "UIKit"
  s.library = 'c++'
end
