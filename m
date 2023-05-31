Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65D7EDB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 01:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685495696; x=1717031696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DKIoRfrnpkNYMVM6Xb3yMkh0kSzOWeAJ0JdTx14I0l4=;
  b=IiisCPDr7zBSK2mN9rFDqpgPcoeqBqmx3tSE9tNVUgyfY7F3RObOkhWm
   JYppVWUQZ2eALrgK0hu0e5oA5VUEsZElnl/NiUwujAZuhxmsHEfpfoGGs
   KJZrZQayboRlnbn+eJvx3pKOGsPuAnLHjlsXf8W3uPVG+1EpM84dybx0e
   46gFoz45ePJLl01nAHXHU7UF6aBwu9n8zQKWk9nVgOdGKYqIpIhxwJoB4
   v3dTuhcUtmtnuhB6+5FAmFhqDchhSr0/0e+Hj1QpkmIQ6I8j2ky+p2wvv
   kZ1bsrHSSvCotLB0lgZAOIDwg7TXNz6lV7ahNGjci0BSVtj+slCJjsdGl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="344600287"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="344600287"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 18:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="1036810311"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="1036810311"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 May 2023 18:14:52 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4AQN-0000xB-1E;
	Wed, 31 May 2023 01:14:51 +0000
Date: Wed, 31 May 2023 09:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Subject: [peterz-queue:locking/core 12/14] slub.c:undefined reference to
 `__bad_size_call_parameter'
Message-ID: <202305310935.51PtEMBK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   5b5635c673a420e884950501f1fdc8ae6dd68174
commit: 43a7be77d3f8e94e1d76c4877602c08406f1c6ac [12/14] slub: Replace cmpxchg_double()
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230531/202305310935.51PtEMBK-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=43a7be77d3f8e94e1d76c4877602c08406f1c6ac
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue locking/core
        git checkout 43a7be77d3f8e94e1d76c4877602c08406f1c6ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310935.51PtEMBK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:7,
                    from ./arch/riscv/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:17,
                    from arch/riscv/include/asm/bitops.h:14,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/slub.c:13:
   include/linux/percpu-defs.h: In function '__update_cpu_freelist_fast':
>> include/linux/percpu-defs.h:343:9: warning: 'pscr2_ret__' is used uninitialized [-Wuninitialized]
     343 |         pscr2_ret__;                                                    \
         |         ^~~~~~~~~~~
   include/linux/percpu-defs.h:333:26: note: 'pscr2_ret__' was declared here
     333 |         typeof(variable) pscr2_ret__;                                   \
         |                          ^~~~~~~~~~~
   include/linux/percpu-defs.h:532:9: note: in expansion of macro '__pcpu_size_call_return2'
     532 |         __pcpu_size_call_return2(this_cpu_cmpxchg_, pcp, oval, nval)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:206:17: note: in expansion of macro 'this_cpu_cmpxchg'
     206 |         __ret = this_cpu_cmpxchg(pcp, __old, nval);                     \
         |                 ^~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:565:9: note: in expansion of macro 'this_cpu_generic_try_cmpxchg'
     565 |         this_cpu_generic_try_cmpxchg(pcp, ovalp, nval)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.h:14:41: note: in expansion of macro 'this_cpu_try_cmpxchg128'
      14 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg128
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:3040:16: note: in expansion of macro 'this_cpu_try_cmpxchg_freelist'
    3040 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid.full,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   riscv64-linux-ld: mm/slub.o: in function `.L1312':
>> slub.c:(.text+0x3610): undefined reference to `__bad_size_call_parameter'
   riscv64-linux-ld: mm/slub.o: in function `.L1415':
   slub.c:(.text+0x3ab8): undefined reference to `__bad_size_call_parameter'
   riscv64-linux-ld: mm/slub.o: in function `.L1424':
   slub.c:(.text+0x3bfa): undefined reference to `__bad_size_call_parameter'
   riscv64-linux-ld: mm/slub.o: in function `.L1454':
   slub.c:(.text+0x3d3e): undefined reference to `__bad_size_call_parameter'
   riscv64-linux-ld: mm/slub.o: in function `.L1491':
   slub.c:(.text+0x3e7a): undefined reference to `__bad_size_call_parameter'
   riscv64-linux-ld: mm/slub.o:slub.c:(.text+0x4034): more undefined references to `__bad_size_call_parameter' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
