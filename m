Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FE342AB0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 05:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727761259; cv=none; b=iwjO2+Y5c3MX0K0pFHZ/mZcmcKbrs0bu8qrS07b8Zap13+brPqIx/4QS4WJ9SJKdAu2IUP5nBURrIwyGwX9ZgOTs7SphIq06jhnZc1/HaEOSAnH+Ecot8LVm4ybZvcwzyxOyofjO1v/Xxx38gLeJtr0XgqrNkBEsUaEpBzbT6mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727761259; c=relaxed/simple;
	bh=l/X1wj2S+g+W+6VzhNbVW/4ABIzi8WwsJ0A/HysF+nM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dUpzVvhJ1bv+jTGgt10AfWH/0bO5/Fw78bLxrDXxjsVyKZ/dWTZFtFykFebY9ZYDVENBJHgz2ScyLnZUaQhh2mslHK0okEvLXCL/WTbvqbH2nzIccrWN8zoFjpBwsLBTepFcyy/oz9BecS9/WNhNPnQ8k2CFBcCQ//USVDXxfQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcTBFeLM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcTBFeLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727761257; x=1759297257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/X1wj2S+g+W+6VzhNbVW/4ABIzi8WwsJ0A/HysF+nM=;
  b=kcTBFeLMw0AamsIaT2jrs/Pmt1X8GAbH/3qCm2Xtl50vHkO7V+E4Eni7
   fsRHkJmJyTDX9BiLb8rtX0S6E1PwouCMTeObFlcD0nup9Pv/fWiLbUGDO
   MdzUXwbOIRY+oAet9jHFaJogH7B4Dcu38kPdUhnsRuqWiFYVlYd9z4auq
   m8fGZ8vGVR994OCx5ruevhvCZznsXzK7H94TMjFFHsY2LyXNcadetHifU
   QS37LAGm0HqwZ1dOWSaQMO1/q91b6S2fsMkpiXTs9QfsGXXkbV56maui+
   bDRlGUC1zorGIHBZ4WwStpxg/NrfVABmXManGEL95q8C+du9e1x2Fsnz9
   w==;
X-CSE-ConnectionGUID: GLLnsBErT2awlfPVE1D59g==
X-CSE-MsgGUID: 6ijJJmrwQEeFaPYm31iPOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26332263"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26332263"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 22:40:57 -0700
X-CSE-ConnectionGUID: SHNhHNQeSoiY94D67FCnng==
X-CSE-MsgGUID: pdLpQgV/QsOHeVnTfuu67Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="111018968"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2024 22:40:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svVcy-000QI7-2r;
	Tue, 01 Oct 2024 05:40:52 +0000
Date: Tue, 1 Oct 2024 13:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Anirudha Sarangi <anirudha.sarangi@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Mubin Usman Sayyed <mubin.usman.sayyed@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 32/1001]
 drivers/irqchip/irq-imx-mu-msi.c:444:31: warning:
 'imx_mu_msi_irqchip_match_table' defined but not used
Message-ID: <202410011342.bowI1gdf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 45f883df03fd7fb2aeab91b78d392b91d921fa45 [32/1001] irqchip: xilinx: Avoid __init macro usage for xilinx_intc_of_init
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241001/202410011342.bowI1gdf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011342.bowI1gdf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011342.bowI1gdf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-imx-mu-msi.c:448:61: error: macro "IRQCHIP_PLATFORM_DRIVER_END" passed 2 arguments, but takes just 1
     448 | IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
         |                                                             ^
   In file included from drivers/irqchip/irq-imx-mu-msi.c:15:
   include/linux/irqchip.h:68: note: macro "IRQCHIP_PLATFORM_DRIVER_END" defined here
      68 | #define IRQCHIP_PLATFORM_DRIVER_END(drv_name)                           \
         | 
   drivers/irqchip/irq-imx-mu-msi.c:448:1: error: 'IRQCHIP_PLATFORM_DRIVER_END' undeclared here (not in a function)
     448 | IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/module.h:22,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:14,
                    from include/linux/irqchip.h:14:
   include/linux/moduleparam.h:24:9: error: expected '}' before 'static'
      24 |         static const char __UNIQUE_ID(name)[]                             \
         |         ^~~~~~
   include/linux/module.h:166:32: note: in expansion of macro '__MODULE_INFO'
     166 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:236:32: note: in expansion of macro 'MODULE_INFO'
     236 | #define MODULE_AUTHOR(_author) MODULE_INFO(author, _author)
         |                                ^~~~~~~~~~~
   drivers/irqchip/irq-imx-mu-msi.c:451:1: note: in expansion of macro 'MODULE_AUTHOR'
     451 | MODULE_AUTHOR("Frank Li <Frank.Li@nxp.com>");
         | ^~~~~~~~~~~~~
   include/linux/irqchip.h:45:69: note: to match this '{'
      45 | static const struct of_device_id drv_name##_irqchip_match_table[] = {
         |                                                                     ^
   drivers/irqchip/irq-imx-mu-msi.c:444:1: note: in expansion of macro 'IRQCHIP_PLATFORM_DRIVER_BEGIN'
     444 | IRQCHIP_PLATFORM_DRIVER_BEGIN(imx_mu_msi)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-imx-mu-msi.c:444:31: warning: 'imx_mu_msi_irqchip_match_table' defined but not used [-Wunused-const-variable=]
     444 | IRQCHIP_PLATFORM_DRIVER_BEGIN(imx_mu_msi)
         |                               ^~~~~~~~~~
   include/linux/irqchip.h:45:34: note: in definition of macro 'IRQCHIP_PLATFORM_DRIVER_BEGIN'
      45 | static const struct of_device_id drv_name##_irqchip_match_table[] = {
         |                                  ^~~~~~~~
>> drivers/irqchip/irq-imx-mu-msi.c:421:32: warning: 'imx_mu_pm_ops' defined but not used [-Wunused-const-variable=]
     421 | static const struct dev_pm_ops imx_mu_pm_ops = {
         |                                ^~~~~~~~~~~~~


vim +/imx_mu_msi_irqchip_match_table +444 drivers/irqchip/irq-imx-mu-msi.c

70afdab904d2d1 Frank Li 2022-09-22  420  
70afdab904d2d1 Frank Li 2022-09-22 @421  static const struct dev_pm_ops imx_mu_pm_ops = {
70afdab904d2d1 Frank Li 2022-09-22  422  	SET_RUNTIME_PM_OPS(imx_mu_runtime_suspend,
70afdab904d2d1 Frank Li 2022-09-22  423  			   imx_mu_runtime_resume, NULL)
70afdab904d2d1 Frank Li 2022-09-22  424  };
70afdab904d2d1 Frank Li 2022-09-22  425  
70afdab904d2d1 Frank Li 2022-09-22  426  static int __init imx_mu_imx7ulp_of_init(struct device_node *dn,
70afdab904d2d1 Frank Li 2022-09-22  427  					 struct device_node *parent)
70afdab904d2d1 Frank Li 2022-09-22  428  {
70afdab904d2d1 Frank Li 2022-09-22  429  	return imx_mu_of_init(dn, parent, &imx_mu_cfg_imx7ulp);
70afdab904d2d1 Frank Li 2022-09-22  430  }
70afdab904d2d1 Frank Li 2022-09-22  431  
70afdab904d2d1 Frank Li 2022-09-22  432  static int __init imx_mu_imx6sx_of_init(struct device_node *dn,
70afdab904d2d1 Frank Li 2022-09-22  433  					struct device_node *parent)
70afdab904d2d1 Frank Li 2022-09-22  434  {
70afdab904d2d1 Frank Li 2022-09-22  435  	return imx_mu_of_init(dn, parent, &imx_mu_cfg_imx6sx);
70afdab904d2d1 Frank Li 2022-09-22  436  }
70afdab904d2d1 Frank Li 2022-09-22  437  
70afdab904d2d1 Frank Li 2022-09-22  438  static int __init imx_mu_imx8ulp_of_init(struct device_node *dn,
70afdab904d2d1 Frank Li 2022-09-22  439  					 struct device_node *parent)
70afdab904d2d1 Frank Li 2022-09-22  440  {
70afdab904d2d1 Frank Li 2022-09-22  441  	return imx_mu_of_init(dn, parent, &imx_mu_cfg_imx8ulp);
70afdab904d2d1 Frank Li 2022-09-22  442  }
70afdab904d2d1 Frank Li 2022-09-22  443  
70afdab904d2d1 Frank Li 2022-09-22 @444  IRQCHIP_PLATFORM_DRIVER_BEGIN(imx_mu_msi)
70afdab904d2d1 Frank Li 2022-09-22  445  IRQCHIP_MATCH("fsl,imx7ulp-mu-msi", imx_mu_imx7ulp_of_init)
70afdab904d2d1 Frank Li 2022-09-22  446  IRQCHIP_MATCH("fsl,imx6sx-mu-msi", imx_mu_imx6sx_of_init)
70afdab904d2d1 Frank Li 2022-09-22  447  IRQCHIP_MATCH("fsl,imx8ulp-mu-msi", imx_mu_imx8ulp_of_init)
70afdab904d2d1 Frank Li 2022-09-22  448  IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
70afdab904d2d1 Frank Li 2022-09-22  449  
70afdab904d2d1 Frank Li 2022-09-22  450  

:::::: The code at line 444 was first introduced by commit
:::::: 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e irqchip: Add IMX MU MSI controller driver

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
