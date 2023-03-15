Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6058B4431
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 12:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678884899; x=1710420899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f8qQ1xkb/qgf5zDw2NI0znr7y666TSQCIoxWPoj7XcA=;
  b=e2sWDw8dDzxxx7Y5qyTe6csWU2UFGCbCZj0McfGoqCDSnprqpDhc8g8A
   Me7UK99v4PImsvg/QX0RVlt1R4oqfis5740+lv0yIUf6z9zB7cwfAz/Mr
   iKyoldQfc0eJQFFkq+CgNWzhtDfwge6rurQus78tgKx13rcFIiF7LBVJc
   vVoaPLPTpdLBUmogSJCfxZcaxxTEPJ4wpQhpP0U7rmot89xHP8g/PJiMT
   +wn8muVh4YOpciShu35CASEXoRFE9Uc1lV/0CgBLn4LCw47EVqnoXzjZ4
   R1flUqx4vYnT0FwSy7DDT+nerJiQZ88QFb7aTv6+mO64VJR8xB3tqvPWP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="402561472"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="402561472"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 05:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="1008822038"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="1008822038"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Mar 2023 05:54:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcQeT-0007g3-2Q;
	Wed, 15 Mar 2023 12:54:45 +0000
Date: Wed, 15 Mar 2023 20:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
 17/31] ld:arch/powerpc/kernel/vdso/vdso32.lds:241: syntax error
Message-ID: <202303152040.apZxhDvL-lkp@intel.com>
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
commit: eed10e13220117531be06db71efbf2fcef9bbdba [17/31] powerpc: Make virt_to_pfn() a static inline
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230315/202303152040.apZxhDvL-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=eed10e13220117531be06db71efbf2fcef9bbdba
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
        git checkout eed10e13220117531be06db71efbf2fcef9bbdba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303152040.apZxhDvL-lkp@intel.com/

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
