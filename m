Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BA7523E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 12:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691239234; x=1722775234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6HHDwVsjMeZOywxmNsq0D52j0VuV3WE4/5FvRQAFmxI=;
  b=mtg/Dk8aZOzouYa8h/uDqWQNRI62zp+HO9OFNkDg0e5sqbPh+C189eqF
   gwXcABrii4VNWniPsctalMmUFAmtgcH3cY7i2q8TeqbfwnG3gMkHt/t5E
   ZhJ397K3szFYpdZrxovmrIXXrUqoVnt8MUBrmcAS6dzJafYMRUbNeuLuP
   F2tpJcijuVLzTXde4i0hyiEZHkMi6Ks0EN/5mpJ7SgvnrBaldlpZwZDkB
   s2PlvahgW7FmEEk4hnPYeJoKbgrYSCWdsLNyN+O40EWxhXIJnzSdYNn/c
   suHBYq+j3jBqGZKNvRPet9gdy999CAO4vXr0ylKXbTLwQhgxl9iIcXG2v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="456690631"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="456690631"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 05:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="873725690"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2023 05:40:34 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSGa6-0003Vj-1m;
	Sat, 05 Aug 2023 12:40:30 +0000
Date: Sat, 5 Aug 2023 20:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 9/9] include/trace/events/cros_net.h:78:1:
 sparse: sparse: cast to restricted __be32
Message-ID: <202308052050.EH7oGymy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   9caf062a55cdd011a7c37bfdb4c88847bbd7a41d
commit: 9caf062a55cdd011a7c37bfdb4c88847bbd7a41d [9/9] CHROMIUM: add new cros_net tracepoints
config: xtensa-randconfig-r091-20230730 (https://download.01.org/0day-ci/archive/20230805/202308052050.EH7oGymy-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308052050.EH7oGymy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308052050.EH7oGymy-lkp@intel.com/

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
