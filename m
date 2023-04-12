Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917752CA5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 23:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681340728; x=1712876728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3OXF7aNyxmAUU61mhMAcXl/TKOB7aOxSlZ7nvloOOoM=;
  b=oKIM+st0XyVAaZdOWH3xu7ewpmUlXvnWxkjjLFbpWn4/zbHPeFIQpNpt
   N7ZE0finEh/FW63qtBwZGBIplILgPeoqtCQhRmnmmFABwJJjB8x4nRWGq
   6C5zZBTVRcv11hQlkdM9itztzJESym/wD553U1o+GpL3l8vkhUHTnSpfq
   cdoqV/HJKVkW05iyhH4kwD7MlVhZoTNAU/oeDKmeGKFeP4JHdKOn8gdX2
   oDSz5SIrA0YSEkbifEp0BK/sobw+SKh+iFhtN9grJ4AO1V+FITwrywqnZ
   Mzfapw09Wel87M8kQNU7CAfc3/25RfA01tBk+OffNd9pPnpCC9XLTy7+f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="406876055"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="406876055"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 16:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="832842187"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="832842187"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2023 16:05:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmjWn-000Y7z-2h;
	Wed, 12 Apr 2023 23:05:25 +0000
Date: Thu, 13 Apr 2023 07:05:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:epoll-min_ts.2 10/10] <stdin>:1567:2: warning: #warning
 syscall epoll_pwait3 not implemented
Message-ID: <202304130637.TjzC3SwF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git epoll-min_ts.2
head:   b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b
commit: b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b [10/10] eventpoll: wire up epoll_pwait3() syscall
config: mips-randconfig-r032-20230412 (https://download.01.org/0day-ci/archive/20230413/202304130637.TjzC3SwF-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block epoll-min_ts.2
        git checkout b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130637.TjzC3SwF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1567:2: warning: #warning syscall epoll_pwait3 not implemented [-Wcpp]
--
>> <stdin>:1567:2: warning: #warning syscall epoll_pwait3 not implemented [-Wcpp]
>> <stdin>:1567:2: warning: #warning syscall epoll_pwait3 not implemented [-Wcpp]
--
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      26 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      78 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:92:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      92 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:108:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
     108 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:136:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     136 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:179:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     179 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:235:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     235 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:248:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
     248 | void output_signal_defined(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:315:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
     315 | void output_pbe_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:327:6: warning: no previous prototype for 'output_pm_defines' [-Wmissing-prototypes]
     327 | void output_pm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:341:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     341 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
>> <stdin>:1567:2: warning: #warning syscall epoll_pwait3 not implemented [-Wcpp]
>> <stdin>:1567:2: warning: #warning syscall epoll_pwait3 not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
