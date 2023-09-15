Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F80CA7A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 14:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694787005; x=1726323005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XFPnyIbZVBZlKxbyg1wh9v7hY9doCpfPmuTAIPOWXYE=;
  b=dh1hgS73VZ6kuk2s6YDjhE2LxEPoj0PR6gegQpUw9U1kuVsthp5QaWSt
   YM0RA+0sSGJde2ziUK2qpKlVTy8HZRhnA9QhuaKHccKlrcph256BpHs0W
   ygTVymefvXkLmPnIBJ7xTgtp21HvrpBUUiEpPlaI9AcWEK/SdZlqGP9qe
   iOzp0muhF4S4Ik3y7vgce4QDsIoofi/asZ/+oKAFHXJvKYuwNZObm241R
   OuiC/7o8tvA4vvmPp94V2IRQ7O88uGuaMVhalgGGatfjeVZDoj58XgXFQ
   b2dZDpgA6zmcLeHX/Z/7z1D7r1U0GHwWcibYGEgeVGmJef4ov20672HLI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="410192519"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="410192519"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 07:10:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="694728973"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="694728973"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Sep 2023 07:10:03 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh9WC-00032b-34;
	Fri, 15 Sep 2023 14:10:00 +0000
Date: Fri, 15 Sep 2023 22:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 18038/28548]
 include/trace/hooks/net.h:26:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202309152229.7g83jsjb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   19cff29fe49cb187d02a308880d58ad8ce1cdc71
commit: 48b03352a3bd46c2aec1804fd36fc78b4270e3d0 [18038/28548] ANDROID: GKI: net: add vendor hooks for 'struct sock' lifecycle
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20230915/202309152229.7g83jsjb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309152229.7g83jsjb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309152229.7g83jsjb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/sock.c: note: in included file:
>> include/trace/hooks/net.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/net.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:26:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/net.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/net.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:28:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   include/trace/hooks/net.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] <asn:4> *funcs @@
   include/trace/hooks/net.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:28:1: sparse:     got struct tracepoint_func [noderef] <asn:4> *funcs
   net/core/sock.c:1910:9: sparse: sparse: context imbalance in 'sk_clone_lock' - wrong count at exit
   net/core/sock.c:1914:6: sparse: sparse: context imbalance in 'sk_free_unlock_clone' - unexpected unlock
   net/core/sock.c:3003:6: sparse: sparse: context imbalance in 'lock_sock_fast' - different lock contexts for basic block
   net/core/sock.c:3502:13: sparse: sparse: context imbalance in 'proto_seq_start' - wrong count at exit
   net/core/sock.c:3514:13: sparse: sparse: context imbalance in 'proto_seq_stop' - wrong count at exit

vim +26 include/trace/hooks/net.h

    11	
    12	struct packet_type;
    13	struct list_head;
    14	struct sk_buff;
    15	struct nf_conn;
    16	struct sock;
    17	DECLARE_HOOK(android_vh_ptype_head,
    18		TP_PROTO(const struct packet_type *pt, struct list_head *vendor_pt),
    19		TP_ARGS(pt, vendor_pt));
    20	DECLARE_HOOK(android_vh_kfree_skb,
    21		TP_PROTO(struct sk_buff *skb), TP_ARGS(skb));
    22	DECLARE_RESTRICTED_HOOK(android_rvh_nf_conn_alloc,
    23		TP_PROTO(struct nf_conn *nf_conn), TP_ARGS(nf_conn), 1);
    24	DECLARE_RESTRICTED_HOOK(android_rvh_nf_conn_free,
    25		TP_PROTO(struct nf_conn *nf_conn), TP_ARGS(nf_conn), 1);
  > 26	DECLARE_RESTRICTED_HOOK(android_rvh_sk_alloc,
    27		TP_PROTO(struct sock *sock), TP_ARGS(sock), 1);
    28	DECLARE_RESTRICTED_HOOK(android_rvh_sk_free,
    29		TP_PROTO(struct sock *sock), TP_ARGS(sock), 1);
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
