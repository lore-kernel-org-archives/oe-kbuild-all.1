Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D40410EC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 05:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693287204; x=1724823204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ZkGzMpTxPw+mPzdbIwY7wFhVqSsEYeihK3NEHKEl/c=;
  b=ab+wa/Fck3Wu8NTM9+t/IROHAee+W8gPK7rE9kTr6tPxhKaei5rFqYH3
   FmxJIOw8A87jOD4m+sM6VcF1MDVQPpNw4EBLJWR5e3WbdlqbLfzIahUWk
   eBE53kEDEqYH3S/XJCgyp4aNqLyBfZ98Zxeu9hAQv3jj2Fy6fWlZLyC8u
   NHJ5JmiOHQZYT6jAcF+4RIx4Kl9iGpWavKVeX6tG0kJogF3dS6qwYFn1w
   eKxhAmy0Fxx82aPoyM9bJdridCyzc1pn04vA2WkSGDSnLMbbYN2aMNZsL
   hHpBqzL/jy7J/g8esbW6WxP5hhoAECyXskTwHbkw5a2H6q02W27Ch0/FJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="375245977"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="375245977"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 22:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="862107103"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="862107103"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Aug 2023 22:33:21 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qarLs-0008Qz-1i;
	Tue, 29 Aug 2023 05:33:20 +0000
Date: Tue, 29 Aug 2023 13:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 23/71]
 include/trace/events/cros_net.h:78:1: sparse: sparse: cast to restricted
 __be32
Message-ID: <202308291300.AOKTUptJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   7882f1fe23d8f51c203639247f05f3f5771252ae
commit: cf03856077b0b4e18302987c619843341eb855d2 [23/71] CHROMIUM: add new cros_net tracepoints
config: i386-randconfig-062-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291300.AOKTUptJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291300.AOKTUptJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291300.AOKTUptJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv4/af_inet.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/cros_net.h):
>> include/trace/events/cros_net.h:78:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/cros_net.h:78:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/cros_net.h:78:1: sparse: sparse: restricted __be32 degrades to integer
>> include/trace/events/cros_net.h:78:1: sparse: sparse: restricted __be32 degrades to integer
>> include/trace/events/cros_net.h:78:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/cros_net.h:78:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/cros_net.h:78:1: sparse: sparse: restricted __be32 degrades to integer
>> include/trace/events/cros_net.h:78:1: sparse: sparse: restricted __be32 degrades to integer
   include/trace/events/cros_net.h:123:1: sparse: sparse: cast to restricted __be32
   include/trace/events/cros_net.h:123:1: sparse: sparse: cast to restricted __be32
   include/trace/events/cros_net.h:123:1: sparse: sparse: restricted __be32 degrades to integer
   include/trace/events/cros_net.h:123:1: sparse: sparse: restricted __be32 degrades to integer
   include/trace/events/cros_net.h:123:1: sparse: sparse: cast to restricted __be32
   include/trace/events/cros_net.h:123:1: sparse: sparse: cast to restricted __be32
   include/trace/events/cros_net.h:123:1: sparse: sparse: restricted __be32 degrades to integer
   include/trace/events/cros_net.h:123:1: sparse: sparse: restricted __be32 degrades to integer
   net/ipv4/af_inet.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/cros_net.h):
   include/trace/events/cros_net.h:195:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:195:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:195:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:195:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:195:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:195:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:195:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:195:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:195:1: sparse:     got restricted __be32 [usertype] skc_daddr
   include/trace/events/cros_net.h:227:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:227:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:227:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:227:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:227:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:227:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:227:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:227:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:227:1: sparse:     got restricted __be32 [usertype] skc_daddr
   include/trace/events/cros_net.h:263:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:263:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:263:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:263:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:263:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:263:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:263:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:263:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:263:1: sparse:     got restricted __be32 [usertype] skc_daddr
   include/trace/events/cros_net.h:300:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:300:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:300:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:300:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:300:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:300:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:300:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:300:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:300:1: sparse:     got restricted __be32 [usertype] skc_daddr
   include/trace/events/cros_net.h:336:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:336:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:336:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:336:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:336:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:336:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:336:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:336:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:336:1: sparse:     got restricted __be32 [usertype] skc_daddr
   include/trace/events/cros_net.h:372:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:372:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:372:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:372:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:372:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:372:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:372:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:372:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:372:1: sparse:     got restricted __be32 [usertype] skc_daddr
   net/ipv4/af_inet.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, include/trace/events/cros_net.h):
   include/trace/events/cros_net.h:195:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:195:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:195:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:195:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:195:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:195:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:195:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:195:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:195:1: sparse:     got restricted __be32 [usertype] skc_daddr
   include/trace/events/cros_net.h:227:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:227:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:227:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:227:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:227:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:227:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:227:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:227:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:227:1: sparse:     got restricted __be32 [usertype] skc_daddr
   include/trace/events/cros_net.h:263:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:263:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:263:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:263:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:263:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:263:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:263:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:263:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:263:1: sparse:     got restricted __be32 [usertype] skc_daddr
   include/trace/events/cros_net.h:300:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:300:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:300:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:300:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:300:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:300:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:300:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:300:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:300:1: sparse:     got restricted __be32 [usertype] skc_daddr

vim +78 include/trace/events/cros_net.h

    17	
    18	
    19	#define CROS_NET_FILL_ADDR_PORT(sk, entry)\
    20		do {							\
    21			entry->sport = sk->__sk_common.skc_num;		\
    22			entry->saddr4 = sk->__sk_common.skc_rcv_saddr;	\
    23			entry->dport = sk->__sk_common.skc_dport;	\
    24			entry->daddr4 = sk->__sk_common.skc_daddr;	\
    25			entry->protocol = sk->sk_protocol;		\
    26		} while (0)
    27		//protocol is also avable in sk_buff
    28		//skb_network_header from skba
    29		// struct iphdr *ip_header = (struct iphdr *) (skb_network_header(skb))
    30	#define CROS_IP_PROTOCOL_NAME(val) { IPPROTO_#val, #val }
    31	#define CROS_SHOW_IP_PROTOCOL(val)				\
    32		__print_symbolic(val,					\
    33			{IPPROTO_UDP, "UDP"},				\
    34			{IPPROTO_TCP, "TCP"},				\
    35			{IPPROTO_ICMP, "ICMP"},				\
    36			{IPPROTO_RAW, "RAW"})
    37	
    38	TRACE_EVENT(cros_ip6_finish_output2_enter,
    39		TP_PROTO(struct net *net, struct sock *sk, struct sk_buff *skb),
    40		TP_ARGS(net, sk, skb),
    41		TP_STRUCT__entry(
    42			__array(__u8, saddr, 16)
    43			__array(__u8, daddr, 16)
    44			__array(char, dev_name, IFNAMSIZ)
    45		),
    46		TP_fast_assign(
    47			struct ipv6hdr *ip_header = (struct ipv6hdr *)(skb_network_header(skb));
    48			struct net_device *dev;
    49	
    50			memmove(__entry->saddr, ip_header->saddr.in6_u.u6_addr8, 16);
    51			memmove(__entry->daddr, ip_header->daddr.in6_u.u6_addr8, 16);
    52			dev = ((struct dst_entry *)(skb->_skb_refdst & SKB_DST_PTRMASK))->dev;
    53			strscpy(__entry->dev_name, dev->name, IFNAMSIZ);
    54		),
    55		TP_printk("do_not_depend:%pI6c %pI6c %s", __entry->saddr, __entry->daddr,
    56			  __entry->dev_name))
    57	
    58	TRACE_EVENT(cros_ip6_input_finish_enter,
    59		TP_PROTO(struct net *net, struct sock *sk, struct sk_buff *skb),
    60		TP_ARGS(net, sk, skb),
    61		TP_STRUCT__entry(
    62			__array(__u8, saddr, 16)
    63			__array(__u8, daddr, 16)
    64			__array(char, dev_name, IFNAMSIZ)
    65		),
    66		TP_fast_assign(
    67			struct ipv6hdr *ip_header = (struct ipv6hdr *)(skb_network_header(skb));
    68			struct net_device *dev;
    69	
    70			memmove(__entry->saddr, ip_header->saddr.in6_u.u6_addr8, 16);
    71			memmove(__entry->daddr, ip_header->daddr.in6_u.u6_addr8, 16);
    72			dev = skb->dev;
    73			strscpy(__entry->dev_name, dev->name, IFNAMSIZ);
    74		),
    75		TP_printk("do_not_depend:%pI6c %pI6c %s", __entry->saddr, __entry->daddr,
    76			  __entry->dev_name))
    77	
  > 78	TRACE_EVENT(cros_ip_protocol_deliver_rcu_enter,
    79		TP_PROTO(struct net *net, struct sk_buff *skb, int protocol),
    80		TP_ARGS(net, skb, protocol),
    81		TP_STRUCT__entry(
    82			__field(__be32, saddr)
    83			__field(__be32, daddr)
    84			__array(char, dev_name, IFNAMSIZ)
    85			__field(int, dev_if)
    86			__field(short, source_port)
    87			__field(short, dest_port)
    88			__field(int, proto)
    89		),
    90		TP_fast_assign(
    91			struct iphdr *ip_header = (struct iphdr *)(skb->head + skb->network_header);
    92			char *transport = (char *)(skb->head + skb->transport_header);
    93			struct tcphdr *tcp = (struct tcphdr *)transport;
    94			struct udphdr *udp = (struct udphdr *)transport;
    95			struct net_device *dev;
    96			bool has_transport = skb->transport_header != (typeof(skb->transport_header))~0U;
    97	
    98			__entry->saddr = ip_header->saddr;
    99			__entry->daddr = ip_header->daddr;
   100			__entry->proto = ip_header->protocol;
   101			if (has_transport) {
   102				switch (ip_header->protocol) {
   103				case IPPROTO_TCP:
   104					__entry->source_port = ntohs(tcp->source);
   105					__entry->dest_port = ntohs(tcp->dest);
   106					break;
   107				case IPPROTO_UDP:
   108					__entry->source_port = ntohs(udp->source);
   109					__entry->dest_port = ntohs(udp->dest);
   110					break;
   111				default:
   112					break;
   113				};
   114			}
   115			dev = ((struct dst_entry *)(skb->_skb_refdst & SKB_DST_PTRMASK))->dev;
   116			strscpy(__entry->dev_name, dev->name, IFNAMSIZ);
   117			__entry->dev_if = dev->ifindex;
   118		),
   119		TP_printk("do_not_depend:%pI4 %u %pI4 %u %s %s", &__entry->saddr, __entry->source_port,
   120			  &__entry->daddr, __entry->dest_port, CROS_SHOW_IP_PROTOCOL(__entry->proto),
   121			  __entry->dev_name))
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
