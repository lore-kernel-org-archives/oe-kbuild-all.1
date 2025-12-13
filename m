Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1757C242D6E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 02:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765592094; cv=none; b=M6LsBKpXUZsRzhKWaSnmzmJEytH9BvkhBL64suyU65SPUxh+TU8wewT9tH6OrWmujxOzEPLwOqqzwg32kdfXmOzWmEcsS50vetIkLuuzH//lvvgOJ0npy02IPYMWhMrRlEYnZAhGzwFcpUOR9vFSMK2FfLUj6Yn9ahyHtO78/dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765592094; c=relaxed/simple;
	bh=WYUnaQJgKmdfKBtu0vd8vDVimYTvYgAYtU0xtJyTIL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WayhbdZNUofc6N4ZoYpj+j6AhGPZ6pDL/jJv+IBFrV3bWhBT5tQzecttRUlSy/6ETTevlbKY4g9nh6iWSwSveovxkNtATgbEuRO3lSU0V7h/bPqaKcvphkYtkc1kHlKpHmBXadB5A7+oN8sSQSl9Esjk6MvJdY62kWJ1ZXRic10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3861IVW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3861IVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765592093; x=1797128093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WYUnaQJgKmdfKBtu0vd8vDVimYTvYgAYtU0xtJyTIL4=;
  b=e3861IVW4bk2C52i75VP0J2ilcRg3Ak2QIij2C5YNMOVEz2bYbMbsOpc
   u/OKfBbCPs5NeGG5nEFeN+wXGnITHmlKYRKQUV4WTliV1YJsRLLavoJpl
   WaKe7bZMAqtiPD78XPTbXDgRUnWKIIEATm605+yBEbMkkZn7se8Fm7OMX
   QX+jzT2MbdInflr4d0Iew38raJ6jRNXS8aEnGsrLYHasI2qa1pSGKrnfx
   LnXmXULJkBmzerXwWLwf4llKd+pGthSXALzXHDCJM1oMcHofkuhd4kJSC
   03qLhG5pP+/X2LvzyPl4j74M79HZ5XdJBsah3MlsFD1hb6ZvKFMTPnMCY
   g==;
X-CSE-ConnectionGUID: 2EVHpr8EQryJ7UOQ11hJjg==
X-CSE-MsgGUID: ZrdVcKM1TS+XSE8u79jUoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67751895"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67751895"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 18:14:51 -0800
X-CSE-ConnectionGUID: NgqEmqHQRTCydiJZZ6CvNg==
X-CSE-MsgGUID: FEdrt+fRRjGEhlA6qdt3/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201649003"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Dec 2025 18:14:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUF9i-000000006vF-34C2;
	Sat, 13 Dec 2025 02:14:46 +0000
Date: Sat, 13 Dec 2025 10:14:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2] drivers/mmc/core/mmc.c:985:6:
 warning: no previous prototype for 'mmc_set_bus_speed'
Message-ID: <202512131018.V5LAuhd7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: a8fe5ae5628fd3e6d29af800e7c63bf58d1380ee [0/2] ANDROID: mmc: core: Export core functions required for clk scaling
config: i386-randconfig-012-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131018.V5LAuhd7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131018.V5LAuhd7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131018.V5LAuhd7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/core/mmc.c:985:6: warning: no previous prototype for 'mmc_set_bus_speed' [-Wmissing-prototypes]
     985 | void mmc_set_bus_speed(struct mmc_card *card)
         |      ^~~~~~~~~~~~~~~~~


vim +/mmc_set_bus_speed +985 drivers/mmc/core/mmc.c

   981	
   982	/*
   983	 * Set the bus speed for the selected speed mode.
   984	 */
 > 985	void mmc_set_bus_speed(struct mmc_card *card)
   986	{
   987		unsigned int max_dtr = (unsigned int)-1;
   988	
   989		if ((mmc_card_hs200(card) || mmc_card_hs400(card)) &&
   990		     max_dtr > card->ext_csd.hs200_max_dtr)
   991			max_dtr = card->ext_csd.hs200_max_dtr;
   992		else if (mmc_card_hs(card) && max_dtr > card->ext_csd.hs_max_dtr)
   993			max_dtr = card->ext_csd.hs_max_dtr;
   994		else if (max_dtr > card->csd.max_dtr)
   995			max_dtr = card->csd.max_dtr;
   996	
   997		mmc_set_clock(card->host, max_dtr);
   998	}
   999	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
