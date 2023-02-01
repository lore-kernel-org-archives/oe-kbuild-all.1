Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F5533C0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 18:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675276015; x=1706812015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZEa2nWwqw4FdivfWaptPjRyGlsio62fMgnfusBC9hc4=;
  b=WxXnzsqZVgm9pkjMgaKhrqgVvoxZNh1H1Yz33ahW68kdvC9lqMNUPrMn
   YWUCv7ZTE11PkuzMeN95c8wl8vSlFUzkfig0rql2ioGASRPsSvtZk031D
   zAfc6u8+k6IK5tLd+3ksPsrhqidwW5yjfkeaW8vLClOEfGcH5v1A/YQUG
   hKY8YE/GV7APdygAqxcqC0jgICMHYiW3L3M6Vo+Q/AcXgj8lopnz4hCEu
   c+LOl2lMiO60aUhZEXOCa3Ar4LaDzCIbjPqZL0gCRNYcNvLLARE/qAtZM
   fiW5QARMEE29zcNp+HzhmPTPKh9xEnmvceGPkqrQsvGHyE8ZtKpTOVEhh
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="390624331"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="390624331"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 10:24:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807664401"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="807664401"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2023 10:24:43 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNHmk-0005gO-0t;
	Wed, 01 Feb 2023 18:24:42 +0000
Date: Thu, 2 Feb 2023 02:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3 17/25]
 ld:arch/powerpc/kernel/vdso/vdso32.lds:241: syntax error
Message-ID: <202302020230.NWNaYtLv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3
head:   ac3cfb78163256f2febd47ebd017d9f5b75820dd
commit: eed10e13220117531be06db71efbf2fcef9bbdba [17/25] powerpc: Make virt_to_pfn() a static inline
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302020230.NWNaYtLv-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=eed10e13220117531be06db71efbf2fcef9bbdba
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3
        git checkout eed10e13220117531be06db71efbf2fcef9bbdba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> ld:arch/powerpc/kernel/vdso/vdso32.lds:241: syntax error
   collect2: error: ld returned 1 exit status
   make[2]: *** [arch/powerpc/kernel/vdso/Makefile:66: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
   make[2]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[1]: *** [arch/powerpc/Makefile:386: vdso_prepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
