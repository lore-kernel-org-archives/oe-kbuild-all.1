Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45A52D24AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 09:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765618048; cv=none; b=qBjZTOx4IkUCVTV03pUj/Z4xDbjoCFw6oZ7OGj0QlgveS7i3Wwf1nqQ3vu9Ln/q3gsbAuPcyQFECwNkVcv+qz7GOkZy03y0KlN/pw2o6/+4aZRjXUdmwpq11WXq1f1RnT/eabDnh1A5Db/ZYVsC1IlbdJ27Z22GneX4yCgU9QUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765618048; c=relaxed/simple;
	bh=Bbg+JZj6XJ1PgdUPcNCD3cyDKt7BCwrBCajs7iC/3hM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MfvXciTXIPoOkEL0z0T6Z5mLJCe5qWT9mGpxKQu/RCMdDxW0TZCFMenA9/uY/CSCV4saYgoZng+1AAOu3iTwrY5tFHtjSu/Sh7sc+/qdrGqCV6uGrqR7QPRKJylwCCMP/boIZWb8OFs9RxgEe3S7o7D1ceA1vnkxc0eIShVFXR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NH92Sk1R; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NH92Sk1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765618046; x=1797154046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bbg+JZj6XJ1PgdUPcNCD3cyDKt7BCwrBCajs7iC/3hM=;
  b=NH92Sk1R9yh/Fw8bbayLS4mJXxPx0mnJKZg7s5Y4gAhPhi2FauxFuflg
   I9VsyNFFHVPOj6/J0JF1a7eGXaEB+7P9kathJ/VcxkXQwfshbKLpQu0/U
   NDRVdDCZAPN+J1SdYsvWC7lBn0/isG7jfBqbbGP7GFU9IBdUZty8xaLSC
   c6DoknN8Xvg/C0lvg1Bi66DiOjXhRLieHFErj4uocqJsrUrDlaaClHcIa
   7kmUHSuQTpukVonAmHwApUdOrR3qq441arCKQuo7EnQAcHZhKk5Z4Ngyx
   OWNzFcmebcB6mD5I55NG+mtzMW4eB6nMIvBaWMaSN0hRDWxD0obnUgH92
   Q==;
X-CSE-ConnectionGUID: Zip60eyiQHquSuVsQAF6ag==
X-CSE-MsgGUID: wBNFu2cLRPSNniGIwcR4fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66594701"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="66594701"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 01:27:26 -0800
X-CSE-ConnectionGUID: BSavn76oQQ6FpZZAc266pw==
X-CSE-MsgGUID: eHN+PiLPT8S3hYSeaOIY2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197185098"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 01:27:25 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vULuM-000000007Q9-46Hn;
	Sat, 13 Dec 2025 09:27:23 +0000
Date: Sat, 13 Dec 2025 17:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 drivers/md/dm-bow.c:1284:12: warning: no previous prototype for function
 'dm_bow_init'
Message-ID: <202512131729.WDmFLisY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: dcb994383d2b1641ebe7b518caab88d2d9dbfa72 [18/18] Revert "ANDROID: dm-bow: remove dm-bow"
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512131729.WDmFLisY-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131729.WDmFLisY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131729.WDmFLisY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/dm.h:14:
   In file included from include/linux/device-mapper.h:12:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
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
>> drivers/md/dm-bow.c:1284:12: warning: no previous prototype for function 'dm_bow_init' [-Wmissing-prototypes]
    1284 | int __init dm_bow_init(void)
         |            ^
   drivers/md/dm-bow.c:1284:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1284 | int __init dm_bow_init(void)
         | ^
         | static 
   drivers/md/dm-bow.c:1293:6: warning: no previous prototype for function 'dm_bow_exit' [-Wmissing-prototypes]
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


vim +/dm_bow_init +1284 drivers/md/dm-bow.c

  1283	
> 1284	int __init dm_bow_init(void)
  1285	{
  1286		int r = dm_register_target(&bow_target);
  1287	
  1288		if (r < 0)
  1289			DMERR("registering bow failed %d", r);
  1290		return r;
  1291	}
  1292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
