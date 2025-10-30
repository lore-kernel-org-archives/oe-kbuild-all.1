Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011CF307AFB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 13:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761830055; cv=none; b=IrVz0wVLDTCAQRtE7UrLDF31of8KXnuQZE2UZv/STxooHFwOR6YrrMxVKHxtpdI3lr4XB3Z92EUSJGtdnMKIkIL54qQjFNpaG47M8hQ9zW0RpCqDqpPaN4u6I7WpxHBZEJW5Z3OWJZk4Ma3sfhXWTudi1f5BBmGJdmauTqG9HyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761830055; c=relaxed/simple;
	bh=Z9x/p+xeBHyTGlmOa9KaC0gqf2WmOHY4BBScJFaKVKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a+8hIq0hS9jWIhoVDiBlaYN3nH7XqwXR340QdVlVCvROCwuJb+mWdX0F/uL5HOGdST16EeHBMKu506oFgXIBvotx9pg5Eaj2FKDAG7GSKZ7VYN6Qxkk2s6mGvDhRrR+otOIHw9Wfcqu2Mh2A/DGu/9cHD6RFESQweATc3gGceCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+u48ceI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+u48ceI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761830053; x=1793366053;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z9x/p+xeBHyTGlmOa9KaC0gqf2WmOHY4BBScJFaKVKw=;
  b=m+u48ceIX5piaPc28ocudTC7QayH6cbULtrSWQ4hwKO0SPcpaUrQKxK6
   G3ihtFXghPgEJXeRhUTUVZ2G5McPRwQpuEHwdXpnNvIBELePpE6BO9lrt
   80f4TglrnEjx9LccQl28X6QwictruUctvjvh5LdGrgeGmcpNkbO/27tpc
   ibvbVt03mvtlJsnbw+1caB92HkupvmxTpA5wxAIcDcPYtTWIMUbwv9ft4
   2+X4B3MXoGJa3WecRFOR6/9c45VThIxvydoYX4rfhF0QtFjuztcC/1gYg
   /SDd5xrkwFWSYbCaCv5cQBymoX1bFI9YFHm00VPTzzK+uNvWwucpA2QpN
   w==;
X-CSE-ConnectionGUID: /dRcMhU8Re2gtIytrbqZNQ==
X-CSE-MsgGUID: dQUBaxwMSSeGk8bApuUJ9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64066742"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="64066742"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 06:14:12 -0700
X-CSE-ConnectionGUID: bpGJ4mC/RTiixWeuqcxuQA==
X-CSE-MsgGUID: 2z6pFNgST52fhOCt3RtObQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="190025186"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Oct 2025 06:14:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vESTg-000M0d-0C;
	Thu, 30 Oct 2025 13:14:08 +0000
Date: Thu, 30 Oct 2025 21:13:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3058/3058] include/net/ip.h:463:14: error:
 default initialization of an object of type 'typeof (rt->dst.expires)' (aka
 'const unsigned long') leaves the object uninitialized
Message-ID: <202510302146.pnDXGiyc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7f38ece6b510adaa28c8e625ff574fe6357a3960
commit: 6864d14bb90f03a1e5b7fbcc04fc2ba4d692bd3e [3058/3058] support 3SNIC 910/920/930 NIC
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20251030/202510302146.pnDXGiyc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510302146.pnDXGiyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510302146.pnDXGiyc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:42:9: error: '__SANITIZE_THREAD__' macro redefined [-Werror,-Wmacro-redefined]
      42 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_THREAD__ 1
         |         ^
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:6:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
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
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:30:
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx.h:9:
   In file included from include/net/ip6_checksum.h:27:
>> include/net/ip.h:463:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
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
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:883:6: error: no previous prototype for function 'sss_nic_port_module_cable_plug' [-Werror,-Wmissing-prototypes]
     883 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:883:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     883 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:889:6: error: no previous prototype for function 'sss_nic_port_module_cable_unplug' [-Werror,-Wmissing-prototypes]
     889 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:889:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     889 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:895:6: error: no previous prototype for function 'sss_nic_port_module_link_err' [-Werror,-Wmissing-prototypes]
     895 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:895:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     895 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1034:22: error: no previous prototype for function 'get_nic_uld_info' [-Werror,-Wmissing-prototypes]
    1034 | struct sss_uld_info *get_nic_uld_info(void)
         |                      ^
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1034:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1034 | struct sss_uld_info *get_nic_uld_info(void)
         | ^
         | static 
   11 errors generated.
--
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
>> include/net/ip.h:463:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
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
   include/net/ip6_fib.h:279:10: error: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
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
>> include/net/ip.h:463:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
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
   include/net/ip6_fib.h:279:10: error: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
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
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:42:9: error: '__SANITIZE_THREAD__' macro redefined [-Werror,-Wmacro-redefined]
      42 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_THREAD__ 1
         |         ^
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_dcb.c:7:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
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
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_dcb.c:23:
   In file included from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx.h:9:
   In file included from include/net/ip6_checksum.h:27:
>> include/net/ip.h:463:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
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
   7 errors generated.
..


vim +463 include/net/ip.h

1b346576359c72 Hannes Frederic Sowa 2014-02-26  451  
f87c10a8aa1e82 Hannes Frederic Sowa 2014-01-09  452  static inline unsigned int ip_dst_mtu_maybe_forward(const struct dst_entry *dst,
f87c10a8aa1e82 Hannes Frederic Sowa 2014-01-09  453  						    bool forwarding)
f87c10a8aa1e82 Hannes Frederic Sowa 2014-01-09  454  {
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  455  	const struct rtable *rt = container_of(dst, struct rtable, dst);
f87c10a8aa1e82 Hannes Frederic Sowa 2014-01-09  456  	struct net *net = dev_net(dst->dev);
02a1b175b0e92d Maciej Żenczykowski  2020-09-23  457  	unsigned int mtu;
f87c10a8aa1e82 Hannes Frederic Sowa 2014-01-09  458  
60c158dc7b1f05 Kuniyuki Iwashima    2022-07-13  459  	if (READ_ONCE(net->ipv4.sysctl_ip_fwd_use_pmtu) ||
d52e5a7e7ca494 Sabrina Dubroca      2018-03-14  460  	    ip_mtu_locked(dst) ||
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  461  	    !forwarding) {
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  462  		mtu = rt->rt_pmtu;
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20 @463  		if (mtu && time_before(jiffies, rt->dst.expires))
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  464  			goto out;
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  465  	}
f87c10a8aa1e82 Hannes Frederic Sowa 2014-01-09  466  
02a1b175b0e92d Maciej Żenczykowski  2020-09-23  467  	/* 'forwarding = true' case should always honour route mtu */
02a1b175b0e92d Maciej Żenczykowski  2020-09-23  468  	mtu = dst_metric_raw(dst, RTAX_MTU);
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  469  	if (mtu)
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  470  		goto out;
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  471  
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  472  	mtu = READ_ONCE(dst->dev->mtu);
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  473  
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  474  	if (unlikely(ip_mtu_locked(dst))) {
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  475  		if (rt->rt_uses_gateway && mtu > 576)
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  476  			mtu = 576;
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  477  	}
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  478  
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  479  out:
ac6627a28dbfb5 Vadim Fedorenko      2021-07-20  480  	mtu = min_t(unsigned int, mtu, IP_MAX_MTU);
02a1b175b0e92d Maciej Żenczykowski  2020-09-23  481  
fade56410c22ca Vadim Fedorenko      2021-06-25  482  	return mtu - lwtunnel_headroom(dst->lwtstate, mtu);
f87c10a8aa1e82 Hannes Frederic Sowa 2014-01-09  483  }
f87c10a8aa1e82 Hannes Frederic Sowa 2014-01-09  484  

:::::: The code at line 463 was first introduced by commit
:::::: ac6627a28dbfb5d96736544a00c3938fa7ea6dfb net: ipv4: Consolidate ipv4_mtu and ip_dst_mtu_maybe_forward

:::::: TO: Vadim Fedorenko <vfedorenko@novek.ru>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
