Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51A714A83
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 20:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cauiV3vK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703883225; x=1735419225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HVAesmOlERNGOkQ8fVszJyPiLtV/UrNTySZU5ZLT2Ok=;
  b=cauiV3vKuR76J61I2s0NJXwVJwqZ4mZmSfaFL0ysmyLRx7vbGsgQ0z4u
   48lqZGpGGqWkxN+nsKrvCqXa2f6v3QmFZjVhDxcrRh+rsB8E+oBkRhiKC
   Uha6yvwamcLITPWHlrEm8zRXWMfLhSSwmn01dGUxPK/R8jRQ68/As2hrF
   uvYah6BIxHYyW1yK15TBCFC1/+wnDS3koodMILe5eOtkhULHdckIcrHVl
   Q4AhGsfvVp8zMZtHdf3sZNIuQOnkAyuSunqIwUkpB3RzRBwS6dHaMBR05
   cZ2FP0qZPCVS+GHvKvBVK6MRwgpJ+Qqg5lhL6UKO5zOqqzB12wirjBq9q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="482858995"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="482858995"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 12:53:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="728679155"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="728679155"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Dec 2023 12:53:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJJrR-000HoJ-1p;
	Fri, 29 Dec 2023 20:53:41 +0000
Date: Sat, 30 Dec 2023 04:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmaps2-on-lukas-v3.1 9/55] sound/soc/sof/ops.h:159:17:
 sparse: sparse: Initializer entry defined twice
Message-ID: <202312300422.t5FAv8gU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-classmaps2-on-lukas-v3.1
head:   4a9d672e048057e464e5bf65816cb57dd078fd62
commit: da57303ad20564945fe168b6ee05d43d12dbe7ca [9/55] dyndbg: move flags field to a new structure
config: i386-randconfig-063-20231229 (https://download.01.org/0day-ci/archive/20231230/202312300422.t5FAv8gU-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300422.t5FAv8gU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300422.t5FAv8gU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/sof/sof-audio.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   sound/soc/sof/sof-audio.c: note: in included file:
>> sound/soc/sof/ops.h:159:17: sparse: sparse: Initializer entry defined twice
   sound/soc/sof/ops.h:159:17: sparse:   also defined here
--
   sound/soc/sof/ipc3.c: note: in included file:
   include/sound/sof/control.h:124:17: sparse: sparse: array of flexible structures
   sound/soc/sof/ipc3.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
>> sound/soc/sof/ipc3.c:222:17: sparse: sparse: Initializer entry defined twice
   sound/soc/sof/ipc3.c:222:17: sparse:   also defined here
>> sound/soc/sof/ipc3.c:222:17: sparse: sparse: Initializer entry defined twice
   sound/soc/sof/ipc3.c:222:17: sparse:   also defined here
>> sound/soc/sof/ipc3.c:222:17: sparse: sparse: Initializer entry defined twice
   sound/soc/sof/ipc3.c:222:17: sparse:   also defined here

vim +159 sound/soc/sof/ops.h

c414d5df9d0547 Ranjani Sridharan 2021-11-19  135  
c414d5df9d0547 Ranjani Sridharan 2021-11-19  136  static inline int snd_sof_dsp_core_put(struct snd_sof_dev *sdev, int core)
c414d5df9d0547 Ranjani Sridharan 2021-11-19  137  {
c414d5df9d0547 Ranjani Sridharan 2021-11-19  138  	if (core > sdev->num_cores - 1) {
c414d5df9d0547 Ranjani Sridharan 2021-11-19  139  		dev_err(sdev->dev, "invalid core id: %d for num_cores: %d\n", core,
c414d5df9d0547 Ranjani Sridharan 2021-11-19  140  			sdev->num_cores);
c414d5df9d0547 Ranjani Sridharan 2021-11-19  141  		return -EINVAL;
c414d5df9d0547 Ranjani Sridharan 2021-11-19  142  	}
c414d5df9d0547 Ranjani Sridharan 2021-11-19  143  
c414d5df9d0547 Ranjani Sridharan 2021-11-19  144  	if (sof_ops(sdev)->core_put) {
c414d5df9d0547 Ranjani Sridharan 2021-11-19  145  		int ret;
c414d5df9d0547 Ranjani Sridharan 2021-11-19  146  
c414d5df9d0547 Ranjani Sridharan 2021-11-19  147  		/* decrement ref_count and return if it is > 0 */
c414d5df9d0547 Ranjani Sridharan 2021-11-19  148  		if (--(sdev->dsp_core_ref_count[core]) > 0)
c414d5df9d0547 Ranjani Sridharan 2021-11-19  149  			return 0;
c414d5df9d0547 Ranjani Sridharan 2021-11-19  150  
c414d5df9d0547 Ranjani Sridharan 2021-11-19  151  		/* power down the core */
c414d5df9d0547 Ranjani Sridharan 2021-11-19  152  		ret = sof_ops(sdev)->core_put(sdev, core);
c414d5df9d0547 Ranjani Sridharan 2021-11-19  153  		if (ret < 0)
c414d5df9d0547 Ranjani Sridharan 2021-11-19  154  			return ret;
c414d5df9d0547 Ranjani Sridharan 2021-11-19  155  
c414d5df9d0547 Ranjani Sridharan 2021-11-19  156  		/* and update enabled_cores_mask */
c414d5df9d0547 Ranjani Sridharan 2021-11-19  157  		sdev->enabled_cores_mask &= ~BIT(core);
c414d5df9d0547 Ranjani Sridharan 2021-11-19  158  
c414d5df9d0547 Ranjani Sridharan 2021-11-19 @159  		dev_dbg(sdev->dev, "Core %d powered down\n", core);
c414d5df9d0547 Ranjani Sridharan 2021-11-19  160  	}
c414d5df9d0547 Ranjani Sridharan 2021-11-19  161  
c414d5df9d0547 Ranjani Sridharan 2021-11-19  162  	return 0;
c414d5df9d0547 Ranjani Sridharan 2021-11-19  163  }
c414d5df9d0547 Ranjani Sridharan 2021-11-19  164  

:::::: The code at line 159 was first introduced by commit
:::::: c414d5df9d05471aa47f50fca7fa4412daca7ac7 ASoC: SOF: Add ops for core_get and core_put

:::::: TO: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
