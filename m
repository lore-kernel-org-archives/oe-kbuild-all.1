Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6BF101C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 01:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729042026; cv=none; b=nCvN/tbnBWgdDW4fkw3wMV6PJ7wxyEVHijCS3vWKzF9dp9wBBD1AwwbLHJU0nfYx97EMvbaHRCAXYIRXt8ydaVpC4BUk3g2cO9xL6FocUmsGbclJnFOJohqdnebF3E87bdkloNEtkaGK0JBEtSmiTRIkQwo+syHUDxUpA99bfXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729042026; c=relaxed/simple;
	bh=Lp9DL0AbSZGiF8gWMr0gGyEA8nesSrpsPROE3tOS0Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pxnsvbJkFOjvwQno/wa7/ZQk0Mv/G6ipyd0l9Fv6E0Pi7qLNQP6P+Snq6HMUnEOZPnxl2diuTsQWYrPi2JRb1sXpI4mL1M058Sp48k0WYysBA11XYfADXMZlyTu6dyQY1s5qnYF3Q5nZZUnINCP5bCEVEiuf8UcZX7PQJmY6hnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVW8I6wz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVW8I6wz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729042024; x=1760578024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lp9DL0AbSZGiF8gWMr0gGyEA8nesSrpsPROE3tOS0Xs=;
  b=kVW8I6wz6BAJXZ+rhcnMhcBHFBZn6fhMf2RzHJS134GiyvS1t2bLoLqf
   el0/SodgfeErYmTpcutTJBHi9MlQOaqABQHJYhwiVrDLQeV8aGL7crFTQ
   BvI1corvAacs6w5GNHX6Q4nujRT7TncLPSVLqjcQ7oroYx0qBwfbBR7GP
   tKXTRaNUAqmldfmRVIlzrMDpH+9UqXT/ctVHcJzVkeUOKpLbs2mXu51A/
   oq5PUN1cPXliFzZqDKBVXu0JNcuCQLYYjNyz498S++LcgjkGxF1ss6Z5J
   m/38uRhKRaK2kzlQZ4fM9Pc22RWYsLjVfS0UOuem00W7fvGQuyM/FhaR8
   w==;
X-CSE-ConnectionGUID: 88rKPI4XSmyElWoQZH10BA==
X-CSE-MsgGUID: lD6k2zEcRzK/5oNBlatz6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51009331"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51009331"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 18:27:04 -0700
X-CSE-ConnectionGUID: rm0olbd/RQSeGFFWD+UIBQ==
X-CSE-MsgGUID: L3NkUAofRgqc+dC0BEd4aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="78415609"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Oct 2024 18:27:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0soX-000K7n-0W;
	Wed, 16 Oct 2024 01:27:01 +0000
Date: Wed, 16 Oct 2024 09:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-debug 1/2] kernel/dma/debug.c:533:7: warning: format
 specifies type 'unsigned long long' but the argument has type 'phys_addr_t'
 (aka 'unsigned int')
Message-ID: <202410160914.Nx3XJ1aq-lkp@intel.com>
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
config: arm-randconfig-003-20241016 (https://download.01.org/0day-ci/archive/20241016/202410160914.Nx3XJ1aq-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160914.Nx3XJ1aq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160914.Nx3XJ1aq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/dma/debug.c:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/dma/debug.c:533:7: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
     531 |                                          "%s idx %d P=%llx D=%llx L=%llx cln=%pa %s %s\n",
         |                                                       ~~~~
         |                                                       %x
     532 |                                          type2name[entry->type], idx,
     533 |                                          entry->paddr, entry->dev_addr,
         |                                          ^~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   kernel/dma/debug.c:566:8: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
     562 |                                    "%s %s %s idx %d P=%llx D=%llx L=%llx cln=%pa %s %s\n",
         |                                                       ~~~~
         |                                                       %x
     563 |                                    dev_driver_string(entry->dev),
     564 |                                    dev_name(entry->dev),
     565 |                                    type2name[entry->type], idx,
     566 |                                    entry->paddr, entry->dev_addr,
         |                                    ^~~~~~~~~~~~
   kernel/dma/debug.c:1004:7: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
    1001 |                            "[cpu alloc address=0x%016llx] "
         |                                                  ~~~~~~~
         |                                                  %016x
    1002 |                            "[cpu free address=0x%016llx]",
    1003 |                            ref->dev_addr, ref->size,
    1004 |                            entry->paddr,
         |                            ^~~~~~~~~~~~
   kernel/dma/debug.c:223:42: note: expanded from macro 'err_printk'
     221 |                         WARN(1, pr_fmt("%s %s: ") format,               \
         |                                                   ~~~~~~
     222 |                              dev ? dev_driver_string(dev) : "NULL",     \
     223 |                              dev ? dev_name(dev) : "NULL", ## arg);     \
         |                                                               ^~~
   include/asm-generic/bug.h:134:29: note: expanded from macro 'WARN'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                                           ^~~~~~
   include/asm-generic/bug.h:99:48: note: expanded from macro '__WARN_printf'
      99 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   kernel/dma/debug.c:1005:7: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
    1002 |                            "[cpu free address=0x%016llx]",
         |                                                 ~~~~~~~
         |                                                 %016x
    1003 |                            ref->dev_addr, ref->size,
    1004 |                            entry->paddr,
    1005 |                            ref->paddr);
         |                            ^~~~~~~~~~
   kernel/dma/debug.c:223:42: note: expanded from macro 'err_printk'
     221 |                         WARN(1, pr_fmt("%s %s: ") format,               \
         |                                                   ~~~~~~
     222 |                              dev ? dev_driver_string(dev) : "NULL",     \
     223 |                              dev ? dev_name(dev) : "NULL", ## arg);     \
         |                                                               ^~~
   include/asm-generic/bug.h:134:29: note: expanded from macro 'WARN'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                                           ^~~~~~
   include/asm-generic/bug.h:99:48: note: expanded from macro '__WARN_printf'
      99 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   5 warnings generated.


vim +533 kernel/dma/debug.c

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
   531						 "%s idx %d P=%llx D=%llx L=%llx cln=%pa %s %s\n",
   532						 type2name[entry->type], idx,
 > 533						 entry->paddr, entry->dev_addr,
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
