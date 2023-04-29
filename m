Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C5828EE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 09:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682761741; x=1714297741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oE6SJASOVO6OvuMhC3wHUsnSzqxMEd0Z0pce8ICKpuM=;
  b=HnnMiMpR9qrnBD8p0gMWZ8CAUhf+CouN/X7UWb5u97+8/HuIPITziZAN
   yUtwwqlo3TK0KOgfX4vRrCrOue2/MbqNVEnTXnNyooTW74SEl9OHmBg2S
   Vnr+zyY9jZiHwAud/rKPy8lx1ZkoDO5DVNMXtgcxFa8cK+YqpL4t6MTd/
   bxsN0qg5gFmN/PzGk0i6eGeHCewcajMCcls8D5Tec95l0BAIqgSX511sW
   xrFxyWaFOs9RNFNrWIT8P5ikuz9jKObIWR2ifDmGoR/22vwBOKKzaju8i
   sTkgQANxPjv4jiAsnvQfvPg1xQEb/D8l1dsxbj6xsKj2ABNp3ulmThbDF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="349960690"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="349960690"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 02:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="689219585"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="689219585"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Apr 2023 02:48:59 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pshCM-00012V-1M;
	Sat, 29 Apr 2023 09:48:58 +0000
Date: Sat, 29 Apr 2023 17:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.3/main 295/445] kernel/sched/smp.h:14:20: error: redefinition
 of 'flush_smp_call_function_queue'
Message-ID: <202304291747.txQZ2S4K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.3/main
head:   eba4954612b618a11e1558a7e6dcce53de9c9d85
commit: bff5eca3b1e3f87c41eba91022950297d0c770bd [295/445] sched/alt: [Sync] 16bf5a5e1ec5 smp: Rename flush_smp_call_function_from_idle()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230429/202304291747.txQZ2S4K-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/bff5eca3b1e3f87c41eba91022950297d0c770bd
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.3/main
        git checkout bff5eca3b1e3f87c41eba91022950297d0c770bd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291747.txQZ2S4K-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:35:
>> kernel/sched/smp.h:14:20: error: redefinition of 'flush_smp_call_function_queue'
      14 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/sched.h:9,
                    from kernel/sched/build_policy.c:34:
   kernel/sched/alt_sched.h:296:20: note: previous definition of 'flush_smp_call_function_queue' with type 'void(void)'
     296 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/flush_smp_call_function_queue +14 kernel/sched/smp.h

d664e399128bd7 Thomas Gleixner 2022-04-13  10  
d664e399128bd7 Thomas Gleixner 2022-04-13  11  #ifdef CONFIG_SMP
16bf5a5e1ec564 Thomas Gleixner 2022-04-13  12  extern void flush_smp_call_function_queue(void);
d664e399128bd7 Thomas Gleixner 2022-04-13  13  #else
16bf5a5e1ec564 Thomas Gleixner 2022-04-13 @14  static inline void flush_smp_call_function_queue(void) { }

:::::: The code at line 14 was first introduced by commit
:::::: 16bf5a5e1ec56474ed2a19d72f272ed09a5d3ea1 smp: Rename flush_smp_call_function_from_idle()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
