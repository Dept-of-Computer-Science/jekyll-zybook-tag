## Plugins

Various plugins specific to the department / this course. Eventually, both this and style should
be moved into a department wide gem. 


### Zybooks Liquid Tag Plugin

This allows us to link to the most current version of zybooks, when referencing chapters in our 
lab write-ups or other parts of the course. Usage

```
{% zybook chapter:x section:x %}{% endzybook %}

For example:
{% zybook chapter:13 section:2 %}Loops{%endzybook%}

would create the following link (assuming Summer Book)
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
