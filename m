Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC4754652
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 01:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769565308; cv=none; b=jJXqiLZvYb3GFvEtX+h9NWVZoW1H0PZmdBkAxyRL+p4z79S9y1UUyNPv9r5i00QKUMffekVXRdrfsSTn2xUy93WQQ6A+aZ06ZPJSApHabx8KOdS3wt7AwKezQ5slZD8gpU6NizQjiTSZ2sBljCfWzt3RSfd14F4zQh1pYQpFcZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769565308; c=relaxed/simple;
	bh=eSbq1mPlv6h0XmWBf6MtVOCQmJsMcgoGJ3WmD3oAh8I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u0bwXSrSNlkPLVUoG5TNc5OuvQ2Qi82j71gyz3gZ8W3yJXJLllFqF9xKrjGJXW7BwqmcUEywYGDvlvAjTN7okpUXfKDE8DrewnEKXavbbenVfBs1mGflI9BBzVYVSUE234sG2zrVLDr5GhZHC1Vale2DYRGdpAQXhFiebuty39k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mK18dh4N; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mK18dh4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769565307; x=1801101307;
  h=date:from:to:cc:subject:message-id;
  bh=eSbq1mPlv6h0XmWBf6MtVOCQmJsMcgoGJ3WmD3oAh8I=;
  b=mK18dh4N70Ks8RLnzIzCe5h83Y69l+j5i+evx7n5mh9hSYab9q5XLzlf
   5MiJTCeZn3ZKPXmL0D1X7mxlyKS5IfQnRgrYAsLm7OtrRfjSF/QAabKFY
   nVINOE5xYdbZ0Vn+KOtYTbDwz3/Qu2ElmOED2AYLi4VJHBnvXNLRMnqb/
   yPrc6v5CDMVuY2LtuBhon7heO6kd05IhVz4Ptk6tFJ+JW3eraBt92jWfv
   L32y1RtrhnXaqbJlfNvh85644N5YCsCYnCoxaxwtjL9TANlOF9H+ppQKK
   KYsuhfrF0GWZfYWs4lEO/7IjV51fD08UftAwnyNDr5YTLfNii6F4J9x6g
   Q==;
X-CSE-ConnectionGUID: Rx8aYrMZSaSlufWIxSUK8g==
X-CSE-MsgGUID: z68f+26YSEasFb4WF746Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69788171"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="69788171"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 17:55:06 -0800
X-CSE-ConnectionGUID: rlFTdG7rR1Wpr7SlqDjskw==
X-CSE-MsgGUID: QEtCYY6+S0u7opfKb5RxyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="213094048"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Jan 2026 17:55:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkulq-00000000Z78-2oZF;
	Wed, 28 Jan 2026 01:55:02 +0000
Date: Wed, 28 Jan 2026 09:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
Subject: [mszyprowski:dma-mapping-fixes 5/5]
 include/linux/cma.h:60:5: warning: "CONFIG_DMA_CMA" is not defined, evaluates
 to 0
Message-ID: <202601280910.9xoKfvQn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux dma-mapping-fixes
head:   05d6113cb1bd4408d4f9cf6497d076e08a6bfe3d
commit: 05d6113cb1bd4408d4f9cf6497d076e08a6bfe3d [5/5] of: reserved_mem: Allow reserved_mem framework detect "cma=" kernel param
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260128/202601280910.9xoKfvQn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280910.9xoKfvQn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280910.9xoKfvQn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mm_init.c:29:
>> include/linux/cma.h:60:5: warning: "CONFIG_DMA_CMA" is not defined, evaluates to 0 [-Wundef]
      60 | #if CONFIG_DMA_CMA
         |     ^~~~~~~~~~~~~~
>> include/linux/cma.h:63:13: warning: 'cma_skip_dt_default_reserved_mem' defined but not used [-Wunused-function]
      63 | static bool cma_skip_dt_default_reserved_mem(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/CONFIG_DMA_CMA +60 include/linux/cma.h

    59	
  > 60	#if CONFIG_DMA_CMA
    61	extern bool cma_skip_dt_default_reserved_mem(void);
    62	#else
  > 63	static bool cma_skip_dt_default_reserved_mem(void)
    64	{
    65		return false;
    66	}
    67	#endif
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
