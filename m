Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F5214F67
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JM/a1Nd9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699715938; x=1731251938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h/zRwMP61ZvFjM/RQmJb1hU1rBscvgnsFspKMLmeaig=;
  b=JM/a1Nd9ZwRCmsy51illcx5kDbMbcl2Ik6e6/BMhg+jyWVxghO5D9JFl
   JMsRy6z3CzB1X5Xi2WFvYA4vtGb8AsNES1zV/FXYiWUuBTNZCv1ekuJg6
   35FmpGK471CBCJsUujitJRPSwdt3J7WoNNZS9QwBVycpKQmFf4Ou46Twv
   vicRW3xpdzdkBzTntMl5QeK2BFam88xoSCW5GfZHVl586qZVh9vSA/0Bf
   rL7oCFcQ3ZBysoD6+JWKlM3dUT4o6w0FgnjZslKyPOXkqb1+IS0Dh2qzM
   EJ8f8Y8AQ48kiKq8tKPSnUEXHCz7i2+z09+1sa9UQdf7g6VrnVVzQ8Dn0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="393150219"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="393150219"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 07:18:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="854608814"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="854608814"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Nov 2023 07:18:56 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1pl8-000AXJ-0S;
	Sat, 11 Nov 2023 15:18:54 +0000
Date: Sat, 11 Nov 2023 23:18:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] include/trace/hooks/net.h:29:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202311112337.yr1Q7Huv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d8156345d8c56a2b082c1877eaee48a22c33014f
commit: 8deaa6958ee305f29e895e49985f206ce8fcbf8e [1/1] ANDROID: Fix build error with CONFIG_UCLAMP_TASK disabled
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20231111/202311112337.yr1Q7Huv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311112337.yr1Q7Huv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311112337.yr1Q7Huv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/sock.c: note: in included file:
>> include/trace/hooks/net.h:29:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:29:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:29:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:31:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:31:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:31:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:31:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:31:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:31:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   net/core/sock.c:2156:9: sparse: sparse: context imbalance in 'sk_clone_lock' - wrong count at exit
   net/core/sock.c:2160:6: sparse: sparse: context imbalance in 'sk_free_unlock_clone' - unexpected unlock
   net/core/sock.c:3744:13: sparse: sparse: context imbalance in 'proto_seq_start' - wrong count at exit
   net/core/sock.c:3756:13: sparse: sparse: context imbalance in 'proto_seq_stop' - wrong count at exit

vim +29 include/trace/hooks/net.h

1da7910c1d7d29 Bae Soukjin             2020-08-19  10  
d5f809c84dc6c3 Giuliano Procida        2022-06-10  11  /* struct packet_type */
d5f809c84dc6c3 Giuliano Procida        2022-06-10  12  #include <linux/netdevice.h>
d5f809c84dc6c3 Giuliano Procida        2022-06-10  13  /* struct sk_buff */
d5f809c84dc6c3 Giuliano Procida        2022-06-10  14  #include <linux/skbuff.h>
d5f809c84dc6c3 Giuliano Procida        2022-06-10  15  /* struct list_head */
d5f809c84dc6c3 Giuliano Procida        2022-06-10  16  #include <linux/types.h>
1da7910c1d7d29 Bae Soukjin             2020-08-19  17  DECLARE_HOOK(android_vh_ptype_head,
1da7910c1d7d29 Bae Soukjin             2020-08-19  18  	TP_PROTO(const struct packet_type *pt, struct list_head *vendor_pt),
1da7910c1d7d29 Bae Soukjin             2020-08-19  19  	TP_ARGS(pt, vendor_pt));
1da7910c1d7d29 Bae Soukjin             2020-08-19  20  DECLARE_HOOK(android_vh_kfree_skb,
1da7910c1d7d29 Bae Soukjin             2020-08-19  21  	TP_PROTO(struct sk_buff *skb), TP_ARGS(skb));
1da7910c1d7d29 Bae Soukjin             2020-08-19  22  
72c4b4cdada1c8 Vignesh Saravanaperumal 2021-07-08  23  struct nf_conn;
1dc9f51423a411 Vignesh Saravanaperumal 2022-05-06  24  struct sock;
72c4b4cdada1c8 Vignesh Saravanaperumal 2021-07-08  25  DECLARE_RESTRICTED_HOOK(android_rvh_nf_conn_alloc,
72c4b4cdada1c8 Vignesh Saravanaperumal 2021-07-08  26  	TP_PROTO(struct nf_conn *nf_conn), TP_ARGS(nf_conn), 1);
72c4b4cdada1c8 Vignesh Saravanaperumal 2021-07-08  27  DECLARE_RESTRICTED_HOOK(android_rvh_nf_conn_free,
72c4b4cdada1c8 Vignesh Saravanaperumal 2021-07-08  28  	TP_PROTO(struct nf_conn *nf_conn), TP_ARGS(nf_conn), 1);
1dc9f51423a411 Vignesh Saravanaperumal 2022-05-06 @29  DECLARE_RESTRICTED_HOOK(android_rvh_sk_alloc,
1dc9f51423a411 Vignesh Saravanaperumal 2022-05-06  30  	TP_PROTO(struct sock *sock), TP_ARGS(sock), 1);
1dc9f51423a411 Vignesh Saravanaperumal 2022-05-06  31  DECLARE_RESTRICTED_HOOK(android_rvh_sk_free,
1dc9f51423a411 Vignesh Saravanaperumal 2022-05-06  32  	TP_PROTO(struct sock *sock), TP_ARGS(sock), 1);
72c4b4cdada1c8 Vignesh Saravanaperumal 2021-07-08  33  

:::::: The code at line 29 was first introduced by commit
:::::: 1dc9f51423a4115cc6c5a92686425f2e4776dafe ANDROID: GKI: net: add vendor hooks for 'struct sock' lifecycle

:::::: TO: Vignesh Saravanaperumal <vignesh1.s@samsung.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
