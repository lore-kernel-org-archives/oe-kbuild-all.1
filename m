Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657D727183E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 02:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739325879; cv=none; b=f8QfACJIe9t+ElvGD6prn2TQHDKOjIiScx6thtsykQaRd/PxwiQJ1ClTSIky4jABpEHb0Kmse/TeI2TS8SKQ/UPIoiS0UJFCNbE8ApiLxWDAhaPRK03bIXBt5IvG2UtjqHto1VtyVQ3cBt8MmBl4gO8hqFIF4ov6KTGXDtVvsD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739325879; c=relaxed/simple;
	bh=gFIZ5gEJHRmEp3BntJiS5n3qqcn0oBAAYzUigac9/MY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WIQlSdMn60+uNO4B6tEIJ0hifzQ958beoUnQFku+40S9oGJlTxqUILVsuqEZIXjcyoZO94W10hzOKWUj6Xpn/+fSDMFGYYCsucgX72/W/7CosRgnkoM/sWxudt0ETQVGMxfLqRBhQEtq0IKZEOqQ4T63aXnCViDuUrS2I1g9A1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HR8ZVFgI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HR8ZVFgI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739325878; x=1770861878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gFIZ5gEJHRmEp3BntJiS5n3qqcn0oBAAYzUigac9/MY=;
  b=HR8ZVFgIuRjvBf1l98XH25zEeE9e2YLdyf72TKySlleNNMnNHYiEP9hn
   fsEEMVsM3wHOqctQpiq065TtGi9fQEfcwFLwMf2+X4jfMUnM3VUzfYFaZ
   Pfl36MQ+QmxScA7WK+ndjm00JvyWbSn8EjsFdVPmMP//9WXdgp/69P6v9
   4/rcRplcHOj0nJ6E+5yxVLTCF7uPMWtjWvDLNtnt+eQfe3nRvitTPsCmu
   tMTSWLW4PYYeqtqqH4adzfb0G/Jni7e8Th8YOc+612JX1WSjcKLbqxt0f
   rIJDh1R4/mlQBeZHiW2Gro6fKpeUalIM7Ih1voqlNXraJkYcRx80NgpOZ
   w==;
X-CSE-ConnectionGUID: aIFdlISxRGq7UhkG4t9uNA==
X-CSE-MsgGUID: W0O4BYKOQAGDHnnjpuipUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39988674"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="39988674"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 18:04:37 -0800
X-CSE-ConnectionGUID: YdiuhNzDSNOPAGtCZDzjmg==
X-CSE-MsgGUID: oDZHQPlmRhuJkPNsOmIlgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="112641412"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Feb 2025 18:04:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti277-0014yD-0A;
	Wed, 12 Feb 2025 02:04:33 +0000
Date: Wed, 12 Feb 2025 10:04:11 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis 27/29] include/linux/memcontrol.h:1266:1:
 warning: spinlock 'pgdat->__lruvec.lru_lock' is still held at the end of
 function
Message-ID: <202502120922.1oOKttPX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis
head:   62e4de14389b44299be85eea5a580e6b497fdf43
commit: 414681ab8e33c58b10bf195293559b9c1e9cf5f9 [27/29] DO-NOT-SEND: tree-wide: Assorted annotations
config: x86_64-buildonly-randconfig-002-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120922.1oOKttPX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120922.1oOKttPX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120922.1oOKttPX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/kfence/core.c:37:
   In file included from mm/kfence/kfence.h:17:
   In file included from mm/kfence/../slab.h:11:
>> include/linux/memcontrol.h:1266:1: warning: spinlock 'pgdat->__lruvec.lru_lock' is still held at the end of function [-Wthread-safety-analysis]
    1266 | }
         | ^
   include/linux/memcontrol.h:1264:2: note: spinlock acquired here
    1264 |         spin_lock(&pgdat->__lruvec.lru_lock);
         |         ^
   include/linux/memcontrol.h:1274:1: warning: spinlock 'pgdat->__lruvec.lru_lock' is still held at the end of function [-Wthread-safety-analysis]
    1274 | }
         | ^
   include/linux/memcontrol.h:1272:2: note: spinlock acquired here
    1272 |         spin_lock_irq(&pgdat->__lruvec.lru_lock);
         |         ^
   include/linux/memcontrol.h:1283:1: warning: spinlock 'pgdat->__lruvec.lru_lock' is still held at the end of function [-Wthread-safety-analysis]
    1283 | }
         | ^
   include/linux/memcontrol.h:1281:2: note: spinlock acquired here
    1281 |         spin_lock_irqsave(&pgdat->__lruvec.lru_lock, *flagsp);
         |         ^
   include/linux/spinlock.h:378:35: note: expanded from macro 'spin_lock_irqsave'
     378 |         __release(spinlock_check(lock)); __acquire(lock);       \
         |                                          ^
   include/linux/compiler-capability-analysis.h:274:23: note: expanded from macro '__acquire'
     274 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   3 warnings generated.


vim +1266 include/linux/memcontrol.h

dc0b58643aff8b Roman Gushchin          2018-08-17  1259  
e809c3fedeeb80 Matthew Wilcox (Oracle  2021-06-28  1260) static inline struct lruvec *folio_lruvec_lock(struct folio *folio)
6168d0da2b479c Alex Shi                2020-12-15  1261  {
e809c3fedeeb80 Matthew Wilcox (Oracle  2021-06-28  1262) 	struct pglist_data *pgdat = folio_pgdat(folio);
6168d0da2b479c Alex Shi                2020-12-15  1263  
6168d0da2b479c Alex Shi                2020-12-15  1264  	spin_lock(&pgdat->__lruvec.lru_lock);
6168d0da2b479c Alex Shi                2020-12-15  1265  	return &pgdat->__lruvec;
6168d0da2b479c Alex Shi                2020-12-15 @1266  }
6168d0da2b479c Alex Shi                2020-12-15  1267  

:::::: The code at line 1266 was first introduced by commit
:::::: 6168d0da2b479ce25a4647de194045de1bdd1f1d mm/lru: replace pgdat lru_lock with lruvec lock

:::::: TO: Alex Shi <alex.shi@linux.alibaba.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
