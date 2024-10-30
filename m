Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F9B194151
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730283010; cv=none; b=FxnyvTv+qTrKcVQTg6AQluT0SbLRwOkmVG1PlF895ZH1mkP5EjjWLDjwFDjXXqa1mGq5ac3CyO1iX5ceHts3TEnpU7zS2/JeGsy7WWmZ9NehdBi3O07F5oR2AXE8lsxzBZxVBB73ZsNbUPm8kMR58IywWxP72JgTmdpscvzBKDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730283010; c=relaxed/simple;
	bh=Tq7Ht9V3WC1Ievhk6BYMLW5ePiwTdEQ8TcYjX8om/SU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d1eW5N49IUftuvk40FvjdsF/88ysvue4KlYuaPQPYQGGQTmLKHbbSVb6s3wnH4Dz9PiXHN3+pfFDxXBlfKx8BHO+P1uiqhggaFrpP9OrlukCJTzqaOsvHhFL+bpeyKTiJl/+VZN6yCeDfNfUpiXC0+w+kCjxMSd4DqPeCaS1nlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6dICwjW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6dICwjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730283007; x=1761819007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tq7Ht9V3WC1Ievhk6BYMLW5ePiwTdEQ8TcYjX8om/SU=;
  b=G6dICwjWOORn5sj5yXsdiN+oojknG6EaoA75Os5/qvxV1s0ByG+0M0R9
   6dkM6PxrTwWcN1pSNwcu/3Xq5hTdqi1Sukm35HD8BPplaSpFRJeEvOTb8
   murqPOfoOkMmSvUAGcATujeJJA+4ddeLEs5moa8GPQ4R+MVW+U6NtbrUh
   H8tcSIufLbywJCyl3k8JTXU3bYiq0ZDDu2eAXb8MFMJOfvOYyLOlsqGjz
   VhRNHFUGYEELLKC7p9wZGMpke4PDKj+xaZu6rpo8fzziuZhRlnFAnFYRx
   +hTaaAh8emsIIUe5nizs9FvQqZFhkH+gp94i2+6XPKyeHM8mVihGiUtdP
   g==;
X-CSE-ConnectionGUID: 1K1hZEgQTeKMFs7V3w8+aw==
X-CSE-MsgGUID: d7c1Yz95QUOWeKkYyZkS/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41073346"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41073346"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 03:10:06 -0700
X-CSE-ConnectionGUID: W4pvakuIRAalkPD3a0MGxA==
X-CSE-MsgGUID: 5EUEwjxkSkewA1UeJFlA/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="82353395"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Oct 2024 03:10:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t65eM-000ejQ-2m;
	Wed, 30 Oct 2024 10:10:02 +0000
Date: Wed, 30 Oct 2024 18:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:health-monitoring 256/271]
 drivers/md/bcache/util.h:284:8: error: redefinition of 'time_stats'
Message-ID: <202410301819.Qmsz40Jz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   ab0339aa32f49d7cce50abab1e0e3e4d648d787c
commit: 4cb3c7a46a03de4e1ec96028e893aaf724c0b4f8 [256/271] vfs: add time stats collection for i_rwsem and the mmap invalidation lock
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241030/202410301819.Qmsz40Jz-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410301819.Qmsz40Jz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410301819.Qmsz40Jz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/md/bcache/alloc.c:64:
   In file included from drivers/md/bcache/bcache.h:181:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/md/bcache/alloc.c:64:
   In file included from drivers/md/bcache/bcache.h:194:
   In file included from drivers/md/bcache/bset.h:9:
>> drivers/md/bcache/util.h:284:8: error: redefinition of 'time_stats'
     284 | struct time_stats {
         |        ^
   include/linux/time_stats.h:69:8: note: previous definition is here
      69 | struct time_stats {
         |        ^
   4 warnings and 1 error generated.
--
   In file included from drivers/md/bcache/sysfs.c:9:
   In file included from drivers/md/bcache/bcache.h:181:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/md/bcache/sysfs.c:9:
   In file included from drivers/md/bcache/bcache.h:194:
   In file included from drivers/md/bcache/bset.h:9:
>> drivers/md/bcache/util.h:284:8: error: redefinition of 'time_stats'
     284 | struct time_stats {
         |        ^
   include/linux/time_stats.h:69:8: note: previous definition is here
      69 | struct time_stats {
         |        ^
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_frequency' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:317:6: note: expanded from macro 'sysfs_print_time_stats'
     316 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     317 |                           average_frequency,    frequency_units);       \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:61:41: note: expanded from macro 'sysfs_print'
      61 |                                 __builtin_types_compatible_p(typeof(var), int)          \
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_frequency' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:317:6: note: expanded from macro 'sysfs_print_time_stats'
     316 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     317 |                           average_frequency,    frequency_units);       \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:63:41: note: expanded from macro 'sysfs_print'
      63 |                                 __builtin_types_compatible_p(typeof(var), unsigned int) \
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_frequency' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:317:6: note: expanded from macro 'sysfs_print_time_stats'
     316 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     317 |                           average_frequency,    frequency_units);       \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:65:41: note: expanded from macro 'sysfs_print'
      65 |                                 __builtin_types_compatible_p(typeof(var), long)         \
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_frequency' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:317:6: note: expanded from macro 'sysfs_print_time_stats'
     316 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     317 |                           average_frequency,    frequency_units);       \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:67:41: note: expanded from macro 'sysfs_print'
      67 |                                 __builtin_types_compatible_p(typeof(var), unsigned long)\
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_frequency' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:317:6: note: expanded from macro 'sysfs_print_time_stats'
     316 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     317 |                           average_frequency,    frequency_units);       \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:69:41: note: expanded from macro 'sysfs_print'
      69 |                                 __builtin_types_compatible_p(typeof(var), int64_t)      \
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_frequency' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:317:6: note: expanded from macro 'sysfs_print_time_stats'
     316 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     317 |                           average_frequency,    frequency_units);       \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:71:41: note: expanded from macro 'sysfs_print'
      71 |                                 __builtin_types_compatible_p(typeof(var), uint64_t)     \
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_frequency' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:317:6: note: expanded from macro 'sysfs_print_time_stats'
     316 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     317 |                           average_frequency,    frequency_units);       \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:73:41: note: expanded from macro 'sysfs_print'
      73 |                                 __builtin_types_compatible_p(typeof(var), const char *) \
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_frequency' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:317:6: note: expanded from macro 'sysfs_print_time_stats'
     316 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     317 |                           average_frequency,    frequency_units);       \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:74:26: note: expanded from macro 'sysfs_print'
      74 |                                          ? "%s\n" : "%i\n", var);       \
         |                                                             ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_duration' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:319:6: note: expanded from macro 'sysfs_print_time_stats'
     318 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     319 |                           average_duration,     duration_units);        \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:61:41: note: expanded from macro 'sysfs_print'
      61 |                                 __builtin_types_compatible_p(typeof(var), int)          \
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_duration' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:319:6: note: expanded from macro 'sysfs_print_time_stats'
     318 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     319 |                           average_duration,     duration_units);        \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:63:41: note: expanded from macro 'sysfs_print'
      63 |                                 __builtin_types_compatible_p(typeof(var), unsigned int) \
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_duration' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:319:6: note: expanded from macro 'sysfs_print_time_stats'
     318 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     319 |                           average_duration,     duration_units);        \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:65:41: note: expanded from macro 'sysfs_print'
      65 |                                 __builtin_types_compatible_p(typeof(var), long)         \
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_duration' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:319:6: note: expanded from macro 'sysfs_print_time_stats'
     318 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     319 |                           average_duration,     duration_units);        \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:67:41: note: expanded from macro 'sysfs_print'
      67 |                                 __builtin_types_compatible_p(typeof(var), unsigned long)\
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_duration' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:319:6: note: expanded from macro 'sysfs_print_time_stats'
     318 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     319 |                           average_duration,     duration_units);        \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:69:41: note: expanded from macro 'sysfs_print'
      69 |                                 __builtin_types_compatible_p(typeof(var), int64_t)      \
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_duration' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:319:6: note: expanded from macro 'sysfs_print_time_stats'
     318 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     319 |                           average_duration,     duration_units);        \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:71:41: note: expanded from macro 'sysfs_print'
      71 |                                 __builtin_types_compatible_p(typeof(var), uint64_t)     \
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_duration' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:319:6: note: expanded from macro 'sysfs_print_time_stats'
     318 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     319 |                           average_duration,     duration_units);        \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:73:41: note: expanded from macro 'sysfs_print'
      73 |                                 __builtin_types_compatible_p(typeof(var), const char *) \
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'average_duration' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:319:6: note: expanded from macro 'sysfs_print_time_stats'
     318 |         __print_time_stat(stats, name,                                  \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     319 |                           average_duration,     duration_units);        \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:310:24: note: expanded from macro '__print_time_stat'
     309 |         sysfs_print(name ## _ ## stat ## _ ## units,                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                     div_u64((stats)->stat >> 8, NSEC_PER_ ## units))
         |                     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/sysfs.h:74:26: note: expanded from macro 'sysfs_print'
      74 |                                          ? "%s\n" : "%i\n", var);       \
         |                                                             ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'last' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:324:58: note: expanded from macro 'sysfs_print_time_stats'
     324 |         sysfs_print(name ## _last_ ## frequency_units, (stats)->last    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
     325 |                     ? div_s64(local_clock() - (stats)->last,            \
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     326 |                               NSEC_PER_ ## frequency_units)             \
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     327 |                     : -1LL);                                            \
         |                     ~~~~~~~
   drivers/md/bcache/sysfs.h:61:41: note: expanded from macro 'sysfs_print'
      61 |                                 __builtin_types_compatible_p(typeof(var), int)          \
         |                                                                     ^~~
>> drivers/md/bcache/sysfs.c:742:2: error: no member named 'last' in 'struct time_stats'
     742 |         sysfs_print_time_stats(&c->btree_gc_time,       btree_gc, sec, ms);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/util.h:325:42: note: expanded from macro 'sysfs_print_time_stats'
     324 |         sysfs_print(name ## _last_ ## frequency_units, (stats)->last    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     325 |                     ? div_s64(local_clock() - (stats)->last,            \
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
     326 |                               NSEC_PER_ ## frequency_units)             \
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     327 |                     : -1LL);                                            \
         |                     ~~~~~~~
   drivers/md/bcache/sysfs.h:61:41: note: expanded from macro 'sysfs_print'
      61 |                                 __builtin_types_compatible_p(typeof(var), int)          \
         |                                                                     ^~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   4 warnings and 20 errors generated.
..


vim +/time_stats +284 drivers/md/bcache/util.h

cafe563591446c Kent Overstreet 2013-03-23  283  
cafe563591446c Kent Overstreet 2013-03-23 @284  struct time_stats {
65d22e911bfc4f Kent Overstreet 2013-07-31  285  	spinlock_t	lock;
cafe563591446c Kent Overstreet 2013-03-23  286  	/*
cafe563591446c Kent Overstreet 2013-03-23  287  	 * all fields are in nanoseconds, averages are ewmas stored left shifted
cafe563591446c Kent Overstreet 2013-03-23  288  	 * by 8
cafe563591446c Kent Overstreet 2013-03-23  289  	 */
cafe563591446c Kent Overstreet 2013-03-23  290  	uint64_t	max_duration;
cafe563591446c Kent Overstreet 2013-03-23  291  	uint64_t	average_duration;
cafe563591446c Kent Overstreet 2013-03-23  292  	uint64_t	average_frequency;
cafe563591446c Kent Overstreet 2013-03-23  293  	uint64_t	last;
cafe563591446c Kent Overstreet 2013-03-23  294  };
cafe563591446c Kent Overstreet 2013-03-23  295  

:::::: The code at line 284 was first introduced by commit
:::::: cafe563591446cf80bfbc2fe3bc72a2e36cf1060 bcache: A block layer cache

:::::: TO: Kent Overstreet <koverstreet@google.com>
:::::: CC: Kent Overstreet <koverstreet@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
