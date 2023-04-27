Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F6EC3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 00:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682556360; x=1714092360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GgYBV+T1RD85sNVfYTFaYCw4/IeJBfdVOWA9AZor7Gw=;
  b=i1aZtc8MK2qE/P3z3Hy9xbWptn+FJTDl8JrdRtxpjAk98zNlUDrdV2cl
   QI7Qqyw6SKA2uRix/L55grbtO75yF6MPosaRyXOfAYCLY+yIqgO+GS98P
   aKx/0EdUFgiAp16XmpPdWiEUY08xvnlBpWgvYmK5lOq+7RGyLBKx99bD6
   S5bCMIdqjKRIUmOy8dLCARAJKybadh3T6Hf9RFreltTeo4WWRnq3Q+Ngh
   yj4NrX7XzBVj5y7J5JLxpZ0AeM9DggSpkd9ZkQbxUl7k0Hq0f4g31Aq6V
   uZx4LfcAyoIs+27tYucJukOFru2V+2q1H603Dn5e53gPNim5BrLcjUW6z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="336217588"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="336217588"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 17:45:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="696850472"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="696850472"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Apr 2023 17:45:57 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prpll-0000c2-05;
	Thu, 27 Apr 2023 00:45:57 +0000
Date: Thu, 27 Apr 2023 08:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: arch/powerpc/platforms/powermac/nvram.c:304:24: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202304270842.BqclGq6g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6e98b09da931a00bf4e0477d0fa52748bf28fcce
commit: 0a2b782a00f33e7d06dc43d099fa071ae97bee77 fortify: Make pointer arguments const
date:   1 year, 2 months ago
config: powerpc-randconfig-s052-20230426 (https://download.01.org/0day-ci/archive/20230427/202304270842.BqclGq6g-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0a2b782a00f33e7d06dc43d099fa071ae97bee77
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0a2b782a00f33e7d06dc43d099fa071ae97bee77
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/platforms/powermac/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270842.BqclGq6g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/powermac/nvram.c:304:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *const p @@     got unsigned char [noderef] [usertype] __iomem *base @@
   arch/powerpc/platforms/powermac/nvram.c:304:24: sparse:     expected void const *const p
   arch/powerpc/platforms/powermac/nvram.c:304:24: sparse:     got unsigned char [noderef] [usertype] __iomem *base
   arch/powerpc/platforms/powermac/nvram.c:338:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *const p @@     got unsigned char [noderef] [usertype] __iomem *base @@
   arch/powerpc/platforms/powermac/nvram.c:338:20: sparse:     expected void const *const p
   arch/powerpc/platforms/powermac/nvram.c:338:20: sparse:     got unsigned char [noderef] [usertype] __iomem *base
   arch/powerpc/platforms/powermac/nvram.c:384:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *const p @@     got unsigned char [noderef] [usertype] __iomem *base @@
   arch/powerpc/platforms/powermac/nvram.c:384:24: sparse:     expected void const *const p
   arch/powerpc/platforms/powermac/nvram.c:384:24: sparse:     got unsigned char [noderef] [usertype] __iomem *base
   arch/powerpc/platforms/powermac/nvram.c:429:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *const p @@     got unsigned char [noderef] [usertype] __iomem *base @@
   arch/powerpc/platforms/powermac/nvram.c:429:20: sparse:     expected void const *const p
   arch/powerpc/platforms/powermac/nvram.c:429:20: sparse:     got unsigned char [noderef] [usertype] __iomem *base
   arch/powerpc/platforms/powermac/nvram.c:480:35: sparse: sparse: cast removes address space '__iomem' of expression
   arch/powerpc/platforms/powermac/nvram.c:526:35: sparse: sparse: cast removes address space '__iomem' of expression
   arch/powerpc/platforms/powermac/nvram.c:527:35: sparse: sparse: cast removes address space '__iomem' of expression
   arch/powerpc/platforms/powermac/nvram.c:534:44: sparse: sparse: dereference of noderef expression

vim +304 arch/powerpc/platforms/powermac/nvram.c

14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  279  
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  280  static int sm_erase_bank(int bank)
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  281  {
2d4b971287cbce arch/powerpc/platforms/powermac/nvram.c      Akinobu Mita     2012-01-27  282  	int stat;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  283  	unsigned long timeout;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  284  
af308377e204e2 arch/powerpc/platforms/powermac/nvram.c      Stephen Rothwell 2006-03-23  285  	u8 __iomem *base = (u8 __iomem *)nvram_data + core99_bank*NVRAM_SIZE;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  286  
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  287         	DBG("nvram: Sharp/Micron Erasing bank %d...\n", bank);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  288  
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  289  	out_8(base, SM_FLASH_CMD_ERASE_SETUP);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  290  	out_8(base, SM_FLASH_CMD_ERASE_CONFIRM);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  291  	timeout = 0;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  292  	do {
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  293  		if (++timeout > 1000000) {
35499c0195e46f arch/powerpc/platforms/powermac/nvram.c      Paul Mackerras   2005-10-22  294  			printk(KERN_ERR "nvram: Sharp/Micron flash erase timeout !\n");
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  295  			break;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  296  		}
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  297  		out_8(base, SM_FLASH_CMD_READ_STATUS);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  298  		stat = in_8(base);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  299  	} while (!(stat & SM_FLASH_STATUS_DONE));
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  300  
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  301  	out_8(base, SM_FLASH_CMD_CLEAR_STATUS);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  302  	out_8(base, SM_FLASH_CMD_RESET);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  303  
2d4b971287cbce arch/powerpc/platforms/powermac/nvram.c      Akinobu Mita     2012-01-27 @304  	if (memchr_inv(base, 0xff, NVRAM_SIZE)) {
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  305  		printk(KERN_ERR "nvram: Sharp/Micron flash erase failed !\n");
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  306  		return -ENXIO;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  307  	}
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  308  	return 0;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  309  }
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_nvram.c Paul Mackerras   2005-09-26  310  

:::::: The code at line 304 was first introduced by commit
:::::: 2d4b971287cbce16585acda4b76308faa8da0950 powerpc/pmac: Use string library in nvram code

:::::: TO: Akinobu Mita <akinobu.mita@gmail.com>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
