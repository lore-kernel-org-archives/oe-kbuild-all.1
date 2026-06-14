Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232272BF3F4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 18:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781462143; cv=none; b=EJIyF/UAaF1TCUl4TYkvCS161mjaTPXBj2NzOK0qbyn445G0ky2nQsjWYC1tiRVoIrhYzoGHB89cuPA7hA5C7jCK0m3n4LHUB3EE2HD7kuk6shu1N5WRK852eai94gAQr2VaODWuHJpbcXEG31omFX372CBgdCAfOjJyslq0tmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781462143; c=relaxed/simple;
	bh=TKZ8O4Nh4QTa+/DACdXzLBN67GFEPK914dfdYU6NszM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XQpEaf5P3PDWmP7nlWR/rMRSriancqu8pgAhuCXRMpKGYv4NhT98pVLXDUNJc0QrT41kQY8eBfS3h7w5HseBKni7mKCn1TrOEZPyxmm603aEjUe172p3wODKN3h8eS0AMkp5jgTGY7DM7uYzxwxFZmQ/4Bit0y1wh87SBdp+qD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nx8yaynf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nx8yaynf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781462141; x=1812998141;
  h=date:from:to:cc:subject:message-id;
  bh=TKZ8O4Nh4QTa+/DACdXzLBN67GFEPK914dfdYU6NszM=;
  b=nx8yaynfh0Ut3JPqv1iw3nzhhkr2XycLqDbPL0OphaPyLfVb13G0fgBm
   Hqm2ity4gBrB766laFzNZjaH0fxPMIML0vGjCrbl8EDK/iyb9hz6/j3Rs
   3Ci8DnbzY4HGIM015Dg1HVbj74f0bG5MAAlxDq+g8Ac1w7EF//zRU6e2+
   2Z+czwH4lxcci67lrU8uYnpi1rHv2p6PWj80/SfMXFMBYMgcD7saujCwy
   ZPYfGBWfCiS6zSeY15H20S9EYLBjXMCkCfA37rMOgyMvug0PstFfwM7Vw
   v/oZVz1bzXX5jPu6yLsHrne9lptl+P4mO2648FJ3TQIVJeP7goWvwhevW
   w==;
X-CSE-ConnectionGUID: 9rrTrGx2SE2HKEGyQAlsiA==
X-CSE-MsgGUID: 80vzxsXHQIKifmSJSv0MZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="104884166"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="104884166"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 11:35:41 -0700
X-CSE-ConnectionGUID: OU+Xhk2TTpaNP8e56MzEIw==
X-CSE-MsgGUID: Zd6a2RMgROS4I6OiK/tPLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="251210903"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Jun 2026 11:35:39 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYpgG-00000000R7a-27lV;
	Sun, 14 Jun 2026 18:35:36 +0000
Date: Mon, 15 Jun 2026 02:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 12/12]
 drivers/accel/adla_legacy/kmd/addon/adlak_platform_addon.c:38:26: warning:
 unused variable 'padlak'
Message-ID: <202606150215.CXN3CTUX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   db2e0f73cef8a993f240d9ea07ff72f5e99a7a9a
commit: db2e0f73cef8a993f240d9ea07ff72f5e99a7a9a [12/12] Temporary use Adla Legacy driver
config: parisc-randconfig-002-20260615 (https://download.01.org/0day-ci/archive/20260615/202606150215.CXN3CTUX-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150215.CXN3CTUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150215.CXN3CTUX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c: In function 'adlak_platform_get_rsv_mem_size':
   drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c:378:19: error: implicit declaration of function 'of_parse_phandle' [-Werror=implicit-function-declaration]
     378 |     res_mem_dev = of_parse_phandle(((struct device *)dev)->of_node, "memory-region", 0);
         |                   ^~~~~~~~~~~~~~~~
>> drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c:378:17: warning: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     378 |     res_mem_dev = of_parse_phandle(((struct device *)dev)->of_node, "memory-region", 0);
         |                 ^
   drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c:382:11: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
     382 |     ret = of_address_to_resource(res_mem_dev, 0, &res);
         |           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c:388:18: error: implicit declaration of function 'of_n_size_cells' [-Werror=implicit-function-declaration]
     388 |         nsize  = of_n_size_cells(res_mem_dev);
         |                  ^~~~~~~~~~~~~~~
   drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c:389:18: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]
     389 |         ranges = of_get_property(res_mem_dev, "size", NULL);
         |                  ^~~~~~~~~~~~~~~
>> drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c:389:16: warning: assignment to 'const __be32 *' {aka 'const unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     389 |         ranges = of_get_property(res_mem_dev, "size", NULL);
         |                ^
   drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_config.c:394:16: error: implicit declaration of function 'of_read_number' [-Werror=implicit-function-declaration]
     394 |         size = of_read_number(ranges, nsize);
         |                ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/accel/adla_legacy/kmd/addon/adlak_platform_addon.c: In function 'adlak_axi_sram_init':
>> drivers/accel/adla_legacy/kmd/addon/adlak_platform_addon.c:38:26: warning: unused variable 'padlak' [-Wunused-variable]
      38 |     struct adlak_device *padlak = (struct adlak_device *)data;
         |                          ^~~~~~


vim +/padlak +38 drivers/accel/adla_legacy/kmd/addon/adlak_platform_addon.c

    36	
    37	int adlak_axi_sram_init(void *data) {
  > 38	    struct adlak_device *padlak = (struct adlak_device *)data;
    39	    u32 adlak_smc_cmd = 0;
    40	    int ret = -1;
    41	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
