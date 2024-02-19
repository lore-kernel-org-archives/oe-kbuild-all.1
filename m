Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277183E470
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 20:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708374783; cv=none; b=P2PfM/EYSFaF8rz2wKlsbh7CVMSbIXA7AKvVq9+eOtyBcfB+Vxecgowm8Mc7I3ghr1q7GlvFzN7GZQl+PVTGbjx5EcpwWYcwyQLOJT5WOc6Zpt03SJTyOHsxKo6xb3oxJ6TAs6ALfurN2Dec9rbG05NiA62exZf5SE755dIW5OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708374783; c=relaxed/simple;
	bh=uTQQzfrRfwGAV8KSsr041TogvHFyRarMCUVmNHKwOzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gm8A+xifJty1RSBxR4Dyh4g2+FQcmZSFrFTkGgApv2ZhQq+JPrzAf9MhfR8MwKOBrwAvzxwYq4pfRVkPWtPtyK/WDaXYvb+eXgjdxWqnGsp6QFHoSOYvSQeMgdU7lwQxlQBfGDGl/3atTEudJYCAzbmGXo+Q6LlI+jZL8+tP9dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDCrE8jX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDCrE8jX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708374781; x=1739910781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uTQQzfrRfwGAV8KSsr041TogvHFyRarMCUVmNHKwOzU=;
  b=eDCrE8jXtfd03Ts5/wTo5Y1zIoYF3b8Da4b58s48NICQlB2V+fD6PWpN
   M7u0i1G6yYXJVXt+8VER4Br2fZ84rkXjMjAVFWCUc6yN2YjH1CBMaihtd
   /VFVIJ5OJRXllXmUINz2GTrhyiaWc64jU/HJqgrU1fO8CGdhBU6GcfHJ2
   3kPazhEWVOHxWTcfbl9vxDrqRmJR+VZMsRmDgkhhwi6NZY/nwfefTlbIS
   Ar2kmIrDFR9gLe/4bAFQ3/bglIG2io9TLMKajV3cOKXkghSRp9eMbyAxo
   M7vpSFfgO50xnQ38INRpZo0ZumoWMlONVmAM+jCNn1rxK4bI9cTontyAY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13091161"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="13091161"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 12:33:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="4744142"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 Feb 2024 12:32:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcAJt-00043K-0l;
	Mon, 19 Feb 2024 20:32:57 +0000
Date: Tue, 20 Feb 2024 04:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned-zwp 652/675] block/blk-zoned.c:1339:13: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is false
Message-ID: <202402200422.BrOgQjAG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned-zwp
head:   f24bc80ab52b7ee42fc7bf25c58ea582b7879fd0
commit: 29a73abf6c6751e8d3082471168d98aceba6f8cf [652/675] block: Use a mempool to allocate zone write plugs
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240220/202402200422.BrOgQjAG-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240220/202402200422.BrOgQjAG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402200422.BrOgQjAG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/blk-zoned.c:15:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from block/blk-zoned.c:15:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from block/blk-zoned.c:15:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> block/blk-zoned.c:1339:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1339 |         } else if (disk->zone_wplugs_pool_size != pool_size) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-zoned.c:1343:9: note: uninitialized use occurs here
    1343 |         return ret;
         |                ^~~
   block/blk-zoned.c:1339:9: note: remove the 'if' if its condition is always true
    1339 |         } else if (disk->zone_wplugs_pool_size != pool_size) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-zoned.c:1337:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1337 |                 if (!disk->zone_wplugs_pool)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   block/blk-zoned.c:1343:9: note: uninitialized use occurs here
    1343 |         return ret;
         |                ^~~
   block/blk-zoned.c:1337:3: note: remove the 'if' if its condition is always true
    1337 |                 if (!disk->zone_wplugs_pool)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1338 |                         ret = -ENOMEM;
   block/blk-zoned.c:1320:9: note: initialize the variable 'ret' to silence this warning
    1320 |         int ret;
         |                ^
         |                 = 0
   8 warnings generated.


vim +1339 block/blk-zoned.c

  1314	
  1315	static int disk_init_zone_wplug_mempool(struct gendisk *disk,
  1316						unsigned int nr_zones)
  1317	{
  1318		struct queue_limits *lim = &disk->queue->limits;
  1319		unsigned int pool_size;
  1320		int ret;
  1321	
  1322		/*
  1323		 * Size the disk mempool of zone write plugs with enough elements
  1324		 * given the device open and active zones limits. When there are no
  1325		 * device limits, we use BLK_ZONE_DEFAULT_WPLUG_POOL_SIZE.
  1326		 */
  1327		pool_size = max(lim->max_active_zones, lim->max_open_zones);
  1328		if (!pool_size)
  1329			pool_size = BLK_ZONE_DEFAULT_WPLUG_POOL_SIZE;
  1330		pool_size = min(pool_size, nr_zones);
  1331	
  1332	 	if (!disk->zone_wplugs_pool) {
  1333			disk->zone_wplugs_pool_size = pool_size;
  1334			disk->zone_wplugs_pool =
  1335				mempool_create_slab_pool(disk->zone_wplugs_pool_size,
  1336							 blk_zone_wplugs_cachep);
  1337			if (!disk->zone_wplugs_pool)
  1338				ret = -ENOMEM;
> 1339		} else if (disk->zone_wplugs_pool_size != pool_size) {
  1340			ret = mempool_resize(disk->zone_wplugs_pool, pool_size);
  1341		}
  1342	
  1343		return ret;
  1344	}
  1345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
