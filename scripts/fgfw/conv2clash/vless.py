import sys
from urllib.parse import urlparse, parse_qsl
import json

# https://github.com/XTLS/Xray-core/discussions/716
"""
protocol://
  $(uuid)
  @
  remote-host
  :
  remote-port
  ?
  <protocol-specific fields>
  <transport-specific fields>
  <tls-specific fields>
#$(descriptive-text)
"""
def vless2clash(url):
    if url[:8] != "vless://":
        print(f"{url[:8]} != 'vless://'", file=sys.stderr)

    vless_info = urlparse(url)

    clash_dict = {"type": "vless"}
    clash_dict["name"] = vless_info.fragment
    uuid, socket = vless_info.netloc.split('@')

    clash_dict["uuid"] = uuid
    ip, port = socket.split(':')
    clash_dict["server"] = ip
    clash_dict["port"] = int(port)
    vless_protocol_info = dict(parse_qsl(vless_info.query))
    clash_dict["udp"] = True
    clash_dict["tls"] = True
    # NOTE: should use for loop iterate `vless_protocol_info`
    clash_dict["servername"] = vless_protocol_info["sni"]
    clash_dict["flow"] = vless_protocol_info["flow"]
    clash_dict["network"] = vless_protocol_info["type"]
    clash_dict["client-fingerprint"] = vless_protocol_info["fp"]

    if vless_protocol_info["security"] == "reality":
        clash_dict["reality-opts"] = {}
        clash_dict["reality-opts"]["public-key"] = vless_protocol_info["pbk"]

    return clash_dict["name"], json.dumps(clash_dict, ensure_ascii=False)


if __name__ == "__main__":
    pass
