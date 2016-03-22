Mime::Type.register "text/richtext", :rtf unless Mime::Type.lookup_by_extension(:rtf)
Mime::Type.register "application/xls", :xls unless Mime::Type.lookup_by_extension(:xls)
