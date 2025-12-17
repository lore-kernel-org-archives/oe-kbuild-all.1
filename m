Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ACA1D90DD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 22:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766010983; cv=none; b=dWtW7DtmVPaRNbmAHXbyuy7WCaeXbsF7K7jMCxsJpkhPx+bq7MRFbTQs80UVfZ+Z35BSr061fTl22FR7rTb5p66+T8V/+mDYvd07Tvq+2iNIJYcXjqAh8a59DtqskTCvYw3G+1PnUeYI0WRji6Z1lMJC2LyAlk6FjElE3xpGpg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766010983; c=relaxed/simple;
	bh=A0ccSliZVuhJZqY5Zu+7qJqNo3dllr4ROZWlcMXnT2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iA/O7him/YgL0IcD1RXSF49vPwAikxzx8d7Ge6asNbIgOWDaQ2CRyyWNn0F80HPz6Wg7b/5Agsebk0t4EzefcVRRgwbTd/GmgvqAo0jlMDHFcTg0eS6tlFAdxoeqRRL5/T47d3H1n3wgqRL9SujeRwpZ+RxeR+YSSfw0YN+Y7GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+Lq1WpR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+Lq1WpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766010980; x=1797546980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A0ccSliZVuhJZqY5Zu+7qJqNo3dllr4ROZWlcMXnT2w=;
  b=T+Lq1WpR8GHTCTocT5w/Re1zdestv+jna+qc8XYDWP7l0KkZMHMh/pdR
   XVtxfTn3mVU7RRm5hTjWDOpPxrXfD4zKn34hPDK6LxyPVosJ1p4SexIHG
   G6YRE+OIY0X+qCSZ9sh8S4Fktdhwmrgs8pZyaJlOlpLtarAjywglnvw10
   i8cZpBkMS0Hmv7NH7eklLWk7hBOMpOCZribmzlJupK44hQofAgDyQTqy/
   556WdPuB443LCdc14qvZrHvTgvTrkk+ebYJeFKDUHpjRbl1XBhFCl3ASD
   MeXN0l+JA5OlcMIQLOTYm97jId8+yzPDLpY+cFILQXKwV7m4ydk+dHI3p
   A==;
X-CSE-ConnectionGUID: cfJyY/5LT6ahHCkJVPsrxg==
X-CSE-MsgGUID: 2D4b2MAWTwSFB4jWZcuoWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71590221"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="71590221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 14:36:20 -0800
X-CSE-ConnectionGUID: sqehYL1NT3GiOuDxywSLJA==
X-CSE-MsgGUID: 0/O/uCk9SQKjMngXyLIdCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="229109521"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Dec 2025 14:36:19 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW07z-000000001JF-0SLo;
	Wed, 17 Dec 2025 22:36:15 +0000
Date: Thu, 18 Dec 2025 06:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: drivers/cache/ax45mp_cache.c:213:undefined reference to
 `riscv_noncoherent_register_cache_ops'
Message-ID: <202512180606.m7eRSrrE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 4d1608d0ab3365d1ef9447bdbc0cb4c0962f1774 cache: Make top level Kconfig menu a boolean dependent on RISCV
date:   4 weeks ago
config: riscv-randconfig-r063-20251218 (https://download.01.org/0day-ci/archive/20251218/202512180606.m7eRSrrE-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180606.m7eRSrrE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180606.m7eRSrrE-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/cache/ax45mp_cache.o: in function `ax45mp_cache_init':
>> drivers/cache/ax45mp_cache.c:213:(.init.text+0x104): undefined reference to `riscv_noncoherent_register_cache_ops'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
   Depends on [n]: CACHEMAINT_FOR_DMA [=n]
   Selected by [y]:
   - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && !DMA_DIRECT_REMAP [=n] && RISCV_ALTERNATIVE [=y] && !RISCV_ISA_ZICBOM [=n] && RISCV_SBI [=y]


vim +213 drivers/cache/ax45mp_cache.c

d34599bcd2e4e9 Lad Prabhakar 2023-08-18  178  
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  179  static int __init ax45mp_cache_init(void)
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  180  {
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  181  	struct device_node *np;
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  182  	struct resource res;
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  183  	int ret;
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  184  
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  185  	np = of_find_matching_node(NULL, ax45mp_cache_ids);
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  186  	if (!of_device_is_available(np))
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  187  		return -ENODEV;
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  188  
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  189  	ret = of_address_to_resource(np, 0, &res);
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  190  	if (ret)
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  191  		return ret;
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  192  
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  193  	/*
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  194  	 * If IOCP is present on the Andes AX45MP core riscv_cbom_block_size
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  195  	 * will be 0 for sure, so we can definitely rely on it. If
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  196  	 * riscv_cbom_block_size = 0 we don't need to handle CMO using SW any
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  197  	 * more so we just return success here and only if its being set we
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  198  	 * continue further in the probe path.
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  199  	 */
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  200  	if (!riscv_cbom_block_size)
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  201  		return 0;
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  202  
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  203  	ax45mp_priv.l2c_base = ioremap(res.start, resource_size(&res));
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  204  	if (!ax45mp_priv.l2c_base)
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  205  		return -ENOMEM;
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  206  
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  207  	ret = ax45mp_get_l2_line_size(np);
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  208  	if (ret) {
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  209  		iounmap(ax45mp_priv.l2c_base);
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  210  		return ret;
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  211  	}
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  212  
d34599bcd2e4e9 Lad Prabhakar 2023-08-18 @213  	riscv_noncoherent_register_cache_ops(&ax45mp_cmo_ops);

:::::: The code at line 213 was first introduced by commit
:::::: d34599bcd2e4e93a28d5904bf94bc7dafc511f04 cache: Add L2 cache management for Andes AX45MP RISC-V core

:::::: TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
