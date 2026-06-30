module github.com/wavix/wavix-go-sdk

go 1.21

require github.com/google/uuid v1.6.0

require github.com/stretchr/testify v1.8.4

require gopkg.in/yaml.v3 v3.0.1 // indirect

require (
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
)

// Legacy versions cached under this path by the proxy; their go.mod declared
// github.com/wavix/sdk-go and are unrelated to this SDK.
retract (
	v1.0.1
	v1.0.0
)
