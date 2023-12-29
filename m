Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0361711C82
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJSKAcbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703860407; x=1735396407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PaM9Ezx5MUQ+0e5jpU5EigLUTz9VgxoQFBYa9MqWJUc=;
  b=XJSKAcbwmv9nHF30c9DyTsx4sfRbrLFY1a8u5gK2uoWOcBiydZF+U+1W
   izwJRePGW7JsbShMW50dqMsSVRNBS9gcYu9r9J15awzGH94iiXn9Tg61k
   IF+ALgg/UohCV34x/iPxogJbYaKqL82hpdRS71z9l+oB+MKiD5UqcqpkN
   cw+zWitHXeSdqa8izBwooamjzbloyJxJfAQ57qwrR3hkcGcTTrkrK80Wj
   iipnayq2dL55H8huQEua7DKAo+H39VJpET0h4Uxffi40OmE/9ZugXXt/G
   0wicANwNM8XOaMo/ZYu1JU5NWSwdAHMIeYlbDz3vOjYjOg0YGo50CL30P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3726353"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="3726353"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 06:33:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="1025917775"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="1025917775"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 29 Dec 2023 06:33:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJDvO-000HVd-1D;
	Fri, 29 Dec 2023 14:33:22 +0000
Date: Fri, 29 Dec 2023 22:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: Anirudha Sarangi <anirudha.sarangi@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Mubin Usman Sayyed <mubin.usman.sayyed@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1 627/1369]
 drivers/irqchip/irq-imx-mu-msi.c:448:61: error: macro
 "IRQCHIP_PLATFORM_DRIVER_END" passed 2 arguments, but takes just 1
Message-ID: <202312292240.z6w5WALy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anirudha,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1
head:   cc7310fda242b85900cc805b028f2f21d1d8f210
commit: d57a0ce28405d21558291942fc17979408936244 [627/1369] irqchip: xilinx: Add support to remove Xilinx INTC irqchip driver module
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231229/202312292240.z6w5WALy-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312292240.z6w5WALy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312292240.z6w5WALy-lkp@intel.com/

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
                    from include/linux/acpi.h:15,
                    from include/linux/irqchip.h:14:
>> include/linux/moduleparam.h:24:9: error: expected '}' before 'static'
      24 |         static const char __UNIQUE_ID(name)[]                             \
         |         ^~~~~~
   include/linux/module.h:165:32: note: in expansion of macro '__MODULE_INFO'
     165 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
         |                                ^~~~~~~~~~~~~
   include/linux/module.h:235:32: note: in expansion of macro 'MODULE_INFO'
     235 | #define MODULE_AUTHOR(_author) MODULE_INFO(author, _author)
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
