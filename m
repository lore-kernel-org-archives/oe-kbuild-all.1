Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D198A210B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679668339; x=1711204339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oDFplqp0rb85Cvja1gAdJl/0/0A2ZTjE7uTbu1Skccs=;
  b=WwSNYoVd1JhHh/g4IcGVUSV0lhn+c7QggAJfQajhVJdHlNjTI9bBgHbW
   yH6hf/4bJe5OB+CzKe4gTJsKyBn8yxeoAnOwh/DZEGWoA1GVncBbPHFN9
   a9hCGkAf8Cunsn8qwLLK3+hMJLBZr4Nk6c8XsC7YqlQWVuEj9bGzkxrdB
   BQjBh6jPHZLOFq/UTbg2HuZdqH1sagz4s/KrVVv5zUT+oF61z6ownujgD
   aMCvTkdxu6rSPkGOh8K+GfWCm64f+P2AGcqIniikPiouJFHbgeh8e6wQr
   VAFpNjPpDMp2g8Y0UDur6DIqHSz5oizEXfKn3E97NL0zFkzG7+Tf7wYnp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="404707368"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="404707368"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 07:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="826276320"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="826276320"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2023 07:32:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfiSn-000FMw-1m;
	Fri, 24 Mar 2023 14:32:17 +0000
Date: Fri, 24 Mar 2023 22:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.3-rc3-redux 8/8]
 arch/m68k/include/asm/page_no.h:29:26: error: invalid operands to binary <<
 (have 'void *' and 'int')
Message-ID: <202303242238.Chb3havl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.3-rc3-redux
head:   b5fe3402030c1ea066167108866fd21881895594
commit: b5fe3402030c1ea066167108866fd21881895594 [8/8] m68k/mm: Make pfn accessors static inlines
config: m68k-randconfig-s031-20230322 (https://download.01.org/0day-ci/archive/20230324/202303242238.Chb3havl-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=b5fe3402030c1ea066167108866fd21881895594
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator virt-to-pfn-v6.3-rc3-redux
        git checkout b5fe3402030c1ea066167108866fd21881895594
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303242238.Chb3havl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/page.h:62,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from arch/m68k/include/asm/current.h:16,
                    from include/linux/sched.h:12,
                    from arch/m68k/kernel/asm-offsets.c:15:
   arch/m68k/include/asm/page_no.h: In function 'pfn_to_virt':
>> arch/m68k/include/asm/page_no.h:29:26: error: invalid operands to binary << (have 'void *' and 'int')
      29 |         return __va(pfn) << PAGE_SHIFT;
         |                          ^~
   make[2]: *** [scripts/Makefile.build:114: arch/m68k/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +29 arch/m68k/include/asm/page_no.h

    26	
    27	static inline void * pfn_to_virt(unsigned long pfn)
    28	{
  > 29		return __va(pfn) << PAGE_SHIFT;
    30	}
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
