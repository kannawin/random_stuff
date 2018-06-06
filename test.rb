require './ASMConfig'
#require '/var/lib/gems/2.3.0/gems/render-0.1.3/lib/render.rb'

verbose = true

url = ASM::API::URI('/ManagedDevice')
url1 = ASM::API::URI('/Server')
url2 = ASM::API::URI('/Network')

response = ASM::API::sign {
 RestClient.get url, :accept=>:json
}

response1 = ASM::API::sign{
 RestClient.get url1, :accept=>:json
}

response2 = ASM::API::sign{
 RestClient.get url2, :accept=>:json
}


payload = ASM::Payload.from_json(response)
payload1 = ASM::Payload.from_json(response1)
payload2 = ASM::Payload.from_json(response2)

pay1 = JSON.parse(response1)
pay1.each do |j|
 j.delete("config")
 j.delete("bios")
 j.delete("facts")
 j.delete("enclosures")
 j.delete("face")
end

pay = JSON.parse(response)
pay.each do |j|
 j.delete("facts")
end


pay2 = JSON.parse(response2)
pay.each do |j|
 j.delete("facts")
end



if verbose
  tags = ['refId','displayName','deviceType','serviceTag','model','health','ipAddress','cpuType','nics','memoryInGB','hostname']
  serverTags = ['refId','refType','displayName','deviceType','managementIP']
  sortKey = 'deviceType'
  payload.print_table_when_json(tags,sortKey)
  payload1.print_table_when_json(serverTags,sortKey)
end

outf = File.open("./xml_payloads/managed_devices.json",'w')
outf.write(pay.to_json)
print "\nJSON document saved\n"

outf = File.open("./xml_payloads/server.json",'w')
outf.write(pay1.to_json)
print "\nJSON DOC\n"

outf = File.open("./xml_payloads/network.json",'w')
outf.write(pay2.to_json)
print "\nNETWORK document saved\n"

