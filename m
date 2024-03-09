Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEDE17CB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 01:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709946733; cv=none; b=lyBV+kcapil1CtXfDs/McCY34wq4ogVrfEZEnaQ1sexzVQUWCghGVMLJR5+fRJF94SN0uvbcnI0hv6daY3v5Lal3qcFPKqvG1cMxCFLsrYqbtJUAWPaWx/ndg2TMPiNZ6ksoN6CQP/CNyYFTYLe5Y4PL5tPitIlMe28DHbYLGg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709946733; c=relaxed/simple;
	bh=w4odC7Dutz0Uzk9LHRKlU7wdATzv/l4NWvcm7JJj0ak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FkoPjfw+H6fWlzYSp3Ejs2V3FVN+1WK6+94QP76b+pNQKLqwsDfKB0wV2VhChtBKiB+L9px+E2hPppylOQaEhEIQJWpNUADtdzlI2e4hVebLKfnbwX1oDKmEmIZd/+CllxYQ3sb0RTuWIKQmgADS1l/+KwGA8fD4E+9tLyiHtVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vtkqho2o; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vtkqho2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709946731; x=1741482731;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w4odC7Dutz0Uzk9LHRKlU7wdATzv/l4NWvcm7JJj0ak=;
  b=Vtkqho2obEwHCO61LhWBA+JaH6C8qME+ieWWEkfM2Dtczu3XawQPcNjc
   QG6ZVCofMsjxlATdUD9Dq4nJq4A/Ux9xHn2cnzc05BNqZ7HKEH7UQAG3b
   QZ8352vmoQswnehQu6sBoL24g8HI4f4XdXMv6dxLrk4GRQZZE3/ZdzsRf
   WmPTjVrccbebrv+3C+1B2gHgP+iGt6sGv/3vogBMrAxXJOagkInh/TzCC
   AP0/DSH2Fck6WvCY3gujeqK1neKa6V3vBE4VAw1bbeio03mZBApqQMPFX
   FG2nL3d2FwKfv0+gcML/3UMT9H9e5zxLzIouTuPTzViYBUZRLI2QbOv8t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="15413670"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="15413670"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 17:12:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="41593603"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Mar 2024 17:12:08 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rilFu-0006qj-1C;
	Sat, 09 Mar 2024 01:12:06 +0000
Date: Sat, 9 Mar 2024 09:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [driver-core:const_work 180/183]
 drivers/bus/fsl-mc/fsl-mc-bus.c:409:19: warning: initialization discards
 'const' qualifier from pointer target type
Message-ID: <202403090918.89zrHUF2-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240309/202403090918.89zrHUF2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090918.89zrHUF2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090918.89zrHUF2-lkp@intel.com/

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

e70ba1b06c26cd drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2021-02-08  402  
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  403  static struct device_type *fsl_mc_get_device_type(const char *type)
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  404  {
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  405  	static const struct {
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  406  		struct device_type *dev_type;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  407  		const char *type;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  408  	} dev_types[] = {
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @409  		{ &fsl_mc_bus_dprc_type, "dprc" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  410  		{ &fsl_mc_bus_dpni_type, "dpni" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  411  		{ &fsl_mc_bus_dpio_type, "dpio" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  412  		{ &fsl_mc_bus_dpsw_type, "dpsw" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  413  		{ &fsl_mc_bus_dpbp_type, "dpbp" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  414  		{ &fsl_mc_bus_dpcon_type, "dpcon" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  415  		{ &fsl_mc_bus_dpmcp_type, "dpmcp" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  416  		{ &fsl_mc_bus_dpmac_type, "dpmac" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  417  		{ &fsl_mc_bus_dprtc_type, "dprtc" },
e9158b35ef9afb drivers/bus/fsl-mc/fsl-mc-bus.c         Horia Geantă    2018-09-12  418  		{ &fsl_mc_bus_dpseci_type, "dpseci" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17  419  		{ &fsl_mc_bus_dpdmux_type, "dpdmux" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17  420  		{ &fsl_mc_bus_dpdcei_type, "dpdcei" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17  421  		{ &fsl_mc_bus_dpaiop_type, "dpaiop" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17  422  		{ &fsl_mc_bus_dpci_type, "dpci" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17  423  		{ &fsl_mc_bus_dpdmai_type, "dpdmai" },
e70ba1b06c26cd drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2021-02-08  424  		{ &fsl_mc_bus_dpdbg_type, "dpdbg" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  425  		{ NULL, NULL }
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  426  	};
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  427  	int i;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  428  
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  429  	for (i = 0; dev_types[i].dev_type; i++)
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  430  		if (!strcmp(dev_types[i].type, type))
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  431  			return dev_types[i].dev_type;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  432  
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  433  	return NULL;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  434  }
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  435  

:::::: The code at line 409 was first introduced by commit
:::::: 47433b630b7b30d0daa360c64308c0f4c9632986 staging: fsl-mc: add support for device type

:::::: TO: Laurentiu Tudor <laurentiu.tudor@nxp.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
