mt-plugin-DataAPIExtendSearch
=============================

You can filter entries by tag, category and date.

## Tag filter

| Parameter | Type | Description |
|:--|:--|:--|
| tag | string |  |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?tag=news

## Category filter

| Parameter | Type | Description |
|:--|:--|:--|
| category | string |  |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?category=technology

## Date filter

| Parameter | Type | Description |
|:--|:--|:--|
| date_type | string |  authored_on, created_on, modified_on or unpublished_on |

###  Range

| Parameter | Type | Description |
|:--|:--|:--|
| date_type | string |  authored_on, created_on, modified_on or unpublished_on |
| from | string | YYYY-MM-DD |
| to | string | YYYY-MM-DD |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?date_type=authored_on&from=2013-01-01&to=2013-12-31

###  Days

| Parameter | Type | Description |
|:--|:--|:--|
| date_type | string |  authored_on, created_on, modified_on or unpublished_on |
| days | number | N |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?date_type=authored_on&days=3

###  Before

| Parameter | Type | Description |
|:--|:--|:--|
| date_type | string |  authored_on, created_on, modified_on or unpublished_on |
| before | string | YYYY-MM-DD |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?date_type=authored_on&before=2013-12-31

###  After

| Parameter | Type | Description |
|:--|:--|:--|
| date_type | string |  authored_on, created_on, modified_on or unpublished_on |
| after | string | YYYY-MM-DD |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?date_type=authored_on&after=2013-01-01

###  Future

| Parameter | Type | Description |
|:--|:--|:--|
| date_type | string |  authored_on |
| future | number | '1' only |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?date_type=authored_on&future=1

###  Past

| Parameter | Type | Description |
|:--|:--|:--|
| date_type | string |  authored_on |
| past | number | '1' only |

e.g.)
http://your-host/your-mt-api.cgi/v1/sites/{blog_id}/entries?date_type=authored_on&past=1

