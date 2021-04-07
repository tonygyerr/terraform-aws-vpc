# Test Files
go_test(
    name = "vpc_pkg_test",
    srcs = glob([
        "*.go",
    ]),
    data = ["//:vpc_pkg"],
    visibility = ["PUBLIC"],
    deps = [
        "//third_party/go:terratest",
        "//third_party/go:testify",
    ]
)