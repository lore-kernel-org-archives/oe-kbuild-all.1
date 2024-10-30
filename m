Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80371DF739
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 22:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730327323; cv=none; b=GUD38qm6U3TPWlYKWUcurKYNkm8UIoKZ3QOMczOmt3i5N/KycS0RMuQ9gkdD0hOLqysc4AtpV5A2Gmi8Tr3yE4W0xy81wLC0IxzF3/+Jcpdyg6dvE/WTfVWSv68M3ptw5Z49vDe9e2nPuOlZqQEOWYY+PQLEkKRR+1n5lVFFHew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730327323; c=relaxed/simple;
	bh=8oxlKsxxH/ENnQPhtfR4Rv3kgVo13eY4L7SQ2efkJM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LDZ3GPPcZ1LPDCE4XZlG/bUY7AuJeHox475e0MXy3dGJRGaWo1BHc4/Xj4H/vofk71dRyrVeZQIpCvIZgGR2R5T01APUI7rbASlPCqyStB/MzNWO4RKzo80329pwsHGoWuX8o6B6l6wupxxSXYAEZtQxGnHLgxzo54UfzyJQjuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIzPCBOr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIzPCBOr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730327320; x=1761863320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8oxlKsxxH/ENnQPhtfR4Rv3kgVo13eY4L7SQ2efkJM0=;
  b=ZIzPCBOrA8xa3l/7NU84NvDBzynX8lIEVsRr3XrNVCU/2YkDiNf6arh9
   3hqDaqnGgWdxuGOG/NtKSwUhra1CNVlNCGteq7JEk3oaKhkeQBzU6bBQk
   jWBurmRxZUscBgdjJLEs6/YvVXSKhDfArVghm/AN4UsJJboYLNEDUgJnn
   TQLXnPZZf8m1aa9i7XhC35nu3zKfzBnurIO+/Og0vDNi1pYjKGIX6YhlI
   SK7dDh2ZAdwNy4H6+/iUs5VKSBQ8b/dZY9kmWj8MNpOGRsn4E/1Q9EXgi
   MURv1AU21lX0X5HE76Emxd/fTlS/HMrl/oEEQNVt0dDSmucE54l/gR8pS
   w==;
X-CSE-ConnectionGUID: kbBzEnY6RxuvT1Tlw3cwiw==
X-CSE-MsgGUID: +kVKDMvfRp+WGHWxFXG+0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="30157761"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="30157761"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 15:28:39 -0700
X-CSE-ConnectionGUID: DLBIVnwcSKKy08ompBo0nQ==
X-CSE-MsgGUID: bB0ZiBl/TfSjzQTePw17/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="86390617"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Oct 2024 15:28:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6HB5-000fNQ-1v;
	Wed, 30 Oct 2024 22:28:35 +0000
Date: Thu, 31 Oct 2024 06:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 49/53] include/linux/blkdev.h:1390:13: error: no
 member named 'conv_zones_bitmap' in 'struct gendisk'
Message-ID: <202410310648.GaLVqiXZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   feb9371f18af51326c82c6d16cacb9db79717f98
commit: 8b88887562ef99311b5d6846095076ef74d3870f [49/53] block: add a public bdev_zone_is_seq helper
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241031/202410310648.GaLVqiXZ-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310648.GaLVqiXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310648.GaLVqiXZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page-writeback.c:20:
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
   In file included from mm/page-writeback.c:28:
>> include/linux/blkdev.h:1390:13: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1390 |         if (!disk->conv_zones_bitmap)
         |              ~~~~  ^
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:45:37: note: expanded from macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   In file included from mm/page-writeback.c:28:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:46:16: note: expanded from macro 'bitop'
      46 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   In file included from mm/page-writeback.c:28:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:47:50: note: expanded from macro 'bitop'
      47 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   In file included from mm/page-writeback.c:28:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:48:17: note: expanded from macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   In file included from mm/page-writeback.c:28:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:48:32: note: expanded from macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   In file included from mm/page-writeback.c:40:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   6 warnings and 6 errors generated.
--
   In file included from mm/vmscan.c:15:
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
   In file included from mm/vmscan.c:28:
>> include/linux/blkdev.h:1390:13: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1390 |         if (!disk->conv_zones_bitmap)
         |              ~~~~  ^
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:45:37: note: expanded from macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   In file included from mm/vmscan.c:28:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:46:16: note: expanded from macro 'bitop'
      46 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   In file included from mm/vmscan.c:28:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:47:50: note: expanded from macro 'bitop'
      47 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   In file included from mm/vmscan.c:28:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:48:17: note: expanded from macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   In file included from mm/vmscan.c:28:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:48:32: note: expanded from macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:401:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     401 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1729:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1729 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2234:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2234 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2235:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2235 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6250:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6250 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   11 warnings and 6 errors generated.
--
   In file included from mm/madvise.c:9:
   In file included from include/linux/mman.h:5:
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
   In file included from mm/madvise.c:21:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/madvise.c:27:
>> include/linux/blkdev.h:1390:13: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1390 |         if (!disk->conv_zones_bitmap)
         |              ~~~~  ^
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:45:37: note: expanded from macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   In file included from mm/madvise.c:27:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:46:16: note: expanded from macro 'bitop'
      46 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   In file included from mm/madvise.c:27:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:47:50: note: expanded from macro 'bitop'
      47 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   In file included from mm/madvise.c:27:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:48:17: note: expanded from macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   In file included from mm/madvise.c:27:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:48:32: note: expanded from macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   6 warnings and 6 errors generated.
--
   In file included from mm/page_io.c:14:
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
   In file included from mm/page_io.c:22:
>> include/linux/blkdev.h:1390:13: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1390 |         if (!disk->conv_zones_bitmap)
         |              ~~~~  ^
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:45:37: note: expanded from macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   In file included from mm/page_io.c:22:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:46:16: note: expanded from macro 'bitop'
      46 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   In file included from mm/page_io.c:22:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:47:50: note: expanded from macro 'bitop'
      47 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   In file included from mm/page_io.c:22:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:48:17: note: expanded from macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   In file included from mm/page_io.c:22:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:48:32: note: expanded from macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   4 warnings and 6 errors generated.
..


vim +1390 include/linux/blkdev.h

  1378	
  1379	/**
  1380	 * bdev_zone_is_seq - check if a sector is on a sequential write zone
  1381	 * @bdev:	block device to check
  1382	 * @sector:	sector number
  1383	 *
  1384	 * Check if @sector on @bdev is on sequential write required zone.
  1385	 */
  1386	static inline bool bdev_zone_is_seq(struct block_device *bdev, sector_t sector)
  1387	{
  1388		struct gendisk *disk = bdev->bd_disk;
  1389	
> 1390		if (!disk->conv_zones_bitmap)
  1391			return bdev_is_zoned(bdev);
  1392		return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
  1393	}
  1394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
