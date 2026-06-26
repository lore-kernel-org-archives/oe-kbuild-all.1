Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0552303CAE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 19:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782503697; cv=none; b=nkDgmmkTkxKQfbEfH4zcWvk/lKcxM/TqofMr1WoTbonromUH3LJkSf8EIIBNFkpAyjKrAgeLv9pUUKIp17bWTaIxJTU2nclO7DYUICxz8l7D9tBuUNfCJs43sr1MKKg+anDECn9Sdq68+QS89iMO1pyn51wq2kgpGLJXnodEsD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782503697; c=relaxed/simple;
	bh=NjfMcqrXEI9pSB3x5s2NAsTmO509k0UW58xJq05cw6U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E55YFoITkgtomBF8pSAzNO+YC1gjQg9bNRUzxPVccZgOCT/HJZh5iKpOueNZ8Oc+aq3OtnMaTGqfdV/vot7HYRKdBbygGUhYnoHE4WSs0doPa9Wg7/X+gfouM2nuPZ18rP91bmc3ehVkmPWAOIjMZe0Klaq+fw1LXoCUhjilclI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5vnv1LW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5vnv1LW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782503695; x=1814039695;
  h=date:from:to:cc:subject:message-id;
  bh=NjfMcqrXEI9pSB3x5s2NAsTmO509k0UW58xJq05cw6U=;
  b=S5vnv1LWj7Tqa0rNG/nAXKXLhJzeu8hZcvfJ8DwLAu6klZKGJWCg4Q2C
   yYGXdsk99mR8OJmjfLog2IyvDgCxDK/g73Gvm2bn2yUrlwU8AoSdpQRcz
   kl7TnkTuN2NDzFD1cN8aoZHeViZXHFyLNdBbbTcE/Kq0/6ImWMRb+ZQq6
   5c/iVNVJdw02D+46m+i2SbtgZfMw6wexxiUX34gpVZICFw3pucXjmTPvS
   cl2szoJyRshnAD1s9+DUdQvoHFivI2a2geVerR8PJYC3pmMqpJqOy6Dm5
   jswp8kYOk/kKtIJvTaw+2RC97INfLEswJwDyJvD0tFue02BZlVrzFuHQu
   Q==;
X-CSE-ConnectionGUID: 03DO1082QKqOfzQXPv0/2w==
X-CSE-MsgGUID: lWI/kqNiRUyQ8BvbKrzJ1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="83308489"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="83308489"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 12:54:54 -0700
X-CSE-ConnectionGUID: yc2shZ3WT02Des+N6rCz0w==
X-CSE-MsgGUID: h2k28PBpREuQJosuYHNN8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="256297912"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2026 12:54:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdCdV-000000005OX-2sIo;
	Fri, 26 Jun 2026 19:54:49 +0000
Date: Sat, 27 Jun 2026 03:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "sys_oak" <sys_oak@intel.com>,
 Tony Luck <tony.luck@intel.com>
Subject: [intel-lts:6.12/emt 0/2] drivers/edac/ie31200_edac.c:613:19:
 sparse: sparse: symbol 'rpl_s_cfg' was not declared. Should it be static?
Message-ID: <202606270325.DGUk0TfP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   efa0eceac635132225b11aaee467c1452a2b775c
commit: f6f3f36d069ec4ee6ad2599c91409ddaa6323849 [0/2] EDAC/ie31200: Add Intel Raptor Lake-S SoCs support
config: x86_64-randconfig-122-20260626 (https://download.01.org/0day-ci/archive/20260627/202606270325.DGUk0TfP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270325.DGUk0TfP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270325.DGUk0TfP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/edac/ie31200_edac.c:613:19: sparse: sparse: symbol 'rpl_s_cfg' was not declared. Should it be static?

vim +/rpl_s_cfg +613 drivers/edac/ie31200_edac.c

   612	
 > 613	struct res_config rpl_s_cfg = {
   614		.mtype				= MEM_DDR5,
   615		.imc_num			= 2,
   616		.reg_mchbar_mask		= GENMASK_ULL(41, 17),
   617		.reg_mchbar_window_size		= BIT_ULL(16),
   618		.reg_eccerrlog_offset[0]	= 0xe048,
   619		.reg_eccerrlog_offset[1]	= 0xe848,
   620		.reg_eccerrlog_ce_mask		= BIT_ULL(0),
   621		.reg_eccerrlog_ce_ovfl_mask	= BIT_ULL(1),
   622		.reg_eccerrlog_ue_mask		= BIT_ULL(2),
   623		.reg_eccerrlog_ue_ovfl_mask	= BIT_ULL(3),
   624		.reg_eccerrlog_rank_mask	= GENMASK_ULL(28, 27),
   625		.reg_eccerrlog_syndrome_mask	= GENMASK_ULL(23, 16),
   626		.msr_clear_eccerrlog_offset	= 0x791,
   627		.reg_mad_dimm_offset[0]		= 0xd80c,
   628		.reg_mad_dimm_offset[1]		= 0xd810,
   629		.reg_mad_dimm_size_granularity	= BIT_ULL(29),
   630		.reg_mad_dimm_size_mask[0]	= GENMASK(6, 0),
   631		.reg_mad_dimm_size_mask[1]	= GENMASK(22, 16),
   632		.reg_mad_dimm_rank_mask[0]	= GENMASK(10, 9),
   633		.reg_mad_dimm_rank_mask[1]	= GENMASK(27, 26),
   634		.reg_mad_dimm_width_mask[0]	= GENMASK(8, 7),
   635		.reg_mad_dimm_width_mask[1]	= GENMASK(25, 24),
   636	};
   637	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
