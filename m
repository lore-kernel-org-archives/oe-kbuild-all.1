Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C891F1CFB6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 16:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMpHUwFM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697215199; x=1728751199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i4ri9UhRq09RCWUSaH39PmdZwk6T7gQ+jNzKGkc0800=;
  b=BMpHUwFMgC6bigZ8N1f/wUYbBBeuEisc0i+9wLjpeu9YuBmwsAqst5eg
   WDIA+xBZMKC+yJ9Zo1WxbU3Sq2hgoj67fADP8RIr1PqMs0ByLDBu2Pohh
   rkkRthFV3GOq/ZTdKoACGSDFEQyyrtW82y9mVn7BX5+3d6olWWoWiP92g
   z7EP90booiSSZ5O0iK0dcuqYgRVuk2AKQydSLaxFsHGWVw3ei9oJeU47a
   XxLCpTheWceUYKMMg2yD1VUGlwvOHtrCYxC0tlZaEwicyRoJWqIukb/un
   63jsEMxhTKiR/NJe5xv7A5OxqwGXLBRejHe7PaHxanMm3nbkCAWoRkx9Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370285931"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="370285931"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 09:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="825119177"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="825119177"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Oct 2023 09:39:52 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrLCY-00058E-2A;
	Fri, 13 Oct 2023 16:39:50 +0000
Date: Sat, 14 Oct 2023 00:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] appletalk: remove ipddp driver
Message-ID: <202310140008.9Hkkc6fo-lkp@intel.com>
References: <20231009141139.1766345-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009141139.1766345-1-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[cannot apply to net/main linus/master horms-ipvs/master v6.6-rc5 next-20231013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/appletalk-remove-ipddp-driver/20231009-221422
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231009141139.1766345-1-arnd%40kernel.org
patch subject: [PATCH] appletalk: remove ipddp driver
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140008.9Hkkc6fo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140008.9Hkkc6fo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/networking/index.rst:8: WARNING: toctree contains reference to nonexisting document 'networking/ipddp'

vim +8 Documentation/networking/index.rst

8df0136376dc92 Jakub Kicinski        2022-03-29    5  
05e0f3b9966c4d Mauro Carvalho Chehab 2017-05-12    6  Contents:
05e0f3b9966c4d Mauro Carvalho Chehab 2017-05-12    7  
05e0f3b9966c4d Mauro Carvalho Chehab 2017-05-12   @8  .. toctree::
05e0f3b9966c4d Mauro Carvalho Chehab 2017-05-12    9     :maxdepth: 2
05e0f3b9966c4d Mauro Carvalho Chehab 2017-05-12   10  
b4b8faa1ded7a3 Magnus Karlsson       2018-05-02   11     af_xdp
571912c69f0ed7 Martin Varghese       2020-02-24   12     bareudp
e45eba2467bd64 Sven Eckelmann        2017-07-12   13     batman-adv
7d5977394515ad Robert Schwebel       2018-01-24   14     can
9f2d3eae88d26c Jakob Unterwurzacher  2018-04-11   15     can_ucan_protocol
b0d8d4363e523e Jakub Kicinski        2019-05-21   16     device_drivers/index
3c91d114832027 Ioana Ciornei         2019-04-12   17     dsa/index
f4bdd7103652fa Jacob Keller          2020-01-09   18     devlink/index
da50d57abd7eca Mauro Carvalho Chehab 2020-04-28   19     caif/index
2b4a8990b7df55 Michal Kubecek        2019-12-27   20     ethtool-netlink
8e4a07405d9dae Stefan Schmidt        2019-02-27   21     ieee802154
9d71dd0c700999 The j1939 authors     2018-10-08   22     j1939
05e0f3b9966c4d Mauro Carvalho Chehab 2017-05-12   23     kapi
2fdd18118dad86 Mike Rapoport         2018-01-08   24     msg_zerocopy
d95768d3cccd0b Tobin C. Harding      2018-07-12   25     failover
9b038086f06be1 Jakub Kicinski        2020-04-09   26     net_dim
d95768d3cccd0b Tobin C. Harding      2018-07-12   27     net_failover
2c8e961d20e38c Mauro Carvalho Chehab 2020-05-01   28     page_pool
25fe02d00a1e94 Heiner Kallweit       2019-01-26   29     phy
0a6c33e894a50e Russell King          2019-02-22   30     sfp-phylink
735dadf894f091 Tobin C. Harding      2018-07-18   31     alias
6b335f8205e9d4 Tobin C. Harding      2018-07-18   32     bridge
b08794a922c420 yupeng                2018-11-10   33     snmp_counter
d96bedb2b24885 Otto Sabart           2019-01-06   34     checksum-offloads
d96bedb2b24885 Otto Sabart           2019-01-06   35     segmentation-offloads
e6e37f63681507 Otto Sabart           2019-01-18   36     scaling
f3c0f3c6c2013e Jakub Kicinski        2019-05-21   37     tls
f42c104f2ec94a Jakub Kicinski        2019-05-21   38     tls-offload
2fd5532044a89d Chuck Lever           2023-04-17   39     tls-handshake
4791d77a08ccd3 Robert Schwebel       2019-11-22   40     nfc
107db7ec783820 Mauro Carvalho Chehab 2020-02-06   41     6lowpan
a434aaba17f56c Mauro Carvalho Chehab 2020-04-28   42     6pack
aa92320b3e38f2 Mauro Carvalho Chehab 2020-04-28   43     arcnet-hardware
08bab46f00d0f0 Mauro Carvalho Chehab 2020-04-28   44     arcnet
ff2269f16a1e1a Mauro Carvalho Chehab 2020-04-28   45     atm
20b943f075574c Mauro Carvalho Chehab 2020-04-28   46     ax25
a362032eca22d0 Mauro Carvalho Chehab 2020-04-28   47     bonding
92f06f4226fd9b Mauro Carvalho Chehab 2020-04-28   48     cdc_mbim
33155bac6519f5 Mauro Carvalho Chehab 2020-04-28   49     dccp
8447bb44ef7c45 Mauro Carvalho Chehab 2020-04-28   50     dctcp
9dfe1361261be4 Mauro Carvalho Chehab 2020-04-28   51     dns_resolver
28d23311ff35ac Mauro Carvalho Chehab 2020-04-28   52     driver
06df65723b69a3 Mauro Carvalho Chehab 2020-04-28   53     eql
aee113427c5d20 Mauro Carvalho Chehab 2020-04-28   54     fib_trie
cb3f0d56e15339 Mauro Carvalho Chehab 2020-04-28   55     filter
16128ad8f92785 Mauro Carvalho Chehab 2020-04-28   56     generic-hdlc
110662503de20f Mauro Carvalho Chehab 2020-04-28   57     generic_netlink
8c498935585680 Mauro Carvalho Chehab 2020-04-28   58     gen_stats
81baecb6f6dc50 Mauro Carvalho Chehab 2020-04-28   59     gtp
1d2698fa05f57b Mauro Carvalho Chehab 2020-04-28   60     ila
883d71a55e9683 Hu Haowen             2021-07-28   61     ioam6-sysctl
7cdb25400f7e86 Mauro Carvalho Chehab 2020-04-28   62     ipddp
9de1fcdf36e7e0 Mauro Carvalho Chehab 2020-04-28   63     ip_dynaddr
355e656e017c3b Mauro Carvalho Chehab 2020-04-28   64     ipsec
1cec2cacaaec5d Mauro Carvalho Chehab 2020-04-28   65     ip-sysctl
19093313cb0486 Mauro Carvalho Chehab 2020-04-28   66     ipv6
1dc2a785954bf4 Mauro Carvalho Chehab 2020-04-28   67     ipvlan
82a07bf33d7d0c Mauro Carvalho Chehab 2020-04-28   68     ipvs-sysctl
b9dd2bea2245dd Mauro Carvalho Chehab 2020-04-28   69     kcm
10ebb22137acd9 Mauro Carvalho Chehab 2020-04-30   70     l2tp
40e79150c16862 Mauro Carvalho Chehab 2020-04-30   71     lapb-module
429ff87bcac75b Mauro Carvalho Chehab 2020-04-30   72     mac80211-injection
6a2d98b1890000 Jeremy Kerr           2021-07-29   73     mctp
e14fd64dcda566 Mauro Carvalho Chehab 2020-04-30   74     mpls-sysctl
9ce7deff92e89b Mat Martineau         2020-11-03   75     mptcp-sysctl
e98aa68223e481 Mauro Carvalho Chehab 2020-04-30   76     multiqueue
3eb8eea2a45346 Jakub Kicinski        2023-03-21   77     napi
d9d6ef25ecab3e Mauro Carvalho Chehab 2020-04-30   78     netconsole
ea5bacaa2cec69 Mauro Carvalho Chehab 2020-04-30   79     netdev-features
482a4360c56a1e Mauro Carvalho Chehab 2020-04-30   80     netdevices
0191533087a3cf Mauro Carvalho Chehab 2020-04-30   81     netfilter-sysctl
c4d5dff60f0a14 Mauro Carvalho Chehab 2020-04-30   82     netif-msg
87f2c6716f6408 Petr Machata          2021-03-29   83     nexthop-group-resilient
13df433f8c1333 Mauro Carvalho Chehab 2020-04-30   84     nf_conntrack-sysctl
aa3764276a4bc1 Mauro Carvalho Chehab 2020-04-30   85     nf_flowtable
63893472d753e9 Mauro Carvalho Chehab 2020-04-30   86     openvswitch
f5c39ef3299f4e Mauro Carvalho Chehab 2020-04-30   87     operstates
4ba7bc9f2de6b2 Mauro Carvalho Chehab 2020-04-30   88     packet_mmap
6e94eaaa400d66 Mauro Carvalho Chehab 2020-04-30   89     phonet
c1e4535f24bcfe Mauro Carvalho Chehab 2020-04-30   90     pktgen
32c01266c0aab0 Mauro Carvalho Chehab 2020-04-30   91     plip
71120802ebeda1 Mauro Carvalho Chehab 2020-04-30   92     ppp_generic
832619012c972d Mauro Carvalho Chehab 2020-04-30   93     proc_net_tcp
66d495d0a5aecd Mauro Carvalho Chehab 2020-04-30   94     radiotap-headers
bad5b6e223e840 Mauro Carvalho Chehab 2020-04-30   95     rds
98661e0c579dbd Mauro Carvalho Chehab 2020-04-30   96     regulatory
6fb4825e492b07 Edward Cree           2022-09-05   97     representors
9f72374cb59595 Mauro Carvalho Chehab 2020-04-30   98     rxrpc
671d114d8cde3b Mauro Carvalho Chehab 2020-04-30   99     sctp
de1fd4a7b0f235 Mauro Carvalho Chehab 2020-04-30  100     secid
d6c48bc6f8da38 Mauro Carvalho Chehab 2020-04-30  101     seg6-sysctl
9ec7ea1462084d Jakub Kicinski        2022-05-09  102     skbuff
f9f52c3474282a Dust Li               2022-03-03  103     smc-sysctl
0db0c34cfbc983 Jakub Kicinski        2020-09-03  104     statistics
060d9d3e1282e3 Mauro Carvalho Chehab 2020-04-30  105     strparser
32c0f0bed5bb08 Mauro Carvalho Chehab 2020-04-30  106     switchdev
6575aeab72e043 John Hubbard          2020-10-09  107     sysfs-tagging
d2461edde7d151 Mauro Carvalho Chehab 2020-04-30  108     tc-actions-env-rules
d5ae8ecf38322f Amritha Nambiar       2022-10-21  109     tc-queue-filters
ff159f4f1152b7 Mauro Carvalho Chehab 2020-04-30  110     tcp-thin
aa8a6ee3e3fc40 Mauro Carvalho Chehab 2020-04-30  111     team
06bfa47e72c835 Mauro Carvalho Chehab 2020-04-30  112     timestamping
2fc30decf73083 Randy Dunlap          2020-11-29  113     tipc
4ac0b122ee63d8 Mauro Carvalho Chehab 2020-04-30  114     tproxy
973d55e590beec Mauro Carvalho Chehab 2020-05-01  115     tuntap
961fb1ff412a2c Mauro Carvalho Chehab 2020-05-01  116     udplite
58ccb2b2e87d52 Mauro Carvalho Chehab 2020-05-01  117     vrf
d2a85c184ac6e7 Mauro Carvalho Chehab 2020-05-01  118     vxlan
c4ea03fdfd122b Mauro Carvalho Chehab 2020-05-01  119     x25
77c964dad99a18 Randy Dunlap          2023-05-09  120     x25-iface
c4a0eb9350183d Mauro Carvalho Chehab 2020-05-01  121     xfrm_device
da62baada5cc94 Mauro Carvalho Chehab 2020-05-01  122     xfrm_proc
a5cfea33e5e548 Mauro Carvalho Chehab 2020-05-01  123     xfrm_sync
a6c34b476ca27d Mauro Carvalho Chehab 2020-05-01  124     xfrm_sysctl
a4aeb9d6565e42 Stanislav Fomichev    2023-01-19  125     xdp-rx-metadata
05e0f3b9966c4d Mauro Carvalho Chehab 2017-05-12  126  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
