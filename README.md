# Bazel RBE Symlink Bug

Source symlinks are being uploaded to the remote cache as files.

## Steps

Locally works:

```shellsession
$ bazel build @swiftpkg_pinoperation//:PINOperation.rspm
```

Remote doesn't:

```shellsession
$ bazel clean --expunge --async
$ bazel build @swiftpkg_pinoperation//:PINOperation.rspm --remote_header=x-buildbuddy-api-key=$BUILDBUDDY_API_KEY --config=rbe

In file included from external/rules_swift_package_manager~~swift_deps~swiftpkg_pinoperation/Source/PINOperationGroup.m:10:
In file included from external/rules_swift_package_manager~~swift_deps~swiftpkg_pinoperation/Source/include/PINOperation/PINOperation.h:12:
external/rules_swift_package_manager~~swift_deps~swiftpkg_pinoperation/Source/include/PINOperation/PINOperationGroup.h:20:1: error: duplicate interface definition for class 'PINOperationGroup'
@interface PINOperationGroup : NSObject
^
external/rules_swift_package_manager~~swift_deps~swiftpkg_pinoperation/Source/PINOperationGroup.h:20:12: note: previous definition is here
@interface PINOperationGroup : NSObject
```
