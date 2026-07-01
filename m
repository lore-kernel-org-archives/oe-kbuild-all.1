Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0015348C7B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 21:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941708; cv=none; b=IKnDRxcCmgQnywLmHVwDV9WGT65jVDjz7w2y2J+7syYl/r3KxvAtYtSaYL1xgnvU57kO0L2RyTysQK/6a9Lrus/xMFGDDYJaJIvngFw2l9z2JPfhXmeydBOWgek60bZ+Mskx1RcYhPBCB7PO0kRvgNVZzGlXcCUJvzQRpKgnu/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941708; c=relaxed/simple;
	bh=Yqtr+WTS+SG7G+/T3GnowUx1q2Obo3CkSa1X76hP0Jg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nmp7eMBUFRwJoetM2PIiv3A4kDJMkwH4Jco+MXyTwRZWCmfbfUGyzgZtEyhs08XOAWqLuSyXgti4GjTDZRT/qcpXspCDiM1aiGI3nYu+WJVLYk8bf5R6LXu16hYsIAvcTpA30PJZWlCwElUj0wYIRPnVn1KVz8WHFKcIYvlMO6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsvZs2Fh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsvZs2Fh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782941707; x=1814477707;
  h=date:from:to:cc:subject:message-id;
  bh=Yqtr+WTS+SG7G+/T3GnowUx1q2Obo3CkSa1X76hP0Jg=;
  b=VsvZs2FhFrUAnK+Zv0ToM+bbHN5jjpm/lHU0SKwY72htqVB6PlAl/d6H
   ZhVtFufoZpuhmCXyFmg+4zDzAB5ECpEcCBs1maMB0ZuQ38XbdIkbSWuEw
   JoWs53Xitr6BV70YiKun2KTXC2VUH3Enp3PCqd6qChotFZT0hc23OhTuh
   zXZpjipXs7lYgncZmg0ELLx9Mlw9DNSeL2uStrHmAkrfFFLZCKfqcqWML
   ncYA/sJiSHo2eSe1515nm4ncMn5GwYcHQd/N+iZTy8QDK3MtfvAdatIUl
   bPUVlsTPvSRlG69yDDSoWvp7lc6NuIYdTdoVFmO3LHIBY/zCKc0McgjuH
   A==;
X-CSE-ConnectionGUID: XcdPcQaZR/WpnCcirflqDA==
X-CSE-MsgGUID: Zo5+tNyNQwSGs0b4A+S52g==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83882164"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83882164"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 14:35:07 -0700
X-CSE-ConnectionGUID: 92GQUzXPRqaFElaDN8lh2g==
X-CSE-MsgGUID: xa9gXe0qSVqp/nJvcJXOwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="257009847"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Jul 2026 14:35:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf2aE-000000009eT-3ADh;
	Wed, 01 Jul 2026 21:35:02 +0000
Date: Thu, 02 Jul 2026 05:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:iommu/tdxc/enablement-alpha-v4 11/13]
 drivers/iommu/intel/tdxc.c:135:13: error: implicit declaration of function
 'tdh_iommu_clear'
Message-ID: <202607020528.nVBZAle1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LuBaolu/intel-iommu.git iommu/tdxc/enablement-alpha-v4
head:   b15da1ab69a5dd93c876d0998dd5a7bfd93efa8f
commit: e1e6373a563efdd8fc62cc372fa7147243167eca [11/13] iommu/vt-d: Add support to setup/teardown TDX extensions
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260702/202607020528.nVBZAle1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020528.nVBZAle1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020528.nVBZAle1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/intel/tdxc.c: In function 'iommu_tdx_clear_one':
>> drivers/iommu/intel/tdxc.c:135:13: error: implicit declaration of function 'tdh_iommu_clear' [-Wimplicit-function-declaration]
     135 |         r = tdh_iommu_clear(iommu->tdx_iommu_id, iommu->mt_pages->root);
         |             ^~~~~~~~~~~~~~~
   drivers/iommu/intel/tdxc.c: In function 'intel_iommu_bringup_tdxc':
>> drivers/iommu/intel/tdxc.c:165:13: error: implicit declaration of function 'tdh_iommu_setup' [-Wimplicit-function-declaration]
     165 |         r = tdh_iommu_setup(drhd->reg_base_addr, iommu_mt->root, &tdx_iommu_id);
         |             ^~~~~~~~~~~~~~~


vim +/tdh_iommu_clear +135 drivers/iommu/intel/tdxc.c

   127	
   128	static void iommu_tdx_clear_one(struct intel_iommu *iommu)
   129	{
   130		u64 r;
   131	
   132		if (!iommu->tdx_iommu_id)
   133			return;
   134	
 > 135		r = tdh_iommu_clear(iommu->tdx_iommu_id, iommu->mt_pages->root);
   136		if (r) {
   137			pr_err("%s: Fail to disable trusted DMA for TEE, error 0x%llx\n",
   138			       iommu->name, r);
   139			return;
   140		}
   141	
   142		free_mt_pages(iommu->mt_pages);
   143		iommu->mt_pages = NULL;
   144		iommu->tdx_iommu_id = 0;
   145	}
   146	
   147	static int intel_iommu_bringup_tdxc(struct intel_iommu *iommu, unsigned int nr_pages)
   148	{
   149		struct dmar_drhd_unit *drhd = iommu->drhd;
   150		struct tdxc_pages *iommu_mt;
   151		u64 r, tdx_iommu_id;
   152		int ret = 0;
   153	
   154		/*
   155		 * Nothing to do if the iommu doesn't support TDX extension or the
   156		 * DMA translation has not been enabled.
   157		 */
   158		if (!ecap_tdxc(iommu->ecap) || !(iommu->gcmd & DMA_GCMD_TE))
   159			return 0;
   160	
   161		iommu_mt = tdxc_alloc_mt_pages(iommu, nr_pages);
   162		if (!iommu_mt)
   163			return -ENOMEM;
   164	
 > 165		r = tdh_iommu_setup(drhd->reg_base_addr, iommu_mt->root, &tdx_iommu_id);
   166		/* TDX Extension is not supported on this iommu. Nothing to do. */
   167		if ((r & TDX_SEAMCALL_STATUS_MASK)  == TDX_OPERAND_INVALID)
   168			goto free_mt_pages;
   169	        if (r) {
   170	                pr_err("%s: Failed to initialize trusted DMA for TEE, error 0x%llx\n",
   171			       iommu->name, r);
   172	                ret = -EFAULT;
   173			goto free_mt_pages;
   174	        }
   175	
   176		iommu->tdx_iommu_id = tdx_iommu_id;
   177		iommu->mt_pages = iommu_mt;
   178	
   179		return -EOPNOTSUPP;
   180	free_mt_pages:
   181		free_mt_pages(iommu_mt);
   182		return ret;
   183	}
   184	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
