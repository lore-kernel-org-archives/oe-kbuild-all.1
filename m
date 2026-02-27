Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43AA346A02
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 17:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772213008; cv=none; b=H4hTcQDFb+rGuas+GOOZh8n5jyxjQOZWuaMJSzXTctTwsN0FQ7y7FUhL+2HWuCutVt3emNjPnfAzICBgJLrKqH3rocAmPjMSyMZoq8FEihWa8qFDEyAvCt2sApM4M+XGkjMb2NUVknxL8VmJ1uljkwh5wJeITQiCEJtbsXa4I4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772213008; c=relaxed/simple;
	bh=wQfTqqJ/9vMxLu46WTVKOm/liGqHagbr9kh/ndv6fJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a0L9irGGgeMaMnUuGSzyTjMoHerfILx2rR4WBJc/a7CK0DgHYWp55CylNwUjaptIw+ssnNzSgjSkqzHDnnPCcCA9JEsTOaz0w6UTKGL12Dxb/OzijOvzO44QxR6a1kUdFsgM9G5N1/KKskR8sAa6ZMKr2Ew4HwTwai8CLNT81Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnGHHAH8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnGHHAH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772212991; x=1803748991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wQfTqqJ/9vMxLu46WTVKOm/liGqHagbr9kh/ndv6fJk=;
  b=jnGHHAH8T4sA1F9lNcDEZdGwT/mseC8mrDg7TbvVH0j49pQbI4m4CYh8
   ym5k2D06JVE+K0hVgI03Z7R+7rAUn6nN+R8f9wV5v1Gnd5U6mDIspY15G
   7EqD2BxcW8xTeTuTMlMkTG2vmVIl9rp8yCxWigqZPivfyeqr+kdX5Fyen
   3SWY6s/eRDfnc2LA31vFtW4gnJP46LmkU0IPsOYiluYvspeNMp4a+MD5a
   w7UKsw+2wYVP9crVFGZyVR0TRODydhwiwMKsZlMtXGKz702hoSkyTz0X1
   XxeJbygbLbX+q25Vi9XUak9DRsMcqAal3tT5iEZ2VNZLVCMgjH4D8rPlG
   g==;
X-CSE-ConnectionGUID: AOh4H/qsT1GfhtJT19KaeA==
X-CSE-MsgGUID: f6dkaIVvTQeASNhUSKBbRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73205575"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="73205575"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 09:23:08 -0800
X-CSE-ConnectionGUID: jm7krxqpRnmJPiMptttLHw==
X-CSE-MsgGUID: Sn6SfMGoSl6aVwbZTCgWVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="221580987"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Feb 2026 09:23:06 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw1Xv-00000000AqJ-2fyy;
	Fri, 27 Feb 2026 17:22:45 +0000
Date: Sat, 28 Feb 2026 01:21:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [linux-next:master 1183/2910]
 drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types
 in comparison expression (different address spaces):
Message-ID: <202602280129.ppJ73555-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fa5e5702a82d259897bd7e209469bc06368bf31
commit: f4cc3ab824d6772a48ca9d9c74ac623b3309985d [1183/2910] dma-buf: protected fence ops by RCU v8
config: um-randconfig-r133-20260224 (https://download.01.org/0day-ci/archive/20260228/202602280129.ppJ73555-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602280129.ppJ73555-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602280129.ppJ73555-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/radeon/radeon_fence.c:140:18: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_fence.c:140:18: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_fence.c:140:18: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_fence.c:140:18: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_fence.c:140:18: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_fence.c:140:18: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_fence.c:140:18: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_fence.c:140:18: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_fence.c:140:18: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_fence.c:140:18: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_fence.c:140:18: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_fence.c: note: in included file:
>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/radeon/radeon_display.c:497:16: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:497:16: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:497:16: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:497:16: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:497:16: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:497:16: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:685:23: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:685:23: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:685:23: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:685:23: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:685:23: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:685:23: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1349:14: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1349:14: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1349:14: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1349:14: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1349:14: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1349:14: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1542:51: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1542:51: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1542:51: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1542:51: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1542:51: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1542:51: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1550:43: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1550:43: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1550:43: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1550:43: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1550:43: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1550:43: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1555:43: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1555:43: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1555:43: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1555:43: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1555:43: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1555:43: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1562:43: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1562:43: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1562:43: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1562:43: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1562:43: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1562:43: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1569:51: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1569:51: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1569:51: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1569:51: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:1569:51: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/radeon/radeon_display.c:1569:51: sparse: sparse: got ,
   drivers/gpu/drm/radeon/radeon_display.c:497:16: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:497:16: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:497:16: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:497:16: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:497:16: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:685:23: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:685:23: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:685:23: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:685:23: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:685:23: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1349:14: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1349:14: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:1349:14: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1349:14: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:1349:14: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1542:51: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1542:51: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:1542:51: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1542:51: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:1542:51: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1550:43: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1550:43: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:1550:43: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1550:43: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:1550:43: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1555:43: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1555:43: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:1555:43: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1555:43: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:1555:43: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1562:43: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1562:43: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:1562:43: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1562:43: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:1562:43: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1569:51: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1569:51: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:1569:51: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c:1569:51: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/radeon/radeon_display.c:1569:51: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/radeon/radeon_display.c: note: in included file:
>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/radeon/radeon_sync.c: note: in included file:
>> drivers/gpu/drm/radeon/radeon.h:2492:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/radeon/radeon.h:2492:27: sparse:    struct dma_fence_ops const *

vim +2492 drivers/gpu/drm/radeon/radeon.h

954605ca3f897a Maarten Lankhorst 2014-01-09  2487  
f54d1867005c33 Chris Wilson      2016-10-25  2488  static inline struct radeon_fence *to_radeon_fence(struct dma_fence *f)
954605ca3f897a Maarten Lankhorst 2014-01-09  2489  {
954605ca3f897a Maarten Lankhorst 2014-01-09  2490  	struct radeon_fence *__f = container_of(f, struct radeon_fence, base);
954605ca3f897a Maarten Lankhorst 2014-01-09  2491  
954605ca3f897a Maarten Lankhorst 2014-01-09 @2492  	if (__f->base.ops == &radeon_fence_ops)
954605ca3f897a Maarten Lankhorst 2014-01-09  2493  		return __f;
954605ca3f897a Maarten Lankhorst 2014-01-09  2494  
954605ca3f897a Maarten Lankhorst 2014-01-09  2495  	return NULL;
954605ca3f897a Maarten Lankhorst 2014-01-09  2496  }
771fe6b912fca5 Jerome Glisse     2009-06-05  2497  

:::::: The code at line 2492 was first introduced by commit
:::::: 954605ca3f897ad617123279eb3404a404cce5ab drm/radeon: use common fence implementation for fences, v4

:::::: TO: Maarten Lankhorst <maarten.lankhorst@canonical.com>
:::::: CC: Maarten Lankhorst <maarten.lankhorst@canonical.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
