import os
import sys
import json

const_header_payload = """
mixed-port: 7890 # HTTP(S) 和 SOCKS 代理混合端口
udp: false
ipv6: true
allow-lan: false # 不允许局域网连接
bind-address: '*'
mode: rule
log-level: info

external-controller: 0.0.0.0:9090
external-ui: /home/jsj/.config/mihomo/dashboard
unified-delay: true # TODO: don't know what this mean
secret: ''

# Clash for Windows
# Proxies module latency test settings
# TODO: Maybe don't need these cfw-* settings
cfw-latency-timeout: 8000
cfw-latency-url: 'http://YouTube.com/generate_204'

hosts:
  baidu.com: google.com  # Seems didn't work

dns:
  enable: true
  listen: '127.0.0.1:1053'
  default-nameserver: [114.114.114.114, 223.5.5.5, 119.29.29.29]
  ipv6: true
  enhanced-mode: fake-ip
  fake-ip-range: 198.18.0.1/16 # fake-ip 池设置
  use-hosts: true # 查询 hosts
  fake-ip-filter: ['*.lan', '*.localdomain', '*.example', '*.invalid', '*.localhost', '*.test', '*.local', '*.home.arpa', 'time.*.com', 'time.*.gov', 'time.*.edu.cn', 'time.*.apple.com', 'time1.*.com', 'time2.*.com', 'time3.*.com', 'time4.*.com', 'time5.*.com', 'time6.*.com', 'time7.*.com', 'ntp.*.com', 'ntp1.*.com', 'ntp2.*.com', 'ntp3.*.com', 'ntp4.*.com', 'ntp5.*.com', 'ntp6.*.com', 'ntp7.*.com', '*.time.edu.cn', '*.ntp.org.cn', +.pool.ntp.org, time1.cloud.tencent.com, music.163.com, '*.music.163.com', '*.126.net', musicapi.taihe.com, music.taihe.com, songsearch.kugou.com, trackercdn.kugou.com, '*.kuwo.cn', api-jooxtt.sanook.com, api.joox.com, joox.com, y.qq.com, '*.y.qq.com', streamoc.music.tc.qq.com, mobileoc.music.tc.qq.com, isure.stream.qqmusic.qq.com, dl.stream.qqmusic.qq.com, aqqmusic.tc.qq.com, amobile.music.tc.qq.com, '*.xiami.com', '*.music.migu.cn', music.migu.cn, +.msftconnecttest.com, +.msftncsi.com, msftconnecttest.com, msftncsi.com, localhost.ptlogin2.qq.com, localhost.sec.qq.com, +.srv.nintendo.net, +.stun.playstation.net, 'xbox.*.microsoft.com', xnotify.xboxlive.com, +.ipv6.microsoft.com, +.battlenet.com.cn, +.wotgame.cn, +.wggames.cn, +.wowsgame.cn, +.wargaming.net, proxy.golang.org, 'stun.*.*', 'stun.*.*.*', '+.stun.*.*', '+.stun.*.*.*', '+.stun.*.*.*.*', heartbeat.belkin.com, '*.linksys.com', '*.linksyssmartwifi.com', '*.router.asus.com', mesu.apple.com, swscan.apple.com, swquery.apple.com, swdownload.apple.com, swcdn.apple.com, swdist.apple.com, lens.l.google.com, stun.l.google.com, '*.square-enix.com', '*.finalfantasyxiv.com', '*.ffxiv.com', '*.ff14.sdo.com', ff.dorado.sdo.com, '*.mcdn.bilivideo.cn', +.media.dssott.com, +.pvp.net]
  nameserver: ['tls://223.5.5.5:853', 'tls://223.6.6.6:853', 'https://doh.pub/dns-query', 'https://dns.alidns.com/dns-query']
"""

proxies_prefix = "proxies:\n"  # TODO:
proxies = []

# action: 0 -> prepend 1 -> append
pg_action = {
        "节点选择": {"index": 0, "action": 0},
        "国外媒体": {"index": 1, "action": 1},
        "电报信息": {"index": 2, "action": 1},
        "微软服务": {"index": 3, "action": 1},
        "苹果服务": {"index": 4, "action": 1},
        "漏网之鱼": {"index": 8, "action": 1},
        }
proxy_groups_prefix = "proxy-groups:\n"  # TODO:
proxy_groups = [
    # TODO: 自动选择
    {"name": "节点选择", "type": "select", "proxies": ["DIRECT"]}, # 0
    {"name": "国外媒体", "type": "select", "proxies": ["节点选择", "全球直连"]}, # 1
    {"name": "电报信息", "type": "select", "proxies": ["节点选择", "全球直连"]}, # 2
    {"name": "微软服务", "type": "select", "proxies": ["全球直连", "节点选择"]}, # 3
    {"name": "苹果服务", "type": "select", "proxies": ["全球直连", "节点选择"]}, # 4
    {"name": "全球直连", "type": "select", "proxies": ["DIRECT", "节点选择"]}, # 5
    {"name": "全球拦截", "type": "select", "proxies": ["REJECT", "DIRECT"]}, # 6
    {"name": "应用净化", "type": "select", "proxies": ["REJECT", "DIRECT"]}, # 7
    {"name": "漏网之鱼", "type": "select", "proxies": ["节点选择", "全球直连"]}, # 8
]

def write_rules(wfile):
    rules_file_p = os.path.expanduser("~/dots/scripts/fgfw/conv2clash/clash-rules.yaml")
    with open(rules_file_p, mode = 'r') as rf:
        lines = rf.readlines()
        wfile.writelines(lines)

def gen_clash_conf(opath):
    with open(opath, mode="w") as ofile:
        ofile.write(const_header_payload)
        ofile.write(proxies_prefix)
        for node in proxies:
            ofile.write("  - " + node + "\n")

        ofile.write("\n")
        ofile.write(proxy_groups_prefix)
        for node in proxy_groups:
            ofile.write("  - " + json.dumps(node, ensure_ascii=False) + "\n")

        ofile.write("\n")
        write_rules(ofile)



def append_node(name, node):
    for node_name in pg_action.keys():
        action = pg_action[node_name]["action"]
        index = pg_action[node_name]["index"]
        if action == 0:
            proxy_groups[index]["proxies"].insert(0, name)
        elif action == 1:
            proxy_groups[index]["proxies"].append(name)
        else:
            print(f"not supported action number: {action}", file=sys.stderr)
            return
    proxies.append(node)


if __name__ == "__main__":
    pass
