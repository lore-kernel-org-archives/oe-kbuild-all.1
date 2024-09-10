Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76D2142911
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 07:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725955080; cv=none; b=jnBx/D4W6wQ5J/QiCHmlwbEp/ENU9g9XDJYsM3Qiv0eIDNchKrDChYhy+sJE0JQARznOoqA2Vy4dkSSu48fT3XJ1TM1yI+UDrGqrIrFdxCsbhI5qzye1V42n2ziVp74vpfUy/nL9twPTaRiF6z+JFKy2i3pG8spG/omDp/pydzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725955080; c=relaxed/simple;
	bh=9ZJM5PIlyPqAchs+jX8EmhlllMyvEgXO44hTCyKc6/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bVCBjjbyNjRCI4yiewOoJWqrTAsYOQNMAvIwyrnNDSR4uG3jAdvaEDbDSxaiSxbzsrOwHFyMdTkuIN60LCwSRCyLZgOz3AdMHguub3wOX3FNoUtrYBbH6H25WT/RjqO8IrLatZlvnM1gMZLidTbGYPsh2CX7IZ0q23F5ek/Jkd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FS8GNScN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FS8GNScN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725955079; x=1757491079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ZJM5PIlyPqAchs+jX8EmhlllMyvEgXO44hTCyKc6/c=;
  b=FS8GNScNxGUQkduyUEKuAD30YQ37eQ0/SLjC5NATprkBU6EIi/XBMyLJ
   Cs+/BALJ5Jha0ex7vJpuCufShMXfX4c1SmMOseRUJ6ZJbKa8rf4G4oHxN
   PGeHcFriGJyZrYx5rFiII423CgILJfxk3vnq7u2Q8tC0pb3KPvhLCNoev
   xlcgrQZqs8iP4Doo6kIllt3LQgoL9f61bYel7pxtJNBMnL192tyYd+XQ9
   nwJg3MZVBatoVwTRJ6xaHyRZgsHKIgj7cLG4TVdx5NDsbJNk/1A/eXswQ
   v27uDtJ2PKGxTQ3c8B5v8/4sxgtkNFx2dsPUSYIMoj3NmbyvA4i2UIUoe
   A==;
X-CSE-ConnectionGUID: wxotTF/iQKiEwWZsNAP+JA==
X-CSE-MsgGUID: GpZapGvMR9+QnLRrdg8G+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42161615"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="42161615"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 00:57:58 -0700
X-CSE-ConnectionGUID: lKVEYYfSTviE3XjPjuFLMQ==
X-CSE-MsgGUID: ajXcwe3VT1KmuaO57/Cs8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="71734105"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Sep 2024 00:57:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snvl4-0000Fm-2o;
	Tue, 10 Sep 2024 07:57:54 +0000
Date: Tue, 10 Sep 2024 15:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip 43/62] drivers/cache/ax45mp_cache.c:141:6:
 warning: no previous prototype for 'arch_sync_dma_for_device'
Message-ID: <202409101540.BMOM9eaP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lad,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   a73978e16f87d704893e4b3a637be257420d43f3
commit: 2656f92bc7dc5ac286595c8eac040828c2f180af [43/62] cache: ax45mp_cache: Add non coherent support
config: riscv-randconfig-001-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101540.BMOM9eaP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101540.BMOM9eaP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101540.BMOM9eaP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cache/ax45mp_cache.c:141:6: warning: no previous prototype for 'arch_sync_dma_for_device' [-Wmissing-prototypes]
     141 | void arch_sync_dma_for_device(phys_addr_t paddr,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cache/ax45mp_cache.c:165:6: warning: no previous prototype for 'arch_sync_dma_for_cpu' [-Wmissing-prototypes]
     165 | void arch_sync_dma_for_cpu(phys_addr_t paddr,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/cache/ax45mp_cache.c:183:6: warning: no previous prototype for 'arch_setup_dma_ops' [-Wmissing-prototypes]
     183 | void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
         |      ^~~~~~~~~~~~~~~~~~


vim +/arch_sync_dma_for_device +141 drivers/cache/ax45mp_cache.c

   140	
 > 141	void arch_sync_dma_for_device(phys_addr_t paddr,
   142				      size_t size, enum dma_data_direction dir)
   143	{
   144		switch (dir) {
   145		case DMA_TO_DEVICE:
   146			ax45mp_dma_cache_wback(paddr, size);
   147			break;
   148	
   149		case DMA_FROM_DEVICE:
   150			fallthrough;
   151	
   152		case DMA_BIDIRECTIONAL:
   153			/* Skip the invalidate here if it's done later */
   154			if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU))
   155				ax45mp_dma_cache_wback(paddr, size);
   156			else
   157				ax45mp_dma_cache_wback_inv(paddr, size);
   158			break;
   159	
   160		default:
   161			break;
   162		}
   163	}
   164	
 > 165	void arch_sync_dma_for_cpu(phys_addr_t paddr,
   166				   size_t size, enum dma_data_direction dir)
   167	{
   168		switch (dir) {
   169		case DMA_TO_DEVICE:
   170			break;
   171	
   172		case DMA_FROM_DEVICE:
   173		case DMA_BIDIRECTIONAL:
   174			/* FROM_DEVICE invalidate needed if speculative CPU prefetch only */
   175			ax45mp_dma_cache_inv(paddr, size);
   176			break;
   177	
   178		default:
   179			break;
   180		}
   181	}
   182	
 > 183	void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
   184				const struct iommu_ops *iommu, bool coherent)
   185	{
   186		dev->dma_coherent = coherent;
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
