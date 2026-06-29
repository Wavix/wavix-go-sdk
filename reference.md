# Reference
## API Keys
<details><summary><code>client.APIKeys.List() -> []*wavixgosdk.APIKey</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the API keys belonging to the authenticated account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.ListAPIKeysRequest{
        Label: wavixgosdk.String(
            "production",
        ),
    }
client.APIKeys.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**label:** `*string` — Filters API keys by `label`. Matches partial values.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.APIKeys.Create(request) -> *wavixgosdk.APIKey</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates an API key for the authenticated account. Restrict access by listing permitted IP addresses in `permitted_ips`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.APIKeyCreateRequest{
        Label: "Production API Key",
        Active: wavixgosdk.Bool(
            true,
        ),
        Restricted: wavixgosdk.Bool(
            true,
        ),
        PermittedIps: []string{
            "192.168.1.1",
            "10.0.0.1",
        },
        ScopesEnabled: wavixgosdk.Bool(
            true,
        ),
        Numbers: &wavixgosdk.APIKeyScopePermission{
            Allow: wavixgosdk.APIKeyScopePermissionAllowRead.Ptr(),
        },
        Calls: &wavixgosdk.APIKeyCallsScopePermission{
            Allow: wavixgosdk.APIKeyCallsScopePermissionAllowRead.Ptr(),
        },
        Messages: &wavixgosdk.APIKeyScopePermission{
            Allow: wavixgosdk.APIKeyScopePermissionAllowWrite.Ptr(),
        },
        TwoFa: &wavixgosdk.APIKeyScopePermission{
            Allow: wavixgosdk.APIKeyScopePermissionAllowWrite.Ptr(),
        },
        Billing: &wavixgosdk.APIKeyScopePermission{
            Allow: wavixgosdk.APIKeyScopePermissionAllowRead.Ptr(),
        },
    }
client.APIKeys.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**label:** `string` — API key label.
    
</dd>
</dl>

<dl>
<dd>

**active:** `*bool` — Indicates whether the API key should be activated upon creation.
    
</dd>
</dl>

<dl>
<dd>

**restricted:** `*bool` — Indicates whether to restrict API key access by IP address. When enabled, only requests from IP addresses listed in `permitted_ips` are allowed.
    
</dd>
</dl>

<dl>
<dd>

**permittedIps:** `[]string` — List of permitted IP addresses for this API key. Each must be a valid IPv4 address. Required when `restricted` is true.
    
</dd>
</dl>

<dl>
<dd>

**scopesEnabled:** `*bool` 

When `true`, scope fields below are enforced. When `false` (default), the
key has full access. Omitted scope fields default to `{ allow: none }`,
so with `scopes_enabled: true` and no scopes set the key has no access.
    
</dd>
</dl>

<dl>
<dd>

**numbers:** `*wavixgosdk.APIKeyScopePermission` — View, buy, release, and configure phone numbers, browse inventory, and manage the cart.
    
</dd>
</dl>

<dl>
<dd>

**trunks:** `*wavixgosdk.APIKeyScopePermission` — View, create, update, and delete SIP trunks and their settings.
    
</dd>
</dl>

<dl>
<dd>

**calls:** `*wavixgosdk.APIKeyCallsScopePermission` — Access call records and active calls, and control live call actions such as starting, answering, ending, audio playback, DTMF, streaming, and transcription requests.
    
</dd>
</dl>

<dl>
<dd>

**messages:** `*wavixgosdk.APIKeyScopePermission` — Access message history and Sender IDs, send messages, manage opt-outs, and create or delete Sender IDs.
    
</dd>
</dl>

<dl>
<dd>

**recordings:** `*wavixgosdk.APIKeyScopePermission` — List, download, and delete call recordings.
    
</dd>
</dl>

<dl>
<dd>

**campaigns:** `*wavixgosdk.APIKeyScopePermission` — View campaign analytics and Sender ID or Brand status, schedule bulk voice or SMS campaigns, register Brands, and create short links.
    
</dd>
</dl>

<dl>
<dd>

**twoFa:** `*wavixgosdk.APIKeyScopePermission` — View 2FA service details and verification logs, trigger OTPs by voice or SMS, and validate verification codes.
    
</dd>
</dl>

<dl>
<dd>

**validator:** `*wavixgosdk.APIKeyScopePermission` — View number validation results and trigger single or bulk validation or HLR lookup requests.
    
</dd>
</dl>

<dl>
<dd>

**webhooks:** `*wavixgosdk.APIKeyScopePermission` — List, create, and delete webhooks.
    
</dd>
</dl>

<dl>
<dd>

**embeddable:** `*wavixgosdk.APIKeyScopePermission` — Manage widget tokens, including listing, viewing, creating, updating, and deleting them.
    
</dd>
</dl>

<dl>
<dd>

**billing:** `*wavixgosdk.APIKeyScopePermission` — Access statements, balance, payment methods, usage reports, and billing settings, including payment method updates.
    
</dd>
</dl>

<dl>
<dd>

**account:** `*wavixgosdk.APIKeyScopePermission` — View and update account profile information and timezone.
    
</dd>
</dl>

<dl>
<dd>

**subaccounts:** `*wavixgosdk.APIKeyScopePermission` — Manage subaccounts: list and view them, create, update, and suspend them.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.APIKeys.Delete(ID) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the API key identified by `id`. Deletion is permanent and revokes the key immediately.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.DeleteAPIKeysRequest{
        ID: 1,
    }
client.APIKeys.Delete(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `int` — The unique ID of the API key.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.APIKeys.Update(ID, request) -> *wavixgosdk.APIKey</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an API key identified by `id`. Only the provided fields are changed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.APIKeyUpdateRequest{
        ID: 1,
        Active: wavixgosdk.Bool(
            true,
        ),
        Restricted: wavixgosdk.Bool(
            true,
        ),
        ScopesEnabled: wavixgosdk.Bool(
            true,
        ),
        PermittedIps: []string{
            "192.168.1.1",
            "10.0.0.1",
        },
        Label: wavixgosdk.String(
            "Production API Key",
        ),
    }
client.APIKeys.Update(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `int` — The unique ID of the API key.
    
</dd>
</dl>

<dl>
<dd>

**active:** `*bool` — Indicates whether the API key is active.
    
</dd>
</dl>

<dl>
<dd>

**restricted:** `*bool` — Indicates whether the API key is restricted to the listed permitted IPs.
    
</dd>
</dl>

<dl>
<dd>

**scopesEnabled:** `*bool` — Indicates whether per-resource scope permissions are enforced for the API key.
    
</dd>
</dl>

<dl>
<dd>

**permittedIps:** `[]string` — IP addresses allowed to use the API key when restriction is enabled.
    
</dd>
</dl>

<dl>
<dd>

**label:** `*string` — Human-readable label for the API key.
    
</dd>
</dl>

<dl>
<dd>

**numbers:** `*wavixgosdk.APIKeyScopePermission` — View, buy, release, and configure phone numbers, browse inventory, and manage the cart.
    
</dd>
</dl>

<dl>
<dd>

**trunks:** `*wavixgosdk.APIKeyScopePermission` — View, create, update, and delete SIP trunks and their settings.
    
</dd>
</dl>

<dl>
<dd>

**calls:** `*wavixgosdk.APIKeyCallsScopePermission` — Access call records and active calls, and control live call actions such as starting, answering, ending, audio playback, DTMF, streaming, and transcription requests.
    
</dd>
</dl>

<dl>
<dd>

**messages:** `*wavixgosdk.APIKeyScopePermission` — Access message history and Sender IDs, send messages, manage opt-outs, and create or delete Sender IDs.
    
</dd>
</dl>

<dl>
<dd>

**recordings:** `*wavixgosdk.APIKeyScopePermission` — List, download, and delete call recordings.
    
</dd>
</dl>

<dl>
<dd>

**campaigns:** `*wavixgosdk.APIKeyScopePermission` — View campaign analytics and Sender ID or Brand status, schedule bulk voice or SMS campaigns, register Brands, and create short links.
    
</dd>
</dl>

<dl>
<dd>

**twoFa:** `*wavixgosdk.APIKeyScopePermission` — View 2FA service details and verification logs, trigger OTPs by voice or SMS, and validate verification codes.
    
</dd>
</dl>

<dl>
<dd>

**validator:** `*wavixgosdk.APIKeyScopePermission` — View number validation results and trigger single or bulk validation or HLR lookup requests.
    
</dd>
</dl>

<dl>
<dd>

**webhooks:** `*wavixgosdk.APIKeyScopePermission` — List, create, and delete webhooks.
    
</dd>
</dl>

<dl>
<dd>

**embeddable:** `*wavixgosdk.APIKeyScopePermission` — Manage widget tokens, including listing, viewing, creating, updating, and deleting them.
    
</dd>
</dl>

<dl>
<dd>

**billing:** `*wavixgosdk.APIKeyScopePermission` — Access statements, balance, payment methods, usage reports, and billing settings, including payment method updates.
    
</dd>
</dl>

<dl>
<dd>

**account:** `*wavixgosdk.APIKeyScopePermission` — View and update account profile information and timezone.
    
</dd>
</dl>

<dl>
<dd>

**subaccounts:** `*wavixgosdk.APIKeyScopePermission` — Manage subaccounts: list and view them, create, update, and suspend them.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## SIP trunks
<details><summary><code>client.SipTrunks.List() -> *wavixgosdk.SipTrunkListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of SIP trunks for the authenticated account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.ListSipTrunksRequest{}
client.SipTrunks.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SipTrunks.Create(request) -> *wavixgosdk.SipTrunkResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a SIP trunk for routing inbound and outbound calls. Returns the trunk with its generated `access_token`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.SipTrunkCreateRequest{
        Label: "My trunk",
        Password: "4r=h;EaCB85QNtr2",
        Callerid: "13132847320",
        IPRestrict: false,
        DidinfoEnabled: true,
        CallRestrict: true,
        CostLimit: true,
        ChannelsRestrict: false,
        RewriteEnabled: true,
        TranscriptionEnabled: true,
        TranscriptionThreshold: 10,
    }
client.SipTrunks.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `*wavixgosdk.SipTrunkCreateRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SipTrunks.Get(ID) -> *wavixgosdk.SipTrunkResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the SIP trunk identified by `id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.GetSipTrunksRequest{
        ID: 3107,
    }
client.SipTrunks.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `int` — The unique ID of the SIP trunk.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SipTrunks.Update(ID, request) -> *wavixgosdk.SipTrunkResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Replaces the configuration of the SIP trunk identified by `id`. Omitted fields revert to their defaults.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.UpdateSipTrunksRequest{
        ID: 3107,
        Body: &wavixgosdk.SipTrunkCreateRequest{
            Label: "My trunk",
            Password: "4r=h;EaCB85QNtr2",
            Callerid: "13132847320",
            IPRestrict: false,
            DidinfoEnabled: true,
            CallRestrict: true,
            CostLimit: true,
            ChannelsRestrict: false,
            RewriteEnabled: true,
            TranscriptionEnabled: true,
            TranscriptionThreshold: 10,
        },
    }
client.SipTrunks.Update(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `int` — The unique ID of the SIP trunk.
    
</dd>
</dl>

<dl>
<dd>

**request:** `*wavixgosdk.SipTrunkCreateRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SipTrunks.Delete(ID) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the SIP trunk identified by `id`. Deletion is permanent and stops call routing through the trunk.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.DeleteSipTrunksRequest{
        ID: 3107,
    }
client.SipTrunks.Delete(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `int` — The unique ID of the SIP trunk.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Cart
<details><summary><code>client.Cart.Get() -> *wavixgosdk.GetCartResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the current purchase cart, including the phone numbers it contains and the documents each requires.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Cart.Get(
        context.TODO(),
    )
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Cart.Add(request) -> []any</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds the listed phone numbers to the purchase cart.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.AddCartRequest{
        IDs: []string{
            "541139862174",
            "541139862175",
        },
    }
client.Cart.Add(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `[]string` — Phone numbers to add to the cart.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Cart.Remove(request) -> *wavixgosdk.RemoveCartResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes the listed phone numbers from the purchase cart.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.RemoveCartRequest{
        IDs: []string{
            "541139862174",
            "541139862175",
        },
    }
client.Cart.Remove(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `[]string` — Phone numbers to remove from the cart.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Cart.Checkout(request) -> *wavixgosdk.CheckoutCartResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Purchases the listed phone numbers from the cart. Activation and monthly fees are deducted from the account balance.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.CheckoutCartRequest{
        IDs: []string{
            "541139862174",
            "541139862175",
        },
    }
client.Cart.Checkout(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `[]string` — Phone numbers from the cart to purchase.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Numbers
<details><summary><code>client.Numbers.List() -> *wavixgosdk.NumberListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of the phone numbers owned by the authenticated account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.ListNumbersRequest{
        CityID: wavixgosdk.Int(
            123,
        ),
        Search: wavixgosdk.String(
            "256537",
        ),
        Label: wavixgosdk.String(
            "ALEX",
        ),
        LabelPresent: wavixgosdk.Bool(
            true,
        ),
        Page: wavixgosdk.Int(
            2,
        ),
        PerPage: wavixgosdk.Int(
            50,
        ),
    }
client.Numbers.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cityID:** `*int` — Filters numbers by the ID of their city or rate center.
    
</dd>
</dl>

<dl>
<dd>

**search:** `*string` — Filters numbers by a full or partial phone number.
    
</dd>
</dl>

<dl>
<dd>

**label:** `*string` — Filters numbers by `label`.
    
</dd>
</dl>

<dl>
<dd>

**labelPresent:** `*bool` — When `true`, returns only numbers that have a label; when `false`, only numbers without one.
    
</dd>
</dl>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Numbers.Delete() -> *wavixgosdk.DeleteNumbersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Releases the listed phone numbers back to stock. Selection accepts either `ids` (record IDs) or `dids` (phone numbers), but not both.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.DeleteNumbersRequest{
        Dids: wavixgosdk.String(
            "47832123321,47832123324,478321233215",
        ),
    }
client.Numbers.Delete(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `*int` — Record IDs of the phone numbers to release. Mutually exclusive with `dids`.
    
</dd>
</dl>

<dl>
<dd>

**dids:** `*string` — Comma-separated phone numbers to release. Mutually exclusive with `ids`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Numbers.BulkUpdate(request) -> *wavixgosdk.BulkUpdateNumbersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Applies the same changes to every listed phone number. Only the provided fields are changed. Destination and SMS callback changes are applied asynchronously and may not be reflected in the response immediately.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.NumberBulkUpdateRequest{
        IDs: []int{
            123,
            456,
        },
    }
client.Numbers.BulkUpdate(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ids:** `[]int` 

Numbers (by ID) to apply the patch to. The same patch is
applied to every listed number.
    
</dd>
</dl>

<dl>
<dd>

**smsEnabled:** `*bool` — Indicates whether SMS is enabled for the phone numbers.
    
</dd>
</dl>

<dl>
<dd>

**destinations:** `[]*wavixgosdk.NumberDestination` — Inbound call routing destinations for the phone numbers.
    
</dd>
</dl>

<dl>
<dd>

**smsRelayURL:** `*string` — Callback URL for inbound messages.
    
</dd>
</dl>

<dl>
<dd>

**callRecordingEnabled:** `*bool` — Indicates whether call recording is enabled.
    
</dd>
</dl>

<dl>
<dd>

**transcriptionEnabled:** `*bool` — Indicates whether call transcription is enabled.
    
</dd>
</dl>

<dl>
<dd>

**transcriptionThreshold:** `*int` — Minimum call duration in seconds before transcription runs.
    
</dd>
</dl>

<dl>
<dd>

**callStatusURL:** `*string` — Callback URL for call status updates.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Numbers.Get(ID) -> *wavixgosdk.Number</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the phone number identified by `id`, including its destinations, documents, and feature settings.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.GetNumbersRequest{
        ID: 123,
    }
client.Numbers.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `int` — The unique ID of the phone number.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Numbers.Update(ID, request) -> *wavixgosdk.Number</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the phone number identified by `id`. Only the provided fields are changed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.NumberUpdateRequest{
        ID: 123,
    }
client.Numbers.Update(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `int` — The unique ID of the phone number.
    
</dd>
</dl>

<dl>
<dd>

**smsEnabled:** `*bool` — Indicates whether SMS is enabled for the phone number.
    
</dd>
</dl>

<dl>
<dd>

**destinations:** `[]*wavixgosdk.NumberDestination` — Inbound call routing destinations for the phone number.
    
</dd>
</dl>

<dl>
<dd>

**smsRelayURL:** `*string` — Callback URL for inbound messages.
    
</dd>
</dl>

<dl>
<dd>

**callRecordingEnabled:** `*bool` — Indicates whether call recording is enabled.
    
</dd>
</dl>

<dl>
<dd>

**transcriptionEnabled:** `*bool` — Indicates whether call transcription is enabled.
    
</dd>
</dl>

<dl>
<dd>

**transcriptionThreshold:** `*int` — Minimum call duration in seconds before transcription runs.
    
</dd>
</dl>

<dl>
<dd>

**callStatusURL:** `*string` — Callback URL for call status updates.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CDRs
<details><summary><code>client.Cdrs.List() -> *wavixgosdk.CdrListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of call detail records for the authenticated account, within the requested date range.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.ListCdrsRequest{
        From: wavixgosdk.MustParseDate(
            "2023-01-01",
        ),
        To: wavixgosdk.MustParseDate(
            "2023-09-01",
        ),
        Type: "received",
        FromSearch: wavixgosdk.String(
            "13524815863",
        ),
        ToSearch: wavixgosdk.String(
            "12565378257",
        ),
        SipTrunk: wavixgosdk.String(
            "12321",
        ),
        UUID: wavixgosdk.String(
            "99df5ffd-962a-410f-bcce-d08f1f7f328c",
        ),
        Page: wavixgosdk.Int(
            1,
        ),
        PerPage: wavixgosdk.Int(
            25,
        ),
    }
client.Cdrs.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `time.Time` — Start of the date range to query, in `YYYY-MM-DD` format. Inclusive.
    
</dd>
</dl>

<dl>
<dd>

**to:** `time.Time` — End of the date range to query, in `YYYY-MM-DD` format. Inclusive.
    
</dd>
</dl>

<dl>
<dd>

**type_:** `string` — Filters CDRs by call direction. One of `placed` (outbound calls dialed by the account) or `received` (inbound calls answered by the account).
    
</dd>
</dl>

<dl>
<dd>

**disposition:** `*wavixgosdk.CallDisposition` — Filters CDRs by call disposition. One of `answered` (the called party answered), `busy` (the called party was busy), `rejected` (the call was declined), `failed` (the call could not be routed), or `all` (no disposition filter).
    
</dd>
</dl>

<dl>
<dd>

**fromSearch:** `*string` — Filters CDRs by originating phone number. Accepts a full or partial number.
    
</dd>
</dl>

<dl>
<dd>

**toSearch:** `*string` — Filters CDRs by destination phone number. Accepts a full or partial number.
    
</dd>
</dl>

<dl>
<dd>

**sipTrunk:** `*string` — Filters outbound CDRs by SIP trunk login. Ignored for inbound calls.
    
</dd>
</dl>

<dl>
<dd>

**uuid:** `*string` — Filters CDRs by the unique call ID.
    
</dd>
</dl>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Cdrs.Search(request) -> *wavixgosdk.CdrTranscriptionSearchResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches call transcriptions for the given keywords or phrases and returns the matching CDRs with their transcriptions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.CdrSearchRequest{
        Type: wavixgosdk.CdrSearchRequestTypePlaced,
        From: wavixgosdk.MustParseDate(
            "2023-08-01",
        ),
        To: wavixgosdk.MustParseDate(
            "2023-08-31",
        ),
        Page: 1,
        PerPage: 50,
    }
client.Cdrs.Search(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**type_:** `*wavixgosdk.CdrSearchRequestType` — Filters by call type. One of `placed` (outbound calls dialed by the account) or `received` (inbound calls answered by the account).
    
</dd>
</dl>

<dl>
<dd>

**from:** `time.Time` — Start date for call search in `YYYY-MM-DD` format.
    
</dd>
</dl>

<dl>
<dd>

**to:** `time.Time` — End date for call search in `YYYY-MM-DD` format.
    
</dd>
</dl>

<dl>
<dd>

**fromSearch:** `*string` — Originating phone number to filter results. Accepts full or partial number.
    
</dd>
</dl>

<dl>
<dd>

**toSearch:** `*string` — Destination phone number to filter results. Accepts full or partial number.
    
</dd>
</dl>

<dl>
<dd>

**sipTrunk:** `*string` — SIP trunk login to filter outbound calls. Ignored for inbound calls.
    
</dd>
</dl>

<dl>
<dd>

**minDuration:** `*int` — Minimum call duration in seconds.
    
</dd>
</dl>

<dl>
<dd>

**transcription:** `*wavixgosdk.TranscriptionFilter` 
    
</dd>
</dl>

<dl>
<dd>

**uuid:** `*string` — Call ID.
    
</dd>
</dl>

<dl>
<dd>

**disposition:** `*wavixgosdk.CdrSearchRequestDisposition` 

Call disposition to filter results.  If omitted, returns only answered
 calls. Allowed values: `answered`, `busy`, `rejected`,
  `failed`, `all`. Use `all` to return calls
   regardless of their disposition.
    
</dd>
</dl>

<dl>
<dd>

**page:** `int` — Page number to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `int` — Number of records per page.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Cdrs.Retranscribe(CallID, request) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Transcribes the recording of the call identified by `call_id`. Transcription is asynchronous; poll the transcription endpoint for the result.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.CdrRetranscriptionRequest{
        CallID: "bbaa37bf-430a-46da-ade3-c248e407016",
    }
client.Cdrs.Retranscribe(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**callID:** `string` — The unique ID of the call.
    
</dd>
</dl>

<dl>
<dd>

**language:** `*wavixgosdk.TranscriptionLanguage` 
    
</dd>
</dl>

<dl>
<dd>

**webhookURL:** `*string` — Webhook URL to receive status updates.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Cdrs.Transcriptions(CallID) -> *wavixgosdk.CdrTranscriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the transcription of the recorded call identified by `call_id`. Alias of the `transcription` endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.TranscriptionsCdrsRequest{
        CallID: "bbaa37bf-430a-46da-ade3-c248e407016",
    }
client.Cdrs.Transcriptions(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**callID:** `string` — The unique ID of the call.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Cdrs.Get(CallID) -> *wavixgosdk.CdrResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the call detail record for the call identified by `call_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.GetCdrsRequest{
        CallID: "aa566501-c591-4a8b-b3b9-cc1295398b72",
        ShowTranscription: wavixgosdk.Bool(
            true,
        ),
    }
client.Cdrs.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**callID:** `string` — The unique ID of the call.
    
</dd>
</dl>

<dl>
<dd>

**showTranscription:** `*bool` — When `true`, includes the call transcription in the response.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Cdrs.ListAll() -> string</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Streams matching call detail records as newline-delimited JSON (NDJSON), one record per line, for bulk export.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.ListAllCdrsRequest{
        From: wavixgosdk.MustParseDate(
            "2023-01-01",
        ),
        To: wavixgosdk.MustParseDate(
            "2023-09-01",
        ),
        Type: "received",
        FromSearch: wavixgosdk.String(
            "13524815863",
        ),
        ToSearch: wavixgosdk.String(
            "12565378257",
        ),
        SipTrunk: wavixgosdk.String(
            "12321",
        ),
        UUID: wavixgosdk.String(
            "99df5ffd-962a-410f-bcce-d08f1f7f328c",
        ),
        Page: wavixgosdk.Int(
            1,
        ),
        PerPage: wavixgosdk.Int(
            25,
        ),
    }
client.Cdrs.ListAll(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `time.Time` — Start of the date range to query, in `YYYY-MM-DD` format. Inclusive.
    
</dd>
</dl>

<dl>
<dd>

**to:** `time.Time` — End of the date range to query, in `YYYY-MM-DD` format. Inclusive.
    
</dd>
</dl>

<dl>
<dd>

**type_:** `string` — Filters CDRs by call direction. One of `placed` (outbound calls dialed by the account) or `received` (inbound calls answered by the account).
    
</dd>
</dl>

<dl>
<dd>

**disposition:** `*wavixgosdk.CallDisposition` — Filters CDRs by call disposition. One of `answered` (the called party answered), `busy` (the called party was busy), `rejected` (the call was declined), `failed` (the call could not be routed), or `all` (no disposition filter).
    
</dd>
</dl>

<dl>
<dd>

**fromSearch:** `*string` — Filters CDRs by originating phone number. Accepts a full or partial number.
    
</dd>
</dl>

<dl>
<dd>

**toSearch:** `*string` — Filters CDRs by destination phone number. Accepts a full or partial number.
    
</dd>
</dl>

<dl>
<dd>

**sipTrunk:** `*string` — Filters outbound CDRs by SIP trunk login. Ignored for inbound calls.
    
</dd>
</dl>

<dl>
<dd>

**uuid:** `*string` — Filters CDRs by the unique call ID.
    
</dd>
</dl>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Call recording
<details><summary><code>client.CallRecording.List() -> *wavixgosdk.CallRecordingListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of call recordings for the authenticated account, filtered by date range, number, call, or SIP trunk.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.ListCallRecordingRequest{
        FromDate: wavixgosdk.Time(
            wavixgosdk.MustParseDate(
                "2023-01-01",
            ),
        ),
        ToDate: wavixgosdk.Time(
            wavixgosdk.MustParseDate(
                "2023-12-31",
            ),
        ),
        From: wavixgosdk.String(
            "123456",
        ),
        To: wavixgosdk.String(
            "1987654321",
        ),
        CallUUID: wavixgosdk.String(
            "aa566501-c591-4a8b-b3b9-cc1295398b72",
        ),
        Page: wavixgosdk.Int(
            1,
        ),
        PerPage: wavixgosdk.Int(
            25,
        ),
    }
client.CallRecording.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**fromDate:** `*time.Time` — Start of the date range to query, in `YYYY-MM-DD` format. Inclusive.
    
</dd>
</dl>

<dl>
<dd>

**toDate:** `*time.Time` — End of the date range to query, in `YYYY-MM-DD` format. Inclusive.
    
</dd>
</dl>

<dl>
<dd>

**from:** `*string` — Filters recordings by originating phone number. Accepts a full or partial number.
    
</dd>
</dl>

<dl>
<dd>

**to:** `*string` — Filters recordings by destination phone number. Accepts a full or partial number.
    
</dd>
</dl>

<dl>
<dd>

**callUUID:** `*string` — Filters recordings by the unique call ID.
    
</dd>
</dl>

<dl>
<dd>

**sipTrunks:** `*string` — Filters recordings of outbound calls placed through the listed SIP trunk logins.
    
</dd>
</dl>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CallRecording.GetByCall(CallID) -> error</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Redirects to the recording file for the call identified by `call_id`. The download URL is returned in the `Location` header.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.GetByCallCallRecordingRequest{
        CallID: "aa566501-c591-4a8b-b3b9-cc1295398b72",
    }
client.CallRecording.GetByCall(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**callID:** `string` — The unique ID of the call whose recording is retrieved.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CallRecording.Get(ID) -> *wavixgosdk.Recording</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the call recording identified by `id`, including its metadata and download URL.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.GetCallRecordingRequest{
        ID: 123,
    }
client.CallRecording.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `int` — The unique ID of the call recording.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CallRecording.Delete(ID) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the call recording identified by `id`. Deletion is permanent and removes the recording file.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.DeleteCallRecordingRequest{
        ID: 123,
    }
client.CallRecording.Delete(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `int` — The unique ID of the call recording.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Speech Analytics
<details><summary><code>client.SpeechAnalytics.Create(request) -> *wavixgosdk.CreateSpeechAnalyticsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Uploads an audio file for transcription. Transcription is asynchronous; Wavix sends a POST callback to `callback_url` when it completes, including the `request_id` returned by this request.

Callback body:
```json
   {
        "request_id": "e865ea07-25af-4fdd-876e-04b0d41d5ebd",
        "status": "completed",
        "error": null
   }
```

- `request_id`: ID of the transcription request.
- `status`: One of `completed` (transcription succeeded) or `failed` (transcription encountered an error).
- `error`: Error description, or `null` when the transcription succeeded.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.CreateSpeechAnalyticsRequest{
        File: strings.NewReader(
            "",
        ),
        CallbackURL: "callback_url",
    }
client.SpeechAnalytics.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SpeechAnalytics.Get(RequestID) -> *wavixgosdk.GetSpeechAnalyticsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the transcription for the request identified by `request_id`, including transcript, speaker turns, and insights when available.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.GetSpeechAnalyticsRequest{
        RequestID: "e865ea07-25af-4fdd-876e-04b0d41d5ebd",
    }
client.SpeechAnalytics.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestID:** `string` — The `request_id` of the transcription, returned when the file was uploaded.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SpeechAnalytics.Retranscribe(RequestID, request) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Re-runs transcription on the file identified by `request_id`, replacing the existing transcript.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.SpeechAnalyticsRetranscribeRequest{
        RequestID: "e865ea07-25af-4fdd-876e-04b0d41d5ebd",
        CallbackURL: "https://you-site.com/webhook",
    }
client.SpeechAnalytics.Retranscribe(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestID:** `string` — The `request_id` of the transcription, returned when the file was uploaded.
    
</dd>
</dl>

<dl>
<dd>

**callbackURL:** `string` — Callback URL for transcription status updates.
    
</dd>
</dl>

<dl>
<dd>

**insights:** `*bool` — Indicates whether to enable insights generation.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Call webhooks
<details><summary><code>client.CallWebhooks.List() -> wavixgosdk.CallWebhookListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the configured call webhooks for the authenticated account. Wavix sends POST callbacks for `on-call` and `post-call` events.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.CallWebhooks.List(
        context.TODO(),
    )
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CallWebhooks.Create(request) -> *wavixgosdk.CallWebhook</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Registers a callback URL for the `on-call` or `post-call` event. Wavix sends a POST callback to the URL when the event occurs.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.CallWebhooksCreateRequest{
        URL: "https://you-site.com/webhook",
        EventType: wavixgosdk.CallWebhooksCreateRequestEventTypePostCall,
    }
client.CallWebhooks.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**url:** `string` — Webhook URL to send call events to.
    
</dd>
</dl>

<dl>
<dd>

**eventType:** `*wavixgosdk.CallWebhooksCreateRequestEventType` 

Allowed values: `on-call`, `post-call`.
 - `on-call`: Sends real-time status updates
  when a call starts, is answered, and ends.

 - `post-call`: Sends a callback after the call ends
  with disposition, duration, and cost.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CallWebhooks.Delete() -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes the call webhook for the given event type. Wavix stops sending callbacks for that event.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.DeleteCallWebhooksRequest{
        EventType: wavixgosdk.DeleteCallWebhooksRequestEventTypePostCall,
    }
client.CallWebhooks.Delete(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**eventType:** `*wavixgosdk.DeleteCallWebhooksRequestEventType` — Event type of the webhook to delete. One of `post-call` (callbacks sent after a call ends) or `on-call` (real-time call status callbacks during a call).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Call control
<details><summary><code>client.CallControl.List() -> *wavixgosdk.CallListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the calls currently in progress for the authenticated account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.CallControl.List(
        context.TODO(),
    )
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CallControl.Create(request) -> *wavixgosdk.CallCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Places an outbound call. Returns the call with its `uuid` for tracking and control.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.CallRequest{
        From: "+1234567890",
        To: "+1987654321",
        CallbackURL: "https://examples.com/callback",
    }
client.CallControl.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `string` — Caller ID. Must be an active or verified phone number on the account.
    
</dd>
</dl>

<dl>
<dd>

**to:** `string` — Destination number in E.164 format
    
</dd>
</dl>

<dl>
<dd>

**callbackURL:** `string` — The callback URL where Wavix sends the call status updates
    
</dd>
</dl>

<dl>
<dd>

**recording:** `*bool` — Specifies whether to record the call
    
</dd>
</dl>

<dl>
<dd>

**voicemailDetection:** `*bool` — Specifies whether the AMD is turned on for the call
    
</dd>
</dl>

<dl>
<dd>

**tag:** `*string` — Call metadata
    
</dd>
</dl>

<dl>
<dd>

**timeout:** `*int` — The ring timeout, in seconds, before the call is considered unanswered.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CallControl.Get(ID) -> *wavixgosdk.CallResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the call identified by `id`, including its current event and timestamps.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.GetCallControlRequest{
        ID: "id",
    }
client.CallControl.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `string` — The `uuid` of the call.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CallControl.Delete(ID) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Ends the active call identified by `id` by hanging up.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.DeleteCallControlRequest{
        ID: "id",
    }
client.CallControl.Delete(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `string` — The `uuid` of the call.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CallControl.Update(ID, request) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the active call identified by `id`. Only the `tag` field can be changed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.UpdateCallRequest{
        ID: "id",
        Tag: "marketing-campaign",
    }
client.CallControl.Update(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `string` — The `uuid` of the call.
    
</dd>
</dl>

<dl>
<dd>

**tag:** `string` — User-defined label attached to the Call for tracking or reporting.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CallControl.Answer(ID, request) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Answers the inbound call identified by `id`. Optionally starts media streaming on answer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.CallAnswerRequest{
        ID: "id",
    }
client.CallControl.Answer(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `string` — The `uuid` of the call.
    
</dd>
</dl>

<dl>
<dd>

**callRecording:** `*bool` — Indicates whether the call should be recorded.
    
</dd>
</dl>

<dl>
<dd>

**callTranscription:** `*bool` — Indicates whether the call should be transcribed after it ends.
    
</dd>
</dl>

<dl>
<dd>

**streamURL:** `*string` — WebSocket URL to stream the call.
    
</dd>
</dl>

<dl>
<dd>

**streamType:** `*wavixgosdk.CallStreamType` — Direction of audio streamed to `stream_url`.
    
</dd>
</dl>

<dl>
<dd>

**streamChannel:** `*wavixgosdk.CallStreamChannel` — Audio channel streamed to `stream_url`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CallControl.Collect(ID, request) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Collects DTMF keypad input from the caller on the active call identified by `id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.CallDtmfCollectRequest{
        ID: "id",
    }
client.CallControl.Collect(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `string` — The `uuid` of the call.
    
</dd>
</dl>

<dl>
<dd>

**maxDigits:** `*int` — Maximum number of digits to collect.
    
</dd>
</dl>

<dl>
<dd>

**timeout:** `*int` — Timeout for digit collection in seconds.
    
</dd>
</dl>

<dl>
<dd>

**terminationCharacter:** `*string` — DTMF character that ends input collection.
    
</dd>
</dl>

<dl>
<dd>

**maxAttempts:** `*int` — Maximum number of attempts.
    
</dd>
</dl>

<dl>
<dd>

**prompt:** `*wavixgosdk.CallDtmfCollectRequestPrompt` 

Prompt to play before collecting digits.
 Play a prerecorded audio file or use Wavix Text-To-Speech.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## NumberValidator
<details><summary><code>client.NumberValidator.Get() -> *wavixgosdk.GetNumberValidatorResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validates a single phone number and returns line type, carrier, portability, and reachability details.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.GetNumberValidatorRequest{
        PhoneNumber: "971569483322",
        Type: wavixgosdk.PhoneNumberValidationTypeFormat,
    }
client.NumberValidator.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**phoneNumber:** `string` — The phone number to validate, in E.164 format with or without the leading `+`.
    
</dd>
</dl>

<dl>
<dd>

**type_:** `*wavixgosdk.PhoneNumberValidationType` — Depth of validation to perform. Accepts a `PhoneNumberValidationType` value.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.NumberValidator.CreateBulk(request) -> *wavixgosdk.NumberValidatorCreateBulkResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validates a batch of phone numbers. When `async` is `true`, returns a `request_id` to poll for results instead of the validation details.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.PhoneValidationRequest{
        PhoneNumbers: []string{
            "971501390098",
            "971504359195",
        },
        Type: wavixgosdk.PhoneNumberValidationTypeFormat,
        Async: true,
        Force: true,
    }
client.NumberValidator.CreateBulk(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**phoneNumbers:** `[]string` — List of phone numbers to get detailed information about.
    
</dd>
</dl>

<dl>
<dd>

**type_:** `*wavixgosdk.PhoneNumberValidationType` 
    
</dd>
</dl>

<dl>
<dd>

**async:** `bool` — Indicates whether the request should be executed asynchronously. If `true`, the response will include a `request_uuid` that can be used to poll for results. If `false`, the response will include validation results directly.
    
</dd>
</dl>

<dl>
<dd>

**force:** `bool` — Indicates whether to force a fresh validation instead of returning a previously cached result.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Voice campaigns
<details><summary><code>client.VoiceCampaigns.Create(request) -> *wavixgosdk.VoiceCampaignsCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Launches a voice campaign that places an outbound call using a pre-configured scenario. Track progress with the returned voice campaign `id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.CreateVoiceCampaignsRequest{
        VoiceCampaign: &wavixgosdk.VoiceCampaignResponse{
            CallflowID: 3212,
            CallerID: "13123310912",
            Contact: "16729923812",
        },
    }
client.VoiceCampaigns.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**voiceCampaign:** `*wavixgosdk.VoiceCampaignResponse` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.VoiceCampaigns.Get(ID) -> *wavixgosdk.VoiceCampaignsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the voice campaign identified by `id`, including its current status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.GetVoiceCampaignsRequest{
        ID: 2321423,
    }
client.VoiceCampaigns.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `int` — The unique ID of the voice campaign to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Link shortener
<details><summary><code>client.LinkShortener.Create(request) -> *wavixgosdk.ShortLinkResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a short link that redirects to the target URL and tracks click metrics.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.ShortLinkCreateRequest{
        Link: "https://your-site.com/long-url",
    }
client.LinkShortener.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**link:** `string` — Target URL to shorten.
    
</dd>
</dl>

<dl>
<dd>

**expirationTime:** `*time.Time` — Expiration date and time in ISO 8601 format.
    
</dd>
</dl>

<dl>
<dd>

**fallbackURL:** `*string` — Fallback URL for expired or invalid links.
    
</dd>
</dl>

<dl>
<dd>

**phone:** `*string` — Phone number for the short link.
    
</dd>
</dl>

<dl>
<dd>

**utmCampaign:** `*string` — UTM campaign name for tracking insights.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Profile
<details><summary><code>client.Profile.Get() -> *wavixgosdk.ProfileResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the profile and billing details of the authenticated account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Profile.Get(
        context.TODO(),
    )
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Profile.Update(request) -> *wavixgosdk.ProfileResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the profile and billing details of the authenticated account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.ProfileUpdateRequest{}
client.Profile.Update(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**additionalInfo:** `*string` — Additional information associated with the account.
    
</dd>
</dl>

<dl>
<dd>

**contacts:** `*string` — Email associated with the account.
    
</dd>
</dl>

<dl>
<dd>

**defaultShortLinkEndpoint:** `*string` — Default short link endpoint.
    
</dd>
</dl>

<dl>
<dd>

**firstName:** `*string` — Account owner's first name.
    
</dd>
</dl>

<dl>
<dd>

**lastName:** `*string` — Account owner's last name.
    
</dd>
</dl>

<dl>
<dd>

**phone:** `*string` — Account owner's phone number
    
</dd>
</dl>

<dl>
<dd>

**smsRelayURL:** `*string` — Callback URL to forward inbound SMS to.
    
</dd>
</dl>

<dl>
<dd>

**dlrRelayURL:** `*string` — Callback URL to forward message delivery reports (DLRs) to.
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `*string` — Timezone configured on the account.
    
</dd>
</dl>

<dl>
<dd>

**jobTitle:** `*string` — Account owner's job title.
    
</dd>
</dl>

<dl>
<dd>

**companyInfo:** `*wavixgosdk.ProfileUpdateRequestCompanyInfo` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## SubAccounts
<details><summary><code>client.SubAccounts.List() -> *wavixgosdk.SubAccountsListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of sub-accounts under the authenticated master account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.ListSubAccountsRequest{}
client.SubAccounts.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**status:** `*wavixgosdk.ListSubAccountsRequestStatus` — Filters sub-accounts by status. One of `enabled` (the sub-account is active) or `disabled` (the sub-account is suspended).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SubAccounts.Create(request) -> *wavixgosdk.SubOrganizationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a sub-account under the authenticated master account. Returns the sub-account with its generated `api_key`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.SubAccountsCreateRequest{
        Name: "Company",
        DefaultDestinations: &wavixgosdk.SubAccountsCreateRequestDefaultDestinations{
            SmsEndpoint: wavixgosdk.String(
                "https://examples.com/sms",
            ),
            DlrEndpoint: wavixgosdk.String(
                "https://examples.com/dlr",
            ),
        },
    }
client.SubAccounts.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `string` — Sub-account name.
    
</dd>
</dl>

<dl>
<dd>

**defaultDestinations:** `*wavixgosdk.SubAccountsCreateRequestDefaultDestinations` — Default webhook URLs for inbound messages and delivery reports.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SubAccounts.Get(ID) -> *wavixgosdk.SubOrganizationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the sub-account identified by `id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.GetSubAccountsRequest{
        ID: 123,
    }
client.SubAccounts.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `int` — The unique ID of the sub-account.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SubAccounts.Update(ID, request) -> *wavixgosdk.SubOrganizationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Replaces the configuration of the sub-account identified by `id`. Omitted fields revert to their defaults.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.SubAccountsUpdateRequest{
        ID: 123,
        Name: "Updated Company Name",
        Status: wavixgosdk.SubAccountsUpdateRequestStatusEnabled.Ptr(),
        DefaultDestinations: &wavixgosdk.SubAccountsUpdateRequestDefaultDestinations{
            SmsEndpoint: wavixgosdk.String(
                "https://examples.com/sms",
            ),
            DlrEndpoint: wavixgosdk.String(
                "https://examples.com/dlr",
            ),
        },
    }
client.SubAccounts.Update(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `int` — The unique ID of the sub-account.
    
</dd>
</dl>

<dl>
<dd>

**name:** `string` — Sub-account name.
    
</dd>
</dl>

<dl>
<dd>

**status:** `*wavixgosdk.SubAccountsUpdateRequestStatus` — Status of the subaccount. One of `enabled` (the subaccount is active and can be used) or `disabled` (the subaccount is suspended).
    
</dd>
</dl>

<dl>
<dd>

**defaultDestinations:** `*wavixgosdk.SubAccountsUpdateRequestDefaultDestinations` — Default webhook URLs for inbound messages and delivery reports.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Billing Transactions
<details><summary><code>client.Billing.Transactions.List() -> *billing.ListTransactionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of billing transactions for the authenticated account within the requested date range.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &billing.ListTransactionsRequest{
        FromDate: wavixgosdk.MustParseDate(
            "2023-08-01",
        ),
        ToDate: wavixgosdk.MustParseDate(
            "2023-08-31",
        ),
        DetailsContains: wavixgosdk.String(
            "monthly",
        ),
        Payments: wavixgosdk.Bool(
            true,
        ),
        Page: wavixgosdk.Int(
            1,
        ),
        PerPage: wavixgosdk.Int(
            25,
        ),
    }
client.Billing.Transactions.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**fromDate:** `time.Time` — Start of the date range to query, in `YYYY-MM-DD` format. Inclusive.
    
</dd>
</dl>

<dl>
<dd>

**toDate:** `time.Time` — End of the date range to query, in `YYYY-MM-DD` format. Inclusive.
    
</dd>
</dl>

<dl>
<dd>

**type_:** `*wavixgosdk.TransactionType` — Filters transactions by type. Accepts a `TransactionType` value.
    
</dd>
</dl>

<dl>
<dd>

**detailsContains:** `*string` — Filters transactions whose `details` contain the given substring.
    
</dd>
</dl>

<dl>
<dd>

**payments:** `*bool` — When `true`, returns only account top-up transactions. Defaults to all transaction types.
    
</dd>
</dl>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Billing Invoices
<details><summary><code>client.Billing.Invoices.List() -> *billing.ListInvoicesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the auto-generated financial statements for the authenticated account, paginated and ordered by billing period.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &billing.ListInvoicesRequest{
        Page: wavixgosdk.Int(
            1,
        ),
        PerPage: wavixgosdk.Int(
            25,
        ),
    }
client.Billing.Invoices.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Billing.Invoices.Download(ID) -> string</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the financial statement identified by `id` as a PDF file.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &billing.DownloadInvoicesRequest{
        ID: 1,
    }
client.Billing.Invoices.Download(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `int` — The unique ID of the financial statement to download.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Buy Countries
<details><summary><code>client.Buy.Countries.List() -> *buy.ListCountriesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of countries where phone numbers are available.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &buy.ListCountriesRequest{}
client.Buy.Countries.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**textEnabledOnly:** `*bool` — When `true`, returns only countries that offer text-enabled phone numbers.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Buy Regions
<details><summary><code>client.Buy.Regions.List(CountryID) -> *buy.ListRegionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of regions (states or provinces) for countries where `has_provinces_or_states` is `true`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &buy.ListRegionsRequest{
        CountryID: 1892,
    }
client.Buy.Regions.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**countryID:** `int` — The unique ID of the country.
    
</dd>
</dl>

<dl>
<dd>

**textEnabledOnly:** `*bool` — When `true`, returns only regions that offer text-enabled numbers.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Buy Cities
<details><summary><code>client.Buy.Cities.List(CountryID) -> *buy.ListCitiesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of cities for countries where
 `has_provinces_or_states` is `false`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &buy.ListCitiesRequest{
        CountryID: 1891,
    }
client.Buy.Cities.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**countryID:** `int` — The unique ID of the country.
    
</dd>
</dl>

<dl>
<dd>

**textEnabledOnly:** `*bool` — When `true`, returns only cities that offer text-enabled numbers.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Buy RegionCities
<details><summary><code>client.Buy.RegionCities.List(CountryID, RegionID) -> *buy.ListRegionCitiesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of cities in the specified region for countries where `has_provinces_or_states` is `true`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &buy.ListRegionCitiesRequest{
        CountryID: 1891,
        RegionID: 821,
    }
client.Buy.RegionCities.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**countryID:** `int` — The unique ID of the country.
    
</dd>
</dl>

<dl>
<dd>

**regionID:** `int` — The unique ID of the region.
    
</dd>
</dl>

<dl>
<dd>

**textEnabledOnly:** `*bool` — When `true`, returns only cities that offer text-enabled numbers.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Buy Numbers
<details><summary><code>client.Buy.Numbers.List(CountryID, CityID) -> *buy.ListNumbersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of phone numbers available for purchase in the specified city.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &buy.ListNumbersRequest{
        CountryID: 1,
        CityID: 1,
    }
client.Buy.Numbers.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**countryID:** `int` — The unique ID of the country.
    
</dd>
</dl>

<dl>
<dd>

**cityID:** `int` — The unique ID of the city.
    
</dd>
</dl>

<dl>
<dd>

**textEnabledOnly:** `*bool` — When `true`, returns only text-enabled phone numbers.
    
</dd>
</dl>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CallControl Streams
<details><summary><code>client.CallControl.Streams.Create(CallID, request) -> *wavixgosdk.CallStreamResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Starts streaming the media of the call identified by `call_id` to the configured destination. Returns the `stream_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &callcontrol.CallStreamCreateRequest{
        CallID: "call_id",
        StreamURL: "wss://examples.com/stream",
        StreamType: wavixgosdk.CallStreamTypeOneway,
        StreamChannel: wavixgosdk.CallStreamChannelInbound,
    }
client.CallControl.Streams.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**callID:** `string` — The `uuid` of the call.
    
</dd>
</dl>

<dl>
<dd>

**streamURL:** `string` — WebSocket URL for call streaming
    
</dd>
</dl>

<dl>
<dd>

**streamType:** `*wavixgosdk.CallStreamType` — Direction of audio streamed to `stream_url`.
    
</dd>
</dl>

<dl>
<dd>

**streamChannel:** `*wavixgosdk.CallStreamChannel` — Audio channel streamed to `stream_url`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CallControl.Streams.Delete(CallID, ID) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Stops the media stream identified by `id` on the call identified by `call_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &callcontrol.DeleteStreamsRequest{
        CallID: "call_id",
        ID: "id",
    }
client.CallControl.Streams.Delete(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**callID:** `string` — The `uuid` of the call.
    
</dd>
</dl>

<dl>
<dd>

**id:** `string` — The `uuid` of the media stream to stop.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CallControl Audio
<details><summary><code>client.CallControl.Audio.Play(ID, request) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Plays an audio prompt into the active call identified by `id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &callcontrol.CallAudioPlayRequest{
        ID: "id",
        AudioFile: "https://examples.com/audio.wav",
    }
client.CallControl.Audio.Play(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `string` — The `uuid` of the call.
    
</dd>
</dl>

<dl>
<dd>

**audioFile:** `string` — URL of the audio file to play to the call.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CallControl.Audio.Stop(ID) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Stops audio playback in the active call identified by `id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &callcontrol.StopAudioRequest{
        ID: "id",
    }
client.CallControl.Audio.Stop(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `string` — The `uuid` of the call.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Cdrs Transcription
<details><summary><code>client.Cdrs.Transcription.Get(CallID) -> *wavixgosdk.CdrTranscriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the transcription of the recorded call identified by `call_id`, including the transcript, speaker turns, and summary.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &cdrs.GetTranscriptionRequest{
        CallID: "bbaa37bf-430a-46da-ade3-c248e407016",
    }
client.Cdrs.Transcription.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**callID:** `string` — The unique ID of the call.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## LinkShortener Metrics
<details><summary><code>client.LinkShortener.Metrics.List() -> *wavixgosdk.ShortLinkMetricsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns per-click metrics for short links, including device, location, and campaign attribution, within the requested date range.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &linkshortener.ListMetricsRequest{
        From: wavixgosdk.MustParseDate(
            "2023-05-01",
        ),
        To: wavixgosdk.MustParseDate(
            "2023-05-31",
        ),
        Phone: wavixgosdk.String(
            "1872025555",
        ),
        UtmCampaign: wavixgosdk.String(
            "summer",
        ),
        Page: wavixgosdk.Int(
            1,
        ),
        PerPage: wavixgosdk.Int(
            25,
        ),
    }
client.LinkShortener.Metrics.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `time.Time` — Start of the date range to query, in `YYYY-MM-DD` format. Inclusive.
    
</dd>
</dl>

<dl>
<dd>

**to:** `time.Time` — End of the date range to query, in `YYYY-MM-DD` format. Inclusive.
    
</dd>
</dl>

<dl>
<dd>

**phone:** `*string` — Filters metrics by the phone number associated with the click, in E.164 format.
    
</dd>
</dl>

<dl>
<dd>

**utmCampaign:** `*string` — Filters metrics by `utm_campaign` name.
    
</dd>
</dl>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## NumberValidator Results
<details><summary><code>client.NumberValidator.Results.Get(RequestID) -> *wavixgosdk.PhoneValidationBatchResultResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the results of an asynchronous batch validation identified by `request_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &numbervalidator.GetResultsRequest{
        RequestID: "12542c5c-1a17-4d12-a163-5b68543e75f6",
    }
client.NumberValidator.Results.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestID:** `string` — The `request_id` returned by the asynchronous bulk validation request.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Numbers Papers
<details><summary><code>client.Numbers.Papers.Upload(request) -> []*wavixgosdk.NumberDocument</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Uploads a verification document for one or more phone numbers.
Uploaded files must meet the following requirements:
- Allowed formats: PNG, JPG, JPEG, TIFF, BMP, or PDF
- Maximum file size: 10 MB
- Files can't be password protected
- PDF files must not contain digital signatures
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &numbers.UploadPapersRequest{
        DocAttachment: strings.NewReader(
            "",
        ),
        DidIDs: "did_ids",
        DocID: 1,
    }
client.Numbers.Papers.Upload(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Profile Config
<details><summary><code>client.Profile.Config.Get() -> *profile.GetConfigResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the balance and global limits configured for the authenticated account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Profile.Config.Get(
        context.TODO(),
    )
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## SmsAndMms SenderIDs
<details><summary><code>client.SmsAndMms.SenderIDs.List() -> *wavixgosdk.SenderIDListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the Sender IDs registered for the authenticated account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.SmsAndMms.SenderIDs.List(
        context.TODO(),
    )
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SmsAndMms.SenderIDs.Create(request) -> *wavixgosdk.SenderIDDetails</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a Sender ID. Use the 10DLC API to create Sender IDs in the US.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &smsandmms.SenderIDCreateRequest{
        SenderID: "Wavix",
        Type: wavixgosdk.SenderIDTypeNumeric,
        Countries: []string{
            "countries",
        },
        Usecase: smsandmms.SenderIDCreateRequestUsecaseTransactional,
    }
client.SmsAndMms.SenderIDs.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**senderID:** `string` — Sender ID name. Can be either an alphanumeric string or a  phone number.
    
</dd>
</dl>

<dl>
<dd>

**type_:** `*wavixgosdk.SenderIDType` 
    
</dd>
</dl>

<dl>
<dd>

**countries:** `[]string` — Two-letter ISO country codes where the Sender ID is allowlisted.
    
</dd>
</dl>

<dl>
<dd>

**usecase:** `*smsandmms.SenderIDCreateRequestUsecase` — Primary use case for the Sender ID. One of `transactional` (account or order notifications), `promo` (marketing and promotional messages), or `authentication` (one-time passcodes and verification codes).
    
</dd>
</dl>

<dl>
<dd>

**monthlyVolume:** `*smsandmms.SenderIDCreateRequestMonthlyVolume` — Expected number of messages sent per month from the Sender ID. One of `1-1000`, `1001-20000`, `20001-50000`, `50001-100000`, or `More than 100000`. Each value is the message-count band for the month.
    
</dd>
</dl>

<dl>
<dd>

**samples:** `[]string` — Message samples.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SmsAndMms.SenderIDs.Get(ID) -> *wavixgosdk.SenderIDResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the Sender ID identified by `id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &smsandmms.GetSenderIDsRequest{
        ID: "id",
    }
client.SmsAndMms.SenderIDs.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `string` — The unique ID of the Sender ID.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SmsAndMms.SenderIDs.Delete(ID) -> *smsandmms.DeleteSenderIDsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the Sender ID identified by `id`. Deletion is permanent.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &smsandmms.DeleteSenderIDsRequest{
        ID: "fc34ba88-1eee-476e-b09e-dae63dc441e0",
    }
client.SmsAndMms.SenderIDs.Delete(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `string` — The unique ID of the Sender ID.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## SmsAndMms OptOuts
<details><summary><code>client.SmsAndMms.OptOuts.List() -> *wavixgosdk.OptOutsListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of phone numbers that have opted out of receiving messages from the authenticated account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &smsandmms.ListOptOutsRequest{
        SenderID: wavixgosdk.String(
            "MySender",
        ),
        CampaignID: wavixgosdk.String(
            "C123456",
        ),
        CreatedAfter: wavixgosdk.Time(
            wavixgosdk.MustParseDate(
                "2024-01-01",
            ),
        ),
        CreatedBefore: wavixgosdk.Time(
            wavixgosdk.MustParseDate(
                "2024-12-31",
            ),
        ),
    }
client.SmsAndMms.OptOuts.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**senderID:** `*string` — Filters opt-outs by the Sender ID they apply to.
    
</dd>
</dl>

<dl>
<dd>

**campaignID:** `*string` — Filters opt-outs by the 10DLC campaign ID they apply to.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `*time.Time` — Returns opt-outs created on or after this date, in `YYYY-MM-DD` format.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `*time.Time` — Returns opt-outs created on or before this date, in `YYYY-MM-DD` format.
    
</dd>
</dl>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Minimum `1`, default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`, maximum `100`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SmsAndMms.OptOuts.Create(request) -> *smsandmms.CreateOptOutsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Opts a phone number out of receiving messages from a Sender ID, a 10DLC campaign, or all outbound messages.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &smsandmms.OptOutCreateRequest{
        OptOut: &wavixgosdk.OptOut{
            Number: "16419252149",
            SenderID: wavixgosdk.String(
                "15072429497",
            ),
        },
    }
client.SmsAndMms.OptOuts.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**optOut:** `*wavixgosdk.OptOut` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## SmsAndMms Messages
<details><summary><code>client.SmsAndMms.Messages.List() -> *smsandmms.ListMessagesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of SMS and MMS messages for the authenticated account, filtered by direction, date, and other criteria.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &smsandmms.ListMessagesRequest{
        SentAfter: wavixgosdk.String(
            "2023-04-10",
        ),
        SentBefore: wavixgosdk.String(
            "2023-04-13",
        ),
        Type: "outbound",
        From: wavixgosdk.String(
            "15072429497",
        ),
        To: wavixgosdk.String(
            "16419252149",
        ),
        Tag: wavixgosdk.String(
            "campaignX",
        ),
        Page: wavixgosdk.Int(
            2,
        ),
        PerPage: wavixgosdk.Int(
            50,
        ),
    }
client.SmsAndMms.Messages.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sentAfter:** `*string` — Returns messages sent on or after this date, in `YYYY-MM-DD` format.
    
</dd>
</dl>

<dl>
<dd>

**sentBefore:** `*string` — Returns messages sent on or before this date, in `YYYY-MM-DD` format.
    
</dd>
</dl>

<dl>
<dd>

**type_:** `string` — Filters messages by direction. One of `inbound` (messages received by the account) or `outbound` (messages sent by the account).
    
</dd>
</dl>

<dl>
<dd>

**from:** `*string` — Filters by message sender. For `outbound` messages, the Sender ID used to send the message; for `inbound` messages, the originating phone number.
    
</dd>
</dl>

<dl>
<dd>

**to:** `*string` — Filters by message recipient. For `outbound` messages, the destination phone number; for `inbound` messages, an SMS-enabled number on the Wavix platform.
    
</dd>
</dl>

<dl>
<dd>

**status:** `*wavixgosdk.MessageDeliveryStatus` — Filters messages by delivery status. Accepts a `MessageDeliveryStatus` value.
    
</dd>
</dl>

<dl>
<dd>

**tag:** `*string` — Filters messages by `tag`. Supported for outbound messages only.
    
</dd>
</dl>

<dl>
<dd>

**messageType:** `*smsandmms.ListMessagesRequestMessageType` — Filters messages by type. One of `sms` (text message) or `mms` (multimedia message).
    
</dd>
</dl>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SmsAndMms.Messages.Send(request) -> *wavixgosdk.SendMessagesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sends an SMS or MMS message. MMS is supported for U.S. numbers only. Track delivery using the returned `message_id` and the message status callback.
**Rate limit**: 20 messages per phone number in 24 hours.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &smsandmms.SendMessagesRequest{
        From: "Wavix",
        To: "+447537151866",
        MessageBody: &wavixgosdk.MessageBody{
            Text: "Hi there, this is a message from Wavix",
        },
        CallbackURL: wavixgosdk.String(
            "https://you-site.com/webhook",
        ),
        Validity: wavixgosdk.Int(
            3600,
        ),
        Tag: wavixgosdk.String(
            "Fall sale",
        ),
    }
client.SmsAndMms.Messages.Send(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from:** `string` — Sender ID. Numeric or alphanumeric.
    
</dd>
</dl>

<dl>
<dd>

**to:** `string` — Recipient phone number.
    
</dd>
</dl>

<dl>
<dd>

**messageBody:** `*wavixgosdk.MessageBody` 
    
</dd>
</dl>

<dl>
<dd>

**callbackURL:** `*string` — Callback URL for delivery reports.
    
</dd>
</dl>

<dl>
<dd>

**validity:** `*int` — Message validity period in seconds. Delivery attempts stop after this period expires.
    
</dd>
</dl>

<dl>
<dd>

**tag:** `*string` — Tag to group messages, such as for a specific campaign.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SmsAndMms.Messages.Get(ID) -> *smsandmms.GetMessagesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the SMS or MMS message identified by `id`, including its delivery status and content.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &smsandmms.GetMessagesRequest{
        ID: "3a525ca2-6909-4c72-9399-905adf7f3a74",
    }
client.SmsAndMms.Messages.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `string` — The unique ID of the message.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.SmsAndMms.Messages.ListAll() -> string</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Streams matching SMS and MMS messages as newline-delimited JSON (NDJSON), one message per line, for bulk export.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &smsandmms.ListAllMessagesRequest{
        SentAfter: wavixgosdk.String(
            "2023-04-10T00:00:00",
        ),
        SentBefore: wavixgosdk.String(
            "2023-04-13T23:59:59",
        ),
        Type: "outbound",
        From: wavixgosdk.String(
            "15072429497",
        ),
        To: wavixgosdk.String(
            "16419252149",
        ),
        Tag: wavixgosdk.String(
            "campaignX",
        ),
    }
client.SmsAndMms.Messages.ListAll(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sentAfter:** `*string` — Returns messages sent on or after this timestamp, in `YYYY-MM-DDTHH:MM:SS` format.
    
</dd>
</dl>

<dl>
<dd>

**sentBefore:** `*string` — Returns messages sent on or before this timestamp, in `YYYY-MM-DDTHH:MM:SS` format.
    
</dd>
</dl>

<dl>
<dd>

**type_:** `string` — Filters messages by direction. One of `inbound` (messages received by the account) or `outbound` (messages sent by the account).
    
</dd>
</dl>

<dl>
<dd>

**from:** `*string` — Filters by message sender. For `outbound` messages, the Sender ID used to send the message; for `inbound` messages, the originating phone number.
    
</dd>
</dl>

<dl>
<dd>

**to:** `*string` — Filters by message recipient. For `outbound` messages, the destination phone number; for `inbound` messages, the SMS-enabled number that received the message.
    
</dd>
</dl>

<dl>
<dd>

**status:** `*wavixgosdk.MessageDeliveryStatus` — Filters messages by delivery status. Accepts a `MessageDeliveryStatus` value.
    
</dd>
</dl>

<dl>
<dd>

**tag:** `*string` — Filters messages by `tag`. Supported for outbound messages only.
    
</dd>
</dl>

<dl>
<dd>

**messageType:** `*smsandmms.ListAllMessagesRequestMessageType` — Filters messages by type. One of `sms` (text message) or `mms` (multimedia message).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## SpeechAnalytics File
<details><summary><code>client.SpeechAnalytics.File.Get(RequestID) -> string</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the original audio file submitted for the transcription identified by `request_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &speechanalytics.GetFileRequest{
        RequestID: "request_id",
    }
client.SpeechAnalytics.File.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestID:** `string` — The `request_id` of the transcription, returned when the file was uploaded.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## SubAccounts Transactions
<details><summary><code>client.SubAccounts.Transactions.List(ID) -> *wavixgosdk.SubAccountsTransactionsListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of billing transactions for the sub-account identified by `id`, within the requested date range.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &subaccounts.ListTransactionsRequest{
        ID: 123,
        FromDate: wavixgosdk.MustParseDate(
            "2023-01-01",
        ),
        ToDate: wavixgosdk.MustParseDate(
            "2023-12-31",
        ),
        Type: []*int{
            wavixgosdk.Int(
                1,
            ),
        },
        Page: wavixgosdk.Int(
            1,
        ),
        PerPage: wavixgosdk.Int(
            25,
        ),
    }
client.SubAccounts.Transactions.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `int` — The unique ID of the sub-account.
    
</dd>
</dl>

<dl>
<dd>

**fromDate:** `time.Time` — Start of the date range to query, in `YYYY-MM-DD` format. Inclusive.
    
</dd>
</dl>

<dl>
<dd>

**toDate:** `time.Time` — End of the date range to query, in `YYYY-MM-DD` format. Inclusive.
    
</dd>
</dl>

<dl>
<dd>

**type_:** `*int` — Filters transactions by type. Accepts a single transaction type code or an array of codes.
    
</dd>
</dl>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TenDlc Brands
<details><summary><code>client.TenDlc.Brands.List() -> *tendlc.ListBrandsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of 10DLC Brands for the authenticated account, filtered by date, name, legal name, and status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.ListBrandsRequest{
        DbaName: wavixgosdk.String(
            "Brand",
        ),
        CompanyName: wavixgosdk.String(
            "Company",
        ),
        EntityType: wavixgosdk.String(
            "PRIVATE_PROFIT",
        ),
        Status: wavixgosdk.String(
            "VERIFIED",
        ),
        Country: wavixgosdk.String(
            "US",
        ),
        ShowDeleted: wavixgosdk.Bool(
            false,
        ),
        EinTaxid: wavixgosdk.String(
            "999999999",
        ),
        Mock: wavixgosdk.Bool(
            false,
        ),
        CreatedBefore: wavixgosdk.String(
            "2024-08-22",
        ),
        CreatedAfter: wavixgosdk.String(
            "2024-08-22",
        ),
        Page: wavixgosdk.Int(
            1,
        ),
        PerPage: wavixgosdk.Int(
            25,
        ),
    }
client.TenDlc.Brands.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**dbaName:** `*string` — Filters Brands by `dba_name` (doing-business-as name). Matches partial values.
    
</dd>
</dl>

<dl>
<dd>

**companyName:** `*string` — Filters Brands by `company_name` (registered legal name). Matches partial values.
    
</dd>
</dl>

<dl>
<dd>

**entityType:** `*string` — Filters Brands by business entity type, such as `PRIVATE_PROFIT`.
    
</dd>
</dl>

<dl>
<dd>

**status:** `*string` — Filters Brands by identity verification status, such as `VERIFIED`.
    
</dd>
</dl>

<dl>
<dd>

**country:** `*string` — Filters Brands by registration country, as an ISO 3166-1 alpha-2 code (e.g., `US`).
    
</dd>
</dl>

<dl>
<dd>

**showDeleted:** `*bool` — When `true`, includes deleted Brands in the results. Default `false`.
    
</dd>
</dl>

<dl>
<dd>

**einTaxid:** `*string` — Filters Brands by their Employer Identification Number (EIN) or tax ID.
    
</dd>
</dl>

<dl>
<dd>

**mock:** `*bool` — When `true`, returns only mock Brands used for testing. Default `false`.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `*string` — Returns brands created on or before this date, in `YYYY-MM-DD` format.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `*string` — Returns brands created on or after this date, in `YYYY-MM-DD` format.
    
</dd>
</dl>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.Brands.Create(request) -> *tendlc.CreateBrandsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Registers a 10DLC Brand. TCR automatically verifies the brand identity. Only brands with `VERIFIED` or `VETTED_VERIFIED` identity status can register 10DLC Campaigns.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.TenDlcBrandCreateRequest{
        TenDlcBrandCreateRequestZero: &wavixgosdk.TenDlcBrandCreateRequestZero{},
    }
client.TenDlc.Brands.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `*wavixgosdk.TenDlcBrandCreateRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.Brands.Get(BrandID) -> *tendlc.GetBrandsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the 10DLC Brand identified by `brand_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.GetBrandsRequest{
        BrandID: "BM20QP9",
    }
client.TenDlc.Brands.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.Brands.Update(BrandID, request) -> *tendlc.UpdateBrandsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the 10DLC Brand identified by `brand_id`. Changing identity fields, including `ein_taxid`, `ein_taxid_country`, and `entity_type`, resets the Brand status to `UNVERIFIED` and triggers automatic re-submission. Brands in `VETTED_VERIFIED` status or with active Campaigns cannot be updated.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.TenDlcBrandUpdateRequest{
        BrandID: "BM20QP9",
    }
client.TenDlc.Brands.Update(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**dbaName:** `*string` — Brand name or DBA
    
</dd>
</dl>

<dl>
<dd>

**companyName:** `*string` — Legal name of the company
    
</dd>
</dl>

<dl>
<dd>

**entityType:** `*tendlc.TenDlcBrandUpdateRequestEntityType` — Legal entity type of the company. One of `PRIVATE_PROFIT` (privately held for-profit company), `PUBLIC_PROFIT` (publicly traded for-profit company), `NON_PROFIT` (non-profit organization), or `GOVERNMENT` (government entity).
    
</dd>
</dl>

<dl>
<dd>

**vertical:** `*tendlc.TenDlcBrandUpdateRequestVertical` 

Business segment the Brand operates in. One of:

- `HEALTHCARE` — healthcare.
- `PROFESSIONAL` — professional services.
- `RETAIL` — retail.
- `TECHNOLOGY` — technology.
- `EDUCATION` — education.
- `FINANCIAL` — financial services.
- `NON_PROFIT` — non-profit organizations.
- `GOVERNMENT` — government entities.
- `OTHER` — any segment not listed above.
    
</dd>
</dl>

<dl>
<dd>

**einTaxid:** `*string` — IRS Employee Identification Number (EIN) for US-based or foreign companies with EIN. The numeric portion of Tax ID for companies incorporated in other countries.
    
</dd>
</dl>

<dl>
<dd>

**einTaxidCountry:** `*string` — 2-letter ISO country code of the Tax ID issuing country
    
</dd>
</dl>

<dl>
<dd>

**website:** `*string` — The website of the business
    
</dd>
</dl>

<dl>
<dd>

**stockSymbol:** `*string` — The stock symbol of the Brand. For PUBLIC_PROFIT Brands only.
    
</dd>
</dl>

<dl>
<dd>

**stockExchange:** `*string` — The stock exchange code. For PUBLIC_PROFIT Brands only.
    
</dd>
</dl>

<dl>
<dd>

**firstName:** `*string` — The first name of the business contact
    
</dd>
</dl>

<dl>
<dd>

**lastName:** `*string` — The last name of the business contact
    
</dd>
</dl>

<dl>
<dd>

**phoneNumber:** `*string` — The support contact telephone in E.164 format
    
</dd>
</dl>

<dl>
<dd>

**email:** `*string` — The email address of the support contact
    
</dd>
</dl>

<dl>
<dd>

**streetAddress:** `*string` — Street name and house number
    
</dd>
</dl>

<dl>
<dd>

**city:** `*string` — The city name
    
</dd>
</dl>

<dl>
<dd>

**stateOrProvince:** `*string` — State or province. For the United States, use 2 character codes.
    
</dd>
</dl>

<dl>
<dd>

**zip:** `*string` — The business zip or postal code
    
</dd>
</dl>

<dl>
<dd>

**country:** `*string` — 2-letter ISO country code the business address
    
</dd>
</dl>

<dl>
<dd>

**mock:** `*bool` — Mock flag for testing (optional, defaults to false)
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.Brands.Delete(BrandID) -> *tendlc.DeleteBrandsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a 10DLC Brand. Brands with active campaigns cannot be deleted.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.DeleteBrandsRequest{
        BrandID: "BM20QP9",
    }
client.TenDlc.Brands.Delete(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.Brands.QualifyUsecase(BrandID, UseCase) -> *tendlc.QualifyUsecaseBrandsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the qualification results for a 10DLC Brand use case. Includes MNO-specific attributes, restrictions, and fees.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.QualifyUsecaseBrandsRequest{
        BrandID: "BMQFB7X",
        UseCase: tendlc.QualifyUsecaseBrandsRequestUseCaseAgentsFranchises,
    }
client.TenDlc.Brands.QualifyUsecase(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**useCase:** `*tendlc.QualifyUsecaseBrandsRequestUseCase` — Name of the use case to qualify the Brand for.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TenDlc BrandAppeals
<details><summary><code>client.TenDlc.BrandAppeals.List(BrandID) -> []*wavixgosdk.TenDlcBrandAppeal</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the identity verification appeals submitted for the 10DLC Brand identified by `brand_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.ListBrandAppealsRequest{
        BrandID: "BM20QP9",
    }
client.TenDlc.BrandAppeals.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.BrandAppeals.Create(BrandID, request) -> *tendlc.CreateBrandAppealsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submits an appeal for 10DLC brand identity verification. Provide any additional documentation to support the appeal. Use `appeal_category` to specify the appeal type:
- `VERIFY_TAX_ID` — Use if the brand is UNVERIFIED due to a tax ID mismatch. Applies to private companies, public companies, non-profits, and government entities.
- `VERIFY_NON_PROFIT` — Use if a non-profit brand is UNVERIFIED or VERIFIED but missing tax-exempt status.
- `VERIFY_GOVERNMENT` — Use if a government brand is UNVERIFIED or VERIFIED but missing government entity status.      
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.CreateBrandAppealsRequest{
        BrandID: "BM20QP9",
        AppealCategories: []string{
            "VERIFY_TAX_ID",
        },
        Evidence: []string{
            "855dff49-c097-4645-3983-08dcb9856232",
        },
    }
client.TenDlc.BrandAppeals.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**appealCategories:** `[]string` — List of appeal categories. Allowed values: `VERIFY_TAX_ID`, `VERIFY_NON_PROFIT`, `VERIFY_GOVERNMENT`
    
</dd>
</dl>

<dl>
<dd>

**evidence:** `[]string` — List of evidence IDs associated with the appeal.
    
</dd>
</dl>

<dl>
<dd>

**explanation:** `*string` — Appeal comment or justification.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TenDlc BrandEvidence
<details><summary><code>client.TenDlc.BrandEvidence.List(BrandID) -> *wavixgosdk.ListBrandEvidenceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the evidence files uploaded for the 10DLC Brand identified by `brand_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.ListBrandEvidenceRequest{
        BrandID: "B6AI7PA",
    }
client.TenDlc.BrandEvidence.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.BrandEvidence.Upload(BrandID, request) -> *tendlc.UploadBrandEvidenceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Uploads a supporting evidence file for the 10DLC Brand identified by `brand_id`. Supported formats include `.jpg`, `.png`, and `.pdf`. Maximum size is 10 MB.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.UploadBrandEvidenceRequest{
        BrandID: "B6AI7PA",
        File: strings.NewReader(
            "",
        ),
    }
client.TenDlc.BrandEvidence.Upload(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.BrandEvidence.Get(BrandID, ID) -> string</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the Brand evidence file identified by the evidence ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.GetBrandEvidenceRequest{
        BrandID: "brand_id",
        ID: "id",
    }
client.TenDlc.BrandEvidence.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**id:** `string` — The unique ID of the Brand evidence file.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.BrandEvidence.Delete(BrandID, ID) -> *tendlc.DeleteBrandEvidenceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the Brand evidence file identified by the evidence ID. Deletion is permanent.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.DeleteBrandEvidenceRequest{
        BrandID: "B6AI7PA",
        ID: "191eb205-8357-4d71-b8da-160a25a000d7",
    }
client.TenDlc.BrandEvidence.Delete(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**id:** `string` — The unique ID of the Brand evidence file.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TenDlc BrandVettings
<details><summary><code>client.TenDlc.BrandVettings.List(BrandID) -> []*wavixgosdk.TenDlcBrandVetting</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the external vettings for the 10DLC Brand identified by `brand_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.ListBrandVettingsRequest{
        BrandID: "B6AI7PA",
    }
client.TenDlc.BrandVettings.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.BrandVettings.Create(BrandID, request) -> *wavixgosdk.TenDlcBrandVetting</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requests external vetting for a 10DLC Brand. Supported providers: `AEGIS`, `CV`, `WMC`. Supported classes: `STANDARD`, `ENHANCED`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.TenDlcBrandVettingCreateRequest{
        BrandID: "B6AI7PA",
        EvpID: "AEGIS",
        VettingClass: "STANDARD",
    }
client.TenDlc.BrandVettings.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**evpID:** `string` — Code identifying the external vetting provider to perform the vetting.
    
</dd>
</dl>

<dl>
<dd>

**vettingClass:** `string` — Class of vetting to request, such as `STANDARD` or `ENHANCED`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.BrandVettings.Import(BrandID, request) -> *wavixgosdk.TenDlcBrandVetting</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Imports an existing external vetting record into the 10DLC Brand identified by `brand_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.TenDlcBrandVettingImportRequest{
        BrandID: "B6AI7PA",
        EvpID: "AEGIS",
        VettingID: "13d8e00c-3cb4-4dc0-9e26-d5057fa938d9",
        VettingToken: "3oDcE1vq8OR43claMa6Thu/7V4vzZywAfKRgiJnXDjlw+08wpWbGqOssAXKgeZibHCLaGgXvU/yPb7kISeeb5qGdisGRLdhPnSNpvRR82RnCWYNpTp92orlJWjTJU8ZGmNxL5MwK0tt/9SxCha36iTtPV2+4vND8xCPe5suItuQTonG4A3Yi6F1LMqihgwdesRjxJnKqcE7Thcv9ug1NyNPYEZQvPugFj2F2DdU6jFZcOWgXsnE7ucZ+xNaNX9LkF9if3v0hrcviG9L8bUUrpPBGr02txP0i+cPBTLbj4Rq1Ox83R+WUx1gnoXHCIU1ByDGWvQq2Ef4qxGVOwPJHJbja1BovxKBk4YJxiz8OSO68QAIEfxuPTpj5eZz7KEFtFmBIVaVmxBDe4b8Tpl01C2rek7xgPzXaoURvh7CQVnVmJL00DTWKvyOmUOQQW901XEcgcJ7VWgfIvxhIMuXEXXtVDGNowmEc9JQXXYHVlGuN5QicSbApkwwqRZI7TQ4lsS66zCfqomIIJyBNRJpl+8sGwsa2J2h6fEkAD77J9zdUgIKXMFamHbvRadCKMZNIbMrkOC7PuOjZdSiWKh5A8FSjzkv3PlN2hRDqkaODEoodp5pTQeBtNe37+uAMOuHNfsZXlwvfMgCZjiZJ9HQNSLhJBUq7/IvT/EzszUk4HPTj/WFSbT1YrrkDi+zrB20ZDY9lZFWxN1hlYQoNcanDAAWPmw/yW1+8DroL5WIMGsXX3WFGOG7eWB1GHgFQsziAeRQl78u1qOvsRMN08+GrkASBJwqwy5l7xCesUKqbz3O0QA/dwzzsWIDvFPavZpjqMBSjRTurQLFahAaGmdY0BX/Ii+s2+OxfaHQIa1lgucm0P7GPKeZvLX/8boO01Onr/87ra+NX7ABvQb+SXvwsg+Bm5CziWB6DMKDKRD/KQjHxpjIY35UwSEW7G4ixux7ufizXttthHfPJWd/rWFhfYigFhVLgIPCR12smwFVuZwM7ujvY2CIM0X4E0dsX9uVHkgYmqRIdNf5vshpmRuIcHsXZpTJP/tD7zQM6m214c5xkJSfAVIaD7WzRYS4eVL+R3z4u+6n5p6FjuWSjSzuEffUai3HCWjes4JbtDSjIwoG0tOMtBukgPbreH+pjXcvnhU+1QhCV2aIdG6C3FmaI5Uoo/mthJyiFAThwtOpxQ5YkdsRunqVVEFYZfMNEn4Ig2clCFrLOm46JB2wPcLGP2MoH5RqajYzQ6IV8IXIFQVzG0C7HoHsBkVp+GrpnH6N0FCKR+fpbGjigM2lLf4pYBhChUY4ao9hvV1hd8ikS6QoasvDLPytBBa1YAwbSa8d7YdwO6fXfQqetfS8S9gbHD0zxazw5p9Lp5fXFmajDNkD2voYNMzOHJMMHG/49pWV2",
    }
client.TenDlc.BrandVettings.Import(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**evpID:** `string` — Code identifying the external vetting provider that issued the vetting.
    
</dd>
</dl>

<dl>
<dd>

**vettingID:** `string` — Unique identifier of the vetting request to import.
    
</dd>
</dl>

<dl>
<dd>

**vettingToken:** `string` — Token issued by the vetting provider that uniquely identifies the vetting result to import.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TenDlc BrandVettingAppeals
<details><summary><code>client.TenDlc.BrandVettingAppeals.List(BrandID) -> []*wavixgosdk.TenDlcBrandVettingAppeal</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the external vetting appeals for the 10DLC Brand identified by `brand_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.ListBrandVettingAppealsRequest{
        BrandID: "BMQFB7X",
    }
client.TenDlc.BrandVettingAppeals.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.BrandVettingAppeals.Create(BrandID, request) -> *tendlc.CreateBrandVettingAppealsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submits an appeal for an external vetting of the 10DLC Brand identified by `brand_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.TenDlcBrandVettingAppealCreateRequest{
        BrandID: "B6AI7PA",
        AppealCategories: []string{
            "VERIFY_TAX_ID",
        },
        Evidence: []string{
            "855dff49-c097-4645-3983-08dcb9856232",
        },
    }
client.TenDlc.BrandVettingAppeals.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**appealCategories:** `[]string` — List of appeal categories. Allowed values: `VERIFY_TAX_ID`, `VERIFY_NON_PROFIT`, `VERIFY_GOVERNMENT`, `LOW_SCORE`.
    
</dd>
</dl>

<dl>
<dd>

**evidence:** `[]string` — List of evidence IDs associated with the appeal.
    
</dd>
</dl>

<dl>
<dd>

**explanation:** `*string` — Appeal comment or justification.
    
</dd>
</dl>

<dl>
<dd>

**evpID:** `*string` — EVP ID.
    
</dd>
</dl>

<dl>
<dd>

**vettingID:** `*string` — Vetting ID.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TenDlc Campaigns
<details><summary><code>client.TenDlc.Campaigns.List() -> *tendlc.ListCampaignsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of 10DLC Campaigns for the authenticated account, filtered by date, status, and use case.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.ListCampaignsRequest{
        Name: wavixgosdk.String(
            "Name",
        ),
        Usecase: wavixgosdk.String(
            "2FA",
        ),
        Status: wavixgosdk.String(
            "APPROVED",
        ),
        Mock: wavixgosdk.Bool(
            true,
        ),
        CreatedBefore: wavixgosdk.Time(
            wavixgosdk.MustParseDate(
                "2024-08-22",
            ),
        ),
        CreatedAfter: wavixgosdk.Time(
            wavixgosdk.MustParseDate(
                "2024-08-22",
            ),
        ),
        Page: wavixgosdk.Int(
            1,
        ),
        PerPage: wavixgosdk.Int(
            25,
        ),
    }
client.TenDlc.Campaigns.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `*string` — Filters Campaigns by name. Matches partial values.
    
</dd>
</dl>

<dl>
<dd>

**usecase:** `*string` — Filters Campaigns by use case.
    
</dd>
</dl>

<dl>
<dd>

**status:** `*string` — Filters Campaigns by status.
    
</dd>
</dl>

<dl>
<dd>

**mock:** `*bool` — When `true`, returns only mock Campaigns used for testing. Default `false`.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `*time.Time` — Returns Campaigns created on or before this date, in `YYYY-MM-DD` format.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `*time.Time` — Returns Campaigns created on or after this date, in `YYYY-MM-DD` format.
    
</dd>
</dl>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.Campaigns.ListByBrand(BrandID) -> *tendlc.ListByBrandCampaignsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of 10DLC Campaigns associated with the 10DLC Brand identified by `brand_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.ListByBrandCampaignsRequest{
        BrandID: "BM20QP9",
        Name: wavixgosdk.String(
            "Name",
        ),
        Usecase: wavixgosdk.String(
            "2FA",
        ),
        Status: wavixgosdk.String(
            "APPROVED",
        ),
        Mock: wavixgosdk.Bool(
            true,
        ),
        CreatedBefore: wavixgosdk.Time(
            wavixgosdk.MustParseDate(
                "2024-08-22",
            ),
        ),
        CreatedAfter: wavixgosdk.Time(
            wavixgosdk.MustParseDate(
                "2024-08-22",
            ),
        ),
        Page: wavixgosdk.Int(
            1,
        ),
        PerPage: wavixgosdk.Int(
            25,
        ),
    }
client.TenDlc.Campaigns.ListByBrand(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**name:** `*string` — Filters Campaigns by name. Matches partial values.
    
</dd>
</dl>

<dl>
<dd>

**usecase:** `*string` — Filters Campaigns by use case.
    
</dd>
</dl>

<dl>
<dd>

**status:** `*string` — Filters Campaigns by status.
    
</dd>
</dl>

<dl>
<dd>

**mock:** `*bool` — When `true`, returns only mock Campaigns used for testing. Default `false`.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `*time.Time` — Returns Campaigns created on or before this date, in `YYYY-MM-DD` format.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `*time.Time` — Returns Campaigns created on or after this date, in `YYYY-MM-DD` format.
    
</dd>
</dl>

<dl>
<dd>

**page:** `*int` — Page number to retrieve. Default `1`.
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `*int` — Number of records to return per page. Default `25`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.Campaigns.Create(BrandID, request) -> *tendlc.CreateCampaignsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Registers a 10DLC Campaign under the 10DLC Brand identified by `brand_id`. The Brand must have a verified identity status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.TenDlcCampaignCreateRequest{
        BrandID: "BM20QP9",
        AffiliateMarketing: false,
        AgeGated: false,
        AutoRenewal: false,
        DirectLending: false,
        EmbeddedLinks: false,
        EmbeddedPhones: wavixgosdk.Bool(
            false,
        ),
        EmbeddedLinkSample: wavixgosdk.String(
            "https://site.com/verify",
        ),
        Description: "Our campaign aims to …",
        OptinWorkflow: "Our SMS ...",
        Help: true,
        HelpKeywords: "help",
        HelpMessage: "For help, please visit www.site.com. To opt-out, reply STOP.",
        Optin: true,
        OptinKeywords: "begin,start",
        OptinMessage: "You are now opted-in for help please reply HELP, to stop please reply STOP",
        Optout: true,
        OptoutKeywords: "stop,quit,unsubscribe",
        OptoutMessage: "You are now opted out and will receive no further messages",
        Name: "My first campaign",
        Sample1: "Your verification code is XXXXXX",
        Sample2: wavixgosdk.String(
            "XXXX is your verification code",
        ),
        Sample3: wavixgosdk.String(
            "Your code is XXXXXX, valid for 10 minutes",
        ),
        Sample4: wavixgosdk.String(
            "Use code XXXXXX to confirm your login",
        ),
        Sample5: wavixgosdk.String(
            "XXXXXX is your one-time passcode",
        ),
        Mock: false,
        Usecase: "2FA",
        PrivacyPolicy: wavixgosdk.String(
            "https://site.com/privacy-policy",
        ),
        TermsConditions: "https://site.com/terms-and-conditions",
    }
client.TenDlc.Campaigns.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**affiliateMarketing:** `bool` — Indicates whether the Campaign is used for affiliate marketing.
    
</dd>
</dl>

<dl>
<dd>

**ageGated:** `bool` — Indicates whether the Campaign messages contain age-gated content.
    
</dd>
</dl>

<dl>
<dd>

**autoRenewal:** `bool` — Indicates whether the Campaign is automatically renewed at the end of each billing period.
    
</dd>
</dl>

<dl>
<dd>

**directLending:** `bool` — Indicates whether the Campaign messages contain direct lending content.
    
</dd>
</dl>

<dl>
<dd>

**embeddedLinks:** `bool` — Indicates whether the Campaign messages contain embedded links.
    
</dd>
</dl>

<dl>
<dd>

**embeddedPhones:** `*bool` — Indicates whether the Campaign messages contain embedded phone numbers.
    
</dd>
</dl>

<dl>
<dd>

**embeddedLinkSample:** `*string` — Sample of an embedded link used in Campaign messages.
    
</dd>
</dl>

<dl>
<dd>

**description:** `string` — Description of the Campaign and its messaging purpose.
    
</dd>
</dl>

<dl>
<dd>

**optinWorkflow:** `string` — Description of the workflow through which subscribers opt in to the Campaign.
    
</dd>
</dl>

<dl>
<dd>

**help:** `bool` — Indicates whether the Campaign provides a help system that subscribers can trigger with a keyword such as HELP or INFO.
    
</dd>
</dl>

<dl>
<dd>

**helpKeywords:** `string` — Comma-separated list of help keywords. Keywords are case-insensitive.
    
</dd>
</dl>

<dl>
<dd>

**helpMessage:** `string` — Acknowledgement sent when a subscriber texts a help keyword.
    
</dd>
</dl>

<dl>
<dd>

**optin:** `bool` — Indicates whether the Campaign requires subscribers to opt in before receiving messages.
    
</dd>
</dl>

<dl>
<dd>

**optinKeywords:** `string` — Comma-separated list of opt-in keywords. Keywords are case-insensitive.
    
</dd>
</dl>

<dl>
<dd>

**optinMessage:** `string` — Acknowledgement sent when a subscriber texts an opt-in keyword.
    
</dd>
</dl>

<dl>
<dd>

**optout:** `bool` — Indicates whether the Campaign provides an opt-out system that subscribers can trigger with a keyword such as STOP or QUIT.
    
</dd>
</dl>

<dl>
<dd>

**optoutKeywords:** `string` — Comma-separated list of opt-out keywords. Keywords are case-insensitive.
    
</dd>
</dl>

<dl>
<dd>

**optoutMessage:** `string` — Acknowledgement sent when a subscriber texts an opt-out keyword.
    
</dd>
</dl>

<dl>
<dd>

**name:** `string` — Display name of the Campaign.
    
</dd>
</dl>

<dl>
<dd>

**sample1:** `string` — Sample message demonstrating the content sent through the Campaign.
    
</dd>
</dl>

<dl>
<dd>

**sample2:** `*string` — Sample message demonstrating the content sent through the Campaign.
    
</dd>
</dl>

<dl>
<dd>

**sample3:** `*string` — Sample message demonstrating the content sent through the Campaign.
    
</dd>
</dl>

<dl>
<dd>

**sample4:** `*string` — Sample message demonstrating the content sent through the Campaign.
    
</dd>
</dl>

<dl>
<dd>

**sample5:** `*string` — Sample message demonstrating the content sent through the Campaign.
    
</dd>
</dl>

<dl>
<dd>

**mock:** `bool` — Indicates whether the Campaign is a mock campaign used for testing. Mock campaigns cannot send production traffic.
    
</dd>
</dl>

<dl>
<dd>

**usecase:** `string` — Registered use case for the Campaign, such as `2FA` or `MARKETING`.
    
</dd>
</dl>

<dl>
<dd>

**privacyPolicy:** `*string` — URL of the Campaign privacy policy.
    
</dd>
</dl>

<dl>
<dd>

**termsConditions:** `string` — URL of the Campaign terms and conditions.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.Campaigns.Get(BrandID, CampaignID) -> *tendlc.GetCampaignsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the 10DLC Campaign identified by `campaign_id` under the Brand identified by `brand_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.GetCampaignsRequest{
        BrandID: "BM20QP9",
        CampaignID: "CKLCK95",
    }
client.TenDlc.Campaigns.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**campaignID:** `string` — The unique ID of the 10DLC Campaign.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.Campaigns.Update(BrandID, CampaignID, request) -> *tendlc.UpdateCampaignsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the 10DLC Campaign identified by `campaign_id`. Only the provided fields are changed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.TenDlcCampaignUpdateRequest{
        BrandID: "BM20QP9",
        CampaignID: "CKLCK95",
    }
client.TenDlc.Campaigns.Update(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**campaignID:** `string` — The unique ID of the 10DLC Campaign.
    
</dd>
</dl>

<dl>
<dd>

**name:** `*string` — Display name of the Campaign.
    
</dd>
</dl>

<dl>
<dd>

**usecase:** `*tendlc.TenDlcCampaignUpdateRequestUsecase` — Registered use case for the Campaign. One of `CUSTOMER_CARE` (customer support messaging), `MARKETING` (promotional content), `ACCOUNT_NOTIFICATION` (account-related alerts), `FRAUD_ALERT` (fraud and suspicious-activity warnings), `PUBLIC_SERVICE_ANNOUNCEMENT` (public-interest notices), or `SECURITY_ALERT` (security-related warnings).
    
</dd>
</dl>

<dl>
<dd>

**description:** `*string` — Description of the Campaign and its messaging purpose.
    
</dd>
</dl>

<dl>
<dd>

**embeddedLinks:** `*bool` — Indicates whether the Campaign messages contain embedded links.
    
</dd>
</dl>

<dl>
<dd>

**embeddedPhones:** `*bool` — Indicates whether the Campaign messages contain embedded phone numbers.
    
</dd>
</dl>

<dl>
<dd>

**ageGated:** `*bool` — Indicates whether the Campaign messages contain age-gated content.
    
</dd>
</dl>

<dl>
<dd>

**directLending:** `*bool` — Indicates whether the Campaign messages contain direct lending content.
    
</dd>
</dl>

<dl>
<dd>

**optin:** `*bool` — Indicates whether the Campaign requires subscribers to opt in before receiving messages.
    
</dd>
</dl>

<dl>
<dd>

**optout:** `*bool` — Indicates whether the Campaign provides an opt-out system that subscribers can trigger with a keyword.
    
</dd>
</dl>

<dl>
<dd>

**help:** `*bool` — Indicates whether the Campaign provides a help system that subscribers can trigger with a keyword.
    
</dd>
</dl>

<dl>
<dd>

**sample1:** `*string` — Sample message demonstrating the content sent through the Campaign.
    
</dd>
</dl>

<dl>
<dd>

**sample2:** `*string` — Sample message demonstrating the content sent through the Campaign.
    
</dd>
</dl>

<dl>
<dd>

**sample3:** `*string` — Sample message demonstrating the content sent through the Campaign.
    
</dd>
</dl>

<dl>
<dd>

**sample4:** `*string` — Sample message demonstrating the content sent through the Campaign.
    
</dd>
</dl>

<dl>
<dd>

**sample5:** `*string` — Sample message demonstrating the content sent through the Campaign.
    
</dd>
</dl>

<dl>
<dd>

**optinWorkflow:** `*string` — Description of the workflow through which subscribers opt in to the Campaign.
    
</dd>
</dl>

<dl>
<dd>

**helpMessage:** `*string` — Acknowledgement sent when a subscriber texts a help keyword.
    
</dd>
</dl>

<dl>
<dd>

**optinMessage:** `*string` — Acknowledgement sent when a subscriber texts an opt-in keyword.
    
</dd>
</dl>

<dl>
<dd>

**optoutMessage:** `*string` — Acknowledgement sent when a subscriber texts an opt-out keyword.
    
</dd>
</dl>

<dl>
<dd>

**autoRenewal:** `*bool` — Indicates whether the Campaign is automatically renewed at the end of each billing period.
    
</dd>
</dl>

<dl>
<dd>

**optinKeywords:** `*string` — Comma-separated list of opt-in keywords. Keywords are case-insensitive.
    
</dd>
</dl>

<dl>
<dd>

**helpKeywords:** `*string` — Comma-separated list of help keywords. Keywords are case-insensitive.
    
</dd>
</dl>

<dl>
<dd>

**optoutKeywords:** `*string` — Comma-separated list of opt-out keywords. Keywords are case-insensitive.
    
</dd>
</dl>

<dl>
<dd>

**termsConditions:** `*string` — URL of the Campaign terms and conditions.
    
</dd>
</dl>

<dl>
<dd>

**privacyPolicy:** `*string` — URL of the Campaign privacy policy.
    
</dd>
</dl>

<dl>
<dd>

**embeddedLinkSample:** `*string` — Sample of an embedded link used in Campaign messages.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.Campaigns.Delete(BrandID, CampaignID) -> *tendlc.DeleteCampaignsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a 10DLC Campaign. Associated phone numbers cannot be used as Sender IDs once the Campaign is deleted.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.DeleteCampaignsRequest{
        BrandID: "BM20QP9",
        CampaignID: "CKLCK95",
    }
client.TenDlc.Campaigns.Delete(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**campaignID:** `string` — The unique ID of the 10DLC Campaign.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.Campaigns.Nudge(BrandID, CampaignID, request) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requests action on a pending or rejected 10DLC Campaign. Use `nudge_intent` to specify the action: 
- `REVIEW`: Request review for a pending Campaign. - `APPEAL_REJECTION`: Appeal a rejected Campaign.
Note:
- The Campaign must be at least 72 hours old.
- Only one nudge request per Campaign is allowed every 24 hours.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.NudgeCampaignsRequest{
        BrandID: "B9FXYNH",
        CampaignID: "CSJ4TV0",
        NudgeIntent: "REVIEW",
        Description: "Please review the campaign.",
    }
client.TenDlc.Campaigns.Nudge(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**campaignID:** `string` — The unique ID of the 10DLC Campaign.
    
</dd>
</dl>

<dl>
<dd>

**nudgeIntent:** `string` 

Nudge intent. Allowed values: `REVIEW`, `APPEAL_REJECTION`. 
Use `nudge_intent` to specify the action: - `REVIEW`: Request review for a pending Campaign. - `APPEAL_REJECTION`: Appeal a rejected Campaign.
    
</dd>
</dl>

<dl>
<dd>

**description:** `string` — Description of the nudge request.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TenDlc Subscriptions
<details><summary><code>client.TenDlc.Subscriptions.List() -> []*wavixgosdk.TenDlcEventSubscription</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the 10DLC event subscriptions for the authenticated account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.TenDlc.Subscriptions.List(
        context.TODO(),
    )
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.Subscriptions.Create(request) -> *tendlc.CreateSubscriptionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Registers a callback URL to receive Wavix 10DLC event notifications.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &wavixgosdk.TenDlcEventSubscription{
        SubscriptionCategory: "brand",
        URL: "https://webhook.url",
    }
client.TenDlc.Subscriptions.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `*wavixgosdk.TenDlcEventSubscription` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.Subscriptions.Delete() -> *tendlc.DeleteSubscriptionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes the 10DLC event subscription for the specified event category.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.DeleteSubscriptionsRequest{
        SubscriptionCategory: "number",
    }
client.TenDlc.Subscriptions.Delete(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionCategory:** `string` — Event category to unsubscribe from.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TenDlc CampaignNumbers
<details><summary><code>client.TenDlc.CampaignNumbers.Link(BrandID, CampaignID, Number) -> *tendlc.LinkCampaignNumbersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Links a phone number to a 10DLC Campaign. Wavix automatically creates a Sender ID once the number is approved.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.LinkCampaignNumbersRequest{
        BrandID: "B9FXYNH",
        CampaignID: "CSJ4TV0",
        Number: "17029641104",
    }
client.TenDlc.CampaignNumbers.Link(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**campaignID:** `string` — The unique ID of the 10DLC Campaign.
    
</dd>
</dl>

<dl>
<dd>

**number:** `string` — The phone number to link to the Campaign, in E.164 format.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.CampaignNumbers.Unlink(BrandID, CampaignID, Number) -> *tendlc.UnlinkCampaignNumbersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Unlinks a phone number from a 10DLC Campaign. The associated Sender ID is also deleted.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.UnlinkCampaignNumbersRequest{
        BrandID: "B9FXYNH",
        CampaignID: "CSJ4TV0",
        Number: "17029641104",
    }
client.TenDlc.CampaignNumbers.Unlink(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**campaignID:** `string` — The unique ID of the 10DLC Campaign.
    
</dd>
</dl>

<dl>
<dd>

**number:** `string` — The phone number to unlink from the Campaign, in E.164 format.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TenDlc.CampaignNumbers.List(BrandID, CampaignID) -> *tendlc.ListCampaignNumbersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the phone numbers linked to the 10DLC Campaign identified by `campaign_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &tendlc.ListCampaignNumbersRequest{
        BrandID: "B9FXYNH",
        CampaignID: "CSJ4TV0",
    }
client.TenDlc.CampaignNumbers.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**brandID:** `string` — The unique ID of the 10DLC Brand.
    
</dd>
</dl>

<dl>
<dd>

**campaignID:** `string` — The unique ID of the 10DLC Campaign.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TwoFa Verification
<details><summary><code>client.TwoFa.Verification.Create(request) -> *twofa.CreateVerificationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a 2FA verification and sends a one-time password (OTP) to the destination phone number over the selected channel. Requires a 2FA service configured in the Wavix portal; the service is reused to generate and validate OTPs.

The verification proceeds through three steps:
1. Create a verification to generate and send an OTP.
2. Resend the OTP on the same verification if needed.
3. Validate the OTP through the check endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &twofa.TwoFactorVerificationCreateRequest{
        ServiceID: "7204a030201211ee9fb47d093f2f127c",
        To: "447919433768",
        Channel: "sms",
    }
client.TwoFa.Verification.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**serviceID:** `string` — Unique Wavix 2FA Service ID. Available on the Wavix portal.
    
</dd>
</dl>

<dl>
<dd>

**to:** `string` — End user's phone number to which the verification code will be sent. The phone number must be in E.164 format.
    
</dd>
</dl>

<dl>
<dd>

**channel:** `string` — Channel used to deliver the verification code. One of `sms` (sent as a text message) or `voice` (read aloud over a phone call).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TwoFa.Verification.Resend(SessionID, request) -> *twofa.ResendVerificationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Resends the OTP for the verification identified by `session_id` over the specified channel. Previously sent codes are invalidated.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &twofa.TwoFactorVerificationResendRequest{
        SessionID: "2953d4308f2e11ecb75fcdafd6d2d687",
        Channel: twofa.TwoFactorVerificationResendRequestChannelSms,
    }
client.TwoFa.Verification.Resend(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sessionID:** `string` — The unique ID of the 2FA verification session.
    
</dd>
</dl>

<dl>
<dd>

**channel:** `*twofa.TwoFactorVerificationResendRequestChannel` — Channel used to resend the verification code. One of `sms` (sent as a text message) or `voice` (read aloud over a phone call).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TwoFa.Verification.Check(SessionID, request) -> *twofa.CheckVerificationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validates the OTP submitted by the end user against the verification identified by `session_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &twofa.TwoFactorVerificationCheckRequest{
        SessionID: "2953d4308f2e11ecb75fcdafd6d2d687",
        Code: "123456",
    }
client.TwoFa.Verification.Check(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sessionID:** `string` — The unique ID of the 2FA verification session.
    
</dd>
</dl>

<dl>
<dd>

**code:** `string` — The code entered by an end user
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TwoFa.Verification.Cancel(SessionID) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels the 2FA verification identified by `session_id`. No further codes are sent, and previously sent codes can no longer be validated. A new verification is required to send another code.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &twofa.CancelVerificationRequest{
        SessionID: "2953d4308f2e11ecb75fcdafd6d2d687",
    }
client.TwoFa.Verification.Cancel(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sessionID:** `string` — The unique ID of the 2FA verification session.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TwoFa Sessions
<details><summary><code>client.TwoFa.Sessions.List(ServiceID) -> []*wavixgosdk.ListSessionsResponseItem</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the 2FA verifications for the service identified by `service_id`, within the requested date range.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &twofa.ListSessionsRequest{
        ServiceID: "7204a030201211ee9fb47d093f2f127c",
        From: wavixgosdk.MustParseDate(
            "2022-01-01",
        ),
        To: wavixgosdk.MustParseDate(
            "2022-01-31",
        ),
    }
client.TwoFa.Sessions.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**serviceID:** `string` — The unique ID of the 2FA service.
    
</dd>
</dl>

<dl>
<dd>

**from:** `time.Time` — Start of the date range to query, in `YYYY-MM-DD` format. Inclusive.
    
</dd>
</dl>

<dl>
<dd>

**to:** `time.Time` — End of the date range to query, in `YYYY-MM-DD` format. Inclusive.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TwoFa Events
<details><summary><code>client.TwoFa.Events.List(SessionID) -> []*wavixgosdk.TwoFactorVerificationEvent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the lifecycle events of the 2FA verification identified by `session_id`, such as number lookup and code delivery.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &twofa.ListEventsRequest{
        SessionID: "8753d4308f2e11ecb75fcdafd6d2d690",
    }
client.TwoFa.Events.List(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sessionID:** `string` — The unique ID of the 2FA verification session.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Webrtc Tokens
<details><summary><code>client.Webrtc.Tokens.List() -> *wavixgosdk.WebRtcTokensListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of active Wavix Embeddable widget tokens for the authenticated account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
client.Webrtc.Tokens.List(
        context.TODO(),
    )
}
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webrtc.Tokens.Create(request) -> *wavixgosdk.WebRtcTokenResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a Wavix Embeddable widget token that authenticates a browser-based softphone session. The token expires after `ttl` seconds.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &webrtc.WebRtcTokenCreateRequest{
        SipTrunk: "my-sip-trunk",
        Payload: map[string]any{
            "user_id": "42",
        },
        TTL: wavixgosdk.Int(
            3600,
        ),
    }
client.Webrtc.Tokens.Create(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sipTrunk:** `string` — Name of the SIP trunk the token authenticates against.
    
</dd>
</dl>

<dl>
<dd>

**payload:** `map[string]any` — Arbitrary client-defined data to associate with the token.
    
</dd>
</dl>

<dl>
<dd>

**ttl:** `*int` — Time to live in seconds. Pass `null` for no expiration.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webrtc.Tokens.Get(ID) -> *wavixgosdk.WebRtcToken</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the Wavix Embeddable widget token identified by `id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &webrtc.GetTokensRequest{
        ID: "id",
    }
client.Webrtc.Tokens.Get(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `string` — The UUID of the widget token to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webrtc.Tokens.Update(ID, request) -> *wavixgosdk.WebRtcToken</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the `payload` carried by the Wavix Embeddable widget token identified by `id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &webrtc.WebRtcTokenUpdateRequest{
        ID: "id",
        Payload: map[string]any{
            "key": "value",
        },
    }
client.Webrtc.Tokens.Update(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `string` — The UUID of the widget token to update.
    
</dd>
</dl>

<dl>
<dd>

**payload:** `map[string]any` — Arbitrary client-defined data to associate with the token, replacing the existing payload.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webrtc.Tokens.Delete(ID) -> *wavixgosdk.SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the Wavix Embeddable widget token identified by `id`. The token can no longer authenticate widget sessions, and any active session using it ends.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```go
request := &webrtc.DeleteTokensRequest{
        ID: "id",
    }
client.Webrtc.Tokens.Delete(
        context.TODO(),
        request,
    )
}
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `string` — The UUID of the widget token to delete.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

