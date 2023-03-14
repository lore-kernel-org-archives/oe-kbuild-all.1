Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758FA3C34
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 13:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678800722; x=1710336722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vtKxaMr3f12tibq5Hl+gvoCj3wpQ+zjy0ErkPtCZfzQ=;
  b=gnvsTMxAGQgdFsE+2oex9SFz8TwCmkF2HUANutuy20acOxJgFMhRJVaK
   wSMetqsRfcJOvSzZfSj2rvTeEIr6OwDg24BcQZrEK3gSfHmkw7f5DtPm1
   pUbyh2hEnkYwBr7HG0EUX3ea5xRKZltNuAsbJEOcHlAyLK9PeDr04yNDW
   vrvUogvMwqzTvbWc76YRxg7AjDPar2qJCVVT4uZRt6IFE8M0q038cmwGQ
   mieHInyjq+wHEeOXocpOOj67rg4bIAzM8Jhu4R2rRuxCSHddb1+0vMFtY
   E6nAcp/JPA3PXFtNYY/9gQ6he2J6B3DP5mM6cENc5qum0eaxpDCPai2qs
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317069752"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="317069752"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 06:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="768083756"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="768083756"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Mar 2023 06:31:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc4kb-0006wS-2U;
	Tue, 14 Mar 2023 13:31:37 +0000
Date: Tue, 14 Mar 2023 21:31:12 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
 19/31] s390-linux-ld:arch/s390/kernel/vdso64/vdso64.lds:262: syntax error
Message-ID: <202303142109.V1nh0gAn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
head:   961fd7e75191ae82383f80c1dfd97559f14965b8
commit: 45f0ce510abec7dd6a9e15aa18a2b5fb93242539 [19/31] s390/mm: Make virt_to_pfn() a static inline
config: s390-randconfig-r044-20230312 (https://download.01.org/0day-ci/archive/20230314/202303142109.V1nh0gAn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=45f0ce510abec7dd6a9e15aa18a2b5fb93242539
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
        git checkout 45f0ce510abec7dd6a9e15aa18a2b5fb93242539
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303142109.V1nh0gAn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> s390-linux-ld:arch/s390/kernel/vdso64/vdso64.lds:262: syntax error
   make[2]: *** [arch/s390/kernel/vdso64/Makefile:50: arch/s390/kernel/vdso64/vdso64.so.dbg] Error 1
   make[2]: Target 'include/generated/vdso64-offsets.h' not remade because of errors.
   make[1]: *** [arch/s390/Makefile:159: vdso_prepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
