Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB90136E3F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 05:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769579363; cv=none; b=m+GHVXahHwHn9Giv1biuIwu0LF75mrArW8j8PjgGE1fadcR6QSCR48R5xz8sJ73ntqrmrnt9UKyPjNaXCD1c4JXVzukAc9LzAzjd1cOQxMKZuPMM3iU++Qsp78zMnTDMARC5QHeVxXUTt9VHRRX6MG3Cs6NrCg10IKxKsOmIDZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769579363; c=relaxed/simple;
	bh=0NLYmR0g5aaPzY6FbkQKWDqk8zRJR+Y4IBx9n2p1ZIk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JZI9HdNWbvgrgGjEgIJXzd+m2+gQ6jjj0MkSFG36vjseLGChnC+IVXYtovDMYp5VNV3JPl79OfLqATCvgSbGdPkQnRnidrFcLhW2Q0BnhgWofMqzb6lOghRS13CHbETYON5G+nKLK9b5+wDVkdXgzLK7KDwsD0Y5xiJAykIJTcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2/2Tg6o; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2/2Tg6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769579360; x=1801115360;
  h=date:from:to:cc:subject:message-id;
  bh=0NLYmR0g5aaPzY6FbkQKWDqk8zRJR+Y4IBx9n2p1ZIk=;
  b=m2/2Tg6oO9j7UJBWSYZ9lyjvSQX2Hb6Dra2aGufJkGpohQfJrmhV47Xe
   3ovmi79lZkFe/WDuNIgqSw9ALO20gWVd4wPlGKVTmgJKE+97sYw/NDe+6
   5B99E4v6rqfcuBtId+73wVp5Hc2dqWwcjPT5K7xzcjNdGh2eeO5Wbm/Au
   Wm9HpBqn/b4FtUXVxIJzXoa6DPX8r8b1V+ijGphXFYOuuz7MDCIcCrCBT
   N4we6oK+LqULczOWRinzAFfaFQEH33Q3XVuJnGv3f52gWPe0hWUaFN79K
   eh5ijV/OGCAJUSL1UWFUJU3GVCHgLBPBwMa+FKrlnqyT8AVqbS/KPTS5e
   A==;
X-CSE-ConnectionGUID: LMQhDQoORwSqV0qJP4xGsw==
X-CSE-MsgGUID: DCq0aOG+R7+cVwNanB7uYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81507587"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81507587"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 21:49:19 -0800
X-CSE-ConnectionGUID: euM4EorQT9uooB20FmINOg==
X-CSE-MsgGUID: SGfuq0TdTAuSNcHzDDEeMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208532013"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jan 2026 21:49:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkyQV-00000000ZLA-1qVR;
	Wed, 28 Jan 2026 05:49:15 +0000
Date: Wed, 28 Jan 2026 13:49:01 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
Subject: [mszyprowski:dma-mapping-fixes 5/5]
 include/linux/cma.h:60:5: sparse: sparse: undefined preprocessor identifier
 'CONFIG_DMA_CMA'
Message-ID: <202601281301.x2o44gvY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux dma-mapping-fixes
head:   05d6113cb1bd4408d4f9cf6497d076e08a6bfe3d
commit: 05d6113cb1bd4408d4f9cf6497d076e08a6bfe3d [5/5] of: reserved_mem: Allow reserved_mem framework detect "cma=" kernel param
config: parisc-randconfig-r113-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281301.x2o44gvY-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281301.x2o44gvY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281301.x2o44gvY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/show_mem.c: note: in included file:
>> include/linux/cma.h:60:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_DMA_CMA'
--
   mm/mm_init.c: note: in included file:
>> include/linux/cma.h:60:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_DMA_CMA'
--
   mm/cma_debug.c: note: in included file:
>> include/linux/cma.h:60:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_DMA_CMA'
--
   mm/cma.c: note: in included file:
>> include/linux/cma.h:60:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_DMA_CMA'

vim +/CONFIG_DMA_CMA +60 include/linux/cma.h

    59	
  > 60	#if CONFIG_DMA_CMA
    61	extern bool cma_skip_dt_default_reserved_mem(void);
    62	#else
    63	static bool cma_skip_dt_default_reserved_mem(void)
    64	{
    65		return false;
    66	}
    67	#endif
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
