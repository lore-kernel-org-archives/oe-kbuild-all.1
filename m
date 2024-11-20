Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFF22914
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 03:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732073806; cv=none; b=nUgYxmSiaedQNjprFgQF36OtU5BQnxAoeZ4TewKFGdE2gIBPupba0Jy5MVjWffB7j3ZLBCbCuUmi30RRVv60c77Rv+HqpPVyUlpLyP/qkop/whq8qXTXQSRJhRzVyqnrFQYcorUgR6v+YD+MzAbYSfEMi0YhT6oFrpd4s3+qnkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732073806; c=relaxed/simple;
	bh=vVi1W5uug4L27hZHxUqii/dHya8VqFAhqrbBYOj5/uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qzb0BjN1bi/p8WpF43Li997csepXv8ObEsWcIMOsGdrT/ZDqqm75eICl8Xq0TCCHC7ooJZy6yLbbmn7WIoS+MbRPNhHZoJGdF9kpMtelm+MLmWMMpQVnNnfEb+W8JIyj+rnWfXh8itvwdorkmQTZloRi6CN15oxdOfmhCSgWSGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ta4fjzVM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ta4fjzVM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732073804; x=1763609804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vVi1W5uug4L27hZHxUqii/dHya8VqFAhqrbBYOj5/uQ=;
  b=Ta4fjzVMu1hWl4tvILsZ3jzvJlW1imVBxDi0rumYN89dW8NwZzRcd2ky
   Hx8tP4Gw1ef+i48/x5Z+0am+BqdFAivHFgyCjm6RnLKw4y9TjBruU+QN8
   HHOm9YyBWBk1OrZGzxa0Z720RatS8mNaos9GBuxGYeLS2tRI0gDtTdgFf
   166Xy5E15xrLeqpGxyK9wh90NObnV31DcskdjDLlR+0KqQD+PGEPZ2oQs
   R7jf7bmcr9NVFnWypcHTiK+5zWb0LCzGCqeHgHbMlLdwkiiCLAK7RDRIO
   pPSsJGe/4Rvfbf5RRSHNr+Pql5sb/slDJQDhWkxXg+hdcb3Yh0OT1kyM6
   A==;
X-CSE-ConnectionGUID: jbhMugfqSAWNYXJM6nLSIg==
X-CSE-MsgGUID: 8wQ1VXyKTdyaSYOYyXJN6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31971168"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="31971168"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 19:36:43 -0800
X-CSE-ConnectionGUID: nQpRJsuzSiSlNSDTPNAHKQ==
X-CSE-MsgGUID: Df/GZ489SqiU9/9+kr/5Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="120726568"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2024 19:36:42 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDbWC-0000TJ-13;
	Wed, 20 Nov 2024 03:36:40 +0000
Date: Wed, 20 Nov 2024 11:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 3/60] block/blk-zoned.c:1473:51: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202411201144.L92dDA4T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   3cb765742058ecc19642d410a3e8cc3a8473fd9e
commit: 2ec7e4ce745d5e16641bd987726a3cabe72c7e20 [3/60] block: RCU protect disk->conv_zones_bitmap
config: x86_64-randconfig-122-20241119 (https://download.01.org/0day-ci/archive/20241120/202411201144.L92dDA4T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201144.L92dDA4T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201144.L92dDA4T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-zoned.c:1473:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long const *src @@     got unsigned long [noderef] __rcu *conv_zones_bitmap @@
   block/blk-zoned.c:1473:51: sparse:     expected unsigned long const *src
   block/blk-zoned.c:1473:51: sparse:     got unsigned long [noderef] __rcu *conv_zones_bitmap
   block/blk-zoned.c:505:30: sparse: sparse: context imbalance in 'disk_get_and_lock_zone_wplug' - wrong count at exit
   block/blk-zoned.c:357:17: sparse: sparse: cast removes address space '__rcu' of expression
   block/blk-zoned.c:357:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu *conv_zones_bitmap @@
   block/blk-zoned.c:357:17: sparse:     expected unsigned long const volatile *addr
   block/blk-zoned.c:357:17: sparse:     got unsigned long [noderef] __rcu *conv_zones_bitmap
   block/blk-zoned.c:357:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu *conv_zones_bitmap @@
   block/blk-zoned.c:357:17: sparse:     expected unsigned long const volatile *addr
   block/blk-zoned.c:357:17: sparse:     got unsigned long [noderef] __rcu *conv_zones_bitmap
   block/blk-zoned.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   block/blk-zoned.c:357:17: sparse: sparse: cast removes address space '__rcu' of expression
   block/blk-zoned.c:357:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu *conv_zones_bitmap @@
   block/blk-zoned.c:357:17: sparse:     expected unsigned long const volatile *addr
   block/blk-zoned.c:357:17: sparse:     got unsigned long [noderef] __rcu *conv_zones_bitmap
   block/blk-zoned.c:357:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu *conv_zones_bitmap @@
   block/blk-zoned.c:357:17: sparse:     expected unsigned long const volatile *addr
   block/blk-zoned.c:357:17: sparse:     got unsigned long [noderef] __rcu *conv_zones_bitmap
   block/blk-zoned.c: note: in included file (through include/linux/blkdev.h):
   include/linux/bio.h:529:9: sparse: sparse: context imbalance in 'blk_zone_wplug_handle_write' - unexpected unlock
   block/blk-zoned.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   block/blk-zoned.c:1687:31: sparse: sparse: context imbalance in 'blk_revalidate_seq_zone' - unexpected unlock

vim +1473 block/blk-zoned.c

  1462	
  1463	static unsigned int disk_set_conv_zones_bitmap(struct gendisk *disk,
  1464						       unsigned long *bitmap)
  1465	{
  1466		unsigned int nr_conv_zones = 0;
  1467		unsigned long flags;
  1468	
  1469		spin_lock_irqsave(&disk->zone_wplugs_lock, flags);
  1470		bitmap = rcu_replace_pointer(disk->conv_zones_bitmap, bitmap,
  1471					     lockdep_is_held(&disk->zone_wplugs_lock));
  1472		if (disk->conv_zones_bitmap)
> 1473			nr_conv_zones = bitmap_weight(disk->conv_zones_bitmap,
  1474						      disk->nr_zones);
  1475		spin_unlock_irqrestore(&disk->zone_wplugs_lock, flags);
  1476	
  1477		kfree_rcu_mightsleep(bitmap);
  1478	
  1479		return nr_conv_zones;
  1480	}
  1481	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
