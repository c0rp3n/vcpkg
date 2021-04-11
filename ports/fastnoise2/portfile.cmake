vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Auburn/FastNoise2
    REF c2ffc0cc5b7e1c81c94ae304be10970d982f26de
    SHA512 aa198c7d0b82d804d231ffbfdf58bb95a08f02529e005cc182efdd3feb63fd1d5f7a58233a64ce8f5de747e0bafa730538ef6eb8c10b24cf29d17f9b2696e073
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DFASTNOISE2_NOISETOOL=OFF
        -DCMAKE_DEBUG_POSTFIX="d"
)
vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/FastNoise2)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
