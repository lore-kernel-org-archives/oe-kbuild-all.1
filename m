Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9417371
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 05:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683784676; x=1715320676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=esf7Awl5wAqdz1VlrbA/Roc3Np8AvsfoKm6R0aAVP/0=;
  b=EaPKLSXyo3rASJ/cgi8mg5o4hYEm1aCPFh2kH8Sn+ffVogLE+1wdBg6X
   hQTq+8tgwvNTvPIgDe8gz6hySOeYy2CHwy+ktIDb02YNKRH6l6Em6pDsg
   HZp7ZR6zo2R9G91tSYIPs9VE9lhCLLIh2feC7wPkLU+BkkFWz3HAJy4JI
   MlXeTHsQvV5GTRkgnvx7NG1wl0dEYerl05roexdhaRRjylgO4otky5m3A
   Q+nw/t/jRPSixbeozzCYz/L4edL4uWfOCySrGhwCtrKNbVmREi896fJW/
   BRk6/Pbdtnso+vG+lWWcJ7rvZ9/7SXugOYRJ4Ku2lkhtpYueAiDhsnF8a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="415995382"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="415995382"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 22:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="702594632"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="702594632"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 May 2023 22:57:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwzJK-0003o4-22;
	Thu, 11 May 2023 05:57:54 +0000
Date: Thu, 11 May 2023 13:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/clk/pxa/clk-pxa3xx.c:167:9: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202305111301.RAHohdob-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   80e62bc8487b049696e67ad133c503bf7f6806f7
commit: 3c816d950a494ae6e16b1fa017af29bc53cb7791 ARM: pxa: move clk register definitions to driver
date:   1 year ago
config: arm-randconfig-s053-20230511 (https://download.01.org/0day-ci/archive/20230511/202305111301.RAHohdob-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3c816d950a494ae6e16b1fa017af29bc53cb7791
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3c816d950a494ae6e16b1fa017af29bc53cb7791
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mach-lpc32xx/ arch/arm/mach-orion5x/ arch/arm/mach-spear/ arch/arm/mm/ drivers/clk/pxa/ drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305111301.RAHohdob-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/pxa/clk-pxa3xx.c:167:9: sparse: sparse: Using plain integer as NULL pointer

vim +167 drivers/clk/pxa/clk-pxa3xx.c

   159	
   160	void pxa3xx_clk_update_accr(u32 disable, u32 enable, u32 xclkcfg, u32 mask)
   161	{
   162		u32 accr = readl(clk_regs + ACCR);
   163	
   164		accr &= ~disable;
   165		accr |= enable;
   166	
 > 167		writel(accr, ACCR);
   168		if (xclkcfg)
   169			__asm__("mcr p14, 0, %0, c6, c0, 0\n" : : "r"(xclkcfg));
   170	
   171		while ((readl(clk_regs + ACSR) & mask) != (accr & mask))
   172			cpu_relax();
   173	}
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
