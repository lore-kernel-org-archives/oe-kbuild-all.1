Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526D0466B79
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932174; cv=none; b=rpgROxCXHq/YGjgPKVIhDFHhnqSd6/jOVSjruzZcptErADkJRSji2SHN54Dqpg1MO99eQBQGwJWHB2HhQAqkLNCKf9ucCNx9scz1EtUIv+Fgr+tdLOay9B0qyJYIUSQ6fLByhl9L8Qi9YBxbCmXRnzRY46Gy3DxpKhKvngj1yWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932174; c=relaxed/simple;
	bh=C+qEejAxtiXR1nMCxtVixLblzwl9UeueiY9kL8NFE6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpJlMfHAVEGSP0zTUjuqUN6LjT19yTx1k5dH1H5zotLgNZ3Kp2bqcwvHe+kgWENeQKDWjQNydvMY8Gi/QXqfwxO/1BqFr0LV2d0C4L4at7z6V+l4+BYufFR7fgFcudoHGcOJShjFidJkm1+vja1yhJdxztr5/1j6aoxmeZTPvTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BoIPeaVx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BoIPeaVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785932172; x=1817468172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C+qEejAxtiXR1nMCxtVixLblzwl9UeueiY9kL8NFE6M=;
  b=BoIPeaVxUOIiujfsmIQdGBpzb/YzjIbRVG/Ux/jrigQ6D/MlXEEcgOdi
   m/7SjeYQE7yFVsiQ8xDDzYAZcfUzcjsuX4WfduOzKJYUrnk035ZcBptZo
   Ja6PcS/sEtPeOIhdATTvAUDKL/ZTp6jqgjRaKFvedZs1Jop55uL0N1PU3
   1/S1VTahEd1QkweTP9f6lDoPZjTEXAAiMr+AAKxbkcPADdP30AIlx/p8u
   Cp3UZDLEtI93bcL/wy1IRpDO+ms1Qg1dEV/nwMtefan9SqasQ+a0v/Lfm
   839RUCOslN613E+Fx368jgGL+49PgK9+csgIPOnlKrzSEKJz4OvyjR2o1
   A==;
X-CSE-ConnectionGUID: CHodsUsWROqoxj8tSBcCQQ==
X-CSE-MsgGUID: s6Sa+GzWQ7WkcArPWSLNEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86513983"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86513983"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 05:16:11 -0700
X-CSE-ConnectionGUID: V6BdiDYUT9O/W+OPYQxKLQ==
X-CSE-MsgGUID: J8JGTI7ETCCgEB9AiE197Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="266916136"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Aug 2026 05:16:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wraXY-00000000CPZ-1T9b;
	Wed, 05 Aug 2026 12:16:08 +0000
Date: Wed, 5 Aug 2026 20:15:56 +0800
From: kernel test robot <lkp@intel.com>
To: Aakarsh Jain <aakarsh.jain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] x86/pci-dma: add "any" keyword to swiotlb= kernel
 parameter
Message-ID: <202608052041.5WmVL4Kf-lkp@intel.com>
References: <20260708114244.246176-1-aakarsh.jain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708114244.246176-1-aakarsh.jain@oss.qualcomm.com>

Hi Aakarsh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v7.2-rc6 next-20260804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aakarsh-Jain/x86-pci-dma-add-any-keyword-to-swiotlb-kernel-parameter/20260805-183105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260708114244.246176-1-aakarsh.jain%40oss.qualcomm.com
patch subject: [RFC PATCH] x86/pci-dma: add "any" keyword to swiotlb= kernel parameter
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260805/202608052041.5WmVL4Kf-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608052041.5WmVL4Kf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608052041.5WmVL4Kf-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/dma/swiotlb.c: In function 'swiotlb_init_late':
>> kernel/dma/swiotlb.c:451:9: error: 'flags' undeclared (first use in this function)
     451 |         flags |= swiotlb_param_flags;
         |         ^~~~~
   kernel/dma/swiotlb.c:451:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/flags +451 kernel/dma/swiotlb.c

   426	
   427	/*
   428	 * Systems with larger DMA zones (those that don't support ISA) can
   429	 * initialize the swiotlb later using the slab allocator if needed.
   430	 * This should be just like above, but with some error catching.
   431	 */
   432	int swiotlb_init_late(size_t size, gfp_t gfp_mask,
   433			int (*remap)(void *tlb, unsigned long nslabs))
   434	{
   435		struct io_tlb_pool *mem = &io_tlb_default_mem.defpool;
   436		unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
   437		unsigned int nareas;
   438		unsigned char *vstart = NULL;
   439		unsigned int order, area_order;
   440		bool retried = false;
   441		int rc = 0;
   442	
   443		if (io_tlb_default_mem.nslabs)
   444			return 0;
   445	
   446		if (swiotlb_force_disable)
   447			return 0;
   448	
   449		io_tlb_default_mem.force_bounce = swiotlb_force_bounce;
   450	
 > 451		flags |= swiotlb_param_flags;
   452	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
