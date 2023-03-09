Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B22BC282
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 19:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678388800; x=1709924800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zZrPDR+1gerh3it1PAG4FHdXEYo/lESMCMxLXn+GjDw=;
  b=ExeovklF+gYK3XdD1CXzISFTafTNxbnY3EhiMI0/HarvqVIlTAQDZudF
   BEFvtU7ICP6qWxCmaCVrMCiT8gLO3Zu64LKVPrPDANgjs4/65UC5hAlQw
   h/wVeZEXdY3G9C+3SdiRYLZqS/HE2eJq487rVZrJgvm2n4P5MMfyTckQT
   tA/+eRHo8XxDny0BqOVQoaV5+G7U0MK2UoAjIo1bSG5vycbsCVKU43wa1
   Db+qI09WCUYkgKLETahk2mJjpwxOZUFOlhkmZG71T7Tx5ILAvE2R5K6zr
   46SQ5B+noVcq48evNISRE3dg/iQr6bnOhhfWsAXY5DCzA6jacpB61YQdy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="338085329"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="338085329"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 11:06:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="627484840"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="627484840"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Mar 2023 11:06:38 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paLb3-0003AJ-1I;
	Thu, 09 Mar 2023 19:06:37 +0000
Date: Fri, 10 Mar 2023 03:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: "dillibabu, karthikx" <karthikx.dillibabu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:5.15/linux 19494/23027] drivers/spi/spi-dw-pci.c:200:13:
 warning: variable 'cgsr_reg' set but not used
Message-ID: <202303100232.rZI9Rme6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi karthikx,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   2533aa36ba52e96057d68a4ab377a6293b91c1fc
commit: 16ea2a5139ad872e7dfdc1003020edbd8ae79d1e [19494/23027] FIX: Enable D0i3 flow for PSE IOs
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230310/202303100232.rZI9Rme6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/16ea2a5139ad872e7dfdc1003020edbd8ae79d1e
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 16ea2a5139ad872e7dfdc1003020edbd8ae79d1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/bridge/imx/ drivers/gpu/drm/mcde/ drivers/media/i2c/ drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100232.rZI9Rme6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-dw-pci.c: In function 'dw_spi_runtime_suspend':
>> drivers/spi/spi-dw-pci.c:200:13: warning: variable 'cgsr_reg' set but not used [-Wunused-but-set-variable]
     200 |         u32 cgsr_reg;
         |             ^~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_PMC_CORE
   Depends on [n]: X86 && X86_PLATFORM_DEVICES [=n] && PCI [=y] && ACPI
   Selected by [y]:
   - DWMAC_INTEL_PLAT [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_PLATFORM [=y] && OF [=y] && COMMON_CLK [=y] && STMMAC_ETH [=y]


vim +/cgsr_reg +200 drivers/spi/spi-dw-pci.c

   193	
   194	#if CONFIG_PM
   195	static int dw_spi_runtime_suspend(struct device *dev)
   196	{
   197		struct dw_spi *dws = dev_get_drvdata(dev);
   198		unsigned long j0, j1, delay;
   199		u32 d0i3c_reg;
 > 200		u32 cgsr_reg;
   201	
   202		delay = msecs_to_jiffies(100);
   203		j0 = jiffies;
   204		j1 = j0 + delay;
   205	
   206		cgsr_reg = dw_readl(dws, PSE_SPI_CGSR);
   207		dw_writel(dws, PSE_SPI_CGSR, PSE_SPI_D0I3_RR);
   208	
   209		d0i3c_reg = dw_readl(dws, PSE_SPI_D0I3C);
   210		if (d0i3c_reg & PSE_SPI_D0I3_CIP) {
   211			dev_info(dev, "%s d0i3c CIP detected", __func__);
   212		} else {
   213			dw_writel(dws, PSE_SPI_D0I3C, PSE_SPI_D0I3_EN);
   214			d0i3c_reg = dw_readl(dws, PSE_SPI_D0I3C);
   215		}
   216	
   217		while (time_before(jiffies, j1)) {
   218			d0i3c_reg = dw_readl(dws, PSE_SPI_D0I3C);
   219			if (!(d0i3c_reg & PSE_SPI_D0I3_CIP))
   220				break;
   221		}
   222	
   223		if (d0i3c_reg & PSE_SPI_D0I3_CIP)
   224			dev_info(dev, "%s: timeout waiting CIP to be cleared", __func__);
   225	
   226		return 0;
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
