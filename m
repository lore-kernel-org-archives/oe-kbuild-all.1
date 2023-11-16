Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB314652A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLr9udvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700163435; x=1731699435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LwA0BuYszOIkNUH5cocoLbDFEjbUYaERZhstLKEwE8A=;
  b=bLr9udviFrQ7vvqacQH59VLAy+hkYLPQOcmGGBbBKphpTG8DXlyriimH
   MMISwssP6L57ZyGtkAx6G8RyiZkNt3Htpk1Tf2JbBFwqe7eVXE8sHW3Zt
   BRj1eGIW0srDz4KNirTiCtYUSwklyDbmELW7qhpSz86ChHEjxy0m7PH85
   dH8XSyC58NavHKUPoYOOfMoXHbrEj97narCoyyGN+gXzvGUzzjYGX90xb
   nklzCkF+YuGel3KayQcqyAASRY01uK2HUcthvCq0Bce+x9RXnIMnD6bKW
   DbVBsIPpVdd52kf6iPbiSIogCAtYPnQAghctUcE1mE81bsufCKHQsv62f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4294032"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="4294032"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 11:37:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="765398759"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="765398759"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Nov 2023 11:37:11 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3iAn-00021j-1f;
	Thu, 16 Nov 2023 19:37:09 +0000
Date: Fri, 17 Nov 2023 03:37:01 +0800
From: kernel test robot <lkp@intel.com>
To: Shravan Kumar Ramani <shravankr@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	David Thompson <davthompson@nvidia.com>
Subject: drivers/platform/mellanox/mlxbf-pmc.c:1172:14: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202311170321.oKTTKcgf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7475e51b87969e01a6812eac713a1c8310372e8a
commit: 423c3361855c1e81f1cb91728a2ac5ddfd2cbf16 platform/mellanox: mlxbf-pmc: Add support for BlueField-3
date:   9 weeks ago
config: arm64-randconfig-r121-20231116 (https://download.01.org/0day-ci/archive/20231117/202311170321.oKTTKcgf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231117/202311170321.oKTTKcgf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311170321.oKTTKcgf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/mellanox/mlxbf-pmc.c:1172:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem * @@
   drivers/platform/mellanox/mlxbf-pmc.c:1172:14: sparse:     expected void *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1172:14: sparse:     got void [noderef] __iomem *
>> drivers/platform/mellanox/mlxbf-pmc.c:1174:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *addr @@
   drivers/platform/mellanox/mlxbf-pmc.c:1174:31: sparse:     expected void [noderef] __iomem *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1174:31: sparse:     got void *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1186:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *addr @@
   drivers/platform/mellanox/mlxbf-pmc.c:1186:32: sparse:     expected void [noderef] __iomem *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1186:32: sparse:     got void *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1194:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem * @@
   drivers/platform/mellanox/mlxbf-pmc.c:1194:14: sparse:     expected void *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1194:14: sparse:     got void [noderef] __iomem *
   drivers/platform/mellanox/mlxbf-pmc.c:1198:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *addr @@
   drivers/platform/mellanox/mlxbf-pmc.c:1198:32: sparse:     expected void [noderef] __iomem *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1198:32: sparse:     got void *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1415:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem * @@
   drivers/platform/mellanox/mlxbf-pmc.c:1415:14: sparse:     expected void *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1415:14: sparse:     got void [noderef] __iomem *
   drivers/platform/mellanox/mlxbf-pmc.c:1417:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *addr @@
   drivers/platform/mellanox/mlxbf-pmc.c:1417:31: sparse:     expected void [noderef] __iomem *addr
   drivers/platform/mellanox/mlxbf-pmc.c:1417:31: sparse:     got void *addr

vim +1172 drivers/platform/mellanox/mlxbf-pmc.c

  1163	
  1164	/* Method to handle crspace counter programming */
  1165	static int mlxbf_pmc_program_crspace_counter(int blk_num, uint32_t cnt_num,
  1166						     uint32_t evt)
  1167	{
  1168		uint32_t word;
  1169		void *addr;
  1170		int ret;
  1171	
> 1172		addr = pmc->block[blk_num].mmio_base +
  1173			(rounddown(cnt_num, 2) * MLXBF_PMC_CRSPACE_PERFSEL_SZ);
> 1174		ret = mlxbf_pmc_readl(addr, &word);
  1175		if (ret)
  1176			return ret;
  1177	
  1178		if (cnt_num % 2) {
  1179			word &= ~MLXBF_PMC_CRSPACE_PERFSEL1;
  1180			word |= FIELD_PREP(MLXBF_PMC_CRSPACE_PERFSEL1, evt);
  1181		} else {
  1182			word &= ~MLXBF_PMC_CRSPACE_PERFSEL0;
  1183			word |= FIELD_PREP(MLXBF_PMC_CRSPACE_PERFSEL0, evt);
  1184		}
  1185	
  1186		return mlxbf_pmc_write(addr, MLXBF_PMC_WRITE_REG_32, word);
  1187	}
  1188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
