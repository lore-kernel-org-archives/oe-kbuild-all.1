Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB984622
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 02:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675131212; x=1706667212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dMgLkwuFVBrlv7+ALS44Or0aWkRYmjnYSlL4Px8y3bM=;
  b=JjieisnfppNp/xrdNKeUulanzEt72JUsEJ8VSZcTVvpV9vf81lg5Dbla
   vAwHFWS5nqH8zginkVV6LOz/dKFM+tkGfeilEARW0kW0jXldVi+32fSjm
   j91wnpc0VhLgR9KGcaJ6FPw1N17wVYnMfnOczaMMbL+W0xUotfgIfVH8c
   EfcbKESvt0uTo6pOo1G2H3izUz3/yXAxBhtx6QiiByAbNYFIiT4GMiqTv
   DhaZdUL/16AdKjW3hQmndUaz680QEkL2LaQlwDNhzAK5DnKiFKP/pG9yU
   xjRjZjPvF9EaW/e4AEzsdSy62ynsnfVER6bygXeN1sfl2G4XfIO0BV15a
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="325427049"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="325427049"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 18:13:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="694789150"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="694789150"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Jan 2023 18:13:30 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMg9J-00044P-19;
	Tue, 31 Jan 2023 02:13:29 +0000
Date: Tue, 31 Jan 2023 10:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/ia64/kernel/efi.c:371:30: error: 'ia64_boot_param' undeclared
Message-ID: <202301311057.YeGOYEZb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230125-163113
head:   06897a0964c21c88d28d72b2d7959fc8651a6d21
commit: 235c8a9c16581ec454f2a79dc1a0d00e3d475ddc ia64: Remove COMMAND_LINE_SIZE from uapi
date:   6 days ago
config: ia64-randconfig-r024-20230129 (https://download.01.org/0day-ci/archive/20230131/202301311057.YeGOYEZb-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/235c8a9c16581ec454f2a79dc1a0d00e3d475ddc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230125-163113
        git checkout 235c8a9c16581ec454f2a79dc1a0d00e3d475ddc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash arch/ia64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/ia64/include/asm/ptrace.h:46,
                    from arch/ia64/include/asm/processor.h:20,
                    from arch/ia64/include/asm/timex.h:15,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from arch/ia64/kernel/efi.c:25:
   arch/ia64/kernel/efi.c: In function 'efi_get_pal_addr':
>> arch/ia64/kernel/efi.c:371:30: error: 'ia64_boot_param' undeclared (first use in this function)
     371 |         efi_map_start = __va(ia64_boot_param->efi_memmap);
         |                              ^~~~~~~~~~~~~~~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/efi.c:371:30: note: each undeclared identifier is reported only once for each function it appears in
     371 |         efi_map_start = __va(ia64_boot_param->efi_memmap);
         |                              ^~~~~~~~~~~~~~~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/efi.c: In function 'efi_init':
   arch/ia64/kernel/efi.c:521:27: error: 'ia64_boot_param' undeclared (first use in this function)
     521 |         efi_systab = __va(ia64_boot_param->efi_systab);
         |                           ^~~~~~~~~~~~~~~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/efi.c:490:13: warning: variable 'efi_desc_size' set but not used [-Wunused-but-set-variable]
     490 |         u64 efi_desc_size;
         |             ^~~~~~~~~~~~~
   arch/ia64/kernel/efi.c:489:31: warning: variable 'efi_map_end' set but not used [-Wunused-but-set-variable]
     489 |         void *efi_map_start, *efi_map_end;
         |                               ^~~~~~~~~~~
   arch/ia64/kernel/efi.c: In function 'efi_enter_virtual_mode':
   arch/ia64/kernel/efi.c:610:30: error: 'ia64_boot_param' undeclared (first use in this function)
     610 |         efi_map_start = __va(ia64_boot_param->efi_memmap);
         |                              ^~~~~~~~~~~~~~~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/efi.c: In function 'efi_get_iobase':
   arch/ia64/kernel/efi.c:694:30: error: 'ia64_boot_param' undeclared (first use in this function)
     694 |         efi_map_start = __va(ia64_boot_param->efi_memmap);
         |                              ^~~~~~~~~~~~~~~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/efi.c: In function 'efi_memory_descriptor':
   arch/ia64/kernel/efi.c:727:30: error: 'ia64_boot_param' undeclared (first use in this function)
     727 |         efi_map_start = __va(ia64_boot_param->efi_memmap);
         |                              ^~~~~~~~~~~~~~~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/efi.c: In function 'efi_memmap_intersects':
   arch/ia64/kernel/efi.c:748:30: error: 'ia64_boot_param' undeclared (first use in this function)
     748 |         efi_map_start = __va(ia64_boot_param->efi_memmap);
         |                              ^~~~~~~~~~~~~~~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/efi.c: At top level:
   arch/ia64/kernel/efi.c:971:1: warning: no previous prototype for 'find_memmap_space' [-Wmissing-prototypes]
     971 | find_memmap_space (void)
         | ^~~~~~~~~~~~~~~~~
   arch/ia64/kernel/efi.c: In function 'find_memmap_space':
   arch/ia64/kernel/efi.c:980:30: error: 'ia64_boot_param' undeclared (first use in this function)
     980 |         efi_map_start = __va(ia64_boot_param->efi_memmap);
         |                              ^~~~~~~~~~~~~~~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/efi.c: In function 'efi_memmap_init':
   arch/ia64/kernel/efi.c:1059:30: error: 'ia64_boot_param' undeclared (first use in this function)
    1059 |         efi_map_start = __va(ia64_boot_param->efi_memmap);
         |                              ^~~~~~~~~~~~~~~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/efi.c: In function 'efi_initialize_iomem_resources':
   arch/ia64/kernel/efi.c:1182:30: error: 'ia64_boot_param' undeclared (first use in this function)
    1182 |         efi_map_start = __va(ia64_boot_param->efi_memmap);
         |                              ^~~~~~~~~~~~~~~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
--
   arch/ia64/kernel/setup.c: In function 'reserve_memory':
>> arch/ia64/kernel/setup.c:367:61: error: invalid application of 'sizeof' to incomplete type 'struct ia64_boot_param'
     367 |         rsvd_region[n].end   = rsvd_region[n].start + sizeof(*ia64_boot_param);
         |                                                             ^
   In file included from arch/ia64/include/asm/ptrace.h:46,
                    from arch/ia64/include/asm/processor.h:20,
                    from arch/ia64/include/asm/timex.h:15,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from arch/ia64/kernel/setup.c:26:
>> arch/ia64/kernel/setup.c:370:68: error: invalid use of undefined type 'struct ia64_boot_param'
     370 |         rsvd_region[n].start = (unsigned long) __va(ia64_boot_param->efi_memmap);
         |                                                                    ^~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/setup.c:371:70: error: invalid use of undefined type 'struct ia64_boot_param'
     371 |         rsvd_region[n].end   = rsvd_region[n].start + ia64_boot_param->efi_memmap_size;
         |                                                                      ^~
   arch/ia64/kernel/setup.c:374:68: error: invalid use of undefined type 'struct ia64_boot_param'
     374 |         rsvd_region[n].start = (unsigned long) __va(ia64_boot_param->command_line);
         |                                                                    ^~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/setup.c:376:62: error: invalid use of undefined type 'struct ia64_boot_param'
     376 |                                 + strlen(__va(ia64_boot_param->command_line)) + 1);
         |                                                              ^~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/setup.c:384:28: error: invalid use of undefined type 'struct ia64_boot_param'
     384 |         if (ia64_boot_param->initrd_start) {
         |                            ^~
   arch/ia64/kernel/setup.c:385:75: error: invalid use of undefined type 'struct ia64_boot_param'
     385 |                 rsvd_region[n].start = (unsigned long)__va(ia64_boot_param->initrd_start);
         |                                                                           ^~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/setup.c:386:78: error: invalid use of undefined type 'struct ia64_boot_param'
     386 |                 rsvd_region[n].end   = rsvd_region[n].start + ia64_boot_param->initrd_size;
         |                                                                              ^~
   arch/ia64/kernel/setup.c: In function 'find_initrd':
   arch/ia64/kernel/setup.c:433:28: error: invalid use of undefined type 'struct ia64_boot_param'
     433 |         if (ia64_boot_param->initrd_start) {
         |                            ^~
   arch/ia64/kernel/setup.c:434:67: error: invalid use of undefined type 'struct ia64_boot_param'
     434 |                 initrd_start = (unsigned long)__va(ia64_boot_param->initrd_start);
         |                                                                   ^~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/setup.c:435:60: error: invalid use of undefined type 'struct ia64_boot_param'
     435 |                 initrd_end   = initrd_start+ia64_boot_param->initrd_size;
         |                                                            ^~
   In file included from include/linux/numa.h:24,
                    from arch/ia64/include/asm/nodedata.h:14,
                    from arch/ia64/include/asm/processor.h:81:
   arch/ia64/kernel/setup.c:438:53: error: invalid use of undefined type 'struct ia64_boot_param'
     438 |                        initrd_start, ia64_boot_param->initrd_size);
         |                                                     ^~
   include/linux/printk.h:429:33: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   arch/ia64/kernel/setup.c:437:17: note: in expansion of macro 'printk'
     437 |                 printk(KERN_INFO "Initial ramdisk at: 0x%lx (%llu bytes)\n",
         |                 ^~~~~~
   arch/ia64/kernel/setup.c: In function 'screen_info_setup':
   arch/ia64/kernel/setup.c:504:29: error: invalid use of undefined type 'struct ia64_boot_param'
     504 |         if (!ia64_boot_param->console_info.num_rows ||
         |                             ^~
   arch/ia64/kernel/setup.c:505:29: error: invalid use of undefined type 'struct ia64_boot_param'
     505 |             !ia64_boot_param->console_info.num_cols) {
         |                             ^~
   arch/ia64/kernel/setup.c:513:41: error: invalid use of undefined type 'struct ia64_boot_param'
     513 |                 orig_x = ia64_boot_param->console_info.orig_x;
         |                                         ^~
   arch/ia64/kernel/setup.c:514:41: error: invalid use of undefined type 'struct ia64_boot_param'
     514 |                 orig_y = ia64_boot_param->console_info.orig_y;
         |                                         ^~
   arch/ia64/kernel/setup.c:515:43: error: invalid use of undefined type 'struct ia64_boot_param'
     515 |                 num_cols = ia64_boot_param->console_info.num_cols;
         |                                           ^~
   arch/ia64/kernel/setup.c:516:43: error: invalid use of undefined type 'struct ia64_boot_param'
     516 |                 num_rows = ia64_boot_param->console_info.num_rows;
         |                                           ^~
   arch/ia64/kernel/setup.c: In function 'setup_arch':
   arch/ia64/kernel/setup.c:554:42: error: invalid use of undefined type 'struct ia64_boot_param'
     554 |         *cmdline_p = __va(ia64_boot_param->command_line);
         |                                          ^~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/setup.c: At top level:
   arch/ia64/kernel/setup.c:1071:1: warning: no previous prototype for 'check_bugs' [-Wmissing-prototypes]
    1071 | check_bugs (void)
         | ^~~~~~~~~~
--
   arch/ia64/kernel/traps.c:35:1: warning: no previous prototype for 'trap_init' [-Wmissing-prototypes]
      35 | trap_init (void)
         | ^~~~~~~~~
   arch/ia64/kernel/traps.c: In function 'trap_init':
>> arch/ia64/kernel/traps.c:37:13: error: 'ia64_boot_param' undeclared (first use in this function)
      37 |         if (ia64_boot_param->fpswa)
         |             ^~~~~~~~~~~~~~~
   arch/ia64/kernel/traps.c:37:13: note: each undeclared identifier is reported only once for each function it appears in
   arch/ia64/kernel/traps.c: At top level:
   arch/ia64/kernel/traps.c:43:1: warning: no previous prototype for 'die' [-Wmissing-prototypes]
      43 | die (const char *str, struct pt_regs *regs, long err)
         | ^~~
   arch/ia64/kernel/traps.c:93:1: warning: no previous prototype for 'die_if_kernel' [-Wmissing-prototypes]
      93 | die_if_kernel (char *str, struct pt_regs *regs, long err)
         | ^~~~~~~~~~~~~
   arch/ia64/kernel/traps.c:101:11: warning: no previous prototype for 'ia64_bad_break' [-Wmissing-prototypes]
     101 | __kprobes ia64_bad_break (unsigned long break_num, struct pt_regs *regs)
         |           ^~~~~~~~~~~~~~
   arch/ia64/kernel/traps.c:387:1: warning: no previous prototype for 'ia64_illegal_op_fault' [-Wmissing-prototypes]
     387 | ia64_illegal_op_fault (unsigned long ec, long arg1, long arg2, long arg3,
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/ia64/kernel/traps.c:416:1: warning: no previous prototype for 'ia64_fault' [-Wmissing-prototypes]
     416 | ia64_fault (unsigned long vector, unsigned long isr, unsigned long ifa,
         | ^~~~~~~~~~


vim +/ia64_boot_param +371 arch/ia64/kernel/efi.c

f14f75b81187cd Jes Sorensen    2005-06-21  356  
^1da177e4c3f41 Linus Torvalds  2005-04-16  357  /*
965e7c8affeca2 Aron Griffis    2008-01-08  358   * Look for the PAL_CODE region reported by EFI and map it using an
^1da177e4c3f41 Linus Torvalds  2005-04-16  359   * ITR to enable safe PAL calls in virtual mode.  See IA-64 Processor
^1da177e4c3f41 Linus Torvalds  2005-04-16  360   * Abstraction Layer chapter 11 in ADAG
^1da177e4c3f41 Linus Torvalds  2005-04-16  361   */
^1da177e4c3f41 Linus Torvalds  2005-04-16  362  void *
^1da177e4c3f41 Linus Torvalds  2005-04-16  363  efi_get_pal_addr (void)
^1da177e4c3f41 Linus Torvalds  2005-04-16  364  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  365  	void *efi_map_start, *efi_map_end, *p;
^1da177e4c3f41 Linus Torvalds  2005-04-16  366  	efi_memory_desc_t *md;
^1da177e4c3f41 Linus Torvalds  2005-04-16  367  	u64 efi_desc_size;
^1da177e4c3f41 Linus Torvalds  2005-04-16  368  	int pal_code_count = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  369  	u64 vaddr, mask;
^1da177e4c3f41 Linus Torvalds  2005-04-16  370  
^1da177e4c3f41 Linus Torvalds  2005-04-16 @371  	efi_map_start = __va(ia64_boot_param->efi_memmap);
^1da177e4c3f41 Linus Torvalds  2005-04-16  372  	efi_map_end   = efi_map_start + ia64_boot_param->efi_memmap_size;
^1da177e4c3f41 Linus Torvalds  2005-04-16  373  	efi_desc_size = ia64_boot_param->efi_memdesc_size;
^1da177e4c3f41 Linus Torvalds  2005-04-16  374  
^1da177e4c3f41 Linus Torvalds  2005-04-16  375  	for (p = efi_map_start; p < efi_map_end; p += efi_desc_size) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  376  		md = p;
^1da177e4c3f41 Linus Torvalds  2005-04-16  377  		if (md->type != EFI_PAL_CODE)
^1da177e4c3f41 Linus Torvalds  2005-04-16  378  			continue;
^1da177e4c3f41 Linus Torvalds  2005-04-16  379  
^1da177e4c3f41 Linus Torvalds  2005-04-16  380  		if (++pal_code_count > 1) {
7d9aed26ed11d7 Aron Griffis    2008-02-04  381  			printk(KERN_ERR "Too many EFI Pal Code memory ranges, "
e088a4ad7fa53c Matthew Wilcox  2009-05-22  382  			       "dropped @ %llx\n", md->phys_addr);
^1da177e4c3f41 Linus Torvalds  2005-04-16  383  			continue;
^1da177e4c3f41 Linus Torvalds  2005-04-16  384  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  385  		/*
7d9aed26ed11d7 Aron Griffis    2008-02-04  386  		 * The only ITLB entry in region 7 that is used is the one
7d9aed26ed11d7 Aron Griffis    2008-02-04  387  		 * installed by __start().  That entry covers a 64MB range.
^1da177e4c3f41 Linus Torvalds  2005-04-16  388  		 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  389  		mask  = ~((1 << KERNEL_TR_PAGE_SHIFT) - 1);
^1da177e4c3f41 Linus Torvalds  2005-04-16  390  		vaddr = PAGE_OFFSET + md->phys_addr;
^1da177e4c3f41 Linus Torvalds  2005-04-16  391  
^1da177e4c3f41 Linus Torvalds  2005-04-16  392  		/*
7d9aed26ed11d7 Aron Griffis    2008-02-04  393  		 * We must check that the PAL mapping won't overlap with the
7d9aed26ed11d7 Aron Griffis    2008-02-04  394  		 * kernel mapping.
^1da177e4c3f41 Linus Torvalds  2005-04-16  395  		 *
7d9aed26ed11d7 Aron Griffis    2008-02-04  396  		 * PAL code is guaranteed to be aligned on a power of 2 between
7d9aed26ed11d7 Aron Griffis    2008-02-04  397  		 * 4k and 256KB and that only one ITR is needed to map it. This
7d9aed26ed11d7 Aron Griffis    2008-02-04  398  		 * implies that the PAL code is always aligned on its size,
7d9aed26ed11d7 Aron Griffis    2008-02-04  399  		 * i.e., the closest matching page size supported by the TLB.
7d9aed26ed11d7 Aron Griffis    2008-02-04  400  		 * Therefore PAL code is guaranteed never to cross a 64MB unless
7d9aed26ed11d7 Aron Griffis    2008-02-04  401  		 * it is bigger than 64MB (very unlikely!).  So for now the
7d9aed26ed11d7 Aron Griffis    2008-02-04  402  		 * following test is enough to determine whether or not we need
7d9aed26ed11d7 Aron Griffis    2008-02-04  403  		 * a dedicated ITR for the PAL code.
^1da177e4c3f41 Linus Torvalds  2005-04-16  404  		 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  405  		if ((vaddr & mask) == (KERNEL_START & mask)) {
d4ed80841ad4a1 Harvey Harrison 2008-03-04  406  			printk(KERN_INFO "%s: no need to install ITR for PAL code\n",
d4ed80841ad4a1 Harvey Harrison 2008-03-04  407  			       __func__);
^1da177e4c3f41 Linus Torvalds  2005-04-16  408  			continue;
^1da177e4c3f41 Linus Torvalds  2005-04-16  409  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  410  
685c7f5d3629d5 Li Zefan        2007-11-21  411  		if (efi_md_size(md) > IA64_GRANULE_SIZE)
965e7c8affeca2 Aron Griffis    2008-01-08  412  			panic("Whoa!  PAL code size bigger than a granule!");
^1da177e4c3f41 Linus Torvalds  2005-04-16  413  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
