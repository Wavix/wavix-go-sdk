# Wavix Go SDK

[![fern shield](https://img.shields.io/badge/%F0%9F%8C%BF-Built%20with%20Fern-brightgreen)](https://buildwithfern.com?utm_source=github&utm_medium=github&utm_campaign=readme&utm_source=https%3A%2F%2Fgithub.com%2Fwavix%2Fwavix-go-sdk)

The official Wavix Go SDK provides programmatic access to the
[Wavix](https://wavix.com) APIs. Use it to add messaging, voice, and account
management capabilities to your application.

Use the SDK to:

- Send and receive SMS and MMS messages.
- Place and programmatically control calls.
- Search for, buy, and manage phone numbers.
- Validate phone numbers.
- Manage SIP trunks.
- Retrieve call detail records (CDRs).


## Table of contents

- [Installation](#installation)
- [Authentication](#authentication)
- [Quickstart](#quickstart)
- [Error handling](#error-handling)
- [Pagination](#pagination)
- [Rate limits and retries](#rate-limits-and-retries)
  - [Retries](#retries)
  - [Idempotency](#idempotency)
- [Request options](#request-options)
- [Advanced](#advanced)
  - [Access raw response data](#access-raw-response-data)
  - [Timeouts](#timeouts)
  - [Explicit null values](#explicit-null-values)
- [SDK and API compatibility](#sdk-and-api-compatibility)
- [Release notes](#release-notes)
- [Major-version upgrades](#major-version-upgrades)
- [Documentation](#documentation)
- [Resources and support](#resources-and-support)
- [Contributing](#contributing)

## Installation

```sh
go get github.com/wavix/wavix-go-sdk
```

**Requirements:** Go 1.23 or later.

## Authentication

Create an API key in the [Wavix portal](https://app.wavix.com). Store the key
in an environment variable and pass it to the client.

```shell
export WAVIX_API_KEY="your-api-key"
```

```go
import (
    "os"

    client "github.com/wavix/wavix-go-sdk/client"
    option "github.com/wavix/wavix-go-sdk/option"
)

c := client.NewClient(option.WithToken(os.Getenv("WAVIX_API_KEY")))
```

> [!CAUTION]
> Don't commit API keys or tokens to source control. In production, store
> credentials in environment variables or a secrets manager.


## Quickstart

Create a client and send an SMS message:

```go
package example

import (
    context "context"

    wavixgo "github.com/wavix/wavix-go-sdk"
    client "github.com/wavix/wavix-go-sdk/client"
    option "github.com/wavix/wavix-go-sdk/option"
    smsandmms "github.com/wavix/wavix-go-sdk/smsandmms"
)

func do() {
    client := client.NewClient(
        option.WithToken(
            "<token>",
        ),
    )
    request := &smsandmms.SendMessagesRequest{
        From: "Wavix",
        To: "+447537151866",
        MessageBody: &wavixgo.MessageBody{
            Text: "Hi there, this is a message from Wavix",
        },
        CallbackURL: wavixgo.String(
            "https://you-site.com/webhook",
        ),
        Validity: wavixgo.Int(
            3600,
        ),
        Tag: wavixgo.String(
            "Fall sale",
        ),
    }
    client.SmsAndMms.Messages.Send(
        context.TODO(),
        request,
    )
}
```

## Error handling

When the API returns a non-success status code, the SDK returns a structured
error. The error supports the standard `errors.Is` and `errors.As` functions:

```go
response, err := client.SmsAndMms.Messages.Send(...)
if err != nil {
    var apiError *core.APIError
    if errors.As(err, &apiError) {
        // Do something with the API error ...
    }
    return err
}
```

Handle errors that aren't instances of `core.APIError` separately, or return
them so that your application doesn't ignore unexpected failures.

## Pagination

List operations use automatic page-number pagination.

The Wavix APIs support these pagination parameters:

- `page`: Specifies the page to retrieve.
- `per_page`: Specifies the number of items per page. The default is `25`.
  The minimum is `1`, and the maximum is `100`.

Paginated responses include the raw HTTP response in the page object.

## Rate limits and retries

Rate limits vary by endpoint. When a request exceeds an endpoint's rate
limit, the Wavix API returns an HTTP `429 Too Many Requests` response.

The SDK can retry `429` responses as described in [Retries](#retries).

### Retries

The SDK automatically retries eligible requests by using exponential backoff.
By default, the SDK makes up to two retry attempts.

The SDK retries requests that return one of these status codes:

- [`408 Request Timeout`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/408).
- [`429 Too Many Requests`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/429).
- Any [`5xx` server error](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#server_error_responses).

These status codes aren't configurable.

If the response includes a `Retry-After` header, the SDK uses its value
instead of the default exponential backoff.

Use `option.WithMaxAttempts` to set the maximum number of attempts for the
client or an individual request:

```go
client := client.NewClient(
    option.WithMaxAttempts(1),
)

response, err := client.SmsAndMms.Messages.Send(
    ...,
    option.WithMaxAttempts(1),
)
```

> [!IMPORTANT]
> A retry can repeat an operation if the server processes the original
> request but the client doesn't receive the response. Before you retry an
> operation that sends a message, places a call, or changes a resource,
> confirm that the operation can be repeated safely.

### Idempotency

The Wavix APIs don't support idempotency keys. A repeated request can repeat
the operation, including sending a message, placing a call, or changing a
resource.

Before you retry a request that changes data or starts an operation, check
whether the original request succeeded. When duplicate operations could
affect customers or incur charges, track request state in your application
and prevent the same operation from being submitted more than once.

## Request options

Use request options to configure the authorization token or provide a custom
`*http.Client`.

Set options on the client to apply them to every request, or pass options to
an individual request.

> [!IMPORTANT]
> Provide an `*http.Client` with a timeout for production applications. If you
> don't provide one, the SDK uses `http.DefaultClient`, which doesn't set a
> request timeout. You can also set a deadline for an individual request by
> using its context.

```go
// Specify default options applied on every request.
client := client.NewClient(
    option.WithToken("<YOUR_API_KEY>"),
    option.WithHTTPClient(
        &http.Client{
            Timeout: 5 * time.Second,
        },
    ),
)

// Specify options for an individual request.
response, err := client.SmsAndMms.Messages.Send(
    ...,
    option.WithToken("<YOUR_API_KEY>"),
)
```

## Advanced

### Access raw response data

Use `WithRawResponse` to access the status code, headers, and other raw HTTP
response data. Paginated endpoints include this data automatically in the
page response object.

```go
response, err := client.SmsAndMms.Messages.WithRawResponse.Send(...)
if err != nil {
    return err
}
fmt.Printf("Got response headers: %v", response.Header)
fmt.Printf("Got status code: %d", response.StatusCode)
```

### Timeouts

Use the standard `context` package to set a deadline for an individual
request. The following example sets a one-second timeout:

```go
ctx, cancel := context.WithTimeout(ctx, time.Second)
defer cancel()

response, err := client.SmsAndMms.Messages.Send(ctx, ...)
```

### Explicit null values

Use a field's setter method to send an explicit JSON `null` value for an
optional parameter. Calling the setter marks the field as explicitly set.
During serialization, the SDK includes the field even when its value is zero
or `nil`:

```go
type ExampleRequest struct {
    // An optional string parameter.
    Name *string `json:"name,omitempty" url:"-"`

    // Private bitmask of fields set to an explicit value and therefore not to be omitted
    explicitFields *big.Int `json:"-" url:"-"`
}

request := &ExampleRequest{}
request.SetName(nil)

response, err := client.SmsAndMms.Messages.Send(ctx, request, ...)
```

## SDK and API compatibility

Each SDK release supports the current version of the Wavix APIs available
when that SDK version is released. Update the SDK regularly to access the
latest API capabilities and fixes.

Before you update the SDK, review the
[GitHub releases](https://github.com/wavix/wavix-go-sdk/releases) for changes
that might affect your application.

## Release notes

See [GitHub releases](https://github.com/wavix/wavix-go-sdk/releases) for new
features, fixes, and breaking changes in each SDK release.

## Major-version upgrades

The SDK doesn't provide separate migration guides. Breaking changes ship only
in major versions, so before you upgrade, review the
[GitHub releases](https://github.com/wavix/wavix-go-sdk/releases) for breaking
changes, then update and test in a development environment before you deploy.

## Documentation

- For API guides and API reference documentation, see the
  [Wavix documentation](https://docs.wavix.com).
- For SDK methods and types, see the
  [Go SDK reference](https://github.com/wavix/wavix-go-sdk/blob/HEAD/reference.md).

## Resources and support

- **Versioning:** The SDK follows [Semantic Versioning](https://semver.org).
  Breaking changes are released in major versions.
- **Security:** Report vulnerabilities privately by following the instructions
  in [SECURITY.md](./SECURITY.md). Don't report vulnerabilities in public
  issues.
- **Support:** For product and API support, contact
  [support@wavix.com](mailto:support@wavix.com).
- **Issues:** To report an SDK bug or request a feature, open a
  [GitHub issue](https://github.com/wavix/wavix-go-sdk/issues).
- **License:** The SDK is available under the [MIT License](./LICENSE).

## Contributing

The SDK source code is generated. Changes made directly to generated files are
overwritten in the next release and can't be merged as submitted. Before you
prepare a code change, open an issue to discuss the proposed update.

You can submit README improvements directly in a pull request.
