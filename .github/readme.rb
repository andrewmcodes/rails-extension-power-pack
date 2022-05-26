require "json"

def get_extension_names(filename)
  JSON.parse(File.read(filename))["extensionPack"]
end

@arr = []

get_extension_names("package.json").each do |extension_name|
  extension_json = JSON.parse(`vsce show #{extension_name} --json`)

  link = "https://marketplace.visualstudio.com/items?itemName=#{extension_name}"
  badge = "https://vsmarketplacebadge.apphb.com/version-short/#{extension_name}.svg"
  name = extension_json["displayName"]
  desc = extension_json["shortDescription"]

  @arr << "| [#{name}](#{link}) | [![#{name}](#{badge})](#{link}) | #{desc} |"
end

puts @arr.join("\n")
