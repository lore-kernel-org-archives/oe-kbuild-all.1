Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDD67F6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 03:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723348114; cv=none; b=YxKFBV/W10f1+CP8QZ3jRlOSv8zJV8vf25vlcKy+v8A5tbuBm8ceuTst7DRXdc64jPW0XxHhQjtfCzf0Z5Vhw5epSLx0/+NEjnBdY8RDo4ym25sS/M9mGwlimUKGdNrT8iCjWL6FqDqej5zCSFcKoSqrjKg7chdzIP30Btzd/KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723348114; c=relaxed/simple;
	bh=oF+s0sOu41xh+Z2IA+sXVe3qr1fak7yPzqxd+aG6hg8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U1hp8VN7Y4Mt3xxz2Ud/OVpbTsHbhh5+5u2FG3kRh4emRvnYbkHPgUNWb3FXq6kibb/SjqsYGyp8t4R2TvuBOE8QVYRgB9e7yQxRCMrruuKbvoc7BxFS2Dqfteq/wKWeozEB2luH0DQ05a42a05qR0sP6SSliN1ZQZ70uB8eVqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HslVHrTU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HslVHrTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723348112; x=1754884112;
  h=date:from:cc:subject:message-id:mime-version;
  bh=oF+s0sOu41xh+Z2IA+sXVe3qr1fak7yPzqxd+aG6hg8=;
  b=HslVHrTUVh8EE63fwmwM6fByXjX/0FSQcqJXYGaYlR8rM7bfAgO6P+uh
   c0uhajCnQTaP3Yvc3vz+W8/zetCiiIpk+useRnOuf+3WIoHkPD4XvsJdd
   ZT3VtAdatCwaO1THqamjmE22AAiQaG/nbIxF/9mgrO0FlUDuIVmyu4CHV
   41HXHqUb8kMtRa5YqX5iKVFLJajpG0SQZRGdCt/a4gRdE0geJXSO+x/76
   CJxlpWj7CQNAa1cZe2jjTto/9EOI6e3VSWo/dkT7TlxhLY+EQvqllXF9B
   Fc4tvbosTykd6Exl7pT3PoFngxhnCMKtdaAW3aRCtFiS19mw71Kck3gHq
   Q==;
X-CSE-ConnectionGUID: zEWgupUIR7yXGVmaRe2qYA==
X-CSE-MsgGUID: MxZ2OMXHQP+2DQc36hmCGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="38933764"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="38933764"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 20:48:30 -0700
X-CSE-ConnectionGUID: nq032XECS7auVlYkIofZiA==
X-CSE-MsgGUID: EKf/4FSMR1OEvbub9+gmfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="58003819"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 10 Aug 2024 20:48:29 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sczZD-000AYN-04;
	Sun, 11 Aug 2024 03:48:27 +0000
Date: Sun, 11 Aug 2024 11:48:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-android-linux-6.6.y-cicd 2/8]
 drivers/iommu/io-pgtable-arm-common.c:126:13: error: void value not ignored
 as it ought to be
Message-ID: <202408111120.pybvnU0t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common ti-android-linux-6.6.y-cicd
head:   2541807a1ef54deb9241788913a930d9558d38fd
commit: cf616fc76f2555d91fc88a543badc8a051f749c9 [2/8] BACKPORT: FROMLIST: iommu/io-pgtable-arm: Split the page table driver
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240811/202408111120.pybvnU0t-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111120.pybvnU0t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408111120.pybvnU0t-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/io-pgtable-arm-common.c: In function 'arm_lpae_install_table':
>> drivers/iommu/io-pgtable-arm-common.c:126:13: error: void value not ignored as it ought to be
     126 |         old = cmpxchg64_relaxed(ptep, curr, new);
         |             ^
   drivers/iommu/io-pgtable-arm-common.c: At top level:
   drivers/iommu/io-pgtable-arm-common.c:139:5: warning: no previous prototype for '__arm_lpae_map' [-Wmissing-prototypes]
     139 | int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
         |     ^~~~~~~~~~~~~~


vim +126 drivers/iommu/io-pgtable-arm-common.c

   105	
   106	static arm_lpae_iopte arm_lpae_install_table(arm_lpae_iopte *table,
   107						     arm_lpae_iopte *ptep,
   108						     arm_lpae_iopte curr,
   109						     struct arm_lpae_io_pgtable *data)
   110	{
   111		arm_lpae_iopte old, new;
   112		struct io_pgtable_cfg *cfg = &data->iop.cfg;
   113	
   114		new = paddr_to_iopte(__arm_lpae_virt_to_phys(table), data) |
   115			ARM_LPAE_PTE_TYPE_TABLE;
   116		if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NS)
   117			new |= ARM_LPAE_PTE_NSTABLE;
   118	
   119		/*
   120		 * Ensure the table itself is visible before its PTE can be.
   121		 * Whilst we could get away with cmpxchg64_release below, this
   122		 * doesn't have any ordering semantics when !CONFIG_SMP.
   123		 */
   124		dma_wmb();
   125	
 > 126		old = cmpxchg64_relaxed(ptep, curr, new);
   127	
   128		if (cfg->coherent_walk || (old & ARM_LPAE_PTE_SW_SYNC))
   129			return old;
   130	
   131		/* Even if it's not ours, there's no point waiting; just kick it */
   132		__arm_lpae_sync_pte(ptep, 1, cfg);
   133		if (old == curr)
   134			WRITE_ONCE(*ptep, new | ARM_LPAE_PTE_SW_SYNC);
   135	
   136		return old;
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
