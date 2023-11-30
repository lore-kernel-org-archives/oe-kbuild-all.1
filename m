Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9A018E00
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A049aUWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701359071; x=1732895071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tDKyg18QDqbeRwDqLoYT+qYLkE3XEEOUMpHKEsp2dlE=;
  b=A049aUWzwAWVRh1qPTJRzMUcA+sSf7pV0bJ/TLL/ilP+I+Ne1APdigHW
   DQrWfp3ht3NyeYRpbknXH4UeleeIwcr/iw3yiTVnMGGZpnucP0OA3fPkS
   /5/pTpMox2/TlSUqkNBIsvAqz2SVTekOFCuH1W6TMq2i9+F17qd7Him3r
   9lSdrg1e4X0WhUFWc5vquPqrizF84OUzQE5x9FMd8xu8BpTJviVb5tm8d
   HZq2jGkAY5roZESgZxu4JrBinbd6HYcBVu/ouuWw2F4Iio4XzMWk9aldT
   OlNZAd+uB5nnyaTk8xvXHfS83Kky8jwxImXSMzySHzYUv13T1UqrC8ddH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="242118"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="242118"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 07:44:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="769344632"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="769344632"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Nov 2023 07:44:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8jDG-0002Fa-1d;
	Thu, 30 Nov 2023 15:44:26 +0000
Date: Thu, 30 Nov 2023 23:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 5502/28619] mm/page_alloc.c:137:40:
 sparse: sparse: restricted gfp_t degrades to integer
Message-ID: <202311302338.tXh3uRX4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   b7ba0d931efd5d4229257d103e47f5319e8ee80c
commit: b9d3d8f1e991052edb89b0537b8f2e8b2aa941ac [5502/28619] ANDROID: GKI: cma: redirect page allocation to CMA
config: arm-randconfig-r131-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302338.tXh3uRX4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311302338.tXh3uRX4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302338.tXh3uRX4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> init/main.c:1167:28: sparse: sparse: restricted gfp_t degrades to integer
>> init/main.c:1167:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted gfp_t extern [addressable] [toplevel] [usertype] gfp_allowed_mask @@     got unsigned int @@
   init/main.c:1167:26: sparse:     expected restricted gfp_t extern [addressable] [toplevel] [usertype] gfp_allowed_mask
   init/main.c:1167:26: sparse:     got unsigned int
--
   mm/page_alloc.c:106:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
   mm/page_alloc.c:107:1: sparse: sparse: symbol '__pcpu_scope_pcpu_drain' was not declared. Should it be static?
>> mm/page_alloc.c:137:40: sparse: sparse: restricted gfp_t degrades to integer
>> mm/page_alloc.c:137:40: sparse: sparse: restricted gfp_t degrades to integer
>> mm/page_alloc.c:137:40: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t [addressable] [toplevel] [usertype] gfp_allowed_mask @@     got unsigned int @@
   mm/page_alloc.c:137:40: sparse:     expected restricted gfp_t [addressable] [toplevel] [usertype] gfp_allowed_mask
   mm/page_alloc.c:137:40: sparse:     got unsigned int
   mm/page_alloc.c:2741:29: sparse: sparse: Using plain integer as NULL pointer
   mm/page_alloc.c:3252:51: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected int cma @@     got restricted gfp_t @@
   mm/page_alloc.c:3252:51: sparse:     expected int cma
   mm/page_alloc.c:3252:51: sparse:     got restricted gfp_t
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:325:27: sparse: sparse: restricted gfp_t degrades to integer
--
>> mm/slub.c:1698:13: sparse: sparse: restricted gfp_t degrades to integer
>> mm/slub.c:1698:13: sparse: sparse: restricted gfp_t degrades to integer
>> mm/slub.c:1698:13: sparse: sparse: restricted gfp_t degrades to integer
   mm/slub.c:1699:46: sparse: sparse: restricted gfp_t degrades to integer
   mm/slub.c:1699:46: sparse: sparse: restricted gfp_t degrades to integer
   mm/slub.c:1699:38: sparse: sparse: restricted gfp_t degrades to integer
>> mm/slub.c:1699:44: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t [usertype] invalid_mask @@     got unsigned int @@
   mm/slub.c:1699:44: sparse:     expected restricted gfp_t [usertype] invalid_mask
   mm/slub.c:1699:44: sparse:     got unsigned int
   mm/slub.c:1700:27: sparse: sparse: restricted gfp_t degrades to integer
   mm/slub.c:1700:27: sparse: sparse: restricted gfp_t degrades to integer
>> mm/slub.c:1700:23: sparse: sparse: invalid assignment: &=
>> mm/slub.c:1700:23: sparse:    left side has type restricted gfp_t
>> mm/slub.c:1700:23: sparse:    right side has type unsigned int
   mm/slub.c:2158:28: sparse: sparse: context imbalance in 'deactivate_slab' - unexpected unlock
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2749:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2749:21: sparse:     got void ***
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2749:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2749:21: sparse:     got unsigned long *
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2749:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2749:21: sparse:     got void ***
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2749:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2749:21: sparse:     got unsigned long *
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2749:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2749:21: sparse:     got void ***
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2749:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2749:21: sparse:     got unsigned long *
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2749:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2749:21: sparse:     got void ***
   mm/slub.c:2749:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2749:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2749:21: sparse:     got unsigned long *
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2749:21: sparse: sparse: self-comparison always evaluates to false
   mm/slub.c:2856:47: sparse: sparse: context imbalance in '__slab_free' - unexpected unlock
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: dereference of noderef expression
   mm/slub.c:2992:21: sparse: sparse: self-comparison always evaluates to false
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
   mm/slub.c:2992:21: sparse:     expected unsigned long [noderef] <asn:3> *__p2
   mm/slub.c:2992:21: sparse:     got unsigned long *
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void **[noderef] <asn:3> *__p1 @@     got void *** @@
   mm/slub.c:2992:21: sparse:     expected void **[noderef] <asn:3> *__p1
   mm/slub.c:2992:21: sparse:     got void ***
   mm/slub.c:2992:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] <asn:3> *__p2 @@     got unsigned long * @@
--
   lib/radix-tree.c:275:36: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *nodes @@     got struct xa_node [noderef] <asn:4> *parent @@
   lib/radix-tree.c:275:36: sparse:     expected struct xa_node *nodes
   lib/radix-tree.c:275:36: sparse:     got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:293:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] <asn:4> *parent @@     got struct xa_node *parent @@
   lib/radix-tree.c:293:29: sparse:     expected struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:293:29: sparse:     got struct xa_node *parent
   lib/radix-tree.c:353:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] <asn:4> *parent @@     got struct xa_node *nodes @@
   lib/radix-tree.c:353:38: sparse:     expected struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:353:38: sparse:     got struct xa_node *nodes
   lib/radix-tree.c:455:54: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] <asn:4> *parent @@     got struct xa_node *node @@
   lib/radix-tree.c:455:54: sparse:     expected struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:455:54: sparse:     got struct xa_node *node
   lib/radix-tree.c:567:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *parent @@     got struct xa_node [noderef] <asn:4> *parent @@
   lib/radix-tree.c:567:24: sparse:     expected struct xa_node *parent
   lib/radix-tree.c:567:24: sparse:     got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:681:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *[assigned] child @@     got struct xa_node [noderef] <asn:4> *parent @@
   lib/radix-tree.c:681:31: sparse:     expected struct xa_node *[assigned] child
   lib/radix-tree.c:681:31: sparse:     got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:955:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *node @@     got struct xa_node [noderef] <asn:4> *parent @@
   lib/radix-tree.c:955:22: sparse:     expected struct xa_node *node
   lib/radix-tree.c:955:22: sparse:     got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:1015:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *node @@     got struct xa_node [noderef] <asn:4> *parent @@
   lib/radix-tree.c:1015:22: sparse:     expected struct xa_node *node
   lib/radix-tree.c:1015:22: sparse:     got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:1536:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *[assigned] node @@     got struct xa_node [noderef] <asn:4> *parent @@
   lib/radix-tree.c:1536:38: sparse:     expected struct xa_node *[assigned] node
   lib/radix-tree.c:1536:38: sparse:     got struct xa_node [noderef] <asn:4> *parent
   lib/radix-tree.c:1596:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *nodes @@     got struct xa_node [noderef] <asn:4> *parent @@
   lib/radix-tree.c:1596:28: sparse:     expected struct xa_node *nodes
   lib/radix-tree.c:1596:28: sparse:     got struct xa_node [noderef] <asn:4> *parent
>> lib/radix-tree.c:106:34: sparse: sparse: restricted gfp_t degrades to integer
   lib/radix-tree.c:106:52: sparse: sparse: restricted gfp_t degrades to integer
   lib/radix-tree.c:106:20: sparse: sparse: restricted gfp_t degrades to integer
>> lib/radix-tree.c:106:31: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted gfp_t @@     got unsigned int @@
   lib/radix-tree.c:106:31: sparse:     expected restricted gfp_t
   lib/radix-tree.c:106:31: sparse:     got unsigned int

vim +137 mm/page_alloc.c

7281201922a006 Lee Schermerhorn       2010-05-26   86  
4518085e127dff Kemi Wang              2017-11-15  @87  DEFINE_STATIC_KEY_TRUE(vm_numa_stat_key);
4518085e127dff Kemi Wang              2017-11-15   88  
7aac7898855123 Lee Schermerhorn       2010-05-26   89  #ifdef CONFIG_HAVE_MEMORYLESS_NODES
7aac7898855123 Lee Schermerhorn       2010-05-26   90  /*
7aac7898855123 Lee Schermerhorn       2010-05-26   91   * N.B., Do NOT reference the '_numa_mem_' per cpu variable directly.
7aac7898855123 Lee Schermerhorn       2010-05-26   92   * It will not be defined when CONFIG_HAVE_MEMORYLESS_NODES is not defined.
7aac7898855123 Lee Schermerhorn       2010-05-26   93   * Use the accessor functions set_numa_mem(), numa_mem_id() and cpu_to_mem()
7aac7898855123 Lee Schermerhorn       2010-05-26   94   * defined in <linux/topology.h>.
7aac7898855123 Lee Schermerhorn       2010-05-26   95   */
7aac7898855123 Lee Schermerhorn       2010-05-26   96  DEFINE_PER_CPU(int, _numa_mem_);		/* Kernel "local memory" node */
7aac7898855123 Lee Schermerhorn       2010-05-26   97  EXPORT_PER_CPU_SYMBOL(_numa_mem_);
ad2c8144418c6a Joonsoo Kim            2014-10-09   98  int _node_numa_mem_[MAX_NUMNODES];
7aac7898855123 Lee Schermerhorn       2010-05-26   99  #endif
7aac7898855123 Lee Schermerhorn       2010-05-26  100  
bd233f538d51c2 Mel Gorman             2017-02-24  101  /* work_structs for global per-cpu drains */
d9367bd06faa1b Wei Yang               2018-12-28  102  struct pcpu_drain {
d9367bd06faa1b Wei Yang               2018-12-28  103  	struct zone *zone;
d9367bd06faa1b Wei Yang               2018-12-28  104  	struct work_struct work;
d9367bd06faa1b Wei Yang               2018-12-28  105  };
bd233f538d51c2 Mel Gorman             2017-02-24  106  DEFINE_MUTEX(pcpu_drain_mutex);
d9367bd06faa1b Wei Yang               2018-12-28  107  DEFINE_PER_CPU(struct pcpu_drain, pcpu_drain);
bd233f538d51c2 Mel Gorman             2017-02-24  108  
38addce8b600ca Emese Revfy            2016-06-20  109  #ifdef CONFIG_GCC_PLUGIN_LATENT_ENTROPY
58bea4144d235c Kees Cook              2016-10-19  110  volatile unsigned long latent_entropy __latent_entropy;
38addce8b600ca Emese Revfy            2016-06-20  111  EXPORT_SYMBOL(latent_entropy);
38addce8b600ca Emese Revfy            2016-06-20  112  #endif
38addce8b600ca Emese Revfy            2016-06-20  113  
^1da177e4c3f41 Linus Torvalds         2005-04-16  114  /*
13808910713a98 Christoph Lameter      2007-10-16  115   * Array of node states.
^1da177e4c3f41 Linus Torvalds         2005-04-16  116   */
13808910713a98 Christoph Lameter      2007-10-16  117  nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
13808910713a98 Christoph Lameter      2007-10-16  118  	[N_POSSIBLE] = NODE_MASK_ALL,
13808910713a98 Christoph Lameter      2007-10-16  119  	[N_ONLINE] = { { [0] = 1UL } },
13808910713a98 Christoph Lameter      2007-10-16  120  #ifndef CONFIG_NUMA
13808910713a98 Christoph Lameter      2007-10-16  121  	[N_NORMAL_MEMORY] = { { [0] = 1UL } },
13808910713a98 Christoph Lameter      2007-10-16  122  #ifdef CONFIG_HIGHMEM
13808910713a98 Christoph Lameter      2007-10-16  123  	[N_HIGH_MEMORY] = { { [0] = 1UL } },
20b2f52b73febc Lai Jiangshan          2012-12-12  124  #endif
20b2f52b73febc Lai Jiangshan          2012-12-12  125  	[N_MEMORY] = { { [0] = 1UL } },
13808910713a98 Christoph Lameter      2007-10-16  126  	[N_CPU] = { { [0] = 1UL } },
13808910713a98 Christoph Lameter      2007-10-16  127  #endif	/* NUMA */
13808910713a98 Christoph Lameter      2007-10-16  128  };
13808910713a98 Christoph Lameter      2007-10-16  129  EXPORT_SYMBOL(node_states);
13808910713a98 Christoph Lameter      2007-10-16  130  
ca79b0c211af63 Arun KS                2018-12-28  131  atomic_long_t _totalram_pages __read_mostly;
ca79b0c211af63 Arun KS                2018-12-28  132  EXPORT_SYMBOL(_totalram_pages);
cb45b0e966cbe7 Hideo AOKI             2006-04-10  133  unsigned long totalreserve_pages __read_mostly;
e48322abb061d7 Pintu Kumar            2014-12-18  134  unsigned long totalcma_pages __read_mostly;
ab8fabd46f811d Johannes Weiner        2012-01-10  135  
1b76b02f15c70d Hugh Dickins           2012-05-11  136  int percpu_pagelist_fraction;
dcce284a259373 Benjamin Herrenschmidt 2009-06-18 @137  gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
6471384af2a653 Alexander Potapenko    2019-07-11  138  #ifdef CONFIG_INIT_ON_ALLOC_DEFAULT_ON
6471384af2a653 Alexander Potapenko    2019-07-11  139  DEFINE_STATIC_KEY_TRUE(init_on_alloc);
6471384af2a653 Alexander Potapenko    2019-07-11  140  #else
6471384af2a653 Alexander Potapenko    2019-07-11  141  DEFINE_STATIC_KEY_FALSE(init_on_alloc);
6471384af2a653 Alexander Potapenko    2019-07-11  142  #endif
6471384af2a653 Alexander Potapenko    2019-07-11  143  EXPORT_SYMBOL(init_on_alloc);
6471384af2a653 Alexander Potapenko    2019-07-11  144  

:::::: The code at line 137 was first introduced by commit
:::::: dcce284a259373f9e5570f2e33f79eca84fcf565 mm: Extend gfp masking to the page allocator

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
