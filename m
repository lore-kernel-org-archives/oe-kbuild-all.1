Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524107466
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 22:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoaAegr9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697409688; x=1728945688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pO2D96/zLivUsy7VGLmqmaoEccMJEl9UyVOfboCmWks=;
  b=HoaAegr9iWFghM+Qxeui3GTie/u98jnFPNoTqGnDSccskwD9LUM3tZCl
   UHb2DxTnw2KtnYaOtMIExWGDzP98wZElGKvLMa3WBVt1OwMAjVCyBSYJR
   qimK4wvrE1QhKSUOkOqUmaT0cadvIY/3T+6ejgeZTr1CABQRhohAojKgy
   XNHxVxK/ax+nWehDSdTeGyRnsTOmcICXxA1R3ZZUPkQJPIEooas8WcefO
   T/xre6WxGOfv08SJHBjUsdzvoNE6lCz1FVduKNUXA8pOXtsvCDoKL65xJ
   65sQK0PJiU9FOS8lGS4I7INtWTL4ro+HFK4eaN1forETAsv79FjoSwwQH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375788574"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="375788574"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 15:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="705382344"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="705382344"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Oct 2023 15:41:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs9nW-0007sN-0s;
	Sun, 15 Oct 2023 22:41:22 +0000
Date: Mon, 16 Oct 2023 06:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4299/15768]
 drivers/net/ethernet/freescale/fman/fman_port.c:2015:36: warning:
 'fman_port_acpi_match' defined but not used
Message-ID: <202310160606.HXRNmjVs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 248945994cd320da38758f1428d6eac0ef0ae0c4 [4299/15768] fsl/fman: add FMan Port ACPI support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231016/202310160606.HXRNmjVs-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160606.HXRNmjVs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160606.HXRNmjVs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/freescale/fman/fman_port.c:2015:36: warning: 'fman_port_acpi_match' defined but not used [-Wunused-const-variable=]
    2015 | static const struct acpi_device_id fman_port_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~


vim +/fman_port_acpi_match +2015 drivers/net/ethernet/freescale/fman/fman_port.c

  2014	
> 2015	static const struct acpi_device_id fman_port_acpi_match[] = {
  2016		{"NXP0026", 0}
  2017	};
  2018	MODULE_DEVICE_TABLE(acpi, fman_port_acpi_match);
  2019	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
