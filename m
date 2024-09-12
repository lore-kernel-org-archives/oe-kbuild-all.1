Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579CA1C0DE7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 18:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726164498; cv=none; b=sHJbV1hIT2aSIPCVFHmDkFJD2kuAau1Eql+0r3ela2pcm3hbnlqzb2vfSsncNyuVTWfbMKq0xUjpr6t8ylVE6LEe+xjnOc1/MnDG6paeqVTyo7D02FhLs+OPqB0Ys0/Z+NU8HGMmZOFcrKa9Fihhrw7M4A9CvCmppVYVeYBLI/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726164498; c=relaxed/simple;
	bh=/Sk/qoDmW0VfyaSu2qOZfuZuosCJXcI1/acp4e1YASM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YfXGToS7BRGTLfmcJc2hUhzuXXgFPgGWn/wgZowFX7C6M10e5WVDuTyDFfo2Y7MXkKDa9W3JA8cSVwn9opZQzi8LKvx2xh3xbMtwBLsJeChFt5/Bmv8AFizZm9fQDGO1IqLqu/1V8EFxmhY4cjbCZlyOzPi9Sdx8jtzU9y62x+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jAnmDPCl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAnmDPCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726164498; x=1757700498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Sk/qoDmW0VfyaSu2qOZfuZuosCJXcI1/acp4e1YASM=;
  b=jAnmDPCl96qODEb8JwmUUjDs+bqqecXFhLQVEkguF+wIFSeWwsMZ4v4f
   tSxeXfSTRJymolQeWTac9VV8PdrSHCFJ9VDqtR015MdLDs6+2jILakpBJ
   wjyhAOfftHgqbuS3ohLuj8uPui1wLjR6PcFyP7IA4EJzVskgSXBeIQxGN
   AYEXw6uPWZny+a85e5t+NJ7Z/MEl+KA9oByY9rv/GgGto3iNowaEsgYRq
   3gdKvZRdIStVemzpwj+X4JJeiSML/5yCt/vX2mUyoOstsu8wek1F+Thyx
   hEZ41R0642qa7DtCe8WY7SdDx55APvmCQTv0Os3Rg5d1xdaUWU0xZFA7x
   A==;
X-CSE-ConnectionGUID: VJa2pExORVa/+uXoonOT7A==
X-CSE-MsgGUID: ReKVsNjmR1qqlWjnIkyCEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24977120"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="24977120"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 11:08:17 -0700
X-CSE-ConnectionGUID: 2eYzWbarRF2JKH1ZmFOrwg==
X-CSE-MsgGUID: NQhZjoKTQvSe0sfleF6BGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="67725108"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Sep 2024 11:08:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sooEm-0005ZG-2x;
	Thu, 12 Sep 2024 18:08:12 +0000
Date: Fri, 13 Sep 2024 02:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 7/7] dma-buf: rework the enable_signaling handling
Message-ID: <202409130132.ScyyyHQm-lkp@intel.com>
References: <20240911085903.1496-8-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911085903.1496-8-christian.koenig@amd.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next drm-tip/drm-tip next-20240912]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.11-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-sw_sync-remove-pointless-enable_signaling-implementation/20240911-175943
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240911085903.1496-8-christian.koenig%40amd.com
patch subject: [PATCH 7/7] dma-buf: rework the enable_signaling handling
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240913/202409130132.ScyyyHQm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130132.ScyyyHQm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130132.ScyyyHQm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c: In function 'dma_resv_kunit_active_fence_init':
>> drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:72:9: error: implicit declaration of function 'dma_fence_enable_sw_signaling'; did you mean 'dma_fence_enable_signaling'? [-Wimplicit-function-declaration]
      72 |         dma_fence_enable_sw_signaling(fence);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         dma_fence_enable_signaling


vim +72 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c

8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  64  
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  65  static void dma_resv_kunit_active_fence_init(struct kunit *test,
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  66  					     struct dma_resv *resv,
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  67  					     enum dma_resv_usage usage)
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  68  {
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  69  	struct dma_fence *fence;
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  70  
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  71  	fence = alloc_mock_fence(test);
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12 @72  	dma_fence_enable_sw_signaling(fence);
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  73  
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  74  	dma_resv_lock(resv, NULL);
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  75  	dma_resv_reserve_fences(resv, 1);
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  76  	dma_resv_add_fence(resv, fence, usage);
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  77  	dma_resv_unlock(resv);
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  78  }
8eda41dfc9b2f0 Karolina Stolarek 2024-06-12  79  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
