Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FFC389
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Mar 2023 04:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679716976; x=1711252976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o2G1yHVLu9KwuKNJ6AySszy3IweCKDpqTuwDBdk2m1M=;
  b=dTSUncIeQSdGUiZruMIx++w1ADw/VWFsqWeXc9vf6tHI3+TuXv2IRyRT
   HcwCRUtrfJG6Hlx/xiYSPeGHSoJsm/UG1HL9B6I4+wC7ap5ZvDTCOn/OP
   cFUFGsIgvzPe2wnRXwnvV6RIsaDcpI9JPDtpJ4xDJAqnL+Mjmw4HtO+8e
   ylFrkTLo5J/iHFHPCmwN+W/PpRV6mUQjG2GMdFikCFPgEowlCGznZYDba
   FkptJZ194nmMuxLY+gd8rLXFJTB67NkxyCIJznKtymTJUgcdRwtcSoMnp
   YdpTDlBu9KFYl5GLXwXRA+4rj4sqVt4HZWcgB9yy+HYxLXF38UScWwrFQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="426194673"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="426194673"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 21:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="633056460"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="633056460"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Mar 2023 21:02:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfv77-000FvX-1d;
	Sat, 25 Mar 2023 04:02:45 +0000
Date: Sat, 25 Mar 2023 12:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org
Subject: [arnd-asm-generic:dma-sync-rework 2/22]
 arch/parisc/include/asm/vdso.h:10:10: fatal error:
 generated/vdso32-offsets.h: No such file or directory
Message-ID: <202303251132.We6NFavu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git dma-sync-rework
head:   985cd64f3b17b82468e68c6269e09a5556d3720e
commit: 30859fbc741ae9358edd55aa0041ecd7ec95e808 [2/22] build workaround
config: parisc-generic-64bit_defconfig (https://download.01.org/0day-ci/archive/20230325/202303251132.We6NFavu-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/commit/?id=30859fbc741ae9358edd55aa0041ecd7ec95e808
        git remote add arnd-asm-generic https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
        git fetch --no-tags arnd-asm-generic dma-sync-rework
        git checkout 30859fbc741ae9358edd55aa0041ecd7ec95e808
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303251132.We6NFavu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/parisc/kernel/signal.c:32:
>> arch/parisc/include/asm/vdso.h:10:10: fatal error: generated/vdso32-offsets.h: No such file or directory
      10 | #include <generated/vdso32-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +10 arch/parisc/include/asm/vdso.h

df24e1783e6e0e Helge Deller 2021-12-08   6  
df24e1783e6e0e Helge Deller 2021-12-08   7  #ifdef CONFIG_64BIT
df24e1783e6e0e Helge Deller 2021-12-08   8  #include <generated/vdso64-offsets.h>
df24e1783e6e0e Helge Deller 2021-12-08   9  #endif
df24e1783e6e0e Helge Deller 2021-12-08 @10  #include <generated/vdso32-offsets.h>
df24e1783e6e0e Helge Deller 2021-12-08  11  

:::::: The code at line 10 was first introduced by commit
:::::: df24e1783e6e0eb3dc0e3ba5a8df3bb0cc537408 parisc: Add vDSO support

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
