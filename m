Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3F67E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 07:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681370503; x=1712906503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tvNhPE0t7voaI/US5EnRox6YwK/qRcmhXZHg8nqL25M=;
  b=Hug97+ryYfXGe4PJJrNH8A2L7L0NFIch5NTYJN3+ecYHI4D3dOyu6USF
   sdZShBKMjgvks5rj+NAPOPRJu9cuVtZdHp7Gna9rXdC+QvES0iYHX5spl
   v28Fs1sDloleoj3+FJpvnHaarcit/0BD0NtNFMivxqFDzBa05d+MrlJ1K
   Gx8mBMCi6zrlbBVux1Vu5BPwbjMIUeot6KyOnAmmaqLEH8aSzd5wSusNS
   dKngGj0wegetxlpeAQ2qn+5s8K3mEapuvQo+JZexgGFECdSQgPbTrbK4k
   S0qnOZRL6O70CgzV5RTtgvnqOAMVjwnmP6pflG54Uy50l3tyhnXkG816I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="345901345"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="345901345"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 00:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="813340401"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="813340401"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Apr 2023 00:21:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmrH1-000YTt-1t;
	Thu, 13 Apr 2023 07:21:39 +0000
Date: Thu, 13 Apr 2023 15:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: Anirudha Sarangi <anirudha.sarangi@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Mubin Usman Sayyed <mubin.usman.sayyed@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 627/1065]
 drivers/irqchip/irq-imx-mu-msi.c:448:61: error: macro
 "IRQCHIP_PLATFORM_DRIVER_END" passed 2 arguments, but takes just 1
Message-ID: <202304131510.VLNlpJU7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   e5753363b5e03fc0a3055d5476c6cca93e9ea28b
commit: d57a0ce28405d21558291942fc17979408936244 [627/1065] irqchip: xilinx: Add support to remove Xilinx INTC irqchip driver module
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230413/202304131510.VLNlpJU7-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/d57a0ce28405d21558291942fc17979408936244
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS
        git checkout d57a0ce28405d21558291942fc17979408936244
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304131510.VLNlpJU7-lkp@intel.com/

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
https://github.com/intel/lkp-tests
