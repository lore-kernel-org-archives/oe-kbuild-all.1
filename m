Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD9E37D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 00:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683593810; x=1715129810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MmwCToMS3/YQbV6VJ0tdFsSxE7NnXGz5KmtBOnI/8vM=;
  b=R3F7CIbaCFeDJyYVuz1ecm+Fw6Jmkjr6kbrmmYX/BSSEcK/TmXG2zkp/
   FVEad8WQYu7xNG759imdbiBHUOQbMEXSTmlyxZFqyqdiRSj7p1Jq8hEaY
   azV9gZ2J+uceX5BnzoG+o8JEJeZp1iUNGUiEVNzmg0IKvUTQqp5k9LEOG
   QnjeKFbOLByQFTxnys2Np3C7Mf3qdJxBlNsUbIUORpARlGl6a++XQp2GB
   vD/w9V3kP+EyAIuLr1z5gapuXq/Yd9wDcS0J9UP7aOpsFzihAsPLO1rzW
   x81Cv06tF9I3VX5X9iVwLIZL1eKGBK+00qjmaMPnyjy2nhVAS+jxHqc7d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="334232044"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="334232044"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 17:56:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="649082802"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="649082802"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 May 2023 17:56:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwBeo-0001VX-12;
	Tue, 09 May 2023 00:56:46 +0000
Date: Tue, 9 May 2023 08:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/clock 8/9]
 nf_conntrack_proto_tcp.c:(.text+0x8b8): multiple definition of
 `sched_clock_noinstr';
 net/netfilter/nf_conntrack_proto.o:nf_conntrack_proto.c:(.text+0x9aa): first
 defined here
Message-ID: <202305090800.amx97MJx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/clock
head:   6c433ce701d4bb3d07a4102cbb8bf00c217be05d
commit: 4ff68e88fd2272a5a1b1e62b017fa964b03242af [8/9] sched/clock: Provide local_clock_noinstr()
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230509/202305090800.amx97MJx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=4ff68e88fd2272a5a1b1e62b017fa964b03242af
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/clock
        git checkout 4ff68e88fd2272a5a1b1e62b017fa964b03242af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090800.amx97MJx-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: net/netfilter/nf_conntrack_proto_tcp.o: in function `sched_clock_noinstr':
>> nf_conntrack_proto_tcp.c:(.text+0x8b8): multiple definition of `sched_clock_noinstr'; net/netfilter/nf_conntrack_proto.o:nf_conntrack_proto.c:(.text+0x9aa): first defined here
   m68k-linux-ld: net/netfilter/nf_conntrack_proto_udp.o: in function `sched_clock_noinstr':
   nf_conntrack_proto_udp.c:(.text+0x72): multiple definition of `sched_clock_noinstr'; net/netfilter/nf_conntrack_proto.o:nf_conntrack_proto.c:(.text+0x9aa): first defined here
   m68k-linux-ld: net/netfilter/nf_conntrack_seqadj.o: in function `sched_clock_noinstr':
   nf_conntrack_seqadj.c:(.text+0x43c): multiple definition of `sched_clock_noinstr'; net/netfilter/nf_conntrack_proto.o:nf_conntrack_proto.c:(.text+0x9aa): first defined here
   m68k-linux-ld: net/netfilter/nf_conntrack_proto_icmpv6.o: in function `sched_clock_noinstr':
   nf_conntrack_proto_icmpv6.c:(.text+0x174): multiple definition of `sched_clock_noinstr'; net/netfilter/nf_conntrack_proto.o:nf_conntrack_proto.c:(.text+0x9aa): first defined here
--
   m68k-linux-ld: net/netfilter/nf_nat_helper.o: in function `sched_clock_noinstr':
>> nf_nat_helper.c:(.text+0x474): multiple definition of `sched_clock_noinstr'; net/netfilter/nf_nat_proto.o:nf_nat_proto.c:(.text+0x118e): first defined here
   m68k-linux-ld: net/netfilter/nf_nat_redirect.o: in function `sched_clock_noinstr':
   nf_nat_redirect.c:(.text+0x1b2): multiple definition of `sched_clock_noinstr'; net/netfilter/nf_nat_proto.o:nf_nat_proto.c:(.text+0x118e): first defined here
   m68k-linux-ld: net/netfilter/nf_nat_masquerade.o: in function `sched_clock_noinstr':
   nf_nat_masquerade.c:(.text+0x612): multiple definition of `sched_clock_noinstr'; net/netfilter/nf_nat_proto.o:nf_nat_proto.c:(.text+0x118e): first defined here
--
   m68k-linux-ld: net/netfilter/nft_exthdr.o: in function `sched_clock_noinstr':
>> nft_exthdr.c:(.text+0xd2e): multiple definition of `sched_clock_noinstr'; net/netfilter/nft_chain_filter.o:nft_chain_filter.c:(.text+0x9ee): first defined here
   m68k-linux-ld: net/netfilter/nft_chain_route.o: in function `sched_clock_noinstr':
   nft_chain_route.c:(.text+0x2b4): multiple definition of `sched_clock_noinstr'; net/netfilter/nft_chain_filter.o:nft_chain_filter.c:(.text+0x9ee): first defined here
--
   m68k-linux-ld: net/netfilter/ipset/pfxlen.o: in function `sched_clock_noinstr':
>> pfxlen.c:(.text+0x48): multiple definition of `sched_clock_noinstr'; net/netfilter/ipset/ip_set_getport.o:ip_set_getport.c:(.text+0x258): first defined here
--
   m68k-linux-ld: net/ipv6/ip6_output.o: in function `sched_clock_noinstr':
>> ip6_output.c:(.text+0x256a): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/ip6_input.o: in function `sched_clock_noinstr':
   ip6_input.c:(.text+0xad4): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/addrconf.o: in function `sched_clock_noinstr':
   addrconf.c:(.text+0x364e): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/route.o: in function `sched_clock_noinstr':
   route.c:(.text+0x45fc): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/ipv6_sockglue.o: in function `sched_clock_noinstr':
   ipv6_sockglue.c:(.text+0x4ea): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/ndisc.o: in function `sched_clock_noinstr':
   ndisc.c:(.text+0xf34): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/udp.o: in function `sched_clock_noinstr':
   udp.c:(.text+0x2752): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/raw.o: in function `sched_clock_noinstr':
   raw.c:(.text+0x1a8a): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/mcast.o: in function `sched_clock_noinstr':
   mcast.c:(.text+0x2e74): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/tcp_ipv6.o: in function `sched_clock_noinstr':
   tcp_ipv6.c:(.text+0x27a0): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/datagram.o: in function `sched_clock_noinstr':
   datagram.c:(.text+0x646): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/inet6_connection_sock.o: in function `sched_clock_noinstr':
   inet6_connection_sock.c:(.text+0x3b0): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/xfrm6_input.o: in function `sched_clock_noinstr':
   xfrm6_input.c:(.text+0x1c0): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/xfrm6_output.o: in function `sched_clock_noinstr':
   xfrm6_output.c:(.text+0x22): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/netfilter.o: in function `sched_clock_noinstr':
   netfilter.c:(.text+0x6a2): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/proc.o: in function `sched_clock_noinstr':
   proc.c:(.text+0x3ac): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
   m68k-linux-ld: net/ipv6/syncookies.o: in function `sched_clock_noinstr':
   syncookies.c:(.text+0x26a): multiple definition of `sched_clock_noinstr'; net/ipv6/af_inet6.o:af_inet6.c:(.text+0xd0c): first defined here
--
   m68k-linux-ld: net/ipv6/netfilter/nf_conntrack_reasm.o: in function `sched_clock_noinstr':
>> nf_conntrack_reasm.c:(.text+0xab8): multiple definition of `sched_clock_noinstr'; net/ipv6/netfilter/nf_defrag_ipv6_hooks.o:nf_defrag_ipv6_hooks.c:(.text+0x13c): first defined here
--
   m68k-linux-ld: drivers/block/drbd/drbd_proc.o: in function `sched_clock_noinstr':
>> drbd_proc.c:(.text+0x686): multiple definition of `sched_clock_noinstr'; drivers/block/drbd/drbd_bitmap.o:drbd_bitmap.c:(.text+0x1174): first defined here
   m68k-linux-ld: drivers/block/drbd/drbd_worker.o: in function `sched_clock_noinstr':
   drbd_worker.c:(.text+0xdaa): multiple definition of `sched_clock_noinstr'; drivers/block/drbd/drbd_bitmap.o:drbd_bitmap.c:(.text+0x1174): first defined here
   m68k-linux-ld: drivers/block/drbd/drbd_receiver.o: in function `sched_clock_noinstr':
   drbd_receiver.c:(.text+0x42a6): multiple definition of `sched_clock_noinstr'; drivers/block/drbd/drbd_bitmap.o:drbd_bitmap.c:(.text+0x1174): first defined here
   m68k-linux-ld: drivers/block/drbd/drbd_req.o: in function `sched_clock_noinstr':
   drbd_req.c:(.text+0xd46): multiple definition of `sched_clock_noinstr'; drivers/block/drbd/drbd_bitmap.o:drbd_bitmap.c:(.text+0x1174): first defined here
   m68k-linux-ld: drivers/block/drbd/drbd_actlog.o: in function `sched_clock_noinstr':
   drbd_actlog.c:(.text+0x57c): multiple definition of `sched_clock_noinstr'; drivers/block/drbd/drbd_bitmap.o:drbd_bitmap.c:(.text+0x1174): first defined here
   m68k-linux-ld: drivers/block/drbd/drbd_main.o: in function `sched_clock_noinstr':
   drbd_main.c:(.text+0x1344): multiple definition of `sched_clock_noinstr'; drivers/block/drbd/drbd_bitmap.o:drbd_bitmap.c:(.text+0x1174): first defined here
   m68k-linux-ld: drivers/block/drbd/drbd_nl.o: in function `sched_clock_noinstr':
   drbd_nl.c:(.text+0x5268): multiple definition of `sched_clock_noinstr'; drivers/block/drbd/drbd_bitmap.o:drbd_bitmap.c:(.text+0x1174): first defined here
   m68k-linux-ld: drivers/block/drbd/drbd_state.o: in function `sched_clock_noinstr':
   drbd_state.c:(.text+0x120e): multiple definition of `sched_clock_noinstr'; drivers/block/drbd/drbd_bitmap.o:drbd_bitmap.c:(.text+0x1174): first defined here
--
   m68k-linux-ld: fs/dlm/lowcomms.o: in function `sched_clock_noinstr':
>> lowcomms.c:(.text+0x1cd6): multiple definition of `sched_clock_noinstr'; fs/dlm/midcomms.o:midcomms.c:(.text+0x712): first defined here
--
   m68k-linux-ld: net/tls/tls_sw.o: in function `sched_clock_noinstr':
>> tls_sw.c:(.text+0x1692): multiple definition of `sched_clock_noinstr'; net/tls/tls_main.o:tls_main.c:(.text+0x5c6): first defined here
   m68k-linux-ld: net/tls/tls_proc.o: in function `sched_clock_noinstr':
   tls_proc.c:(.text+0x78): multiple definition of `sched_clock_noinstr'; net/tls/tls_main.o:tls_main.c:(.text+0x5c6): first defined here
   m68k-linux-ld: net/tls/tls_strp.o: in function `sched_clock_noinstr':
   tls_strp.c:(.text+0x5b8): multiple definition of `sched_clock_noinstr'; net/tls/tls_main.o:tls_main.c:(.text+0x5c6): first defined here
--
   m68k-linux-ld: net/kcm/kcmproc.o: in function `sched_clock_noinstr':
>> kcmproc.c:(.text+0x988): multiple definition of `sched_clock_noinstr'; net/kcm/kcmsock.o:kcmsock.c:(.text+0x2a4e): first defined here
--
   m68k-linux-ld: net/dccp/feat.o: in function `sched_clock_noinstr':
>> feat.c:(.text+0x11b8): multiple definition of `sched_clock_noinstr'; net/dccp/ccid.o:ccid.c:(.text+0x6e): first defined here
   m68k-linux-ld: net/dccp/input.o: in function `sched_clock_noinstr':
   input.c:(.text+0x8f8): multiple definition of `sched_clock_noinstr'; net/dccp/ccid.o:ccid.c:(.text+0x6e): first defined here
   m68k-linux-ld: net/dccp/minisocks.o: in function `sched_clock_noinstr':
   minisocks.c:(.text+0x3d0): multiple definition of `sched_clock_noinstr'; net/dccp/ccid.o:ccid.c:(.text+0x6e): first defined here
   m68k-linux-ld: net/dccp/options.o: in function `sched_clock_noinstr':
   options.c:(.text+0x332): multiple definition of `sched_clock_noinstr'; net/dccp/ccid.o:ccid.c:(.text+0x6e): first defined here
   m68k-linux-ld: net/dccp/output.o: in function `sched_clock_noinstr':
   output.c:(.text+0xa70): multiple definition of `sched_clock_noinstr'; net/dccp/ccid.o:ccid.c:(.text+0x6e): first defined here
   m68k-linux-ld: net/dccp/proto.o: in function `sched_clock_noinstr':
   proto.c:(.text+0x152e): multiple definition of `sched_clock_noinstr'; net/dccp/ccid.o:ccid.c:(.text+0x6e): first defined here
   m68k-linux-ld: net/dccp/timer.o: in function `sched_clock_noinstr':
   timer.c:(.text+0x3fe): multiple definition of `sched_clock_noinstr'; net/dccp/ccid.o:ccid.c:(.text+0x6e): first defined here
   m68k-linux-ld: net/dccp/qpolicy.o: in function `sched_clock_noinstr':
   qpolicy.c:(.text+0x70): multiple definition of `sched_clock_noinstr'; net/dccp/ccid.o:ccid.c:(.text+0x6e): first defined here
   m68k-linux-ld: net/dccp/ccids/ccid2.o: in function `sched_clock_noinstr':
   ccid2.c:(.text+0xdee): multiple definition of `sched_clock_noinstr'; net/dccp/ccid.o:ccid.c:(.text+0x6e): first defined here
   m68k-linux-ld: net/dccp/ackvec.o: in function `sched_clock_noinstr':
   ackvec.c:(.text+0xd8): multiple definition of `sched_clock_noinstr'; net/dccp/ccid.o:ccid.c:(.text+0x6e): first defined here
   m68k-linux-ld: net/dccp/sysctl.o: in function `sched_clock_noinstr':
   sysctl.c:(.text+0x0): multiple definition of `sched_clock_noinstr'; net/dccp/ccid.o:ccid.c:(.text+0x6e): first defined here
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
