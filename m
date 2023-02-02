Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7817B3201
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 20:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675370453; x=1706906453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tcG533vtcda5IPwRI7zE/RlCi1XwHpyWZzOlkBJkPPg=;
  b=lilBWQZIDTe+L8WA4EsYzspTxgpVmsnb5ZuJmb85C9g/44h6D16SQbet
   HpXL30R/f6RwRdQ+qnrbIqaX1lyZeQtyZ/tC+13TTkgRq8sUXjeyBjhFw
   bnKzvkR7ONcEAReNexO6ac13Fcxle9D3K6cTxWpYNNn317+9H2GePbAGT
   0Q5osYCDsWJyFTrZifnGzyl+qhrNgOoM+rBrKdEmiyfS3Ney+9R9BO/mP
   7z85iS29CwWzveAISC0S39Lm7D2CcmOuJ0dXhk3wOi8unyx+TTY1hHRfB
   bw9ejNclG9yhq/mqnxQRIJDWVz5KjUaHWYueKfm7lnBYHGgyaR8foJrqu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="308209891"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="308209891"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 12:40:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="774049210"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="774049210"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2023 12:40:49 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNgO1-0006pm-0R;
	Thu, 02 Feb 2023 20:40:49 +0000
Date: Fri, 3 Feb 2023 04:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: YunQiang Su <yunqiang.su@cipunited.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/boot/compressed/uart-16550.c:44:6: warning: no previous
 prototype for 'putc'
Message-ID: <202302030435.X9R1x5Ei-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi YunQiang,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f266ccaa2f5228bfe67ad58a94ca4e0109b954a
commit: 31b2f3dc851c65fee288612432c4fc956f1a264e MIPS: enable both vmlinux.gz.itb and vmlinuz for generic
date:   1 year, 1 month ago
config: mips-randconfig-r006-20230202 (https://download.01.org/0day-ci/archive/20230203/202302030435.X9R1x5Ei-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=31b2f3dc851c65fee288612432c4fc956f1a264e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 31b2f3dc851c65fee288612432c4fc956f1a264e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/mips/boot/compressed/uart-16550.c:44:6: warning: no previous prototype for 'putc' [-Wmissing-prototypes]
      44 | void putc(char c)
         |      ^~~~


vim +/putc +44 arch/mips/boot/compressed/uart-16550.c

1b93b3c3e94be2 Wu Zhangjin 2009-10-14  43  
1b93b3c3e94be2 Wu Zhangjin 2009-10-14 @44  void putc(char c)

:::::: The code at line 44 was first introduced by commit
:::::: 1b93b3c3e94be2605759735a89fc935ba5f58dcf MIPS: Add support for GZIP / BZIP2 / LZMA compressed kernel images

:::::: TO: Wu Zhangjin <wuzhangjin@gmail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
