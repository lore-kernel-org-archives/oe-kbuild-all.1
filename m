Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AC22C853
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 01:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729042027; cv=none; b=IATRQGbR8SzsoRHJkh6CxiTTYqluvWWTWu9Ql9Dp7GpMckpVSymhtu84Y6hVExlLfs0u84XcA1Udb0gqRBCinEHPl0wNTDoTF8sfTvUkcbtEvunWkXY6nqB1AMJXno/PSs9hw3u/Jo9boQMqKk9Yp7bbqmDXbHdCaf4Qi2y16Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729042027; c=relaxed/simple;
	bh=JipvMeOxlz8vtjfVMBU90ht7p1wHzWyEBilY6zGoItU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RLntYZqLjG5fuYMWzGO4JSJG9bBi4MPwT/dIz2sjKWX26Ob3u/rmyhguwIl/gVQd5gUSdiiFdGQqsOVo+ryzpkJPvkKHgRwf0D1PVPxwaKpEJlPTRpwmuprPGYTyQNVnUhCKG+0M0pFrJq4pX3iRdBmJUrtn2u0XP8tslaZDccU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvTyP0Ce; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvTyP0Ce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729042025; x=1760578025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JipvMeOxlz8vtjfVMBU90ht7p1wHzWyEBilY6zGoItU=;
  b=nvTyP0CenW656vLpIJtImMjWlM1M8TidcQjvp93sOUA4QINfSHumbM+o
   QG5Zy2UsytwtXRcOQWZbKBTw/+xYBerkdmqLaRsH1sQAGYA3w2i/I7j9D
   vQzbNXerBEXt+dcWSzFPeNoi9dTWXKEBYS3aByv2CIrxCgnuqi2QiYaUo
   YTeWNNLpqMEVhaQuQv4vleb2qhsbRcQCx5ju8MzR7/Xn33p8QdDteJzoK
   hDObRuJ8IE/2PKpxPMTt4yCWpCYBuVwQoMf+Ln5zHbDhF0AC/t+gWk5uB
   V8+s3ZKwaV22uicxJlUc5w5xaktMV5gPA1E1KPeSRATsxsgUC7A2kUWvS
   g==;
X-CSE-ConnectionGUID: Ey/vBZolS4GxzFgSHdibeg==
X-CSE-MsgGUID: Ws7oOStoR5yehbjFZogiAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32162204"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32162204"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 18:27:05 -0700
X-CSE-ConnectionGUID: BP3JUeqoScSk03E3b3P71A==
X-CSE-MsgGUID: /TpfKPAxSNS0yoFIhH0pFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="78084571"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Oct 2024 18:27:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0soX-000K7w-18;
	Wed, 16 Oct 2024 01:27:01 +0000
Date: Wed, 16 Oct 2024 09:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-debug 1/2] kernel/dma/debug.c:531:42: warning: format
 '%llx' expects argument of type 'long long unsigned int', but argument 5 has
 type 'phys_addr_t' {aka 'unsigned int'}
Message-ID: <202410160901.vPr8dgV8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma-debug
head:   9dd3879d69fdd63f1bd4502e9aadf5f4a45ab651
commit: 6864bd943a0cea3579abd41d7d177ea35277c153 [1/2] dma-debug: store a phys_addr_t in struct dma_debug_entry
config: arc-randconfig-002-20241016 (https://download.01.org/0day-ci/archive/20241016/202410160901.vPr8dgV8-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160901.vPr8dgV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160901.vPr8dgV8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:8,
                    from include/linux/dma-map-ops.h:9,
                    from kernel/dma/debug.c:12:
   kernel/dma/debug.c: In function 'debug_dma_dump_mappings':
>> kernel/dma/debug.c:531:42: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
     531 |                                          "%s idx %d P=%llx D=%llx L=%llx cln=%pa %s %s\n",
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   kernel/dma/debug.c:530:33: note: in expansion of macro 'dev_info'
     530 |                                 dev_info(entry->dev,
         |                                 ^~~~~~~~
   kernel/dma/debug.c:531:58: note: format string is defined here
     531 |                                          "%s idx %d P=%llx D=%llx L=%llx cln=%pa %s %s\n",
         |                                                       ~~~^
         |                                                          |
         |                                                          long long unsigned int
         |                                                       %x
   kernel/dma/debug.c: In function 'dump_show':
   kernel/dma/debug.c:562:58: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 7 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
     562 |                                    "%s %s %s idx %d P=%llx D=%llx L=%llx cln=%pa %s %s\n",
         |                                                       ~~~^
         |                                                          |
         |                                                          long long unsigned int
         |                                                       %x
   ......
     566 |                                    entry->paddr, entry->dev_addr,
         |                                    ~~~~~~~~~~~~           
         |                                         |
         |                                         phys_addr_t {aka unsigned int}
   In file included from include/asm-generic/bug.h:22,
                    from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from include/linux/sched/task_stack.h:9,
                    from kernel/dma/debug.c:10:
   kernel/dma/debug.c: In function 'check_unmap':
   kernel/dma/debug.c:8:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
       8 | #define pr_fmt(fmt)     "DMA-API: " fmt
         |                         ^~~~~~~~~~~
   include/linux/printk.h:135:25: note: in definition of macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   kernel/dma/debug.c:221:25: note: in expansion of macro 'WARN'
     221 |                         WARN(1, pr_fmt("%s %s: ") format,               \
         |                         ^~~~
   kernel/dma/debug.c:221:33: note: in expansion of macro 'pr_fmt'
     221 |                         WARN(1, pr_fmt("%s %s: ") format,               \
         |                                 ^~~~~~
   kernel/dma/debug.c:998:17: note: in expansion of macro 'err_printk'
     998 |                 err_printk(ref->dev, entry, "device driver frees "
         |                 ^~~~~~~~~~
   kernel/dma/debug.c:8:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 7 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
       8 | #define pr_fmt(fmt)     "DMA-API: " fmt
         |                         ^~~~~~~~~~~
   include/linux/printk.h:135:25: note: in definition of macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   kernel/dma/debug.c:221:25: note: in expansion of macro 'WARN'
     221 |                         WARN(1, pr_fmt("%s %s: ") format,               \
         |                         ^~~~
   kernel/dma/debug.c:221:33: note: in expansion of macro 'pr_fmt'
     221 |                         WARN(1, pr_fmt("%s %s: ") format,               \
         |                                 ^~~~~~
   kernel/dma/debug.c:998:17: note: in expansion of macro 'err_printk'
     998 |                 err_printk(ref->dev, entry, "device driver frees "
         |                 ^~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +531 kernel/dma/debug.c

   512	
   513	/*
   514	 * Dump mappings entries on kernel space for debugging purposes
   515	 */
   516	void debug_dma_dump_mappings(struct device *dev)
   517	{
   518		int idx;
   519		phys_addr_t cln;
   520	
   521		for (idx = 0; idx < HASH_SIZE; idx++) {
   522			struct hash_bucket *bucket = &dma_entry_hash[idx];
   523			struct dma_debug_entry *entry;
   524			unsigned long flags;
   525	
   526			spin_lock_irqsave(&bucket->lock, flags);
   527			list_for_each_entry(entry, &bucket->list, list) {
   528				if (!dev || dev == entry->dev) {
   529					cln = to_cacheline_number(entry);
   530					dev_info(entry->dev,
 > 531						 "%s idx %d P=%llx D=%llx L=%llx cln=%pa %s %s\n",
   532						 type2name[entry->type], idx,
   533						 entry->paddr, entry->dev_addr,
   534						 entry->size, &cln,
   535						 dir2name[entry->direction],
   536						 maperr2str[entry->map_err_type]);
   537				}
   538			}
   539			spin_unlock_irqrestore(&bucket->lock, flags);
   540	
   541			cond_resched();
   542		}
   543	}
   544	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
