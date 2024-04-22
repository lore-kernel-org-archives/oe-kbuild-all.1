Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2301B964
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 20:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713818985; cv=none; b=OSOp91NzFem3bPyZjbsmabX/Xbk7GhWouH+S4cgiEOgsSMsC4t0a8LTTe0e+KjDkMP+ImOvOPX95j70fAMsubva3iHEnYXc/KmexZbnacAzAlAioik232kYYMU3kstl7adoRZj7ZTaTCY8raPjPlf75zOXQ8Q+rGr61SIxRd0wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713818985; c=relaxed/simple;
	bh=K5g4uqxyfmtAoU4V97Tff54gAC3H2o6AhJkM+JBNC3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B/uVamwfgGwzu11myaN+YKW6bHrLMxg0UpVaB/P6NUhqvgkWeqFVvITN8Cqvl8cK5WeWzTID+0SbAv4fhUY5+prDp+RKVqesq+rQohKxFQw/4osjx4DXfl4WF71eodIeuqlvqKGosQI5GAKDE/r0WkK9pBcfz4tzA9SbIZkWMcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlcbCWLA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlcbCWLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713818985; x=1745354985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K5g4uqxyfmtAoU4V97Tff54gAC3H2o6AhJkM+JBNC3E=;
  b=SlcbCWLAr0NobCWb/L+i8hWc8KxwHkzOU1ZVitNKgFcXTTldeiMi9aGl
   u/b1kTDiyCbcWMAf3l3XZcw1+KwAWpRRsBQwwBc96IhfThvocPzfTSymR
   KN3SqGoLvQH9zZV27OTcQR6cRqf+wCTbdo1k3m9O2k4YCZwmVRZaBhM8l
   EVPHiTR2m7bq5Tdr5mnTyIwJI9FZ+Ou6iZ065WAa2sJbyzsdFxaip1W3d
   RDy3KQuYRv/KA20Bv4PWR90+5uVQLio60sJJeoIs6uWxUt18cOwSkof+P
   4F7SiDiiUXmACKOPQFAFSeRHEoGJzI4irJhmTEX5RVEtiDcVeOuo6BEnE
   A==;
X-CSE-ConnectionGUID: bCh7CpH1S+Saj8Sh6D0VWA==
X-CSE-MsgGUID: C6DHCXsJTNaVq8GKsLZfhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="34778705"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="34778705"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 13:49:44 -0700
X-CSE-ConnectionGUID: GioQma9mRMaMChAO6BGO7g==
X-CSE-MsgGUID: vHMqVCx7RverrsBU9V3E5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="24578942"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Apr 2024 13:49:40 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz0bZ-0000Eu-0k;
	Mon, 22 Apr 2024 20:49:37 +0000
Date: Tue, 23 Apr 2024 04:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@nxp.com>, Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [abelvesa:for-next 1/5]
 drivers/clk/imx/clk-imx8mp-audiomix.c:363:12: warning:
 'clk_imx8mp_audiomix_runtime_resume' defined but not used
Message-ID: <202404230448.ku2Czmrq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git for-next
head:   5224b189462ff70df328f173b71acfd925092c3c
commit: 1496dd413b2e0974a040fa93a2ddc51cc9847fd8 [1/5] clk: imx: imx8mp: Add pm_runtime support for power saving
config: microblaze-randconfig-r071-20240423 (https://download.01.org/0day-ci/archive/20240423/202404230448.ku2Czmrq-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404230448.ku2Czmrq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404230448.ku2Czmrq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-imx8mp-audiomix.c:363:12: warning: 'clk_imx8mp_audiomix_runtime_resume' defined but not used [-Wunused-function]
     363 | static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/imx/clk-imx8mp-audiomix.c:356:12: warning: 'clk_imx8mp_audiomix_runtime_suspend' defined but not used [-Wunused-function]
     356 | static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/clk_imx8mp_audiomix_runtime_resume +363 drivers/clk/imx/clk-imx8mp-audiomix.c

   355	
 > 356	static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev)
   357	{
   358		clk_imx8mp_audiomix_save_restore(dev, true);
   359	
   360		return 0;
   361	}
   362	
 > 363	static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
   364	{
   365		clk_imx8mp_audiomix_save_restore(dev, false);
   366	
   367		return 0;
   368	}
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
