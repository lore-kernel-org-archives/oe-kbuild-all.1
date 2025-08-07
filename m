Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7438542AA5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 10:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754563003; cv=none; b=ZgHiOaOF41wphM30co6cJEo872ZUtO8JH6TuSAQUAVXzh+1nCCSwnAmWm/Kf/nNdxk2N6wvuhB8P7RZGB6a+4R7fw3IkKZG3iOIVOLc7YbEfh4qO15u127BSqxPCy3XdZu/IU/Xh8T8kBimPczQicFJyFFyFGZVsxvdOXO95u6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754563003; c=relaxed/simple;
	bh=8t3/LWFb41pH6iwdFnd4PU6wu4jKIQkpfoSsH2t+ZUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZHjtLFRX0c11zZrHQ+/WtLdhASBaKbWU7IsnhGmPL1DAAMeNtrYMnebjzLxK88pajhzQMkgbbD0T1JsU60Zu2N4nnJRecY3gv0F0xkRCzuOxfkvfT4vVunostvEdevg2oz++I9g4h1bcJYUut98QzCY5lmaCOwuUhb9nlXxzTmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQ6TzObC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQ6TzObC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754563002; x=1786099002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8t3/LWFb41pH6iwdFnd4PU6wu4jKIQkpfoSsH2t+ZUA=;
  b=jQ6TzObCwjbyLq0svVO7FUh8df8zVUBySJ3eydYaa0I49BGKF3OSoD/9
   UjgBfmMZohd92lrvbpLmRhgEV6sakN0WU815ryMdVuDFqZhnHO5wjCdR1
   u7wGTT28QjnbtZtg/z97Ntv0NJkZLyDBzq7KxD4NcX3T7bVPVZolwgOLY
   UubRN1ifMt+SDvvdKoRrrDFHg7TSofcSmOb+5qacABWlhh3lsQ6zufUeZ
   1lKI4zcQwW3FVaiX6uG4aPM8su5U48ob3UCzmhLMjB2oNjhQGs7zzV7Qc
   jpxPmn4eegtK4Pr9hNhWRnTRKqSxt4KeTz5ASuhs8Pq5g7b9wJWqgucLu
   w==;
X-CSE-ConnectionGUID: 7FA0JrxHQe6Zr43KJjSwzA==
X-CSE-MsgGUID: nvdw1cryR6C425DGapONgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74351707"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74351707"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 03:36:41 -0700
X-CSE-ConnectionGUID: 6yc31yJoS1GDvNB5OjrUxA==
X-CSE-MsgGUID: ltI4xJ4NQxGeOL+iiWghyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="170399919"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Aug 2025 03:36:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujxzB-0002gm-0h;
	Thu, 07 Aug 2025 10:36:37 +0000
Date: Thu, 7 Aug 2025 18:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>
Subject: [xilinx-xlnx:lkp_test 3/4]
 drivers/ufs/host/ufs-amd-versal2.c:561:34: warning:
 'ufs_versal2_pltfm_match' defined but not used
Message-ID: <202508071848.2WeD4IMd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   bf02b5ab30f349d173dd098be46a5a01493670b3
commit: 2a574c8da24fba5d98b9b6c5adc266ef3e3f2c2e [3/4] ufs: amd-versal2: Add AMD Versal Gen 2 UFS support
config: sh-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071848.2WeD4IMd-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071848.2WeD4IMd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071848.2WeD4IMd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ufs/host/ufs-amd-versal2.c: In function 'ufs_versal2_phy_init':
   drivers/ufs/host/ufs-amd-versal2.c:251:9: error: implicit declaration of function 'zynqmp_pm_sec_read_reg'; did you mean 'zynqmp_pm_read_pggs'? [-Werror=implicit-function-declaration]
     251 |   ret = zynqmp_pm_sec_read_reg(PM_REGNODE_PMC_IOU_SLCR, TXRX_CFGRDY_OFFSET, &reg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         zynqmp_pm_read_pggs
   drivers/ufs/host/ufs-amd-versal2.c: In function 'ufs_versal2_hce_enable_notify':
   drivers/ufs/host/ufs-amd-versal2.c:388:9: error: implicit declaration of function 'zynqmp_pm_sec_mask_write_reg' [-Werror=implicit-function-declaration]
     388 |   ret = zynqmp_pm_sec_mask_write_reg(PM_REGNODE_PMC_IOU_SLCR, SRAM_CSR_OFFSET,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/host/ufs-amd-versal2.c: At top level:
   drivers/ufs/host/ufs-amd-versal2.c:558:23: error: initialization of 'int (*)(struct ufs_hba *, enum ufs_notify_change_status,  const struct ufs_pa_layer_attr *, struct ufs_pa_layer_attr *)' from incompatible pointer type 'int (*)(struct ufs_hba *, enum ufs_notify_change_status,  struct ufs_pa_layer_attr *, struct ufs_pa_layer_attr *)' [-Werror=incompatible-pointer-types]
     558 |  .pwr_change_notify = ufs_versal2_pwr_change_notify,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/host/ufs-amd-versal2.c:558:23: note: (near initialization for 'ufs_versal2_hba_vops.pwr_change_notify')
>> drivers/ufs/host/ufs-amd-versal2.c:561:34: warning: 'ufs_versal2_pltfm_match' defined but not used [-Wunused-const-variable=]
     561 | static const struct of_device_id ufs_versal2_pltfm_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ufs_versal2_pltfm_match +561 drivers/ufs/host/ufs-amd-versal2.c

   560	
 > 561	static const struct of_device_id ufs_versal2_pltfm_match[] = {
   562		{
   563			.compatible = "amd,versal2-ufs",
   564			.data = &ufs_versal2_hba_vops,
   565		},
   566		{ },
   567	};
   568	MODULE_DEVICE_TABLE(of, ufs_versal2_pltfm_match);
   569	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
