Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22751165FD6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 21:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713474023; cv=none; b=chLift0Xabg69pwqQxtBkh1rwAdGFOGLXEb+540vwSHOaHd2oX0S3vVa65ut1VvhxthIZ3niPS1N66O/Gyhp7qqE2T6iGM7mKsXaGdDJa8/sH4+TKU/HxJktGYclc/MTbM24WeHOWf5qwMG5u0MLgZ2p/+Uy8Mj06XSz2cDUCbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713474023; c=relaxed/simple;
	bh=53xgofSM8kj0+NggAMYoUgfSeMoYlGELkO4InNC4YYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qWpR6KgWVE/AdDUbUpvkpZjDdY4hD7DZH/ppIG/tcXJTUG5D/a3ZyH2LMnS5uy+TALmRSFRX0C1bV3P2ennfaUe5zEUXNNCQcQxFZJ0hTJRcCWUQfqU/upHlgSkgQ6PT8YsfGQxWKwBYA5+yqkEPvoL0IxwsoMXQzZ42NNR0/TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPwVi0n3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPwVi0n3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713474021; x=1745010021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53xgofSM8kj0+NggAMYoUgfSeMoYlGELkO4InNC4YYA=;
  b=UPwVi0n3UTeR19H+us3RJtNtKocB+emmthRQVF7P9dLR9x6FffpToFJ+
   PhiFvWn641pE8SjIXyLK/RIeuoo7zYUffcpn0l8iSP94wrTjIPN/066Ip
   HS/CzPTWGx0CXrTrRtc/7qKkl2wbcT00wTSCJ+pqCoKVc93bTZTZQHJWX
   PREd7gZt7mNANat0JDUn3taDJbrzsLd5anAxIB8W4GUkkAoQGZuFPN2j7
   s8Y72yVE6TzUpCVzcPZgOZttu1eSj5Drbr7f7qqOQReNJACG3BTizUdCT
   thbqGrBTD7rAlOnoauKzDn/JqaNbhzP5SXCU+VwNW81RxR+KWXHhhHKDn
   A==;
X-CSE-ConnectionGUID: KUvQzhjIQPadtOuqZFPybA==
X-CSE-MsgGUID: bREYVHQyReioH6wLgZC1Kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20476090"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="20476090"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 14:00:19 -0700
X-CSE-ConnectionGUID: JXLkJdqFQPmVNZdQzCe/DA==
X-CSE-MsgGUID: syXNXYETQ36L1O8XEWtbJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23175683"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Apr 2024 14:00:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxYre-0009EN-0d;
	Thu, 18 Apr 2024 21:00:14 +0000
Date: Fri, 19 Apr 2024 05:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 61/98] block/blk-cgroup.c:677:40: error: invalid
 application of 'sizeof' to incomplete type 'struct iocg_pcpu_stat'
Message-ID: <202404190422.koIM7d2d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   1a77a557522cf821eb3cb19959da7093902866ed
commit: 6dfa517032c94097afefeb8c2101f9b90b107cd9 [61/98] blkcg/diskstats: add per blkcg diskstats support
config: x86_64-randconfig-121-20240419 (https://download.01.org/0day-ci/archive/20240419/202404190422.koIM7d2d-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190422.koIM7d2d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190422.koIM7d2d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/hrtimer.h:19,
                    from include/linux/sched.h:20,
                    from include/linux/ioprio.h:5,
                    from block/blk-cgroup.c:18:
   block/blk-cgroup.c: In function 'blkcg_dkstats_alloc':
>> block/blk-cgroup.c:677:40: error: invalid application of 'sizeof' to incomplete type 'struct iocg_pcpu_stat'
     677 |         ds->dkstats = alloc_percpu_gfp(struct iocg_pcpu_stat, GFP_NOWAIT);
         |                                        ^~~~~~
   include/linux/percpu.h:141:60: note: in definition of macro 'alloc_percpu_gfp'
     141 |         (typeof(type) __percpu *)__alloc_percpu_gfp(sizeof(type),       \
         |                                                            ^~~~
>> block/blk-cgroup.c:677:40: error: invalid application of '__alignof__' to incomplete type 'struct iocg_pcpu_stat'
     677 |         ds->dkstats = alloc_percpu_gfp(struct iocg_pcpu_stat, GFP_NOWAIT);
         |                                        ^~~~~~
   include/linux/percpu.h:142:61: note: in definition of macro 'alloc_percpu_gfp'
     142 |                                                 __alignof__(type), gfp)
         |                                                             ^~~~
>> block/blk-cgroup.c:679:17: error: implicit declaration of function 'free' [-Werror=implicit-function-declaration]
     679 |                 free(ds);
         |                 ^~~~
   block/blk-cgroup.c:37:1: note: include '<stdlib.h>' or provide a declaration of 'free'
      36 | #include "blk-throttle.h"
     +++ |+#include <stdlib.h>
      37 | 
   block/blk-cgroup.c:679:17: warning: incompatible implicit declaration of built-in function 'free' [-Wbuiltin-declaration-mismatch]
     679 |                 free(ds);
         |                 ^~~~
   block/blk-cgroup.c:679:17: note: include '<stdlib.h>' or provide a declaration of 'free'
   block/blk-cgroup.c:661:23: warning: unused variable 'flags' [-Wunused-variable]
     661 |         unsigned long flags;
         |                       ^~~~~
   cc1: some warnings being treated as errors


vim +677 block/blk-cgroup.c

   657	
   658	static struct blkcg_dkstats *blkcg_dkstats_alloc(struct block_device *bdev)
   659	{
   660		struct blkcg_dkstats *ds;
   661		unsigned long flags;
   662	
   663		/* inside io path, do not consider GFP_KERNEL */
   664		ds = kzalloc(sizeof(struct blkcg_dkstats), GFP_ATOMIC);
   665		if (!ds)
   666			return NULL;
   667	
   668		ds->part = bdev;
   669		INIT_LIST_HEAD(&ds->list_node);
   670	#ifdef BLK_CGROUP_DISKSTATS_DEFER_ALLOC
   671		INIT_LIST_HEAD(&ds->alloc_node);
   672		spin_lock_irqsave(&alloc_lock, flags);
   673		list_add(&ds->alloc_node, &alloc_list);
   674		schedule_delayed_work(&dkstats_alloc_work, 0);
   675		spin_unlock_irqrestore(&alloc_lock, flags);
   676	#else
 > 677		ds->dkstats = alloc_percpu_gfp(struct iocg_pcpu_stat, GFP_NOWAIT);
   678		if (!ds->dkstats) {
 > 679			free(ds);
   680			ds = NULL;
   681		}
   682	#endif
   683		return ds;
   684	}
   685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
