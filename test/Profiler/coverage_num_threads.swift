// RUN: %target-swift-frontend -profile-generate -profile-coverage-mapping -num-threads 0 -emit-ir %S/Inputs/coverage_num_threads1.swift | %FileCheck %s -check-prefix=SINGLE-SOURCE --implicit-check-not="llvm_coverage_mapping ="

// SINGLE-SOURCE: llvm_coverage_mapping =

// RUN: %target-swift-frontend -profile-generate -profile-coverage-mapping -num-threads 0 -emit-ir %S/Inputs/coverage_num_threads1.swift %S/Inputs/coverage_num_threads2.swift | %FileCheck %s -check-prefix=SINGLE-OBJECT --implicit-check-not="llvm_coverage_mapping ="

// SINGLE-OBJECT: llvm_coverage_mapping =

// RUN: %target-swift-frontend -profile-generate -profile-coverage-mapping -num-threads 2 -emit-ir %S/Inputs/coverage_num_threads1.swift %S/Inputs/coverage_num_threads2.swift | %FileCheck %s -check-prefix=MULTIPLE-OBJECTS --implicit-check-not="llvm_coverage_mapping ="

// MULTIPLE-OBJECTS: llvm_coverage_mapping =
// MULTIPLE-OBJECTS: llvm_coverage_mapping =
