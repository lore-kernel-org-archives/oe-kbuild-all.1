Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699313B2A0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 18:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762107400; cv=none; b=fvmSQZOP70enypziXkDfXbEaqNNNr1jKk+ryyorYuETUUsX9IWuRVb8672KjS1p3ZyktY73Klbvq31i3VcvfvuS0EKMwyPXlwpKruw6PMU5XiSdYCqzABolzq0YJXIMUciZejq20675Sdz+8/IQqQvKWsWSb1muuVQbR+9nFAt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762107400; c=relaxed/simple;
	bh=BzAw3wdy0yIYjUMfKi5H96OjXEJomjSDoseUp5jMqv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+AAkL+K5jaUzTiCt//nsL4mlSgS1XNv8cMHRVV4X0q0sQaAGXxI2cT9dDgdzb4/PNbRWAlZ1TYJ9AQxCl9rC4KHr/LQEEVjOAz+qxN4PGakt0qvJMcqgSTnIa+icAozVm2YKp8FkVFDV0pkhg5azo8m3P7sdZM2cREe8TuD/l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAVpM6lk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAVpM6lk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762107397; x=1793643397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BzAw3wdy0yIYjUMfKi5H96OjXEJomjSDoseUp5jMqv0=;
  b=LAVpM6lkhd8zn4wkLiUAnetTboE73+IGQozgn6IKKKQ+6U7lFxSL62mI
   ARd+yBKc7QeBIrR+Zdkub+WDOwZ9mgcViGWiMKu3WWdmMjmI40pJ6olio
   dCpWpBJpWN9VKY7QfljyCEOaZDWvBNhGGrhVDByPfGir5a3A2MXIs40tK
   fH3xVNSsxCAfoMa7Bm5QKjxIr2Hg5w0lFRXxVBJDSvBWUruTNQHN5lKO0
   mfG/QrfgUeW9Brg/QZS79u7Ws/a+PIyvf1DFHigfqk6pmqy15SJb27KhW
   XfbPNa4fIACyOGjPuuBgGVbHoZxqn94s7LQRjVraQJHuWgaRjoucWAgbE
   w==;
X-CSE-ConnectionGUID: rTSbVnZVQwu1M4HvjAa3Jw==
X-CSE-MsgGUID: Wkt8cHrESSevHuTP5bazwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75643026"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="75643026"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 10:16:36 -0800
X-CSE-ConnectionGUID: KRzHMQISQlaCuVYUKaY6/Q==
X-CSE-MsgGUID: 4FKkRB2tR1KBPjQCAFixog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="190774441"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Nov 2025 10:16:35 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFccz-000PUO-1I;
	Sun, 02 Nov 2025 18:16:33 +0000
Date: Mon, 3 Nov 2025 02:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3081/3081] include/net/ip6_fib.h:279:10: error:
 default initialization of an object of type 'typeof (f6i->expires)' (aka
 'const unsigned long') leaves the object uninitialized
Message-ID: <202511030209.4oIfkvXK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5394cae209c4a4990d81be436ba17ae56fb09d16
commit: 6864d14bb90f03a1e5b7fbcc04fc2ba4d692bd3e [3081/3081] support 3SNIC 910/920/930 NIC
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20251103/202511030209.4oIfkvXK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030209.4oIfkvXK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030209.4oIfkvXK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:42:9: error: '__SANITIZE_THREAD__' macro redefined [-Werror,-Wmacro-redefined]
      42 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_THREAD__ 1
         |         ^
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx.c:6:
   In file included from include/net/xfrm.h:9:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx.c:6:
   In file included from include/net/xfrm.h:22:
   include/net/ip.h:463:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
     463 |                 if (mtu && time_before(jiffies, rt->dst.expires))
         |                            ^
   include/linux/jiffies.h:135:26: note: expanded from macro 'time_before'
     135 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:125:3: note: expanded from macro 'time_after'
     125 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx.c:6:
   In file included from include/net/xfrm.h:25:
>> include/net/ip6_fib.h:279:10: error: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
     279 |                 return time_after(jiffies, f6i->expires);
         |                        ^
   include/linux/jiffies.h:126:3: note: expanded from macro 'time_after'
     126 |          typecheck(unsigned long, b) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   8 errors generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:42:9: error: '__SANITIZE_THREAD__' macro redefined [-Werror,-Wmacro-redefined]
      42 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_THREAD__ 1
         |         ^
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:6:
   In file included from include/net/xfrm.h:9:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:508:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:6:
   In file included from include/net/xfrm.h:22:
   include/net/ip.h:463:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
     463 |                 if (mtu && time_before(jiffies, rt->dst.expires))
         |                            ^
   include/linux/jiffies.h:135:26: note: expanded from macro 'time_before'
     135 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:125:3: note: expanded from macro 'time_after'
     125 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:6:
   In file included from include/net/xfrm.h:25:
>> include/net/ip6_fib.h:279:10: error: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
     279 |                 return time_after(jiffies, f6i->expires);
         |                        ^
   include/linux/jiffies.h:126:3: note: expanded from macro 'time_after'
     126 |          typecheck(unsigned long, b) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:42:5: error: no previous prototype for function 'sss_nic_alloc_sq_resource' [-Werror,-Wmissing-prototypes]
      42 | int sss_nic_alloc_sq_resource(struct sss_nic_dev *nic_dev,
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | int sss_nic_alloc_sq_resource(struct sss_nic_dev *nic_dev,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:87:6: error: no previous prototype for function 'sss_nic_free_sq_resource' [-Werror,-Wmissing-prototypes]
      87 | void sss_nic_free_sq_resource(struct sss_nic_dev *nic_dev,
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:87:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      87 | void sss_nic_free_sq_resource(struct sss_nic_dev *nic_dev,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:104:6: error: no previous prototype for function 'sss_nic_init_all_sq' [-Werror,-Wmissing-prototypes]
     104 | void sss_nic_init_all_sq(struct sss_nic_dev *nic_dev,
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:104:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     104 | void sss_nic_init_all_sq(struct sss_nic_dev *nic_dev,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:128:5: error: no previous prototype for function 'sss_nic_alloc_sq_desc_group' [-Werror,-Wmissing-prototypes]
     128 | int sss_nic_alloc_sq_desc_group(struct sss_nic_dev *nic_dev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:128:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     128 | int sss_nic_alloc_sq_desc_group(struct sss_nic_dev *nic_dev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:153:6: error: no previous prototype for function 'sss_nic_free_sq_desc_group' [-Werror,-Wmissing-prototypes]
     153 | void sss_nic_free_sq_desc_group(struct sss_nic_dev *nic_dev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:153:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     153 | void sss_nic_free_sq_desc_group(struct sss_nic_dev *nic_dev)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:200:6: error: no previous prototype for function 'sss_nic_flush_all_sq' [-Werror,-Wmissing-prototypes]
     200 | void sss_nic_flush_all_sq(struct sss_nic_dev *nic_dev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx_init.c:200:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     200 | void sss_nic_flush_all_sq(struct sss_nic_dev *nic_dev)
         | ^
         | static 
   14 errors generated.


vim +279 include/net/ip6_fib.h

bb892fef742b66 David Ahern      2024-03-20  275  
8d1c802b2815ed David Ahern      2018-04-17  276  static inline bool fib6_check_expired(const struct fib6_info *f6i)
1716a96101c491 Gao feng         2012-04-06  277  {
93c2fb253d177a David Ahern      2018-04-18  278  	if (f6i->fib6_flags & RTF_EXPIRES)
14895687d36805 David Ahern      2018-04-17 @279  		return time_after(jiffies, f6i->expires);
14895687d36805 David Ahern      2018-04-17  280  	return false;
1716a96101c491 Gao feng         2012-04-06  281  }
b197df4f0f3782 Martin KaFai Lau 2015-05-22  282  

:::::: The code at line 279 was first introduced by commit
:::::: 14895687d36805f051bb54014c32e48e5937f7e1 net/ipv6: move expires into rt6_info

:::::: TO: David Ahern <dsahern@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
