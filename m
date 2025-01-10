Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0369211A14
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 16:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736525554; cv=none; b=lL+ST6y4yWZehbyRW51NByp7fx1JlbDvKoymWrS021B6TEEHCTHpcFeI+PPa+nPWN+2vHdkE/Q1/DeZIgv6XVXBzra8eiia3kaD4/kbeDuBKF9eGRpWym8LaWyrARq7Og82QUSnrhsucyLELGVyyvwYbo+cHAvfkZ/90glje0NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736525554; c=relaxed/simple;
	bh=QGkGx2LycFp/+RKZ2Mq6fbLRS75jFLGusMbPo3qaIGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M7fMI9ww8Diw7CMSF0t3vLlX/X+KVtVyhwgis0bY3XRkq14Hzj8CYhs4WczOCSmMFMP3szHN//18RFfEK5K8xn0wgON9YATT6itFoVFxFwbqyf5hf1v1nHRHZ7aADh7Lju4s5slT0fKpih+Ypqh0w60xtUo+GKzD4f8cVH3IatU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjagC6V4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjagC6V4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736525553; x=1768061553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QGkGx2LycFp/+RKZ2Mq6fbLRS75jFLGusMbPo3qaIGE=;
  b=gjagC6V4YtCTuaFcPMIMu9myBX7D3Xic2Jf535GsQfI7pk0H5wDK5f84
   ERWyhf7JW2idHrEJGHYVqbRF3lZyvesZbgtaY26wyd2mEDiN7Snq4eYza
   m2fhDV5WOj3BonqhjCGf1FTkBspz+UPc86yEfGqBa6OozPY2HAiCfNn2v
   x0bRp4Dy0c5E4M+OdrFSlJZfEhzB+yES6Pz/8MDTaioSmPn7GRmveyktR
   KAF5YyOhL7OtSF6654QXSy7nISC9X6FORt8EmiWPQAubCiSy9PuqXPfnh
   5GUUtRET8M/TgDpmCw0g1hyHG3NQL9nJvIDAFtifaM2UT1mW6Z3j0D7kE
   g==;
X-CSE-ConnectionGUID: VTskg5SeSgK7XKpf/YiVcQ==
X-CSE-MsgGUID: n3lfMzJaTXemTb1voUzZLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="54364052"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="54364052"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 08:12:32 -0800
X-CSE-ConnectionGUID: 6fZ1RQG3T0+nZBRcsEgpxw==
X-CSE-MsgGUID: 9i0/kjQMStyA3rlTC6HPXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108870775"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jan 2025 08:12:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWHca-000JSN-0o;
	Fri, 10 Jan 2025 16:12:28 +0000
Date: Sat, 11 Jan 2025 00:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: Anirudha Sarangi <anirudha.sarangi@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Mubin Usman Sayyed <mubin.usman.sayyed@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 59/504]
 drivers/irqchip/irq-imx-mu-msi.c:440:61: error: macro
 "IRQCHIP_PLATFORM_DRIVER_END" passed 2 arguments, but takes just 1
Message-ID: <202501110057.NkVGrw5j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 14781d6a50ec5c5d2152f30447ccfc139e849d79 [59/504] irqchip: xilinx: Avoid __init macro usage for xilinx_intc_of_init
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501110057.NkVGrw5j-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110057.NkVGrw5j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110057.NkVGrw5j-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-imx-mu-msi.c:440:61: error: macro "IRQCHIP_PLATFORM_DRIVER_END" passed 2 arguments, but takes just 1
     440 | IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
         |                                                             ^
   In file included from drivers/irqchip/irq-imx-mu-msi.c:15:
   include/linux/irqchip.h:68:9: note: macro "IRQCHIP_PLATFORM_DRIVER_END" defined here
      68 | #define IRQCHIP_PLATFORM_DRIVER_END(drv_name)                           \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-imx-mu-msi.c:440:1: error: 'IRQCHIP_PLATFORM_DRIVER_END' undeclared here (not in a function)
     440 | IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/module.h:22,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:14,
                    from include/linux/irqchip.h:14:
>> include/linux/moduleparam.h:24:9: error: expected '}' before 'static'
      24 |         static const char __UNIQUE_ID(name)[]                             \
         |         ^~~~~~
   include/linux/module.h:166:32: note: in expansion of macro '__MODULE_INFO'
     166 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:242:32: note: in expansion of macro 'MODULE_INFO'
     242 | #define MODULE_AUTHOR(_author) MODULE_INFO(author, _author)
         |                                ^~~~~~~~~~~
   drivers/irqchip/irq-imx-mu-msi.c:443:1: note: in expansion of macro 'MODULE_AUTHOR'
     443 | MODULE_AUTHOR("Frank Li <Frank.Li@nxp.com>");
         | ^~~~~~~~~~~~~
   include/linux/irqchip.h:45:69: note: to match this '{'
      45 | static const struct of_device_id drv_name##_irqchip_match_table[] = {
         |                                                                     ^
   drivers/irqchip/irq-imx-mu-msi.c:436:1: note: in expansion of macro 'IRQCHIP_PLATFORM_DRIVER_BEGIN'
     436 | IRQCHIP_PLATFORM_DRIVER_BEGIN(imx_mu_msi)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-imx-mu-msi.c:436:31: warning: 'imx_mu_msi_irqchip_match_table' defined but not used [-Wunused-const-variable=]
     436 | IRQCHIP_PLATFORM_DRIVER_BEGIN(imx_mu_msi)
         |                               ^~~~~~~~~~
   include/linux/irqchip.h:45:34: note: in definition of macro 'IRQCHIP_PLATFORM_DRIVER_BEGIN'
      45 | static const struct of_device_id drv_name##_irqchip_match_table[] = {
         |                                  ^~~~~~~~
>> drivers/irqchip/irq-imx-mu-msi.c:413:32: warning: 'imx_mu_pm_ops' defined but not used [-Wunused-const-variable=]
     413 | static const struct dev_pm_ops imx_mu_pm_ops = {
         |                                ^~~~~~~~~~~~~


vim +/IRQCHIP_PLATFORM_DRIVER_END +440 drivers/irqchip/irq-imx-mu-msi.c

70afdab904d2d1 Frank Li 2022-09-22  412  
70afdab904d2d1 Frank Li 2022-09-22 @413  static const struct dev_pm_ops imx_mu_pm_ops = {
70afdab904d2d1 Frank Li 2022-09-22  414  	SET_RUNTIME_PM_OPS(imx_mu_runtime_suspend,
70afdab904d2d1 Frank Li 2022-09-22  415  			   imx_mu_runtime_resume, NULL)
70afdab904d2d1 Frank Li 2022-09-22  416  };
70afdab904d2d1 Frank Li 2022-09-22  417  
70afdab904d2d1 Frank Li 2022-09-22  418  static int __init imx_mu_imx7ulp_of_init(struct device_node *dn,
70afdab904d2d1 Frank Li 2022-09-22  419  					 struct device_node *parent)
70afdab904d2d1 Frank Li 2022-09-22  420  {
70afdab904d2d1 Frank Li 2022-09-22  421  	return imx_mu_of_init(dn, parent, &imx_mu_cfg_imx7ulp);
70afdab904d2d1 Frank Li 2022-09-22  422  }
70afdab904d2d1 Frank Li 2022-09-22  423  
70afdab904d2d1 Frank Li 2022-09-22  424  static int __init imx_mu_imx6sx_of_init(struct device_node *dn,
70afdab904d2d1 Frank Li 2022-09-22  425  					struct device_node *parent)
70afdab904d2d1 Frank Li 2022-09-22  426  {
70afdab904d2d1 Frank Li 2022-09-22  427  	return imx_mu_of_init(dn, parent, &imx_mu_cfg_imx6sx);
70afdab904d2d1 Frank Li 2022-09-22  428  }
70afdab904d2d1 Frank Li 2022-09-22  429  
70afdab904d2d1 Frank Li 2022-09-22  430  static int __init imx_mu_imx8ulp_of_init(struct device_node *dn,
70afdab904d2d1 Frank Li 2022-09-22  431  					 struct device_node *parent)
70afdab904d2d1 Frank Li 2022-09-22  432  {
70afdab904d2d1 Frank Li 2022-09-22  433  	return imx_mu_of_init(dn, parent, &imx_mu_cfg_imx8ulp);
70afdab904d2d1 Frank Li 2022-09-22  434  }
70afdab904d2d1 Frank Li 2022-09-22  435  
70afdab904d2d1 Frank Li 2022-09-22 @436  IRQCHIP_PLATFORM_DRIVER_BEGIN(imx_mu_msi)
70afdab904d2d1 Frank Li 2022-09-22  437  IRQCHIP_MATCH("fsl,imx7ulp-mu-msi", imx_mu_imx7ulp_of_init)
70afdab904d2d1 Frank Li 2022-09-22  438  IRQCHIP_MATCH("fsl,imx6sx-mu-msi", imx_mu_imx6sx_of_init)
70afdab904d2d1 Frank Li 2022-09-22  439  IRQCHIP_MATCH("fsl,imx8ulp-mu-msi", imx_mu_imx8ulp_of_init)
70afdab904d2d1 Frank Li 2022-09-22 @440  IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
70afdab904d2d1 Frank Li 2022-09-22  441  
70afdab904d2d1 Frank Li 2022-09-22  442  

:::::: The code at line 440 was first introduced by commit
:::::: 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e irqchip: Add IMX MU MSI controller driver

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
