Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D133D76
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 09:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735379758; cv=none; b=eGCO3AjCBLanrMH/YtqbFOegP9/XvLLKtXQ4du7idv+a+x2rfOmGVCU8ZAwlUTGqp6MLzpHGuGpJPPHsvW5ArQaqGDhXP2kVLUgll4AMjqgW74my1NXbvNb6JkugcDbI1/PuBd48RPGZQBZfTYfZZSDMu+Vf7X3yIJsYStnbRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735379758; c=relaxed/simple;
	bh=GyB6OgTjdTuyaf5Y4MhOycoZOYK5cBoJUVIiyAzk3l4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pmfhFxmpkRba6Ap7mcdIrZ7Ud0PgXluiRTJXt6x+L6j2pZ7/pZ9GK1BBTPuOqgjfg4+Xmd3uxj0SuGlAJXnYX/BmePPINbmSME9lFhbsGQVMoiYzx+8rXsXv14OxOtPJh9QxyH66YG+r3qMAFdJ6Mwt0PSL0KANzLo/gh6JmmO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+uuHtt0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+uuHtt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735379757; x=1766915757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GyB6OgTjdTuyaf5Y4MhOycoZOYK5cBoJUVIiyAzk3l4=;
  b=N+uuHtt0kt4m8nIk3aedUwMofpgWZFQJ8Ekudcm17qHq6V/RaMa4zvOF
   W8IHnZ721nMkhAGKWI/yKp2eRcN6/t5XME1d0HkjjDr17/VQJ/FGo7eMR
   g9nl4uuYSMOTsXZ8FGseQJ8Uw1F7LDT8WAcNZZt//XmL1fInu4IU8zAWK
   BNvlfYqIjJsocKtsb9dR1zos+DqLHWbIzw+KcMVPsWZrnxibnBiteL0SV
   xRHNxrrRSD1GPq5s3vAy8DuxG8+CuMF6EjfeJX5HKCI6BN11N5Q5p7Ux/
   u+jEEq/jHb+oeV2eq8EDQEilkgOBEE+3vAMyc/p/pBOS0hlHlpL0Cgikr
   w==;
X-CSE-ConnectionGUID: FwQmRZruRHKkTLvv9A9aKQ==
X-CSE-MsgGUID: 3xW0bnSFQMyvargfSWJmKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="39437950"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="39437950"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 01:55:54 -0800
X-CSE-ConnectionGUID: +AoNiaOkSCuG7ko4DvNhmg==
X-CSE-MsgGUID: yZhBVBMVSAqBMZ2rc440bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104400827"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Dec 2024 01:55:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRTXy-0003zI-0U;
	Sat, 28 Dec 2024 09:55:50 +0000
Date: Sat, 28 Dec 2024 17:55:47 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/memory/emif.c:70: warning: Function parameter or struct
 member 'lpmode' not described in 'emif_data'
Message-ID: <202412281715.ZOR40f8d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
commit: ea0c0ad6b6eb36726088991d97a55b99cae456d0 memory: Enable compile testing for most of the drivers
date:   4 years, 4 months ago
config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241228/202412281715.ZOR40f8d-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281715.ZOR40f8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281715.ZOR40f8d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/memory/emif.c:70: warning: Function parameter or struct member 'lpmode' not described in 'emif_data'
   drivers/memory/emif.c:70: warning: Function parameter or struct member 'irq_state' not described in 'emif_data'
   drivers/memory/emif.c:70: warning: Function parameter or struct member 'addressing' not described in 'emif_data'


vim +70 drivers/memory/emif.c

7ec944538dde3d Aneesh V 2012-04-27  30  
7ec944538dde3d Aneesh V 2012-04-27  31  /**
7ec944538dde3d Aneesh V 2012-04-27  32   * struct emif_data - Per device static data for driver's use
7ec944538dde3d Aneesh V 2012-04-27  33   * @duplicate:			Whether the DDR devices attached to this EMIF
7ec944538dde3d Aneesh V 2012-04-27  34   *				instance are exactly same as that on EMIF1. In
7ec944538dde3d Aneesh V 2012-04-27  35   *				this case we can save some memory and processing
7ec944538dde3d Aneesh V 2012-04-27  36   * @temperature_level:		Maximum temperature of LPDDR2 devices attached
7ec944538dde3d Aneesh V 2012-04-27  37   *				to this EMIF - read from MR4 register. If there
7ec944538dde3d Aneesh V 2012-04-27  38   *				are two devices attached to this EMIF, this
7ec944538dde3d Aneesh V 2012-04-27  39   *				value is the maximum of the two temperature
7ec944538dde3d Aneesh V 2012-04-27  40   *				levels.
7ec944538dde3d Aneesh V 2012-04-27  41   * @node:			node in the device list
7ec944538dde3d Aneesh V 2012-04-27  42   * @base:			base address of memory-mapped IO registers.
7ec944538dde3d Aneesh V 2012-04-27  43   * @dev:			device pointer.
a93de288aad3b0 Aneesh V 2012-04-27  44   * @addressing			table with addressing information from the spec
a93de288aad3b0 Aneesh V 2012-04-27  45   * @regs_cache:			An array of 'struct emif_regs' that stores
a93de288aad3b0 Aneesh V 2012-04-27  46   *				calculated register values for different
a93de288aad3b0 Aneesh V 2012-04-27  47   *				frequencies, to avoid re-calculating them on
a93de288aad3b0 Aneesh V 2012-04-27  48   *				each DVFS transition.
a93de288aad3b0 Aneesh V 2012-04-27  49   * @curr_regs:			The set of register values used in the last
a93de288aad3b0 Aneesh V 2012-04-27  50   *				frequency change (i.e. corresponding to the
a93de288aad3b0 Aneesh V 2012-04-27  51   *				frequency in effect at the moment)
7ec944538dde3d Aneesh V 2012-04-27  52   * @plat_data:			Pointer to saved platform data.
aac10aaa8cc65a Aneesh V 2012-04-27  53   * @debugfs_root:		dentry to the root folder for EMIF in debugfs
e6b42eb6a66c18 Aneesh V 2012-08-17  54   * @np_ddr:			Pointer to ddr device tree node
7ec944538dde3d Aneesh V 2012-04-27  55   */
7ec944538dde3d Aneesh V 2012-04-27  56  struct emif_data {
7ec944538dde3d Aneesh V 2012-04-27  57  	u8				duplicate;
7ec944538dde3d Aneesh V 2012-04-27  58  	u8				temperature_level;
a93de288aad3b0 Aneesh V 2012-04-27  59  	u8				lpmode;
7ec944538dde3d Aneesh V 2012-04-27  60  	struct list_head		node;
a93de288aad3b0 Aneesh V 2012-04-27  61  	unsigned long			irq_state;
7ec944538dde3d Aneesh V 2012-04-27  62  	void __iomem			*base;
7ec944538dde3d Aneesh V 2012-04-27  63  	struct device			*dev;
a93de288aad3b0 Aneesh V 2012-04-27  64  	const struct lpddr2_addressing	*addressing;
a93de288aad3b0 Aneesh V 2012-04-27  65  	struct emif_regs		*regs_cache[EMIF_MAX_NUM_FREQUENCIES];
a93de288aad3b0 Aneesh V 2012-04-27  66  	struct emif_regs		*curr_regs;
7ec944538dde3d Aneesh V 2012-04-27  67  	struct emif_platform_data	*plat_data;
aac10aaa8cc65a Aneesh V 2012-04-27  68  	struct dentry			*debugfs_root;
e6b42eb6a66c18 Aneesh V 2012-08-17  69  	struct device_node		*np_ddr;
7ec944538dde3d Aneesh V 2012-04-27 @70  };
7ec944538dde3d Aneesh V 2012-04-27  71  

:::::: The code at line 70 was first introduced by commit
:::::: 7ec944538dde3d7f490bd4d2619051789db5c3c3 memory: emif: add basic infrastructure for EMIF driver

:::::: TO: Aneesh V <aneesh@ti.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
