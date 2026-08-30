Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB6838D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076153; cv=none; b=NkaZye4dj7s7ssYQ5nirJ3ObDePNbOvHeZICRbY29Dl83vnyYN9/xSJbjdj+WLXuYxzqn0XKzGSVPHYqv1S1R/isL+X36fjYKnOzjCeYn/E+0GBEs6aMxkrswdg5Jo1p4fHgKhVjEmrnLDnMsS1PQWtcDhz8WTU+GPZlEoZo1/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076153; c=relaxed/simple;
	bh=e20lWrbk0AltbD6M4VVConOq7CpWrw86nzChT/NqycQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BOSIrCocBMayyTqZkzF5rMOkzBL/yVou2ODpgLIXBdcPfr0RorOncB7kC9BY2sroGkROmBiMdLMMnqDHj4RomgwrHnFZCAWtPxIAnWXsxpdWZI4Dygea63ibL1/m9MNtaGNdouvdd2SORmIBrGPi8Fk83pIoD5qDniYN/Bl6tto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3p7c5Vu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3p7c5Vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788076151; x=1819612151;
  h=date:from:to:cc:subject:message-id;
  bh=e20lWrbk0AltbD6M4VVConOq7CpWrw86nzChT/NqycQ=;
  b=H3p7c5VuQjcyDYFAoJEWYGyxpS0lD0RuIObD0YO7FkP1UYXeG9EzbLt0
   wfks4S99toaI4cCyTgXOj9vLJJ/lc1eNMU5dxIAKgmvUFgjCuXKzPlIp7
   gboaqowhLVUSIdXGM39EOmbuQc9y7HSF7xfAwvobvpmJQXIOkbHVfNQ/k
   Q1c7MIcN0MFrVfc8kYy4OGStV2vYzcXEZ+XygVAzZFVxqzVPY/ajPy0ZC
   jKFOHOOlCF/WZ2G+qW1IRz638n2KwQZyLreRKOSPfy/OVDBSy+wUW8u3b
   6Nf9l0uBVSG5yKGfr2ioBBcwnKfAbjADxgeRdOqX/rzldqY9IQ86xwmiv
   w==;
X-CSE-ConnectionGUID: 732YlS9BT2emEl7K8G+ZRQ==
X-CSE-MsgGUID: IqY1zwHkRL2Z477PIWr3+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="99675307"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="99675307"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 00:49:10 -0700
X-CSE-ConnectionGUID: /f6izALfSlG689rY0gVk6g==
X-CSE-MsgGUID: dJQXbxtOR3OEMdDJYnwhng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="273797435"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Aug 2026 00:49:08 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0aHq-00000000DhI-0pie;
	Sun, 30 Aug 2026 07:49:06 +0000
Date: Sun, 30 Aug 2026 15:48:16 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/zen-sauce 4/26]
 drivers/firmware/cirrus/cs_dsp.c:491:17: warning: '%s' directive argument is
 null
Message-ID: <202608301541.XDEvwalU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/zen-sauce
head:   299e73098bef8870b60c6ce830084457d222b0f5
commit: 4552ae443b368caad94ec1a5dfb1e92047dc62a6 [4/26] ZEN: Restore CONFIG_OPTIMIZE_FOR_PERFORMANCE_O3
config: m68k-randconfig-r112-20260829 (https://download.01.org/0day-ci/archive/20260830/202608301541.XDEvwalU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608301541.XDEvwalU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608301541.XDEvwalU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/cirrus/cs_dsp.c: In function 'cs_dsp_debugfs_read_controls_show':
>> drivers/firmware/cirrus/cs_dsp.c:491:17: warning: '%s' directive argument is null [-Wformat-overflow=]
     491 |                 seq_printf(s, "%22.*s: %#8x %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     492 |                            ctl->subname_len, ctl->subname, ctl->len,
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     493 |                            cs_dsp_mem_region_name(ctl->alg_region.type),
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     494 |                            ctl->offset, reg, ctl->fw_name, ctl->alg_region.alg, ctl->type,
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     495 |                            ctl->flags & WMFW_CTL_FLAG_VOLATILE ? 'V' : '-',
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     496 |                            ctl->flags & WMFW_CTL_FLAG_SYS ? 'S' : '-',
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     497 |                            ctl->flags & WMFW_CTL_FLAG_READABLE ? 'R' : '-',
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     498 |                            ctl->flags & WMFW_CTL_FLAG_WRITEABLE ? 'W' : '-',
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     499 |                            ctl->enabled ? "enabled" : "disabled",
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     500 |                            ctl->set ? "dirty" : "clean");
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +491 drivers/firmware/cirrus/cs_dsp.c

f6bc909e7673c30 Simon Trimmer      2021-09-13  477  
7a3f924cee4bdfe Simon Trimmer      2023-03-28  478  static int cs_dsp_coeff_base_reg(struct cs_dsp_coeff_ctl *ctl, unsigned int *reg,
7a3f924cee4bdfe Simon Trimmer      2023-03-28  479  				 unsigned int off);
7a3f924cee4bdfe Simon Trimmer      2023-03-28  480  
7a3f924cee4bdfe Simon Trimmer      2023-03-28  481  static int cs_dsp_debugfs_read_controls_show(struct seq_file *s, void *ignored)
7a3f924cee4bdfe Simon Trimmer      2023-03-28  482  {
7a3f924cee4bdfe Simon Trimmer      2023-03-28  483  	struct cs_dsp *dsp = s->private;
7a3f924cee4bdfe Simon Trimmer      2023-03-28  484  	struct cs_dsp_coeff_ctl *ctl;
7a3f924cee4bdfe Simon Trimmer      2023-03-28  485  	unsigned int reg;
7a3f924cee4bdfe Simon Trimmer      2023-03-28  486  
ed6e90cb9fe53ab Richard Fitzgerald 2025-11-27  487  	guard(mutex)(&dsp->pwr_lock);
ed6e90cb9fe53ab Richard Fitzgerald 2025-11-27  488  
7a3f924cee4bdfe Simon Trimmer      2023-03-28  489  	list_for_each_entry(ctl, &dsp->ctl_list, list) {
7a3f924cee4bdfe Simon Trimmer      2023-03-28  490  		cs_dsp_coeff_base_reg(ctl, &reg, 0);
7584edf15892e29 Richard Fitzgerald 2025-11-24 @491  		seq_printf(s, "%22.*s: %#8x %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
7a3f924cee4bdfe Simon Trimmer      2023-03-28  492  			   ctl->subname_len, ctl->subname, ctl->len,
7a3f924cee4bdfe Simon Trimmer      2023-03-28  493  			   cs_dsp_mem_region_name(ctl->alg_region.type),
7a3f924cee4bdfe Simon Trimmer      2023-03-28  494  			   ctl->offset, reg, ctl->fw_name, ctl->alg_region.alg, ctl->type,
7a3f924cee4bdfe Simon Trimmer      2023-03-28  495  			   ctl->flags & WMFW_CTL_FLAG_VOLATILE ? 'V' : '-',
7a3f924cee4bdfe Simon Trimmer      2023-03-28  496  			   ctl->flags & WMFW_CTL_FLAG_SYS ? 'S' : '-',
7a3f924cee4bdfe Simon Trimmer      2023-03-28  497  			   ctl->flags & WMFW_CTL_FLAG_READABLE ? 'R' : '-',
7a3f924cee4bdfe Simon Trimmer      2023-03-28  498  			   ctl->flags & WMFW_CTL_FLAG_WRITEABLE ? 'W' : '-',
7a3f924cee4bdfe Simon Trimmer      2023-03-28  499  			   ctl->enabled ? "enabled" : "disabled",
7a3f924cee4bdfe Simon Trimmer      2023-03-28  500  			   ctl->set ? "dirty" : "clean");
7a3f924cee4bdfe Simon Trimmer      2023-03-28  501  	}
7a3f924cee4bdfe Simon Trimmer      2023-03-28  502  
7a3f924cee4bdfe Simon Trimmer      2023-03-28  503  	return 0;
7a3f924cee4bdfe Simon Trimmer      2023-03-28  504  }
7a3f924cee4bdfe Simon Trimmer      2023-03-28  505  DEFINE_SHOW_ATTRIBUTE(cs_dsp_debugfs_read_controls);
7a3f924cee4bdfe Simon Trimmer      2023-03-28  506  

:::::: The code at line 491 was first introduced by commit
:::::: 7584edf15892e29190b2145294cc1680aa142586 firmware: cs_dsp: Store control length as 32-bit

:::::: TO: Richard Fitzgerald <rf@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
