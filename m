Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E393FE34A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 14:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536938; cv=none; b=TfN2PxPvHwJYWfEXRCqPvvQaWcGMNUF1y8sWLxfe0MQ0lekRvKoxI74wzfATXkpB0aYRNzwi5vHMx1NGVQ+Q0HOcqOMCupDSyRrOnzGwGQ8xKepykLkFxkfqJEgK/wUBwP0NtaU3BxX1vSzxT80m7lHY6fHPM2fIhWGOxbn0l70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536938; c=relaxed/simple;
	bh=V3UoIwjSt7joa0kafyldGhExlDZtZZor4stfWZARBz8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jL/NcTWpmc96raQ/urKReTqXhziKZE4qkkzcQRIs2wa7rTG3X0yWFngLEOma7zJxeW38DjvsNPGtSs8cD8+NDFyRNjKHuLHGcGs3w4CkCKx0DUSfKhk6+qA/snQx0JjONHQQN0ae214OQ3lK+HUlw75HZ+JfM5bUKYKEVG7B5Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZ/lxs0o; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZ/lxs0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774536933; x=1806072933;
  h=date:from:to:cc:subject:message-id;
  bh=V3UoIwjSt7joa0kafyldGhExlDZtZZor4stfWZARBz8=;
  b=dZ/lxs0oU4qEVhd42YHCLnS1kwzaCvXuq+8E3/tNdW54rxSsIVRcP9b/
   2iXtt2ObqQAhhepW8sysdGo31J6/kYChX1lvDLjzpHfGYxviKemCOTdJT
   Ud+Z+z2ly1bXp1T89WEM8quYZDj4L+fXyNs8+a8dFtZQHkaQ2DMk4Mhn/
   mot64xWtGb1jMk6ToSbwIwGFJUrs4WIsmqzZkXSslzZh0yGwEzLLSOKfD
   Ec8nxFbf4NWfPvMrTTyCgmzB84Q1q0aE0f0mDobDiyFpZfiIACQoTXVso
   1ghQhEQQ9gAzAUSmGN/hDIUu9FHKmKhL7CIT7JMCJleJXDm0xQof60n9j
   w==;
X-CSE-ConnectionGUID: EjrXjbJzTSyM1rjWe19v6A==
X-CSE-MsgGUID: oH6zOLQgSz+6ov/CqV2nHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="87070029"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="87070029"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 07:55:32 -0700
X-CSE-ConnectionGUID: pshME199TY249T/gKvW1Dw==
X-CSE-MsgGUID: 08j69PYcQcOBpLjmUrYJpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="248426656"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Mar 2026 07:55:30 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5m7M-000000008wD-1OOB;
	Thu, 26 Mar 2026 14:55:28 +0000
Date: Thu, 26 Mar 2026 22:54:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/md/dm-bow.c:1293:6: warning: no previous prototype for function
 'dm_bow_exit'
Message-ID: <202603262256.Ts6AEUb5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Paul,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d73a8ddf419e5ee819fff624cf35bfedd85b5609
commit: dcb994383d2b1641ebe7b518caab88d2d9dbfa72 [1/1] Revert "ANDROID: dm-bow: remove dm-bow"
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260326/202603262256.Ts6AEUb5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603262256.Ts6AEUb5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603262256.Ts6AEUb5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c:97:10: warning: no previous prototype for function 'range_top' [-Wmissing-prototypes]
      97 | sector_t range_top(struct bow_range *br)
         |          ^
   drivers/md/dm-bow.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | sector_t range_top(struct bow_range *br)
         | ^
         | static 
   drivers/md/dm-bow.c:103:5: warning: no previous prototype for function 'range_size' [-Wmissing-prototypes]
     103 | u64 range_size(struct bow_range *br)
         |     ^
   drivers/md/dm-bow.c:103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     103 | u64 range_size(struct bow_range *br)
         | ^
         | static 
   drivers/md/dm-bow.c:148:6: warning: no previous prototype for function 'add_before' [-Wmissing-prototypes]
     148 | void add_before(struct rb_root *ranges, struct bow_range *new_br,
         |      ^
   drivers/md/dm-bow.c:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     148 | void add_before(struct rb_root *ranges, struct bow_range *new_br,
         | ^
         | static 
   drivers/md/dm-bow.c:592:3: error: field designator 'default_attrs' does not refer to any field in type 'struct kobj_type'
     592 |         .default_attrs = bow_attrs,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c:712:6: error: no member named 'num_write_same_bios' in 'struct dm_target'; did you mean 'num_write_zeroes_bios'?
     712 |         ti->num_write_same_bios = 1;
         |             ^~~~~~~~~~~~~~~~~~~
         |             num_write_zeroes_bios
   include/linux/device-mapper.h:339:15: note: 'num_write_zeroes_bios' declared here
     339 |         unsigned int num_write_zeroes_bios;
         |                      ^
   drivers/md/dm-bow.c:749:19: error: too few arguments to function call, expected 7, have 6
     748 |         bc->bufio = dm_bufio_client_create(bc->dev->bdev, bc->block_size, 1, 0,
         |                     ~~~~~~~~~~~~~~~~~~~~~~
     749 |                                            NULL, NULL);
         |                                                      ^
   include/linux/dm-bufio.h:30:1: note: 'dm_bufio_client_create' declared here
      30 | dm_bufio_client_create(struct block_device *bdev, unsigned int block_size,
         | ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      31 |                        unsigned int reserved_buffers, unsigned int aux_size,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      32 |                        void (*alloc_callback)(struct dm_buffer *),
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      33 |                        void (*write_callback)(struct dm_buffer *),
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      34 |                        unsigned int flags);
         |                        ~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c:1096:5: warning: no previous prototype for function 'remap_unless_illegal_trim' [-Wmissing-prototypes]
    1096 | int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
         |     ^
   drivers/md/dm-bow.c:1096:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1096 | int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
         | ^
         | static 
   drivers/md/dm-bow.c:1259:43: error: no member named 'bd_inode' in 'struct block_device'
    1259 |         return ti->len != i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT;
         |                                       ~~~~~~~~~  ^
   drivers/md/dm-bow.c:1252:5: warning: no previous prototype for function 'dm_bow_prepare_ioctl' [-Wmissing-prototypes]
    1252 | int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
         |     ^
   drivers/md/dm-bow.c:1252:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1252 | int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
         | ^
         | static 
   drivers/md/dm-bow.c:1284:12: warning: no previous prototype for function 'dm_bow_init' [-Wmissing-prototypes]
    1284 | int __init dm_bow_init(void)
         |            ^
   drivers/md/dm-bow.c:1284:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1284 | int __init dm_bow_init(void)
         | ^
         | static 
>> drivers/md/dm-bow.c:1293:6: warning: no previous prototype for function 'dm_bow_exit' [-Wmissing-prototypes]
    1293 | void dm_bow_exit(void)
         |      ^
   drivers/md/dm-bow.c:1293:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1293 | void dm_bow_exit(void)
         | ^
         | static 
   12 warnings and 4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/dm_bow_exit +1293 drivers/md/dm-bow.c

  1292	
> 1293	void dm_bow_exit(void)
  1294	{
  1295		dm_unregister_target(&bow_target);
  1296	}
  1297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
