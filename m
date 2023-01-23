Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0145E7C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 18:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674499940; x=1706035940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KW330JoZjxjdy4WxELaOtDnlPPuIG1a0APCDRhswfOc=;
  b=HLNwb8EKjyn915HsyasTgtC19F5pQMDYiRYpi5LIizudCDZ47aow7G5/
   W8ssEu84v8b8QwUEpfjbZKo1S/bCptU60sVKQs58n7Q1J3Zs8ZFoXB8QC
   au9L+Sqj811mmK0Ti3rJATjguRf2Sr+CWNJ6NLP2XwUrB0fq6xS0NyuCx
   U4ltBCQnICI8NG2vJa7I5lLhzhnXUdUg2Ds4CaUZSdy83bZJmcdE0wdKR
   QhBPJvT0X4obOgEj4Yo4Hz5vbTOw0MVKKS//Agw1kG9e+VsK/b++4bqxx
   ooTIi6LWysfXwS3ABo4OvXDfu+fr7DbCHw1aTnJVu97PSdrDSVRd63zXO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353386739"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="353386739"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:52:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655122167"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="655122167"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Jan 2023 10:52:17 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK1vU-0005pE-12;
	Mon, 23 Jan 2023 18:52:16 +0000
Date: Tue, 24 Jan 2023 02:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:misc/pfn_valid/v0 1/1] arch/m68k/include/asm/page_mm.h:140:
 warning: "pfn_valid" redefined
Message-ID: <202301240256.7xjsc0eX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git misc/pfn_valid/v0
head:   80b44d294c92a4d3645936e12178b4d2c475a641
commit: 80b44d294c92a4d3645936e12178b4d2c475a641 [1/1] mm, arch: add generic implementation of pfn_valid() for FLATMEM
config: m68k-buildonly-randconfig-r004-20230123 (https://download.01.org/0day-ci/archive/20230124/202301240256.7xjsc0eX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=80b44d294c92a4d3645936e12178b4d2c475a641
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt misc/pfn_valid/v0
        git checkout 80b44d294c92a4d3645936e12178b4d2c475a641
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/m68k/kernel/asm-offsets.c:15:
>> arch/m68k/include/asm/page_mm.h:140: warning: "pfn_valid" redefined
     140 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         | 
   In file included from arch/m68k/include/asm/page_mm.h:137:
   include/asm-generic/memory_model.h:31: note: this is the location of the previous definition
      31 | #define pfn_valid pfn_valid
         | 
--
   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from arch/m68k/mac/config.c:14:
>> arch/m68k/include/asm/page_mm.h:140: warning: "pfn_valid" redefined
     140 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         | 
   In file included from arch/m68k/include/asm/page_mm.h:137:
   include/asm-generic/memory_model.h:31: note: this is the location of the previous definition
      31 | #define pfn_valid pfn_valid
         | 
   arch/m68k/mac/config.c:961:12: warning: no previous prototype for 'mac_platform_init' [-Wmissing-prototypes]
     961 | int __init mac_platform_init(void)
         |            ^~~~~~~~~~~~~~~~~
--
   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/m68k/mac/iop.c:113:
>> arch/m68k/include/asm/page_mm.h:140: warning: "pfn_valid" redefined
     140 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         | 
   In file included from arch/m68k/include/asm/page_mm.h:137:
   include/asm-generic/memory_model.h:31: note: this is the location of the previous definition
      31 | #define pfn_valid pfn_valid
         | 
   arch/m68k/mac/iop.c:235:13: warning: no previous prototype for 'iop_init' [-Wmissing-prototypes]
     235 | void __init iop_init(void)
         |             ^~~~~~~~
--
   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from include/linux/clocksource.h:17,
                    from arch/m68k/mac/via.c:26:
>> arch/m68k/include/asm/page_mm.h:140: warning: "pfn_valid" redefined
     140 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         | 
   In file included from arch/m68k/include/asm/page_mm.h:137:
   include/asm-generic/memory_model.h:31: note: this is the location of the previous definition
      31 | #define pfn_valid pfn_valid
         | 
   arch/m68k/mac/via.c:111:13: warning: no previous prototype for 'via_init' [-Wmissing-prototypes]
     111 | void __init via_init(void)
         |             ^~~~~~~~
   arch/m68k/mac/via.c:593:13: warning: no previous prototype for 'via_init_clock' [-Wmissing-prototypes]
     593 | void __init via_init_clock(void)
         |             ^~~~~~~~~~~~~~
--
   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/m68k/mac/oss.c:20:
>> arch/m68k/include/asm/page_mm.h:140: warning: "pfn_valid" redefined
     140 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         | 
   In file included from arch/m68k/include/asm/page_mm.h:137:
   include/asm-generic/memory_model.h:31: note: this is the location of the previous definition
      31 | #define pfn_valid pfn_valid
         | 
   arch/m68k/mac/oss.c:37:13: warning: no previous prototype for 'oss_init' [-Wmissing-prototypes]
      37 | void __init oss_init(void)
         |             ^~~~~~~~
--
   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/m68k/mac/psc.c:19:
>> arch/m68k/include/asm/page_mm.h:140: warning: "pfn_valid" redefined
     140 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         | 
   In file included from arch/m68k/include/asm/page_mm.h:137:
   include/asm-generic/memory_model.h:31: note: this is the location of the previous definition
      31 | #define pfn_valid pfn_valid
         | 
   arch/m68k/mac/psc.c:76:13: warning: no previous prototype for 'psc_init' [-Wmissing-prototypes]
      76 | void __init psc_init(void)
         |             ^~~~~~~~
--
   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from arch/m68k/mac/baboon.c:12:
>> arch/m68k/include/asm/page_mm.h:140: warning: "pfn_valid" redefined
     140 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         | 
   In file included from arch/m68k/include/asm/page_mm.h:137:
   include/asm-generic/memory_model.h:31: note: this is the location of the previous definition
      31 | #define pfn_valid pfn_valid
         | 
   arch/m68k/mac/baboon.c:25:13: warning: no previous prototype for 'baboon_init' [-Wmissing-prototypes]
      25 | void __init baboon_init(void)
         |             ^~~~~~~~~~~
--
   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/m68k/mac/macboing.c:13:
>> arch/m68k/include/asm/page_mm.h:140: warning: "pfn_valid" redefined
     140 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         | 
   In file included from arch/m68k/include/asm/page_mm.h:137:
   include/asm-generic/memory_model.h:31: note: this is the location of the previous definition
      31 | #define pfn_valid pfn_valid
         | 
   arch/m68k/mac/macboing.c:164:6: warning: no previous prototype for 'mac_mksound' [-Wmissing-prototypes]
     164 | void mac_mksound( unsigned int freq, unsigned int length )
         |      ^~~~~~~~~~~
   arch/m68k/mac/macboing.c:29:26: warning: 'sine_data' defined but not used [-Wunused-const-variable=]
      29 | static const signed char sine_data[] = {
         |                          ^~~~~~~~~
--
   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/delay.h:23,
                    from arch/m68k/mac/misc.c:9:
>> arch/m68k/include/asm/page_mm.h:140: warning: "pfn_valid" redefined
     140 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         | 
   In file included from arch/m68k/include/asm/page_mm.h:137:
   include/asm-generic/memory_model.h:31: note: this is the location of the previous definition
      31 | #define pfn_valid pfn_valid
         | 
   arch/m68k/mac/misc.c: In function 'unmktime':
   arch/m68k/mac/misc.c:557:33: warning: variable 'yday' set but not used [-Wunused-but-set-variable]
     557 |         int days, rem, y, wday, yday;
         |                                 ^~~~
   arch/m68k/mac/misc.c: At top level:
   arch/m68k/mac/misc.c:609:5: warning: no previous prototype for 'mac_hwclk' [-Wmissing-prototypes]
     609 | int mac_hwclk(int op, struct rtc_time *t)
         |     ^~~~~~~~~
--
   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/m68k/kernel/asm-offsets.c:15:
>> arch/m68k/include/asm/page_mm.h:140: warning: "pfn_valid" redefined
     140 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         | 
   In file included from arch/m68k/include/asm/page_mm.h:137:
   include/asm-generic/memory_model.h:31: note: this is the location of the previous definition
      31 | #define pfn_valid pfn_valid
         | 


vim +/pfn_valid +140 arch/m68k/include/asm/page_mm.h

^1da177e4c3f41 include/asm-m68k/page.h         Linus Torvalds     2005-04-16  138  
a65a802aadba07 arch/m68k/include/asm/page_mm.h Geert Uytterhoeven 2021-03-05  139  #define virt_addr_valid(kaddr)	((unsigned long)(kaddr) >= PAGE_OFFSET && (unsigned long)(kaddr) < (unsigned long)high_memory)
^1da177e4c3f41 include/asm-m68k/page.h         Linus Torvalds     2005-04-16 @140  #define pfn_valid(pfn)		virt_addr_valid(pfn_to_virt(pfn))
^1da177e4c3f41 include/asm-m68k/page.h         Linus Torvalds     2005-04-16  141  

:::::: The code at line 140 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
