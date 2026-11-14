import io
import os
import json
import sys
import base64

# https://github.com/2dust/v2rayN/wiki/%E5%88%86%E4%BA%AB%E9%93%BE%E6%8E%A5%E6%A0%BC%E5%BC%8F%E8%AF%B4%E6%98%8E(ver-2)
"""Clash for vmess
# vmess
# cipher 支持 auto/aes-128-gcm/chacha20-poly1305/none
- name: "vmess"
type: vmess
server: server
port: 443
uuid: uuid
alterId: 32
cipher: auto
# udp: true
# tls: true
# fingerprint: xxxx
# client-fingerprint: chrome    # Available: "chrome","firefox","safari","ios","random", currently only support TLS transport in TCP/GRPC/WS/HTTP for VLESS/Vmess and trojan.
# skip-cert-verify: true
# servername: example.com # priority over wss host
# network: ws
# ws-opts:
    # path: /path
    # headers:
    #   Host: v2ray.com
    # max-early-data: 2048
    # early-data-header-name: Sec-WebSocket-Protocol
    # v2ray-http-upgrade: false
    # v2ray-http-upgrade-fast-open: false
"""
def vmess2clash(url):
    if url[:8] != "vmess://":
        print(f"{url[:8]} != 'vmess://'", file=sys.stderr)
        return None, None

    vmess_dict = json.loads(base64.b64decode(url[8:]).decode('utf-8'))

    # dict_keys(['v', 'ps', 'add', 'port', 'id', 'aid', 'net', 'type', 'host', 'path', 'tls'])
    # TODO: unhandled `type` `host`

    if str(vmess_dict["v"].strip()) != "2":
        print(f"The vmess://base64 version is {vmess_dict['v']}, which is not supported!!!", file=sys.stderr)
        print(f"The vmess is `{url}`", file=sys.stderr)
        return None, None

    clash_dict = {"type": "vmess"}
    clash_dict["name"] = vmess_dict["ps"]
    clash_dict["server"] = vmess_dict["add"]
    clash_dict["port"] = vmess_dict["port"]
    clash_dict["uuid"] = vmess_dict["id"]
    clash_dict["alterId"] = vmess_dict["aid"]
    # cipher 支持 auto/aes-128-gcm/chacha20-poly1305/none
    cipher = vmess_dict.get("scy")
    clash_dict["cipher"] = cipher if cipher != None else "auto"
    # clash_dict["udp"]  TODO:
    clash_dict["tls"] = True if vmess_dict["tls"] == "tls" else False
    fingerprint = vmess_dict.get("fp")
    if fingerprint != None:
        clash_dict["fingerprint"] = fingerprint
    # clash_dict["client-fingerprint"]  TODO:
    clash_dict["skip-cert-verify"] = True
    # clash_dict["servername"]  TODO:
    if vmess_dict["net"] == "ws":
        clash_dict["network"] = "ws"
        clash_dict["ws-opts"] = {}
        path = vmess_dict.get("path")
        clash_dict["ws-opts"]["path"] = "/" if path == None else path
    else:
        print(f"The vmess link `net` == {vmess_dict['net']}, which is not handled", file=sys.stderr)
        print(f"The vmess is `{url}`", file=sys.stderr)
        return None, None

    return clash_dict["name"], json.dumps(clash_dict, ensure_ascii=False)


if __name__ == "__main__":
    pass
