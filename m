Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A3744384
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 14:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731592807; cv=none; b=SAEVuObs/3UPagV+zvmVemm/eJxmg72Dj0SHqo8h389KxhpLqMdeKDd4y/+NhjqQegDE2teCqhg1q608T+iny/tp6RGVQtUZi2wQP9vjAWBnoRp0SKJbz1x/6CyP6Euq9+0luXxsUIJ0kilK/I5DJBmcbbl3v6SFk08gyqiLiUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731592807; c=relaxed/simple;
	bh=DiKHTGOuRAKcZqLGzV4cF7W7lSNZg9xPpHSJk7czPKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gfny3Zq09J0/8abX71CoIoOrKWzwKrxrUv3b6hAhI0MEyW6dlaiCozHPoT11LwIqCS3RzhVaPmLpQWJlA4H2RQQHZA397AVu79qJdYYxtunymUBhbZrX0GXtZbcUunygdV8RXVnX2yWPgMECtOBuJK0AmGl3oCkk4pPlVsO8aqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGdAANCW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGdAANCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731592802; x=1763128802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DiKHTGOuRAKcZqLGzV4cF7W7lSNZg9xPpHSJk7czPKM=;
  b=XGdAANCW74IUCzTKFndlWFndvMBN0XW6So19onkY2pJTsTt3V+Qd6NET
   kmTy/mkxe+9qi/LiowVb4/ziqnbKnjd/l/hRmKeLV4sA5TEWYRlr8qWpK
   b0urX+DXCd13fBzPC4wM7jakp40tZrcDdnTIuANFX6AuUxhMMzmQgS8pS
   5t0uc4kYGk5TDPwBG02ff9ExYkr6RIVfrhhwOmFRjdR8O0a94Zq5YhilI
   fGuCi6b7lS3hN/BkKV65QZf4gUPSEfBb2FmX//4iftoMMN8QEjWqA0V14
   JQnJWGPUBU+DSD/rON8toD+Y+kQprSFQPeMlGk4f4MSii3U4eNqeu9WJ3
   Q==;
X-CSE-ConnectionGUID: zEeoQ0AFT2ugsj58anPs+w==
X-CSE-MsgGUID: iRcPIVx+SZajmEzdQC0pXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="35461614"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="35461614"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 06:00:00 -0800
X-CSE-ConnectionGUID: gK2rGVwkTGqhGJXvI20OZg==
X-CSE-MsgGUID: nkWhtyI2RKS8yrUWdqlZEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="92664556"
Received: from lkp-server01.sh.intel.com (HELO c7bc087bbc55) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Nov 2024 05:59:59 -0800
Received: from kbuild by c7bc087bbc55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBaO4-00004j-2i;
	Thu, 14 Nov 2024 13:59:56 +0000
Date: Thu, 14 Nov 2024 21:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 4/7] block/blk-flush.c:484:65:
 sparse: sparse: incorrect type in argument 3 (different base types)
Message-ID: <202411142102.ylpZAg2c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   e733b347fbf8a8a5149461d848bf4e726141afaf
commit: f76294a6557b6c99c9ca58d89232171cf693eac2 [4/7] ANDROID: add hooks into blk-flush.c for customized I/O scheduler
config: x86_64-randconfig-121-20241114 (https://download.01.org/0day-ci/archive/20241114/202411142102.ylpZAg2c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411142102.ylpZAg2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411142102.ylpZAg2c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-flush.c:484:65: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int flags @@     got restricted gfp_t [usertype] flags @@
   block/blk-flush.c:484:65: sparse:     expected int flags
   block/blk-flush.c:484:65: sparse:     got restricted gfp_t [usertype] flags

vim +484 block/blk-flush.c

   469	
   470	#include <trace/hooks/block.h>
   471	struct blk_flush_queue *blk_alloc_flush_queue(int node, int cmd_size,
   472						      gfp_t flags)
   473	{
   474		struct blk_flush_queue *fq;
   475		int rq_sz = sizeof(struct request);
   476		bool skip = false;
   477	
   478		fq = kzalloc_node(sizeof(*fq), flags, node);
   479		if (!fq)
   480			goto fail;
   481	
   482		spin_lock_init(&fq->mq_flush_lock);
   483	
 > 484		trace_android_vh_blk_alloc_flush_queue(&skip, cmd_size, flags, node,
   485						       fq);
   486		if (!skip) {
   487			rq_sz = round_up(rq_sz + cmd_size, cache_line_size());
   488			fq->flush_rq = kzalloc_node(rq_sz, flags, node);
   489		}
   490		if (!fq->flush_rq)
   491			goto fail_rq;
   492	
   493		INIT_LIST_HEAD(&fq->flush_queue[0]);
   494		INIT_LIST_HEAD(&fq->flush_queue[1]);
   495		INIT_LIST_HEAD(&fq->flush_data_in_flight);
   496	
   497		lockdep_register_key(&fq->key);
   498		lockdep_set_class(&fq->mq_flush_lock, &fq->key);
   499	
   500		return fq;
   501	
   502	 fail_rq:
   503		kfree(fq);
   504	 fail:
   505		return NULL;
   506	}
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
