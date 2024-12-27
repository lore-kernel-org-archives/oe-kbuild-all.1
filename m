Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB65013D518
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 21:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735335410; cv=none; b=VRtoeNELu+ArptExepvKB65FXOXxALVfJUHu8z++qPkgxQYR+1ljnyI9E6m/H3rDnov9eHNzzpOYQauGIP/OZo3KbdjodS+/b9ySyddPcIA7/l1koMJxuSYiKuaSBdRRI8wu3sD6kYtA1e3ZSvsVmaF6mLGfZ71+nRzVLwuInVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735335410; c=relaxed/simple;
	bh=lbTy+zeuy5MS0pqL/sK2rJskBXYvrgESr+f70dsC3q8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kSPNFs6XkU22OrEUJrbIdY/jOmqTUExJevSqqz6GHcio0xC4R5Pa70ztvR0le3RrdxuLe3I/9xfUHayviR9LxpLeL/FT843i56RKyiR2YedA19YPH1NZd6gEUA4+rVRIS+ba21J1/DjAWb7439VS0PBEtWHK+Xmbs931R+YHt8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDKkmr3Y; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDKkmr3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735335408; x=1766871408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lbTy+zeuy5MS0pqL/sK2rJskBXYvrgESr+f70dsC3q8=;
  b=CDKkmr3Ynt/eubSg7a4I6Mq7a0tBbDArq9wN6U/1ffm4dOhNCELy1swD
   rXgmw5v1P56B3z2VZgK5GCPGW6DhO7UPjoM0grw8CskAUOEiSGbpN9YQ7
   FjKbXgTFabjd7nUzKmw15pjjAM/r0k3VOfifxEeyisML/FQydnNqhjVDw
   DZUWFoDCKL0+2nr9Z1DnfMz55Hx7pt4jOgXveLMpXmb1FwE9ycltUx1jL
   v1mY0VyK4D/euLljUTWt8WrM6Q084y3gNj4oQtGaL/yuzBSNjrAzNS5XH
   KcUgytOTUhgdh1D0z7gIBfFX8cORWA4oN8rw9diFxxYEssb4PfMv4Kxri
   g==;
X-CSE-ConnectionGUID: JTr4Dl67RneA4e69Sx9MXg==
X-CSE-MsgGUID: NVS2l25ERAWG7829HG3U1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="58194773"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="58194773"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 13:36:47 -0800
X-CSE-ConnectionGUID: oFBZnCJ+STaNDe8iLrd3Ng==
X-CSE-MsgGUID: GIMLaRa7Rk+VniQ58qJSfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105249882"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Dec 2024 13:36:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRI0i-0003e0-0A;
	Fri, 27 Dec 2024 21:36:44 +0000
Date: Sat, 28 Dec 2024 05:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 12/13]
 drivers/thermal/intel/x86_pkg_temp_thermal.c:195:9: error: implicit
 declaration of function 'wrmsr'; did you mean 'wrmsrl'?
Message-ID: <202412280509.QKUQ21Rt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   04e87989806be09036718fa57acd80ea138c2319
commit: 688f8f5d716435f44712807ae801abfb1c1f5c50 [12/13] x86/msr: Remove MSR write APIs that take MSR value in two u32 arguments
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241228/202412280509.QKUQ21Rt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280509.QKUQ21Rt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280509.QKUQ21Rt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/thermal/intel/x86_pkg_temp_thermal.c: In function 'enable_pkg_thres_interrupt':
>> drivers/thermal/intel/x86_pkg_temp_thermal.c:195:9: error: implicit declaration of function 'wrmsr'; did you mean 'wrmsrl'? [-Werror=implicit-function-declaration]
     195 |         wrmsr(MSR_IA32_PACKAGE_THERM_INTERRUPT, l, h);
         |         ^~~~~
         |         wrmsrl
   cc1: some warnings being treated as errors


vim +195 drivers/thermal/intel/x86_pkg_temp_thermal.c

f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  180  
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  181  /* Enable threshold interrupt on local package/cpu */
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  182  static inline void enable_pkg_thres_interrupt(void)
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  183  {
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  184  	u8 thres_0, thres_1;
8079a4bdcb0731 drivers/thermal/x86_pkg_temp_thermal.c Thomas Gleixner     2016-11-22  185  	u32 l, h;
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  186  
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  187  	rdmsr(MSR_IA32_PACKAGE_THERM_INTERRUPT, l, h);
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  188  	/* only enable/disable if it had valid threshold value */
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  189  	thres_0 = (l & THERM_MASK_THRESHOLD0) >> THERM_SHIFT_THRESHOLD0;
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  190  	thres_1 = (l & THERM_MASK_THRESHOLD1) >> THERM_SHIFT_THRESHOLD1;
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  191  	if (thres_0)
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  192  		l |= THERM_INT_THRESHOLD0_ENABLE;
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  193  	if (thres_1)
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  194  		l |= THERM_INT_THRESHOLD1_ENABLE;
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17 @195  	wrmsr(MSR_IA32_PACKAGE_THERM_INTERRUPT, l, h);
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  196  }
f1a18a10566081 drivers/thermal/x86_pkg_temp_thermal.c Srinivas Pandruvada 2013-05-17  197  

:::::: The code at line 195 was first introduced by commit
:::::: f1a18a10566081abfce1649c2f3884b28fff7372 Thermal: CPU Package temperature thermal

:::::: TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
:::::: CC: Zhang Rui <rui.zhang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
