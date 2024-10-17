Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83ED201009
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 18:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729190448; cv=none; b=QLH80nFx2R81kvJVRkP/PBVrSJR4cBDkboQNYq8kQCafKniEQK5NeIuEMn65d8UlnXSyOq+bfO/gEYrXkGexv/KRQZp1DwpxARzcjYIMSmwiKKESj4TC2lFdFqGUxqsXNdTeAOhElh6bghmgemS+ztNe+uwDnH4Ac0YC/kOzhVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729190448; c=relaxed/simple;
	bh=UxxPdsNDAgGxmoJmmD4R711CuDnHdJ2CQjGxtVLUVRQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jFeI13Yulm3KQH291SPz8/1+u9ykMYXy3FqgbWxaUrpNeGXhN8rC8WqolMJ+fpUpaxDtLykJ1kXxHJR0TUXIwHfQLga9Q6JtnN1vv48RVGe3TMdE2z/0MXdq2+IjF+TipNn7IX/BvaISpaabbGIgS8ZVr6TURavyngLsWiwqgVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfU5hhQU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfU5hhQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729190443; x=1760726443;
  h=date:from:cc:subject:message-id:mime-version;
  bh=UxxPdsNDAgGxmoJmmD4R711CuDnHdJ2CQjGxtVLUVRQ=;
  b=bfU5hhQU2Kpihi9GBMoZMjAxjSuGR6C6F3DYxzKSrn5fOX3zSRw+RrMJ
   LlxHgq0vpP8Pgtm9XY6tEhJiO1MN8AfG1HUSQCGnJjq7fXTgCd+9OIROI
   JbPX+kh9/RacROcJlX/KcpAfDcN8jNZ8MZVMtOE2HaB7trkYDnkFRfTvp
   iqUCNs1xfP1SmRahvWCw3FSHaxp239VeT7Gf9Rgn54XCn99NDsIJlUVST
   Q3ZewB2Oh87wpXHxMaClUsNFGMGD8vp9i+k3TUXB6O+PBWuK+VWma3L+u
   CUkfF8Zy+ekLqNQodDyj93mBD0IBYrHacCOuSC0sMyEyqTLO4j5Tm0UBK
   A==;
X-CSE-ConnectionGUID: hYBZknZMSZmMHKsoTbMdYA==
X-CSE-MsgGUID: imsEyz90SWyK2SFoEKokPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28847702"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28847702"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 11:40:42 -0700
X-CSE-ConnectionGUID: 62cPyPQ+RfylqL1MerUNAA==
X-CSE-MsgGUID: u6KPSNsnRNuY3R8LaLSrkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="109457129"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Oct 2024 11:40:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1VQM-000MkL-22;
	Thu, 17 Oct 2024 18:40:38 +0000
Date: Fri, 18 Oct 2024 02:39:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 1/3]
 drivers/remoteproc/ti_k3_r5_remoteproc.c:187:12: warning: 'is_core_in_wfi'
 defined but not used
Message-ID: <202410180213.iIynddZZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   e680678e5fef8c191b1588d8d7520171011ebe93
commit: 3dfcf0a746aa02fee2ef2c9ef37da637f38e3339 [1/3] Merge tag 'v6.1.105-rt38' into ti-rt-linux-6.1.y-cicd
config: arm64-randconfig-003-20241017 (https://download.01.org/0day-ci/archive/20241018/202410180213.iIynddZZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180213.iIynddZZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410180213.iIynddZZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/ti_k3_r5_remoteproc.c:187:12: warning: 'is_core_in_wfi' defined but not used [-Wunused-function]
     187 | static int is_core_in_wfi(struct k3_r5_core *core)
         |            ^~~~~~~~~~~~~~


vim +/is_core_in_wfi +187 drivers/remoteproc/ti_k3_r5_remoteproc.c

6dedbd1d544389 Suman Anna   2020-10-02  179  
1db4571a37a91d Hari Nagalla 2023-10-18  180  /**
1db4571a37a91d Hari Nagalla 2023-10-18  181   * is_core_in_wfi - local utility function to check core status
1db4571a37a91d Hari Nagalla 2023-10-18  182   * @core: remote core pointer used for checking core status
1db4571a37a91d Hari Nagalla 2023-10-18  183   *
1db4571a37a91d Hari Nagalla 2023-10-18  184   * This utility function is invoked by the shutdown sequence to ensure
1db4571a37a91d Hari Nagalla 2023-10-18  185   * the remote core is in wfi, before asserting a reset.
1db4571a37a91d Hari Nagalla 2023-10-18  186   */
1db4571a37a91d Hari Nagalla 2023-10-18 @187  static int is_core_in_wfi(struct k3_r5_core *core)
1db4571a37a91d Hari Nagalla 2023-10-18  188  {
1db4571a37a91d Hari Nagalla 2023-10-18  189  	int ret;
1db4571a37a91d Hari Nagalla 2023-10-18  190  	u64 boot_vec = 0;
1db4571a37a91d Hari Nagalla 2023-10-18  191  	u32 cfg = 0, ctrl = 0, stat = 0;
1db4571a37a91d Hari Nagalla 2023-10-18  192  
1db4571a37a91d Hari Nagalla 2023-10-18  193  	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
1db4571a37a91d Hari Nagalla 2023-10-18  194  
1db4571a37a91d Hari Nagalla 2023-10-18  195  	if (ret < 0)
1db4571a37a91d Hari Nagalla 2023-10-18  196  		return 0;
1db4571a37a91d Hari Nagalla 2023-10-18  197  
1db4571a37a91d Hari Nagalla 2023-10-18  198  	return (stat & PROC_BOOT_STATUS_FLAG_R5_WFI);
1db4571a37a91d Hari Nagalla 2023-10-18  199  }
1db4571a37a91d Hari Nagalla 2023-10-18  200  

:::::: The code at line 187 was first introduced by commit
:::::: 1db4571a37a91dac5c68e6bb3337151028e4d52f remoteproc: k3-r5: support for graceful stop of remote cores

:::::: TO: Hari Nagalla <hnagalla@ti.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
