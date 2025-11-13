Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEB833F392
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 11:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763034129; cv=none; b=pZUERZy1D+rj7Sq2LbR75rcvq0Rkw9Jc5jnSLcLGY+XpQQSq8/cy0sMXEMZXr7kj9DDU2KIu5Yrz39GekJR7QFhivsdf0u2fQ+kh2naUXk32/qlXHa2f2FJtFK4KW3kPJ55ullvD9LklRFM5sRqichNLjZz5RAqN1t0bmgz3RDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763034129; c=relaxed/simple;
	bh=XFuoCpILsY69OVgtg7QEmC2zHNsVpwAmcEk8eO5afnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FTNQ4Y0vuOe3EvZF/fYLxCDJ9NSz9X8vTwMBq324ps4tniVUdsvMdh+D9oHf7fAPDmUusBpTQy8aj5Xm2JWPrxAPmGJa4afFdvqe8DTAZlORNFkpK5kLTK+ah/wkamjj+WD9m0r+6Zwu15tgERLQUfMR0AVPZXDAbR8zlSOmn4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnSQTLuY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnSQTLuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763034128; x=1794570128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XFuoCpILsY69OVgtg7QEmC2zHNsVpwAmcEk8eO5afnY=;
  b=gnSQTLuY7yyrZ6UCn8WXWHWCW42akHcVCEl4Y2gYCTWVED7K2W8FcdFE
   F3ogH/d1Qdj1NcfU2ARB7lpJViyzvWHmT7WJA+75MLBzxQAnM9Si2nLty
   ONqygQE/0d59/YovBXzgflO10spfQODRn9OsEqjpaJrU+/0Ubc3be0a+R
   yRaTu3+BPmYWbS1DNJ6O5zH5pwPQQaxPG0p/WGa63wVtHkOnEdgGB5eji
   4ZKFZ5lGpufE2dAYchGwgo9wObwsnD73n+s9sZiynId116OhSCuYbitul
   nhkXIAOUVmxHXdBz9Ox4FP22pvtqH91X3aTX0HBdULBmEPT5YwKNs5Lfs
   A==;
X-CSE-ConnectionGUID: odkAylleT2epxH92rnPpog==
X-CSE-MsgGUID: O/Z7ybViQaGRAhCTgviatA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76215041"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="76215041"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 03:42:08 -0800
X-CSE-ConnectionGUID: d80N0CBRQFqADt3xfDEvAQ==
X-CSE-MsgGUID: +EL7peWySI+E/30FaEBnAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189912075"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2025 03:42:06 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJViF-0005Gn-2t;
	Thu, 13 Nov 2025 11:42:03 +0000
Date: Thu, 13 Nov 2025 19:41:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3182/3182] include/linux/migrate.h:102:9: error:
 expected identifier or '(' before '{' token
Message-ID: <202511131914.MqxXnsR5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c9750f803899fe67a8d281d2d283e8d75d08d4d
commit: 2a212a2a044ed85140cdf66e516f6bde7da08e9d [3182/3182] mm: migrate: add isolate_and_migrate_folios()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511131914.MqxXnsR5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131914.MqxXnsR5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131914.MqxXnsR5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:45:
>> include/linux/migrate.h:102:9: error: expected identifier or '(' before '{' token
     102 |         { return -EINVAL; }
         |         ^
>> include/linux/migrate.h:98:19: warning: 'isolate_and_migrate_folios' declared 'static' but never defined [-Wunused-function]
      98 | static inline int isolate_and_migrate_folios(struct folio **folios, unsigned int nr_folios,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from mm/shmem.c:72:
>> include/linux/migrate.h:102:9: error: expected identifier or '(' before '{' token
     102 |         { return -EINVAL; }
         |         ^
   mm/shmem.c: In function 'shmem_swapin_cluster':
   mm/shmem.c:1699:51: error: passing argument 3 of 'swap_cluster_readahead' from incompatible pointer type [-Wincompatible-pointer-types]
    1699 |         folio = swap_cluster_readahead(swap, gfp, mpol, ilx);
         |                                                   ^~~~
         |                                                   |
         |                                                   struct mempolicy *
   In file included from mm/shmem.c:43:
   mm/swap.h:102:66: note: expected 'struct vm_fault *' but argument is of type 'struct mempolicy *'
     102 |                                 gfp_t gfp_mask, struct vm_fault *vmf)
         |                                                 ~~~~~~~~~~~~~~~~~^~~
   mm/shmem.c:1699:17: error: too many arguments to function 'swap_cluster_readahead'; expected 3, have 4
    1699 |         folio = swap_cluster_readahead(swap, gfp, mpol, ilx);
         |                 ^~~~~~~~~~~~~~~~~~~~~~                  ~~~
   mm/swap.h:101:29: note: declared here
     101 | static inline struct folio *swap_cluster_readahead(swp_entry_t entry,
         |                             ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/migrate.h: At top level:
>> include/linux/migrate.h:98:19: warning: 'isolate_and_migrate_folios' declared 'static' but never defined [-Wunused-function]
      98 | static inline int isolate_and_migrate_folios(struct folio **folios, unsigned int nr_folios,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from mm/memory.c:68:
>> include/linux/migrate.h:102:9: error: expected identifier or '(' before '{' token
     102 |         { return -EINVAL; }
         |         ^
   mm/memory.c: In function 'do_numa_page':
   mm/memory.c:5538:24: warning: variable 'nr_pages' set but not used [-Wunused-but-set-variable]
    5538 |         int flags = 0, nr_pages;
         |                        ^~~~~~~~
   include/linux/migrate.h: At top level:
>> include/linux/migrate.h:98:19: warning: 'isolate_and_migrate_folios' declared 'static' but never defined [-Wunused-function]
      98 | static inline int isolate_and_migrate_folios(struct folio **folios, unsigned int nr_folios,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
   Depends on [n]: CGROUPS [=n]
   Selected by [y]:
   - ARM64 [=y]
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +102 include/linux/migrate.h

    89	
    90	static inline void putback_movable_pages(struct list_head *l) {}
    91	static inline int migrate_pages(struct list_head *l, new_folio_t new,
    92			free_folio_t free, unsigned long private,
    93			enum migrate_mode mode, int reason, unsigned int *ret_succeeded)
    94		{ return -ENOSYS; }
    95	static inline struct folio *alloc_migration_target(struct folio *src,
    96			unsigned long private)
    97		{ return NULL; }
  > 98	static inline int isolate_and_migrate_folios(struct folio **folios, unsigned int nr_folios,
    99			new_folio_t get_new_folio, free_folio_t put_new_folio,
   100			unsigned long private, enum migrate_mode mode,
   101			unsigned int *nr_succeeded);
 > 102		{ return -EINVAL; }
   103	static inline bool isolate_movable_page(struct page *page, isolate_mode_t mode)
   104		{ return false; }
   105	static inline bool isolate_folio_to_list(struct folio *folio, struct list_head *list)
   106		{ return false; }
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
