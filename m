Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90D1EC7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 00:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJa/mUhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701737874; x=1733273874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5O0V6Bjm+DTrqGHC/asax/5ceN2FG4KozQ+qIfYM2bE=;
  b=YJa/mUhUJMS/e7s4FOGdh+4XgAYZEJ9w/xKeAppk/0dMu9OKZHZpMXJ5
   QdgU9509Up1LYMaAhsGPkbDGSRAuM8jdDOk5Cj1/zTl0oaKBl8aHFcXFh
   j3ndgZZ53IUVxZ9I6gfa03MBz4Psbcw5Zubm+FQFvYAkGApbfB6JWoueB
   wX2otYiHpnjC1c1aOzL3oCJ6Kgd938Nt+GVVe1AmXW49ypCStbVgPPhLp
   EHoRNEudV4TdX+jKwWcatR5CKV2u2TE5i+1ibnI7mlVigF4AxPriq0AX1
   Ph42lGnJrUbGFGSfcLt3dTmmHnNTJ0578IgkRjyVPBhFiphvD+FLtA5MN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="373266644"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="373266644"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 16:57:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="861570164"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="861570164"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 16:57:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAJkw-0008F6-13;
	Tue, 05 Dec 2023 00:57:46 +0000
Date: Tue, 5 Dec 2023 08:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Pravin B Shelar <pshelar@nicira.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jesse Gross <jesse@nicira.com>
Subject: drivers/net/geneve.c:85:47: sparse: sparse: incorrect type in return
 expression (different base types)
Message-ID: <202312050859.kt51OTo8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 371bd1061d29562e6423435073623add8c475ee2 geneve: Consolidate Geneve functionality in single module.
date:   8 years ago
config: parisc-randconfig-r122-20231115 (https://download.01.org/0day-ci/archive/20231205/202312050859.kt51OTo8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312050859.kt51OTo8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312050859.kt51OTo8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/geneve.c:85:47: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __be64 @@     got int @@
   drivers/net/geneve.c:85:47: sparse:     expected restricted __be64
   drivers/net/geneve.c:85:47: sparse:     got int
   drivers/net/geneve.c: note: in included file:
   include/net/geneve.h:62:34: sparse: sparse: array of flexible structures
>> drivers/net/geneve.c:599:33: sparse: sparse: restricted __be64 degrades to integer
   drivers/net/geneve.c:600:33: sparse: sparse: restricted __be64 degrades to integer
   In file included from include/linux/kernel.h:11,
                    from drivers/net/geneve.c:13:
   include/linux/log2.h:22:1: warning: ignoring attribute 'noreturn' because it conflicts with attribute 'const' [-Wattributes]
      22 | int ____ilog2_NaN(void);
         | ^~~
   In file included from arch/parisc/include/asm/bug.h:92,
                    from include/linux/bug.h:4,
                    from include/linux/thread_info.h:11,
                    from include/asm-generic/preempt.h:4,
                    from arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:64,
                    from include/linux/spinlock.h:50,
                    from include/linux/seqlock.h:35,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:18,
                    from include/linux/module.h:10,
                    from drivers/net/geneve.c:14:
   include/linux/cpumask.h: In function 'cpumask_check':
   include/linux/cpumask.h:117:26: warning: comparison of integer expressions of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
     117 |         WARN_ON_ONCE(cpu >= nr_cpumask_bits);
         |                          ^~
   include/asm-generic/bug.h:111:34: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_once = !!(condition);                    31-      |                                  ^~~~~~~~~
   In file included from include/linux/linkage.h:4,
                    from include/linux/kernel.h:6:
   arch/parisc/include/asm/uaccess.h: In function 'copy_from_user':
   arch/parisc/include/asm/uaccess.h:249:63: warning: comparison of integer expressions of different signedness: 'int' and 'long unsigned int' [-Wsign-compare]
     249 |         if (likely(sz == -1 || !__builtin_constant_p(n) || sz >= n))
         |                                                               ^~
   include/linux/compiler.h:165:45: note: in definition of macro 'likely'
     165 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   In file included from include/linux/if_ether.h:23,
                    from include/uapi/linux/ethtool.h:17,
                    from include/linux/ethtool.h:16,
                    from include/linux/netdevice.h:42,
                    from drivers/net/geneve.c:15:
   include/linux/skbuff.h: In function 'skb_add_data':
   include/linux/skbuff.h:2561:58: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'unsigned int'} and 'int' [-Wsign-compare]
    2561 |                                             &csum, from) == copy) {
         |                                                          ^~
   include/linux/skbuff.h:2565:67: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'unsigned int'} and 'int' [-Wsign-compare]
    2565 |         } else if (copy_from_iter(skb_put(skb, copy), copy, from) == copy)
         |                                                                   ^~
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2579:28: warning: comparison of integer expressions of different signedness: 'int' and 'unsigned int' [-Wsign-compare]
    2579 |                        off == frag->page_offset + skb_frag_size(frag);
         |                            ^~
   include/linux/skbuff.h: In function 'memcpy_from_msg':
   include/linux/skbuff.h:2762:58: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'unsigned int'} and 'int' [-Wsign-compare]
    2762 |         return copy_from_iter(data, len, &msg->msg_iter) == len ? 0 : -EFAULT;
         |                                                          ^~
   include/linux/skbuff.h: In function 'memcpy_to_msg':
   include/linux/skbuff.h:2767:56: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'unsigned int'} and 'int' [-Wsign-compare]
    2767 |         return copy_to_iter(data, len, &msg->msg_iter) == len ? 0 : -EFAULT;
         |                                                        ^~
   include/linux/netdevice.h: In function '__skb_gro_checksum_validate_needed':
   include/linux/netdevice.h:2322:48: warning: comparison of integer expressions of different signedness: 'int' and 'unsigned int' [-Wsign-compare]
    2322 |                 skb_checksum_start_offset(skb) <
         |                                                ^
   include/linux/netdevice.h: In function 'get_netdev_rx_queue_index':
   include/linux/netdevice.h:2940:22: warning: comparison of integer expressions of different signedness: 'int' and 'unsigned int' [-Wsign-compare]
    2940 |         BUG_ON(index >= dev->num_rx_queues);
         |                      ^~
   include/linux/compiler.h:166:45: note: in definition of macro 'unlikely'
     166 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/netdevice.h:2940:9: note: in expansion of macro 'BUG_ON'
    2940 |         BUG_ON(index >= dev->num_rx_queues);
         |         ^~~~~~
   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3217:44: warning: comparison of integer expressions of different signedness: 'int' and 'unsigned int' [-Wsign-compare]
    3217 |         if (debug_value < 0 || debug_value >= (sizeof(u32) * 8))
         |                                            ^~
   In file included from include/net/rtnetlink.h:5,
                    from include/net/neighbour.h:29,
                    from include/net/dst.h:17,
                    from include/net/sock.h:67,
                    from include/linux/tcp.h:22,
                    from include/linux/ipv6.h:72,
                    from include/net/dsfield.h:11,
                    from include/net/ip_tunnels.h:9,
                    from include/net/dst_metadata.h:5,
                    from drivers/net/geneve.c:18:
   include/net/netlink.h: In function 'nlmsg_ok':
   include/net/netlink.h:337:32: warning: comparison of integer expressions of different signedness: '__u32' {aka 'unsigned int'} and 'int' [-Wsign-compare]
     337 |                 nlh->nlmsg_len <= remaining);
         |                                ^~
   include/net/netlink.h: In function 'nlmsg_parse':
   include/net/netlink.h:372:28: warning: comparison of integer expressions of different signedness: '__u32' {aka 'unsigned int'} and 'int' [-Wsign-compare]
     372 |         if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen))
         |                            ^
   include/net/netlink.h: In function 'nlmsg_validate':
   include/net/netlink.h:405:28: warning: comparison of integer expressions of different signedness: '__u32' {aka 'unsigned int'} and 'int' [-Wsign-compare]
     405 |         if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen))
         |                            ^
   include/net/rtnetlink.h: In function 'rtnl_msg_family':
   include/net/rtnetlink.h:20:28: warning: comparison of integer expressions of different signedness: 'int' and 'unsigned int' [-Wsign-compare]

vim +85 drivers/net/geneve.c

2d07dc79fe04a4 John W. Linville 2015-05-13  81  
e305ac6cf5a1e1 Pravin B Shelar  2015-08-26  82  static __be64 vni_to_tunnel_id(const __u8 *vni)
e305ac6cf5a1e1 Pravin B Shelar  2015-08-26  83  {
e305ac6cf5a1e1 Pravin B Shelar  2015-08-26  84  #ifdef __BIG_ENDIAN
e305ac6cf5a1e1 Pravin B Shelar  2015-08-26 @85  	return (vni[0] << 16) | (vni[1] << 8) | vni[2];
e305ac6cf5a1e1 Pravin B Shelar  2015-08-26  86  #else
e305ac6cf5a1e1 Pravin B Shelar  2015-08-26  87  	return (__force __be64)(((__force u64)vni[0] << 40) |
e305ac6cf5a1e1 Pravin B Shelar  2015-08-26  88  				((__force u64)vni[1] << 48) |
e305ac6cf5a1e1 Pravin B Shelar  2015-08-26  89  				((__force u64)vni[2] << 56));
e305ac6cf5a1e1 Pravin B Shelar  2015-08-26  90  #endif
e305ac6cf5a1e1 Pravin B Shelar  2015-08-26  91  }
e305ac6cf5a1e1 Pravin B Shelar  2015-08-26  92  

:::::: The code at line 85 was first introduced by commit
:::::: e305ac6cf5a1e1386aedce7ef9cb773635d5845c geneve: Add support to collect tunnel metadata.

:::::: TO: Pravin B Shelar <pshelar@nicira.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
