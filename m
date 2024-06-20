Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90FA1990B3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 11:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718884202; cv=none; b=qBLRRKRiUQi3sCbNWi+HQJpFoGiBTIOobY3Tth8inSLQ9dtGmFWLUXay+QAMkBIez1LIjFCkCUm9A0T0NrUHs1Ekcr/tw9czkJztNKjBMlDUa7C4PL0ljvoeAiatVJl0muFYrNPqpQRZ5xthUc6VjTvYpGCFmaBF7nbFlhEhI0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718884202; c=relaxed/simple;
	bh=JcMNtWOySz+Xy7t2ExD6eZnmfmKSWYkpgI3INGPI5pA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eZYwlqAcgsdlpA+CXVniDN0/pWs/IEkTjcJ4xNPue/6JRQCfOx2eqsCcw9l5XIYy5S7jUAHjYc51vwQzSlyVG7hDgQkBq8AytVCQtXpJNW3TtBdi9QBTiW6MAKebCe56F56eQx19ljTAIX6aF1GDbP4IwLry+wfdJs7E103r4uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWqfRi2a; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWqfRi2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718884200; x=1750420200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JcMNtWOySz+Xy7t2ExD6eZnmfmKSWYkpgI3INGPI5pA=;
  b=OWqfRi2anaqw6HwXWIgTCNbvCby46i72Pzf/U+JgSJ9efoW4fovXq2L7
   FNxaks5aemPE+Ad4kFiF272NZEXrxatIm+zsk9GDpAxE2jeFz3c2uraQx
   VwVBDYnWy6HHPPeg3oYUb3BqywwqCVi4/ZxGqm9mrSdennWgrP+/VXxYE
   uG+7zZJdTd2pvrDZ0i7PwFSbTtVV117pfgayKIrIsTJCMp/EVHSyqULM0
   c4nou31GGUp+x3szT57v6XXXZioVsmkoMLLNEJo1D4vaWK8Q9nljwgcKT
   ASqsBxU/3z3GjEHpfWb7WlxEJh9XUma/lSguuScbK+KszgxkcjBsutmaK
   g==;
X-CSE-ConnectionGUID: 6VHNWJL3Q3S+Y9Fdk7BIeg==
X-CSE-MsgGUID: tp8Lf4HSTrioysDSy3GFTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26445720"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="26445720"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 04:49:59 -0700
X-CSE-ConnectionGUID: 6ASef76IRhWUmGu1JZ3ISA==
X-CSE-MsgGUID: /TCjEPKYQvGenZw37QCn1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="46569222"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jun 2024 04:49:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKGIe-0007Zy-16;
	Thu, 20 Jun 2024 11:49:56 +0000
Date: Thu, 20 Jun 2024 19:49:15 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/enable-interrupt-after-power-up 5/8]
 drivers/soundwire/intel_ace2x.c:178:3: error: implicit declaration of
 function 'hdac_bus_eml_enable_interrupt_unlocked'; did you mean
 'hdac_bus_eml_enable_interrupt'?
Message-ID: <202406201942.AgdTpM1u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/enable-interrupt-after-power-up
head:   de2bd82603c6b006d74e5c96c80e3cc4fee77c26
commit: be656d5ae2641105c22b18264a92411b5ff0e106 [5/8] ASoC/SoundWire: Intel: lnl: enable interrupts after first power-up/before last power-down
config: i386-randconfig-011-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201942.AgdTpM1u-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201942.AgdTpM1u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201942.AgdTpM1u-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soundwire/intel_ace2x.c: In function 'intel_link_power_up':
>> drivers/soundwire/intel_ace2x.c:178:3: error: implicit declaration of function 'hdac_bus_eml_enable_interrupt_unlocked'; did you mean 'hdac_bus_eml_enable_interrupt'? [-Werror=implicit-function-declaration]
      hdac_bus_eml_enable_interrupt_unlocked(sdw->link_res->hbus, true, AZX_REG_ML_LEPTR_ID_SDW, true);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      hdac_bus_eml_enable_interrupt
   cc1: some warnings being treated as errors


vim +178 drivers/soundwire/intel_ace2x.c

   124	
   125	static int intel_link_power_up(struct sdw_intel *sdw)
   126	{
   127		struct sdw_bus *bus = &sdw->cdns.bus;
   128		struct sdw_master_prop *prop = &bus->prop;
   129		u32 *shim_mask = sdw->link_res->shim_mask;
   130		unsigned int link_id = sdw->instance;
   131		u32 clock_source;
   132		u32 syncprd;
   133		int ret;
   134	
   135		if (prop->mclk_freq % 6000000) {
   136			if (prop->mclk_freq % 2400000) {
   137				syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_24_576;
   138				clock_source = SDW_SHIM2_MLCS_CARDINAL_CLK;
   139			} else {
   140				syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_38_4;
   141				clock_source = SDW_SHIM2_MLCS_XTAL_CLK;
   142			}
   143		} else {
   144			syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_96;
   145			clock_source = SDW_SHIM2_MLCS_AUDIO_PLL_CLK;
   146		}
   147	
   148		mutex_lock(sdw->link_res->shim_lock);
   149	
   150		ret = hdac_bus_eml_sdw_power_up_unlocked(sdw->link_res->hbus, link_id);
   151		if (ret < 0) {
   152			dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_power_up failed: %d\n",
   153				__func__, ret);
   154			goto out;
   155		}
   156	
   157		intel_shim_vs_set_clock_source(sdw, clock_source);
   158	
   159		if (!*shim_mask) {
   160			/* we first need to program the SyncPRD/CPU registers */
   161			dev_dbg(sdw->cdns.dev, "first link up, programming SYNCPRD\n");
   162	
   163			ret =  hdac_bus_eml_sdw_set_syncprd_unlocked(sdw->link_res->hbus, syncprd);
   164			if (ret < 0) {
   165				dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_set_syncprd failed: %d\n",
   166					__func__, ret);
   167				goto out;
   168			}
   169	
   170			/* SYNCPU will change once link is active */
   171			ret =  hdac_bus_eml_sdw_wait_syncpu_unlocked(sdw->link_res->hbus);
   172			if (ret < 0) {
   173				dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_wait_syncpu failed: %d\n",
   174					__func__, ret);
   175				goto out;
   176			}
   177	
 > 178			hdac_bus_eml_enable_interrupt_unlocked(sdw->link_res->hbus, true, AZX_REG_ML_LEPTR_ID_SDW, true);
   179		}
   180	
   181		*shim_mask |= BIT(link_id);
   182	
   183		sdw->cdns.link_up = true;
   184	
   185		intel_shim_vs_init(sdw);
   186	
   187	out:
   188		mutex_unlock(sdw->link_res->shim_lock);
   189	
   190		return ret;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
