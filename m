Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE285B1EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 02:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769566666; cv=none; b=s1VS4lxNN+AvcXSEt2qWC/kgFpjh6BqxlhvZoV3btQrGxwHe7HfEs1UK9pP8+XnzcR7iHvBiSvTtUHNDGQjPfWCNy+fH1QHwgXz6iF24rxGtiwJJcPQTE04hbIKyyMVr6beZIO3JcO4yx74WGoLhZ7ISx7alvWnMNft77smKTL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769566666; c=relaxed/simple;
	bh=Xjui6Cnph1G4zFOmvliE5oBwZysBflQw300GaAPA054=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T4sGDFvqrZAKWHcyDY8qPR9CtppD7vgI6knGMv8bc3VkgpIVtjLNQsWmGqGxrFca/b04204MqlbF5sCbaK4uWVLNHPgjCEbKo7Wdo6C9m4FEm9FERRWCGN1IY8ZXXoVCX/DpGBC1nfzE99Q27jtuona07DWZxGjseHGcxNnGZ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSVDmrPB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSVDmrPB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769566664; x=1801102664;
  h=date:from:to:cc:subject:message-id;
  bh=Xjui6Cnph1G4zFOmvliE5oBwZysBflQw300GaAPA054=;
  b=JSVDmrPBU5FAT7lFMLCTVMqH+wv9u970J6Gnl2jOTBN6I9OcHxqhfkBE
   uYGsAcgBQoaWXrpWbtAiGsZ5+TbQZRJLSUx2O1BCYGjIUPGgxuebdwtph
   DrSiM39e5YZ+TtsTBx70jUXH3SR/riwdy5XrCJGC8B2mmByiuvh6ECMVb
   HO/h78qDTlic/8CuHr53M9cDOSqREZXjqbC2jaJEcp45Yw6s0P/k10Qrw
   r90wczfIVN+n0FHQan36w1yQ549QdCpPeLbUZ7RZGizAuxeirwShteZ6X
   3G7d5ufkzPjGpZa7wvibNPdzr7IIoqdIRVIiKqV0VaTW+CPUVvX61WkzX
   A==;
X-CSE-ConnectionGUID: iSAlZDi1Tnmk9iz1SGtMJg==
X-CSE-MsgGUID: vt006hAWTZ6LNcCyLri5sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70747411"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70747411"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:17:44 -0800
X-CSE-ConnectionGUID: ceB/W4g7QJqyQyo66EpxAA==
X-CSE-MsgGUID: 0b9dQ0blQ+aDlm5NHMCjGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="213097915"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 Jan 2026 18:17:42 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkv7j-000000001z7-3YDi;
	Wed, 28 Jan 2026 02:17:39 +0000
Date: Wed, 28 Jan 2026 03:17:03 +0100
From: kernel test robot <lkp@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
Subject: [mszyprowski:dma-mapping-fixes 5/5]
 ./include/linux/cma.h:60:5: warning: 'CONFIG_DMA_CMA' is not defined,
 evaluates to '0'
Message-ID: <202601280336.KFaZQhdm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux dma-mapping-fixes
head:   05d6113cb1bd4408d4f9cf6497d076e08a6bfe3d
commit: 05d6113cb1bd4408d4f9cf6497d076e08a6bfe3d [5/5] of: reserved_mem: Allow reserved_mem framework detect "cma=" kernel param
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260128/202601280336.KFaZQhdm-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280336.KFaZQhdm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280336.KFaZQhdm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/crash_reserve.c:17:
>> ./include/linux/cma.h:60:5: warning: 'CONFIG_DMA_CMA' is not defined, evaluates to '0' [-Wundef]
      60 | #if CONFIG_DMA_CMA
         |     ^~~~~~~~~~~~~~
>> ./include/linux/cma.h:63:13: warning: 'cma_skip_dt_default_reserved_mem' defined but not used [-Wunused-function]
      63 | static bool cma_skip_dt_default_reserved_mem(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from mm/mm_init.c:29:
>> ./include/linux/cma.h:60:5: warning: 'CONFIG_DMA_CMA' is not defined, evaluates to '0' [-Wundef]
      60 | #if CONFIG_DMA_CMA
         |     ^~~~~~~~~~~~~~


vim +60 ./include/linux/cma.h

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
