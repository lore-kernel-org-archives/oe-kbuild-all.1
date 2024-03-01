Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F4917E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 00:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709252887; cv=none; b=Q1Mi4SD8wdYbxzzOaF9dUtmnup0nsnLFjoI6rs9NNHYdRwg4EKoEUIKu/7gBLTUC/VpUKOrsWn5CDBsJd1EuQx5W7Y67SkGpIUkZOzP+XwSfYZZ0srRNNDnct1xBOSIEtdZPgRwfjeS4WwgYmWjtWQvQLbXtlrk2DyGd0Si5gB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709252887; c=relaxed/simple;
	bh=EbW1DTDY0eC+TsVhY8c4ErlEDyQp/K7v8SvfL3L94gs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NIL51Z8+4gvcPqSLEfGyvwsCA+1lNCM5qoOCUxe3fCOXL97uhskoP2Ujfq8lOPwMWwN9G/L3gmd+JmQWQYMdklJxDBlp/Bm9b3Pb9/jjV2XR4y1WYtfjO3Y25S5TUw0WCZj50dCD8hA810RVrMlEuLPMndRkGQty8/I7ARrZukQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnB+mZU8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnB+mZU8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709252885; x=1740788885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EbW1DTDY0eC+TsVhY8c4ErlEDyQp/K7v8SvfL3L94gs=;
  b=bnB+mZU8MRCYklgq4WyXSxKLJv4vTiJrwh5HCbkeCBG6MG43U8+8uxJW
   t4QC9+FKp53b/aDVK4vb4WxefKMhIz1tAg4b48A9KE/AK0A6VVKsmpPt6
   hSBrrPq7KiPcv13ivFFcMnwuTd+IxjRixtzhcuTXbLvNLnDz8xUOzpeK7
   E1/xkTXOs95M6wKN2SloUvmUuwcNPft4xk6E/BdRhtH6bK+BA9/qxa7zi
   LLaobA0l1DimI83eFvGhIHOg+pPy/jl5urmyFo4rS3UCBCHzNGnUqwol1
   nBhA/SM3ZX/MKRTIvWrn6ozfG53ijsMW1vw58pinkhxVoXzSkBXOMgb00
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="15205415"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="15205415"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 16:28:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7961437"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Feb 2024 16:28:02 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfqjl-000DNr-0R;
	Fri, 01 Mar 2024 00:27:25 +0000
Date: Fri, 1 Mar 2024 08:24:05 +0800
From: kernel test robot <lkp@intel.com>
To: Anirudha Sarangi <anirudha.sarangi@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Mubin Usman Sayyed <mubin.usman.sayyed@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 32/860]
 drivers/irqchip/irq-imx-mu-msi.c:448:61: error: macro
 "IRQCHIP_PLATFORM_DRIVER_END" passed 2 arguments, but takes just 1
Message-ID: <202403010825.CYhu52jP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   24eec56fe5bd68cae795c37c61276b4dcf218a53
commit: 45f883df03fd7fb2aeab91b78d392b91d921fa45 [32/860] irqchip: xilinx: Avoid __init macro usage for xilinx_intc_of_init
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403010825.CYhu52jP-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010825.CYhu52jP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010825.CYhu52jP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-imx-mu-msi.c:448:61: error: macro "IRQCHIP_PLATFORM_DRIVER_END" passed 2 arguments, but takes just 1
     448 | IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
         |                                                             ^
   In file included from drivers/irqchip/irq-imx-mu-msi.c:15:
   include/linux/irqchip.h:68: note: macro "IRQCHIP_PLATFORM_DRIVER_END" defined here
      68 | #define IRQCHIP_PLATFORM_DRIVER_END(drv_name)                           \
         | 
>> drivers/irqchip/irq-imx-mu-msi.c:448:1: error: 'IRQCHIP_PLATFORM_DRIVER_END' undeclared here (not in a function)
     448 | IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
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
   drivers/irqchip/irq-imx-mu-msi.c:444:31: warning: 'imx_mu_msi_irqchip_match_table' defined but not used [-Wunused-const-variable=]
     444 | IRQCHIP_PLATFORM_DRIVER_BEGIN(imx_mu_msi)
         |                               ^~~~~~~~~~
   include/linux/irqchip.h:45:34: note: in definition of macro 'IRQCHIP_PLATFORM_DRIVER_BEGIN'
      45 | static const struct of_device_id drv_name##_irqchip_match_table[] = {
         |                                  ^~~~~~~~
   drivers/irqchip/irq-imx-mu-msi.c:421:32: warning: 'imx_mu_pm_ops' defined but not used [-Wunused-const-variable=]
     421 | static const struct dev_pm_ops imx_mu_pm_ops = {
         |                                ^~~~~~~~~~~~~


vim +/IRQCHIP_PLATFORM_DRIVER_END +448 drivers/irqchip/irq-imx-mu-msi.c

70afdab904d2d1 Frank Li 2022-09-22  443  
70afdab904d2d1 Frank Li 2022-09-22  444  IRQCHIP_PLATFORM_DRIVER_BEGIN(imx_mu_msi)
70afdab904d2d1 Frank Li 2022-09-22  445  IRQCHIP_MATCH("fsl,imx7ulp-mu-msi", imx_mu_imx7ulp_of_init)
70afdab904d2d1 Frank Li 2022-09-22  446  IRQCHIP_MATCH("fsl,imx6sx-mu-msi", imx_mu_imx6sx_of_init)
70afdab904d2d1 Frank Li 2022-09-22  447  IRQCHIP_MATCH("fsl,imx8ulp-mu-msi", imx_mu_imx8ulp_of_init)
70afdab904d2d1 Frank Li 2022-09-22 @448  IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
70afdab904d2d1 Frank Li 2022-09-22  449  
70afdab904d2d1 Frank Li 2022-09-22  450  

:::::: The code at line 448 was first introduced by commit
:::::: 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e irqchip: Add IMX MU MSI controller driver

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
