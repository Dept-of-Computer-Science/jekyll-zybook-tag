# Zybooks Liquid Tag Plugin


This allows a link to the most recent version of zybooks, without having to 
change links throughout the entire website. Instead the link updates based on the contents 
of the _config.yml direction.

## Setup
Make sure the _config.yml includes the line zybook, and book-id

```yaml
zybook:  
  book_id: "COLOSTATECS1634Summer2020"
```
Replace COLOSTATE... with your latest book ID, that is find in the URL of the book. For example:

```
https://learn.zybooks.com/zybook/COLOSTATECS1634Summer2020/`
```


## Usage

```
{% zybook chapter:x section:x %}Link text{% endzybook %}
```

For example:
```
{% zybook chapter:13 section:2 %}Loops{%endzybook%}
```
would create the following link (assuming Summer Book)
```html
<a href="https://learn.zybooks.com/zybook/COLOSTATECS1634Summer2020/chapter/13/section/2" target="_blank">Loops</a>
```

Arguments are optional, possible arguments are as follows:

* chapter  
  defaults to nothing, directing the link to the zybook TOC if omitted
* section  
  defaults to 1 
* resource_id  
  for the content_resource_id in links, defaults to nothing
  
The text between the tag block is used for the link text.

## _config.yml options
All arguments can also be included in the _config.yml. They will
be used as default arguments, but local (placing in the tag) use overwrites
the _config.yml setting. In most cases, the only option 
in _config.yml that makes sense is `book-id`.