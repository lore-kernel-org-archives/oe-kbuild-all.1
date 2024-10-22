Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAB913A87C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729583966; cv=none; b=bZLwSjvx81pBcU3n444wo9qOOsh9ogEWZvoSwqdGGFkLRpEuyR9RDtvqWi0qSDvYH8LrcKfT7/ET0UVf8t4Hlc0UaWW1n8L43+ZDtFc19zoV54HWis/TTKqJQ+Ldbyf2cKBrtln8BXRpMencSnc8EhNdswHtgQvoidm4buXMBjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729583966; c=relaxed/simple;
	bh=VL4rIa5v9f8x9ygbZK5axqNbOKbdDuiyXc/oTFaT3KE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EDrCy2UrJQPNazuQ83sYaEiOQqCk69alcI+QxNvzQxdqjg4pQ/MRRq4jgNfQ8IJ2w0BqyW5G+oeMDxedG62Dqas1SvQzQDrTFQ2y7VJVo65suD/Ngi51nzDF6WZ3vyNP0/bQ7QfjgA2Hf6+fdstN0JTfw+ikdmwLB0EhsyQOKRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEu4CFPD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEu4CFPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729583964; x=1761119964;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VL4rIa5v9f8x9ygbZK5axqNbOKbdDuiyXc/oTFaT3KE=;
  b=AEu4CFPD+pp4TSdOEI9SJcGz8+NKW8DoSoUw/DKMq0fgu8lMOTODG0DN
   b8sbwyBeh020ss2P8IC/QzJd//w0OxykUGihpiIxBTYa5AuVxDabf+As8
   472us3kkkU3GQ+ETEBxDTSV2nPyHovkFl24rnkHEo8tfGeDL0GUa7rSFc
   j3yHlI+hk/DLTB9t0f1Pnm6s+WPtjQ6Q0QdcEq0/zKzZc/OGSuaK11KkN
   UT7MBj4/rLzs/6LGla1w0qetGlRTJvygRoFe0Kyao3EJGICobQxATqs0r
   H8BnQxpMjDdtAQ6Arox57HjBGIpLx47fZmXm71u+sLyXUhx3aO/twQt1U
   Q==;
X-CSE-ConnectionGUID: s/Rr40eLTCuRRUGUkAsCKQ==
X-CSE-MsgGUID: UVIhfPRVQ16SQm633Ma1GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="46587990"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="46587990"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 00:59:24 -0700
X-CSE-ConnectionGUID: W8cMpnUWRjGt/sg/K6ZoiA==
X-CSE-MsgGUID: TRIrAUYrTF+0XNyAp0ia1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="79714284"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2024 00:59:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t39nT-000THE-2q;
	Tue, 22 Oct 2024 07:59:19 +0000
Date: Tue, 22 Oct 2024 15:58:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [driver-core:const_work 31/40]
 drivers/bus/fsl-mc/fsl-mc-bus.c:409:20: sparse: sparse: incorrect type in
 initializer (different modifiers)
Message-ID: <202410221546.cizoXgp5-lkp@intel.com>
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
head:   b7bbe168fc896538357a88d4b7de1a4d41958bfe
commit: cfd1974cbf0023d6d6de9e410aa1860d5a34c132 [31/40] bus: fsl-mc: constify the struct device_type usage
config: powerpc64-randconfig-r112-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221546.cizoXgp5-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241022/202410221546.cizoXgp5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221546.cizoXgp5-lkp@intel.com/

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
