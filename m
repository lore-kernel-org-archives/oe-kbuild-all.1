Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341BA2033A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 03:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709954897; cv=none; b=dLSIkkTBPEymDvB4PTK2I0LTuwYTKSmafTP15dT9t9YJQiAPJiR6mfVQ+HmUnNT7SqiGR2NHx32zBiXfQm32W/b0gJrch8QpzOiSuDu8kM2PsdtyZ/uBXjOOzF1h06xap1TIsy1xiIEDjbd3/xoUawxPfEA6Uymz6ByXkZNHsNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709954897; c=relaxed/simple;
	bh=8iXFKDNmYF1V2PuWAb42pmRxbFfIlrkeN+P++64jxoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1s5RP12KQcjTM3JUyrc3BJjQdyEFHRI2e1yAxUQC35WLUnbBHSNrTC7lIy6hamReCjjHuWK6SMS/le1Eg8cBpjd63/1GN+M9czXqmfgekWiTiGV7vH9z0F5Fh4Y0xsRaSRSUSeC2KPc2Gdly9ZwoVJMNSuQ8qnBOHQQM1WLavo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/A/6B6M; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/A/6B6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709954894; x=1741490894;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8iXFKDNmYF1V2PuWAb42pmRxbFfIlrkeN+P++64jxoc=;
  b=i/A/6B6MZgnmJLpElcSlhZp6UCXdoyke64wKfCLbESxJ51uY7bSHv/5/
   YsKe7jOudYxhzJF6UZowEVxMjQgs2r/WeTr9ZpVEE9r3Q8SBjTLWakqj6
   MH+7L68YiXNeLPlBpACHxtNaMomCDXNqJdJTv3eDJJXyiZsm31WlGF2SG
   zY558AEch60UU0bU27A0F9nO0EAKqQ7wbPcnR+xlJfJd/hECPhdRhA9kg
   gNfZUF8UYFbBTcqn1VRDxcSU1KyiF5O17A1ulB8Wl7xJ2uU/ykjbUs28R
   gbDhSi804BK34VqIM9l2eVYVYlPYHuFOxktbPwf8spNCre15brwP1T3CC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="7644283"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="7644283"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 19:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="11049827"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Mar 2024 19:28:11 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rinNZ-0006w7-0d;
	Sat, 09 Mar 2024 03:28:09 +0000
Date: Sat, 9 Mar 2024 11:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [driver-core:const_work 180/183]
 drivers/bus/fsl-mc/fsl-mc-bus.c:409:20: sparse: sparse: incorrect type in
 initializer (different modifiers)
Message-ID: <202403091124.VOzGG1lj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_work
head:   77294dd75aa919b6af3a44e9d68c441ea5d7de59
commit: 3ee4e4da3bc4d912fb1519b56f9922c52f0b12a9 [180/183] bus: fsl-mc: constify the struct device_type usage
config: arm64-randconfig-r112-20240308 (https://download.01.org/0day-ci/archive/20240309/202403091124.VOzGG1lj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240309/202403091124.VOzGG1lj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403091124.VOzGG1lj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/bus/fsl-mc/fsl-mc-bus.c:409:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:409:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:409:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:410:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:410:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:410:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:411:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:411:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:411:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:412:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:412:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:412:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:413:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:413:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:413:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:414:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:414:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:414:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:415:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:415:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:415:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:416:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:416:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:416:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:417:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:417:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:417:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:418:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:418:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:418:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:419:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:419:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:419:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:420:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:420:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:420:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:421:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:421:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:421:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:422:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:422:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:422:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:423:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:423:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:423:20: sparse:     got struct device_type const *
   drivers/bus/fsl-mc/fsl-mc-bus.c:424:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct device_type *dev_type @@     got struct device_type const * @@
   drivers/bus/fsl-mc/fsl-mc-bus.c:424:20: sparse:     expected struct device_type *dev_type
   drivers/bus/fsl-mc/fsl-mc-bus.c:424:20: sparse:     got struct device_type const *

vim +409 drivers/bus/fsl-mc/fsl-mc-bus.c

a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei       2020-07-17  397  
3ee4e4da3bc4d9 drivers/bus/fsl-mc/fsl-mc-bus.c         Ricardo B. Marliere 2024-02-19 @398  const struct device_type fsl_mc_bus_dpdbg_type = {
e70ba1b06c26cd drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei       2021-02-08  399  	.name = "fsl_mc_bus_dpdbg"
e70ba1b06c26cd drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei       2021-02-08  400  };
e70ba1b06c26cd drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei       2021-02-08  401  EXPORT_SYMBOL_GPL(fsl_mc_bus_dpdbg_type);
e70ba1b06c26cd drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei       2021-02-08  402  
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  403  static struct device_type *fsl_mc_get_device_type(const char *type)
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  404  {
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  405  	static const struct {
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  406  		struct device_type *dev_type;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  407  		const char *type;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  408  	} dev_types[] = {
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17 @409  		{ &fsl_mc_bus_dprc_type, "dprc" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  410  		{ &fsl_mc_bus_dpni_type, "dpni" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  411  		{ &fsl_mc_bus_dpio_type, "dpio" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  412  		{ &fsl_mc_bus_dpsw_type, "dpsw" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  413  		{ &fsl_mc_bus_dpbp_type, "dpbp" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  414  		{ &fsl_mc_bus_dpcon_type, "dpcon" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  415  		{ &fsl_mc_bus_dpmcp_type, "dpmcp" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  416  		{ &fsl_mc_bus_dpmac_type, "dpmac" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  417  		{ &fsl_mc_bus_dprtc_type, "dprtc" },
e9158b35ef9afb drivers/bus/fsl-mc/fsl-mc-bus.c         Horia Geantă        2018-09-12  418  		{ &fsl_mc_bus_dpseci_type, "dpseci" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei       2020-07-17  419  		{ &fsl_mc_bus_dpdmux_type, "dpdmux" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei       2020-07-17  420  		{ &fsl_mc_bus_dpdcei_type, "dpdcei" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei       2020-07-17  421  		{ &fsl_mc_bus_dpaiop_type, "dpaiop" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei       2020-07-17  422  		{ &fsl_mc_bus_dpci_type, "dpci" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei       2020-07-17  423  		{ &fsl_mc_bus_dpdmai_type, "dpdmai" },
e70ba1b06c26cd drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei       2021-02-08  424  		{ &fsl_mc_bus_dpdbg_type, "dpdbg" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  425  		{ NULL, NULL }
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  426  	};
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  427  	int i;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  428  
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  429  	for (i = 0; dev_types[i].dev_type; i++)
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  430  		if (!strcmp(dev_types[i].type, type))
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  431  			return dev_types[i].dev_type;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  432  
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  433  	return NULL;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  434  }
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor     2017-11-17  435  

:::::: The code at line 409 was first introduced by commit
:::::: 47433b630b7b30d0daa360c64308c0f4c9632986 staging: fsl-mc: add support for device type

:::::: TO: Laurentiu Tudor <laurentiu.tudor@nxp.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
