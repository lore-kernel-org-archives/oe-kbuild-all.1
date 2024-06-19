Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB35B2139D3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 03:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718768983; cv=none; b=bw51xKgpOktQEeTJlNJxN5jWHcQwD3Dsw6A3kiI8K3wWoD9NVDyFwTPyMyuyGcrh6LB7/SnSvAKJMU7sEIVVyqc1SRC542b6l1BZPQLlazMD7NLdo7D9vqPx/akZd4qJk2WxBSx3qrWMx4dyjjFCqtxpOhhkzXVuD47cefTcMjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718768983; c=relaxed/simple;
	bh=QXkSVgStsUG9fYT331CI3KiuTyOcT9EhyIjOJUjiO4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fXNwPUlFymA5VOfYUHTp4znOi19YNdENV1KrLIK3M//l/usBPHtv4CO4nMEQkAzR4HcZBevMTUGyeru6ebdEQB+6X7eTRBb0sEzqWnqXXIsFn9Y7POsIHsFNURkwtCV+hDsJv486DSYBfrEsrymVL0rzcHndA6yUCjdJzrQ30ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C59xcf3/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C59xcf3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718768981; x=1750304981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QXkSVgStsUG9fYT331CI3KiuTyOcT9EhyIjOJUjiO4c=;
  b=C59xcf3/xQrPjt7rylRp1hljjszo08Njw9AgqXxrieqFJMFzxbiVMwGJ
   z954/x2zeiyPmKQSEEWLCO20khBD10QDl9KdriPG9xoPrYZkxIl4j49qN
   WTwWgE1tEg+vUPM4KJJUnq3u7TgvOIyW0BVIXaCqCrWrCUADHfQXu+9ls
   Niyd4LVgYKc60Fcu50P8RKEN6pnTh/coDI5H64roc8atvKlkkEd9IhmWL
   pUGKnBaAEqlBueAnYyLUURu8UdAA1Nj910aS7tc4TgHM6N3ky9bojcGIQ
   0tfoGsICfYAm0drzepUsC3VgGfziH0619x31Sc/cA2CnNqUReI4K5XADN
   A==;
X-CSE-ConnectionGUID: c9lGc/CWSjSyoMZ/7azfWA==
X-CSE-MsgGUID: hVuxXOV2ThCVCscg1TQGRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27087150"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="27087150"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 20:49:41 -0700
X-CSE-ConnectionGUID: fWBddMlARjqvtEjSvhQHcQ==
X-CSE-MsgGUID: aTl78yIaT0OGdr4D3qSamQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="46721246"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Jun 2024 20:49:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJmKH-0006Fi-1w;
	Wed, 19 Jun 2024 03:49:37 +0000
Date: Wed, 19 Jun 2024 11:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/fix-link-power-up 4/4]
 drivers/soundwire/intel_ace2x.c:133:6: warning: variable 'clock_source' set
 but not used
Message-ID: <202406191114.f7jLI1wM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/fix-link-power-up
head:   e29ccf331968bbdc45bda006cfe4da3c8618baf2
commit: e29ccf331968bbdc45bda006cfe4da3c8618baf2 [4/4] soundwire: intel_ace2x: revert power-up sequence
config: i386-buildonly-randconfig-002-20240619 (https://download.01.org/0day-ci/archive/20240619/202406191114.f7jLI1wM-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406191114.f7jLI1wM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406191114.f7jLI1wM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soundwire/intel_ace2x.c:133:6: warning: variable 'clock_source' set but not used [-Wunused-but-set-variable]
     133 |         u32 clock_source;
         |             ^
   1 warning generated.


vim +/clock_source +133 drivers/soundwire/intel_ace2x.c

4e024a8cfb184d Pierre-Louis Bossart 2023-01-20  126  
bb2ec5644697a8 Pierre-Louis Bossart 2023-01-10  127  static int intel_link_power_up(struct sdw_intel *sdw)
bb2ec5644697a8 Pierre-Louis Bossart 2023-01-10  128  {
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  129  	struct sdw_bus *bus = &sdw->cdns.bus;
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  130  	struct sdw_master_prop *prop = &bus->prop;
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  131  	u32 *shim_mask = sdw->link_res->shim_mask;
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  132  	unsigned int link_id = sdw->instance;
4e6a966b12d959 Pierre-Louis Bossart 2023-09-20 @133  	u32 clock_source;
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  134  	u32 syncprd;
bb2ec5644697a8 Pierre-Louis Bossart 2023-01-10  135  	int ret;
bb2ec5644697a8 Pierre-Louis Bossart 2023-01-10  136  
4e6a966b12d959 Pierre-Louis Bossart 2023-09-20  137  	if (prop->mclk_freq % 6000000) {
4e6a966b12d959 Pierre-Louis Bossart 2023-09-20  138  		if (prop->mclk_freq % 2400000) {
4e6a966b12d959 Pierre-Louis Bossart 2023-09-20  139  			syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_24_576;
4e6a966b12d959 Pierre-Louis Bossart 2023-09-20  140  			clock_source = SDW_SHIM2_MLCS_CARDINAL_CLK;
4e6a966b12d959 Pierre-Louis Bossart 2023-09-20  141  		} else {
4e6a966b12d959 Pierre-Louis Bossart 2023-09-20  142  			syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_38_4;
4e6a966b12d959 Pierre-Louis Bossart 2023-09-20  143  			clock_source = SDW_SHIM2_MLCS_XTAL_CLK;
4e6a966b12d959 Pierre-Louis Bossart 2023-09-20  144  		}
4e6a966b12d959 Pierre-Louis Bossart 2023-09-20  145  	} else {
4e6a966b12d959 Pierre-Louis Bossart 2023-09-20  146  		syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_96;
4e6a966b12d959 Pierre-Louis Bossart 2023-09-20  147  		clock_source = SDW_SHIM2_MLCS_AUDIO_PLL_CLK;
4e6a966b12d959 Pierre-Louis Bossart 2023-09-20  148  	}
4e6a966b12d959 Pierre-Louis Bossart 2023-09-20  149  
bb2ec5644697a8 Pierre-Louis Bossart 2023-01-10  150  	mutex_lock(sdw->link_res->shim_lock);
bb2ec5644697a8 Pierre-Louis Bossart 2023-01-10  151  
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  152  	if (!*shim_mask) {
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  153  		/* we first need to program the SyncPRD/CPU registers */
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  154  		dev_dbg(sdw->cdns.dev, "first link up, programming SYNCPRD\n");
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  155  
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  156  		ret =  hdac_bus_eml_sdw_set_syncprd_unlocked(sdw->link_res->hbus, syncprd);
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  157  		if (ret < 0) {
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  158  			dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_set_syncprd failed: %d\n",
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  159  				__func__, ret);
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  160  			goto out;
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  161  		}
e29ccf331968bb Pierre-Louis Bossart 2024-06-18  162  	}
e29ccf331968bb Pierre-Louis Bossart 2024-06-18  163  
e29ccf331968bb Pierre-Louis Bossart 2024-06-18  164  	ret = hdac_bus_eml_sdw_power_up_unlocked(sdw->link_res->hbus, link_id);
e29ccf331968bb Pierre-Louis Bossart 2024-06-18  165  	if (ret < 0) {
e29ccf331968bb Pierre-Louis Bossart 2024-06-18  166  		dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_power_up failed: %d\n",
e29ccf331968bb Pierre-Louis Bossart 2024-06-18  167  			__func__, ret);
e29ccf331968bb Pierre-Louis Bossart 2024-06-18  168  		goto out;
e29ccf331968bb Pierre-Louis Bossart 2024-06-18  169  	}
bb2ec5644697a8 Pierre-Louis Bossart 2023-01-10  170  
e29ccf331968bb Pierre-Louis Bossart 2024-06-18  171  	//intel_shim_vs_set_clock_source(sdw, clock_source);
e29ccf331968bb Pierre-Louis Bossart 2024-06-18  172  
e29ccf331968bb Pierre-Louis Bossart 2024-06-18  173  	if (!*shim_mask) {
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  174  		/* SYNCPU will change once link is active */
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  175  		ret =  hdac_bus_eml_sdw_wait_syncpu_unlocked(sdw->link_res->hbus);
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  176  		if (ret < 0) {
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  177  			dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_wait_syncpu failed: %d\n",
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  178  				__func__, ret);
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  179  			goto out;
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  180  		}
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  181  	}
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  182  
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  183  	*shim_mask |= BIT(link_id);
5772df7f0fe716 Pierre-Louis Bossart 2023-01-16  184  
bb2ec5644697a8 Pierre-Louis Bossart 2023-01-10  185  	sdw->cdns.link_up = true;
2749185d559c59 Pierre-Louis Bossart 2023-01-16  186  
2749185d559c59 Pierre-Louis Bossart 2023-01-16  187  	intel_shim_vs_init(sdw);
2749185d559c59 Pierre-Louis Bossart 2023-01-16  188  
bb2ec5644697a8 Pierre-Louis Bossart 2023-01-10  189  out:
bb2ec5644697a8 Pierre-Louis Bossart 2023-01-10  190  	mutex_unlock(sdw->link_res->shim_lock);
bb2ec5644697a8 Pierre-Louis Bossart 2023-01-10  191  
bb2ec5644697a8 Pierre-Louis Bossart 2023-01-10  192  	return ret;
bb2ec5644697a8 Pierre-Louis Bossart 2023-01-10  193  }
bb2ec5644697a8 Pierre-Louis Bossart 2023-01-10  194  

:::::: The code at line 133 was first introduced by commit
:::::: 4e6a966b12d959187f68694a8821f5bcbef3beff soundwire: intel_ace2x: move and extend clock selection

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
