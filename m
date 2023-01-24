Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9961380
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 12:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674562617; x=1706098617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r2NjXAKOM393SIJpaIAHK6scSYeXmiN+F3X9wweeFKQ=;
  b=LXgq3q3DCVgVBl+hMyazoTlz9/JWMamnKG6wMEznRR/TvBhG+lpP0ORs
   ww0NI5ZgOo9R3hWwmNEbrob4r/bDbdjJxAgOoudKM3rScGuvPah7nmbnN
   TGOo+2tnsm+ODhtvqMNO8DovJgp5pvKSJeAVlP2n0D+En20qWkn6gmSci
   edeGIWv6GlLiBF+ljIpCUunO3GHUACZuZlTHvaT4iM+9qRVhUJOW5vTIU
   6iFy7S+GX2/MyUelTDihkgbWpov16Kp7VESNDGJvkuPIuWXF1Wia2+OVc
   CMiFEVePPT6NZnDUNYgvKUWdanBYC80u2K/7m8qNbF8LHOTdGmRi938GU
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323976949"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="323976949"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 04:16:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="750808088"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="750808088"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2023 04:16:55 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKIEQ-0006RV-2B;
	Tue, 24 Jan 2023 12:16:54 +0000
Date: Tue, 24 Jan 2023 20:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:misc/pfn_valid/v0 2/2] arch/mips/include/asm/page.h:262:2:
 error: #endif without #if
Message-ID: <202301242025.1fo2LdS6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git misc/pfn_valid/v0
head:   6d896eb70d86ede11a8996011abca9f4c1a382ad
commit: 6d896eb70d86ede11a8996011abca9f4c1a382ad [2/2] mm, arch: add generic implementation of pfn_valid() for FLATMEM
config: mips-randconfig-r015-20230123 (https://download.01.org/0day-ci/archive/20230124/202301242025.1fo2LdS6-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=6d896eb70d86ede11a8996011abca9f4c1a382ad
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt misc/pfn_valid/v0
        git checkout 6d896eb70d86ede11a8996011abca9f4c1a382ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/mips/include/asm/io.h:29,
                    from arch/mips/include/asm/mmiowb.h:5,
                    from include/linux/spinlock.h:65,
                    from include/linux/ipc.h:5,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/mips/kernel/asm-offsets.c:12:
>> arch/mips/include/asm/page.h:262:2: error: #endif without #if
     262 | #endif /* _ASM_PAGE_H */
         |  ^~~~~
   In file included from include/linux/mm_types_task.h:16,
                    from include/linux/mm_types.h:5,
                    from include/linux/uio.h:10,
                    from include/linux/socket.h:8,
                    from include/linux/compat.h:15:
>> arch/mips/include/asm/page.h:254:29: error: redefinition of 'kaslr_offset'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:254:29: note: previous definition of 'kaslr_offset' with type 'long unsigned int(void)'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
>> arch/mips/include/asm/page.h:262:2: error: #endif without #if
     262 | #endif /* _ASM_PAGE_H */
         |  ^~~~~
   In file included from include/linux/mmzone.h:24,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:15,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/compat.h:17:
>> arch/mips/include/asm/page.h:254:29: error: redefinition of 'kaslr_offset'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:254:29: note: previous definition of 'kaslr_offset' with type 'long unsigned int(void)'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
>> arch/mips/include/asm/page.h:262:2: error: #endif without #if
     262 | #endif /* _ASM_PAGE_H */
         |  ^~~~~
   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:16,
                    from include/linux/sched/mm.h:7,
                    from include/linux/xarray.h:19:
>> arch/mips/include/asm/page.h:254:29: error: redefinition of 'kaslr_offset'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:254:29: note: previous definition of 'kaslr_offset' with type 'long unsigned int(void)'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
>> arch/mips/include/asm/page.h:262:2: error: #endif without #if
     262 | #endif /* _ASM_PAGE_H */
         |  ^~~~~
   In file included from arch/mips/include/asm/ptrace.h:17,
                    from include/linux/sched/signal.h:14,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33:
>> arch/mips/include/asm/page.h:254:29: error: redefinition of 'kaslr_offset'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:254:29: note: previous definition of 'kaslr_offset' with type 'long unsigned int(void)'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
>> arch/mips/include/asm/page.h:262:2: error: #endif without #if
     262 | #endif /* _ASM_PAGE_H */
         |  ^~~~~
   In file included from arch/mips/include/asm/compat.h:9,
                    from include/linux/compat.h:22:
>> arch/mips/include/asm/page.h:254:29: error: redefinition of 'kaslr_offset'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:254:29: note: previous definition of 'kaslr_offset' with type 'long unsigned int(void)'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
>> arch/mips/include/asm/page.h:262:2: error: #endif without #if
     262 | #endif /* _ASM_PAGE_H */
         |  ^~~~~
   In file included from arch/mips/include/asm/pgtable-32.h:13,
                    from arch/mips/include/asm/pgtable.h:14,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/mips/kernel/asm-offsets.c:15:
>> arch/mips/include/asm/page.h:254:29: error: redefinition of 'kaslr_offset'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:254:29: note: previous definition of 'kaslr_offset' with type 'long unsigned int(void)'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
>> arch/mips/include/asm/page.h:262:2: error: #endif without #if
     262 | #endif /* _ASM_PAGE_H */
         |  ^~~~~
   In file included from arch/mips/include/asm/fixmap.h:16,
                    from arch/mips/include/asm/pgtable-32.h:17:
>> arch/mips/include/asm/page.h:254:29: error: redefinition of 'kaslr_offset'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:254:29: note: previous definition of 'kaslr_offset' with type 'long unsigned int(void)'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
>> arch/mips/include/asm/page.h:262:2: error: #endif without #if
     262 | #endif /* _ASM_PAGE_H */
         |  ^~~~~
   In file included from include/linux/mm.h:96:
>> arch/mips/include/asm/page.h:254:29: error: redefinition of 'kaslr_offset'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:254:29: note: previous definition of 'kaslr_offset' with type 'long unsigned int(void)'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
>> arch/mips/include/asm/page.h:262:2: error: #endif without #if
     262 | #endif /* _ASM_PAGE_H */
         |  ^~~~~
   In file included from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/mips/kernel/asm-offsets.c:17:
>> arch/mips/include/asm/page.h:254:29: error: redefinition of 'kaslr_offset'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:254:29: note: previous definition of 'kaslr_offset' with type 'long unsigned int(void)'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
>> arch/mips/include/asm/page.h:262:2: error: #endif without #if
     262 | #endif /* _ASM_PAGE_H */
         |  ^~~~~
   In file included from include/linux/page_counter.h:8,
                    from include/linux/memcontrol.h:17:
>> arch/mips/include/asm/page.h:254:29: error: redefinition of 'kaslr_offset'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:254:29: note: previous definition of 'kaslr_offset' with type 'long unsigned int(void)'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:262:2: error: #endif without #if
     262 | #endif /* _ASM_PAGE_H */
         |  ^~~~~
   In file included from include/linux/swap.h:17:
   arch/mips/include/asm/page.h:254:29: error: redefinition of 'kaslr_offset'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:254:29: note: previous definition of 'kaslr_offset' with type 'long unsigned int(void)'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:262:2: error: #endif without #if
     262 | #endif /* _ASM_PAGE_H */
         |  ^~~~~
   In file included from include/linux/vmalloc.h:9,
                    from include/linux/kvm_host.h:21,
                    from arch/mips/kernel/asm-offsets.c:24:
   arch/mips/include/asm/page.h:254:29: error: redefinition of 'kaslr_offset'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:254:29: note: previous definition of 'kaslr_offset' with type 'long unsigned int(void)'
     254 | static inline unsigned long kaslr_offset(void)
         |                             ^~~~~~~~~~~~
   arch/mips/include/asm/page.h:262:2: error: #endif without #if
     262 | #endif /* _ASM_PAGE_H */
         |  ^~~~~
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
   arch/mips/kernel/asm-offsets.c:179:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     179 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:213:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     213 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:248:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
     248 | void output_signal_defined(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:114: arch/mips/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1298: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +262 arch/mips/include/asm/page.h

^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds    2005-04-16  252  
d4d3ef8b347b73 arch/mips/include/asm/page.h Jinyang He        2021-02-05  253  extern unsigned long __kaslr_offset;
d4d3ef8b347b73 arch/mips/include/asm/page.h Jinyang He        2021-02-05 @254  static inline unsigned long kaslr_offset(void)
d4d3ef8b347b73 arch/mips/include/asm/page.h Jinyang He        2021-02-05  255  {
d4d3ef8b347b73 arch/mips/include/asm/page.h Jinyang He        2021-02-05  256  	return __kaslr_offset;
d4d3ef8b347b73 arch/mips/include/asm/page.h Jinyang He        2021-02-05  257  }
d4d3ef8b347b73 arch/mips/include/asm/page.h Jinyang He        2021-02-05  258  
a02036e796e504 include/asm-mips/page.h      KAMEZAWA Hiroyuki 2006-03-27  259  #include <asm-generic/memory_model.h>
5b17e1cd8928ae arch/mips/include/asm/page.h Arnd Bergmann     2009-05-13  260  #include <asm-generic/getorder.h>
fd4fd5aac12828 include/asm-mips/page.h      Stephen Rothwell  2005-09-03  261  
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds    2005-04-16 @262  #endif /* _ASM_PAGE_H */

:::::: The code at line 262 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
