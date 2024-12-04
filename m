Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1841F03E4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 19:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733342393; cv=none; b=l25oUSAThGAoOuAWo4td9K8lcqeY9CPogFuptDdxNNT7r+t0LwEZUm/J+Rc5J/4tjLxWIP0qn+OB0eV6v7h/b7U0Ep4VQZa6pc6jbNKT6eq6eIaNpvusilTjfpgK+6WNS+oFXiu+CH4CGxliNFCvzIjRJKOS4FBpJ9bMOZCyPJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733342393; c=relaxed/simple;
	bh=5HV0BeYxLgf8xsHRXt2wdSBgGxPlD5SYWq69r7bOd0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qBFybEZNG3i0dmVIW87cKoaRltRWgKhk/h3z2QBj70SnRvdJnhRG8bQhTWQbUJvoOSc7DqJpfY4WXW3IBDFzLDYKic0IE+OCf3WLMwkQHIh6SntQeCOHejOKckMtTDVq9Tve3boxGH7tr9xyCfFu3YX6JdIV3EgVmPzHR5xMR8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7j8Dsji; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7j8Dsji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733342391; x=1764878391;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5HV0BeYxLgf8xsHRXt2wdSBgGxPlD5SYWq69r7bOd0c=;
  b=l7j8Dsji2B//xoXozOxLHLEYXrQI8C6hhz00e8kAFFXaHYEE3FhPC+7E
   uZcScmhS4GlRqt+4ItQadLF3MA+5n6/1sbrGyOniZtQm4R8utYk7WQ/ag
   XXI6qa3c9o9+Z0RwUpKxDJrFudvwaOlRn1xbWtyiNaFMZYBAX67lYd8j8
   RInJ26vI0CuzOtiJeQV+lZa9Wi4JK9QH8/iai9V9QGziu75judYeDa9rY
   PRfY3rlHbD08P/xXIRRJ2gA7aYvyx55WTDM4UfIitIQVDgBVydcPuJYDm
   ucpJL3+FI3EoUJeYvnXZ1FZUaxGjWEBx2vOsjXf+P8yuY15dYL4M+QLjS
   w==;
X-CSE-ConnectionGUID: 9dyALReISzm9jMZsg14DJg==
X-CSE-MsgGUID: wiJl2XysR3e1NEG7/M7VXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="59037446"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="59037446"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 11:59:49 -0800
X-CSE-ConnectionGUID: DrVrs1IOT6W/Lc+CFX3efQ==
X-CSE-MsgGUID: hzKN+3RhQ1mn3KwLHluILA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="93944590"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Dec 2024 11:59:48 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIvXF-0003RF-0w;
	Wed, 04 Dec 2024 19:59:45 +0000
Date: Thu, 5 Dec 2024 03:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [driver-core:const_work 25/34]
 drivers/bus/fsl-mc/fsl-mc-bus.c:409:19: warning: initialization discards
 'const' qualifier from pointer target type
Message-ID: <202412050329.3ah5aThh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_work
head:   9608e6a5fe45f4882ecb095938d616ee9a2c70df
commit: b8cc878da25e18cb9e75d90800f84b1dee59def0 [25/34] bus: fsl-mc: constify the struct device_type usage
config: arm-randconfig-001 (https://download.01.org/0day-ci/archive/20241205/202412050329.3ah5aThh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050329.3ah5aThh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050329.3ah5aThh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bus/fsl-mc/fsl-mc-bus.c: In function 'fsl_mc_get_device_type':
>> drivers/bus/fsl-mc/fsl-mc-bus.c:409:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     409 |                 { &fsl_mc_bus_dprc_type, "dprc" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:410:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     410 |                 { &fsl_mc_bus_dpni_type, "dpni" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:411:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     411 |                 { &fsl_mc_bus_dpio_type, "dpio" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:412:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     412 |                 { &fsl_mc_bus_dpsw_type, "dpsw" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:413:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     413 |                 { &fsl_mc_bus_dpbp_type, "dpbp" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:414:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     414 |                 { &fsl_mc_bus_dpcon_type, "dpcon" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:415:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     415 |                 { &fsl_mc_bus_dpmcp_type, "dpmcp" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:416:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     416 |                 { &fsl_mc_bus_dpmac_type, "dpmac" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:417:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     417 |                 { &fsl_mc_bus_dprtc_type, "dprtc" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:418:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     418 |                 { &fsl_mc_bus_dpseci_type, "dpseci" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:419:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     419 |                 { &fsl_mc_bus_dpdmux_type, "dpdmux" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:420:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     420 |                 { &fsl_mc_bus_dpdcei_type, "dpdcei" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:421:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     421 |                 { &fsl_mc_bus_dpaiop_type, "dpaiop" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:422:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     422 |                 { &fsl_mc_bus_dpci_type, "dpci" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:423:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     423 |                 { &fsl_mc_bus_dpdmai_type, "dpdmai" },
         |                   ^
   drivers/bus/fsl-mc/fsl-mc-bus.c:424:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     424 |                 { &fsl_mc_bus_dpdbg_type, "dpdbg" },
         |                   ^


vim +/const +409 drivers/bus/fsl-mc/fsl-mc-bus.c

e70ba1b06c26cdd drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2021-02-08  402  
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  403  static struct device_type *fsl_mc_get_device_type(const char *type)
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  404  {
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  405  	static const struct {
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  406  		struct device_type *dev_type;
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  407  		const char *type;
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  408  	} dev_types[] = {
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @409  		{ &fsl_mc_bus_dprc_type, "dprc" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  410  		{ &fsl_mc_bus_dpni_type, "dpni" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  411  		{ &fsl_mc_bus_dpio_type, "dpio" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  412  		{ &fsl_mc_bus_dpsw_type, "dpsw" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  413  		{ &fsl_mc_bus_dpbp_type, "dpbp" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  414  		{ &fsl_mc_bus_dpcon_type, "dpcon" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  415  		{ &fsl_mc_bus_dpmcp_type, "dpmcp" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  416  		{ &fsl_mc_bus_dpmac_type, "dpmac" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  417  		{ &fsl_mc_bus_dprtc_type, "dprtc" },
e9158b35ef9afb3 drivers/bus/fsl-mc/fsl-mc-bus.c         Horia Geantă    2018-09-12  418  		{ &fsl_mc_bus_dpseci_type, "dpseci" },
a3b7a581823857f drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17  419  		{ &fsl_mc_bus_dpdmux_type, "dpdmux" },
a3b7a581823857f drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17  420  		{ &fsl_mc_bus_dpdcei_type, "dpdcei" },
a3b7a581823857f drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17  421  		{ &fsl_mc_bus_dpaiop_type, "dpaiop" },
a3b7a581823857f drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17  422  		{ &fsl_mc_bus_dpci_type, "dpci" },
a3b7a581823857f drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17  423  		{ &fsl_mc_bus_dpdmai_type, "dpdmai" },
e70ba1b06c26cdd drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2021-02-08  424  		{ &fsl_mc_bus_dpdbg_type, "dpdbg" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  425  		{ NULL, NULL }
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  426  	};
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  427  	int i;
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  428  
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  429  	for (i = 0; dev_types[i].dev_type; i++)
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  430  		if (!strcmp(dev_types[i].type, type))
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  431  			return dev_types[i].dev_type;
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  432  
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  433  	return NULL;
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  434  }
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  435  

:::::: The code at line 409 was first introduced by commit
:::::: 47433b630b7b30d0daa360c64308c0f4c9632986 staging: fsl-mc: add support for device type

:::::: TO: Laurentiu Tudor <laurentiu.tudor@nxp.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
