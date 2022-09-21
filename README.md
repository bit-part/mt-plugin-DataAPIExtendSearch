mt-plugin-DataAPIExtendSearch
=============================

## Overview

Add filters by Tag, Category and Date to Data API Endpoint of Entries and Content Data.

## Prerequisites

* Movable Type 7

## Installation

1. Unpack the DataAPIExtendSearch's archive.
1. Copy the contents of plugins/DataAPIExtendSearch into /path/to/mt/plugins/

## Filters

### Tag filter (Only for Entries)

| Parameter | Type   | Description |
|-----------|--------|-------------|
| tag       | string |             |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?tag=news

### Category filter (Only for Entries)

| Parameter | Type   | Description |
|-----------|--------|-------------|
| category  | string |             |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?category=technology

### Date filter

| Parameter | Type   | Description                                            |
|-----------|--------|--------------------------------------------------------|
| date_type | string | authored_on, created_on, modified_on or unpublished_on |

####  Range

| Parameter | Type   | Description                                            |
|-----------|--------|--------------------------------------------------------|
| date_type | string | authored_on, created_on, modified_on or unpublished_on |
| from      | string | YYYY-MM-DD                                             |
| to        | string | YYYY-MM-DD                                             |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?date_type=authored_on&from=2013-01-01&to=2013-12-31

####  Days

| Parameter | Type   | Description                                            |
|-----------|--------|--------------------------------------------------------|
| date_type | string | authored_on, created_on, modified_on or unpublished_on |
| days      | number | N                                                      |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?date_type=authored_on&days=3

####  Before

| Parameter | Type   | Description                                            |
|-----------|--------|--------------------------------------------------------|
| date_type | string | authored_on, created_on, modified_on or unpublished_on |
| before    | string | YYYY-MM-DD                                             |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?date_type=authored_on&before=2013-12-31

####  After

| Parameter | Type   | Description                                            |
|-----------|--------|--------------------------------------------------------|
| date_type | string | authored_on, created_on, modified_on or unpublished_on |
| after     | string | YYYY-MM-DD                                             |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?date_type=authored_on&after=2013-01-01

####  Future

| Parameter | Type   | Description |
|-----------|--------|-------------|
| date_type | string | authored_on |
| future    | number | '1' only    |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?date_type=authored_on&future=1

####  Past

| Parameter | Type   | Description |
|-----------|--------|-------------|
| date_type | string | authored_on |
| past      | number | '1' only    |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?date_type=authored_on&past=1  
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?date_type=authored_on&past=1

### Author Name filter (Only for Entries)

| Parameter   | Type   | Description |
|-------------|--------|-------------|
| author_name | string |             |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?author_name=bitpart

### Label filter (Only for Content Data)

Note: Label means "Data Label".

| Parameter | Type   | Description |
|-----------|--------|-------------|
| label     | string |             |

e.g.)
http://your-host/your-mt-api.cgi/v4/sites/{blog_id}/content?label=bitpart

### Identifier filter (Only for Content Data)

Note: Identifier is called "Basename" in Entry.

| Parameter | Type   | Description |
|-----------|--------|-------------|
| label     | string |             |

e.g.)
http://your-host/your-mt-api.cgi/v4/sites/{blog_id}/content?identifier=bitpart

## Endpoint

### /sites/:site_id/contentTypes/:content_type_id/dataExtend

- sortFieldName: The name of a content field to use to sort
- sortFieldNameOrder: `ascend` or `descend` (default)
- fields: The field list to retrieve as part of the content data resource. That list should be separated by comma. If this parameter is not specified, All fields will be returned.
- includeIds: The comma separated ID list of content data to include to result.
- excludeIds: The comma separated ID list of content data to exclude from result.
- content_field_[content_field_id]: Filtering the result with a specific content field by the given text (Only support for the text type content field)
- content_field_[content_field_id]=not_empty: Filtering data that a specific content field is not empty
