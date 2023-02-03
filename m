Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7E729A2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 12:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675426200; x=1706962200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jqqgSjkKaY2nYvdkoC8laiwl/s1VhQ+fD2s0e/JLqqM=;
  b=VNXwhp4G7XyKHPQuTkAIk7jDC0dltOvay+PsAbpESqERkzkOa50YGW0g
   mdHYrGME8V/lidITdVu3m89iuhA7an5F0KSBYUwlbW2P2Bx3zDAzwU/S5
   Ap87sfcAL2/tH42Od/IE/Ci3HoxAzfDcKUMT00Zt6gAGIU3PXHjsVMI4E
   PFzQBj9jfzDCJ2AxF+SOYoAkmeMHqgMR/3Zaow99q26Us3oApCC8YvZom
   nChbuuQ1Ir+yE4xMGlWHa1hoz0O9VtW7eaKzkmFylSeSRl4QHFSHb4h/n
   td8V/lxp0v+eGVKN800n3N1eDnCDa2miItHm+kDrFQZ5iOHalIAUdLoeq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="326430253"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="326430253"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 04:09:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="774312344"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="774312344"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2023 04:09:58 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNutC-0000Sz-0a;
	Fri, 03 Feb 2023 12:09:58 +0000
Date: Fri, 3 Feb 2023 20:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: "dillibabu, karthikx" <karthikx.dillibabu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:5.15/linux 19494/22285] drivers/spi/spi-dw-pci.c:200:13:
 warning: variable 'cgsr_reg' set but not used
Message-ID: <202302031948.bR9KLymQ-lkp@intel.com>
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
head:   3fcbe6a0b3dc32ae64e534484770059e644250bc
commit: 16ea2a5139ad872e7dfdc1003020edbd8ae79d1e [19494/22285] FIX: Enable D0i3 flow for PSE IOs
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230203/202302031948.bR9KLymQ-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/bridge/imx/ drivers/gpu/drm/mcde/ drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
