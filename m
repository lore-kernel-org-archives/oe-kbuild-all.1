Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EBD1F609
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 14:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0+6D+CH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705154646; x=1736690646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=naImp+E3jIzlZzT98gOw9lXpDMHIvbNoA5SwDGjjcaQ=;
  b=b0+6D+CHnlEq6mUHV7Y/0OVmoAzjcmzeIBsMkkMHxkMVqTg/6RLP+cXy
   M2hd8BvyW6xnCbQmm/G9orzobSzlfoN41Wx1Sj7+lBJx9TZjzs3YbaofT
   ZnN0ZOXljDcjFXqFWPzupJPURQ1RDKuH1jaKNAC+y6kquCxvKDecoZlYo
   v6eWJ7hC+dFtqs5gaYV+CgP3PhaBXUaVWRQ2OgWh7lwCTHaZuYxxMeIYS
   FFSBCmiPvqqc/ZPo6gXbu0nzGXRRO/hofyIfflXFSZStB2E6zUcWamALc
   EICsJeyAIj7m87tHEvdMtMWzqH6Tr6TDNyedUVFxiTDcWX0ET0VN1kqcE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6467954"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6467954"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 06:04:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="853550022"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="853550022"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jan 2024 06:04:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOecD-000AYo-1r;
	Sat, 13 Jan 2024 14:04:01 +0000
Date: Sat, 13 Jan 2024 22:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 3816/17888]
 drivers/spi/spi-nxp-fspi.c:1340:12: error: use of undeclared identifier
 'nxp_fspi_pm_ops'; did you mean 'nxp_fspi_mem_ops'?
Message-ID: <202401132125.OAsG0m7G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: e0b338dc8b0a33b70718899aa798738d157d0259 [3816/17888] spi: spi-nxp-fspi: enable runtime pm for fspi
config: hexagon-randconfig-001-20240113 (https://download.01.org/0day-ci/archive/20240113/202401132125.OAsG0m7G-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401132125.OAsG0m7G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401132125.OAsG0m7G-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/spi/spi-nxp-fspi.c:42:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/spi/spi-nxp-fspi.c:42:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/spi/spi-nxp-fspi.c:42:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/spi/spi-nxp-fspi.c:1340:12: error: use of undeclared identifier 'nxp_fspi_pm_ops'; did you mean 'nxp_fspi_mem_ops'?
    1340 |                 .pm =   &nxp_fspi_pm_ops,
         |                          ^~~~~~~~~~~~~~~
         |                          nxp_fspi_mem_ops
   drivers/spi/spi-nxp-fspi.c:1086:44: note: 'nxp_fspi_mem_ops' declared here
    1086 | static const struct spi_controller_mem_ops nxp_fspi_mem_ops = {
         |                                            ^
>> drivers/spi/spi-nxp-fspi.c:1340:11: error: incompatible pointer types initializing 'const struct dev_pm_ops *' with an expression of type 'const struct spi_controller_mem_ops *' [-Werror,-Wincompatible-pointer-types]
    1340 |                 .pm =   &nxp_fspi_pm_ops,
         |                         ^~~~~~~~~~~~~~~~
   6 warnings and 2 errors generated.


vim +1340 drivers/spi/spi-nxp-fspi.c

55ab8487e01d18 kuldip dwivedi      2020-09-11  1334  
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1335  static struct platform_driver nxp_fspi_driver = {
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1336  	.driver = {
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1337  		.name	= "nxp-fspi",
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1338  		.of_match_table = nxp_fspi_dt_ids,
55ab8487e01d18 kuldip dwivedi      2020-09-11  1339  		.acpi_match_table = ACPI_PTR(nxp_fspi_acpi_ids),
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15 @1340  		.pm =   &nxp_fspi_pm_ops,
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1341  	},
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1342  	.probe          = nxp_fspi_probe,
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1343  	.remove		= nxp_fspi_remove,
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1344  };
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1345  module_platform_driver(nxp_fspi_driver);
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1346  

:::::: The code at line 1340 was first introduced by commit
:::::: a5356aef6a907c2e2aed0caaa2b88b6021394471 spi: spi-mem: Add driver for NXP FlexSPI controller

:::::: TO: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
