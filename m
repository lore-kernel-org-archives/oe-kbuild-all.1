Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9B8EA5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674485195; x=1706021195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BZd+BSLxqWvqjnEkQQYt/NHiTFxkWsqyt6XWP4Nh8n0=;
  b=MjOel3jNuSLmwzDLD5Ts07wnmPT94anG5RB60AcC8wwOy3OiSkAgq+vW
   rgNZY85vgCsWLJQr55TQRvFtY+xwKvcq1qXgtLcQTY86YQLHP8we4aHiR
   K3Vsg1Ti1NTh9wVV2rg/RaiG3vzgAmc2GZcocrHPs+YTLGjue+8szP0Ww
   FScJpliiVr2yp8BXn0bqTYMQYmu6OK5rgdns8X2NOyt9ikTlQTdHJz5cH
   byNftAvbF0FM0+h7UZkK9mHGCvaCtbjalVNsTIPyAD7skaJ7b8EfJ7SYl
   6ZjgfNvjduzTlw+PVYVBe3tyj08JXp1M0ULHKgAn+yKEMTn3Xa3DYkTuz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="305712143"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="305712143"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 06:46:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="692183235"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="692183235"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jan 2023 06:46:11 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJy5K-0005hg-0s;
	Mon, 23 Jan 2023 14:46:10 +0000
Date: Mon, 23 Jan 2023 22:46:03 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/ia64/include/asm/kexec.h:27:24: warning: 'struct
 ia64_boot_param' declared inside parameter list will not be visible outside
 of this definition or declaration
Message-ID: <202301232232.IqHmbNXO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230123-181826
head:   569c0e5183ad71e231b95cb03d3ac25ba572b6db
commit: c2d5b47bf11d9e79370ea6994fbae042cfa9d38b ia64: Remove COMMAND_LINE_SIZE from uapi
date:   4 hours ago
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20230123/202301232232.IqHmbNXO-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c2d5b47bf11d9e79370ea6994fbae042cfa9d38b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230123-181826
        git checkout c2d5b47bf11d9e79370ea6994fbae042cfa9d38b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash arch/ia64/kernel/ drivers/net/ethernet/qlogic/qed/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/kexec.h:36,
                    from include/linux/crash_dump.h:5,
                    from arch/ia64/kernel/efi.c:27:
>> arch/ia64/include/asm/kexec.h:27:24: warning: 'struct ia64_boot_param' declared inside parameter list will not be visible outside of this definition or declaration
      27 |                 struct ia64_boot_param *, unsigned long);
         |                        ^~~~~~~~~~~~~~~
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
   arch/ia64/kernel/efi.c:371:30: error: 'ia64_boot_param' undeclared (first use in this function)
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
   arch/ia64/kernel/efi.c: In function 'kdump_find_rsvd_region':
   arch/ia64/kernel/efi.c:1291:30: error: 'ia64_boot_param' undeclared (first use in this function)
    1291 |         efi_map_start = __va(ia64_boot_param->efi_memmap);
         |                              ^~~~~~~~~~~~~~~
   arch/ia64/include/asm/page.h:124:54: note: in definition of macro '__va'
     124 | #define __va(x)         ({ia64_va _v; _v.l = (long) (x); _v.f.reg = -1; _v.p;})
         |                                                      ^
   arch/ia64/kernel/efi.c: In function 'vmcore_find_descriptor_size':
   arch/ia64/kernel/efi.c:1333:30: error: 'ia64_boot_param' undeclared (first use in this function)
    1333 |         efi_map_start = __va(ia64_boot_param->efi_memmap);
--
   In file included from arch/ia64/kernel/process.c:43:
>> arch/ia64/include/asm/kexec.h:27:24: warning: 'struct ia64_boot_param' declared inside parameter list will not be visible outside of this definition or declaration
      27 |                 struct ia64_boot_param *, unsigned long);
         |                        ^~~~~~~~~~~~~~~
   arch/ia64/kernel/process.c:156:1: warning: no previous prototype for 'console_print' [-Wmissing-prototypes]
     156 | console_print(const char *s)
         | ^~~~~~~~~~~~~
   arch/ia64/kernel/process.c:162:1: warning: no previous prototype for 'do_notify_resume_user' [-Wmissing-prototypes]
     162 | do_notify_resume_user(sigset_t *unused, struct sigscratch *scr, long in_syscall)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/ia64/kernel/process.c:404:17: warning: no previous prototype for 'ia64_clone' [-Wmissing-prototypes]
     404 | asmlinkage long ia64_clone(unsigned long clone_flags, unsigned long stack_start,
         |                 ^~~~~~~~~~
   arch/ia64/kernel/process.c:558:1: warning: no previous prototype for 'cpu_halt' [-Wmissing-prototypes]
     558 | cpu_halt (void)
         | ^~~~~~~~
--
   In file included from include/linux/kexec.h:36,
                    from arch/ia64/kernel/setup.c:53:
>> arch/ia64/include/asm/kexec.h:27:24: warning: 'struct ia64_boot_param' declared inside parameter list will not be visible outside of this definition or declaration
      27 |                 struct ia64_boot_param *, unsigned long);
         |                        ^~~~~~~~~~~~~~~
   arch/ia64/kernel/setup.c: In function 'setup_crashkernel':
   arch/ia64/kernel/setup.c:313:47: error: invalid use of undefined type 'struct ia64_boot_param'
     313 |         efi_memmap_res.start = ia64_boot_param->efi_memmap;
         |                                               ^~
   arch/ia64/kernel/setup.c:315:32: error: invalid use of undefined type 'struct ia64_boot_param'
     315 |                 ia64_boot_param->efi_memmap_size;
         |                                ^~
   arch/ia64/kernel/setup.c:318:23: error: invalid application of 'sizeof' to incomplete type 'struct ia64_boot_param'
     318 |                 sizeof(*ia64_boot_param);
         |                       ^
   arch/ia64/kernel/setup.c: In function 'reserve_memory':
   arch/ia64/kernel/setup.c:367:61: error: invalid application of 'sizeof' to incomplete type 'struct ia64_boot_param'
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
   arch/ia64/kernel/setup.c:370:68: error: invalid use of undefined type 'struct ia64_boot_param'
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
--
   In file included from arch/ia64/kernel/mca.c:101:
>> arch/ia64/include/asm/kexec.h:27:24: warning: 'struct ia64_boot_param' declared inside parameter list will not be visible outside of this definition or declaration
      27 |                 struct ia64_boot_param *, unsigned long);
         |                        ^~~~~~~~~~~~~~~
   arch/ia64/kernel/mca.c: In function 'ia64_mca_printk':
   arch/ia64/kernel/mca.c:212:13: warning: variable 'printed_len' set but not used [-Wunused-but-set-variable]
     212 |         int printed_len;
         |             ^~~~~~~~~~~
   arch/ia64/kernel/mca.c: At top level:
   arch/ia64/kernel/mca.c:504:1: warning: no previous prototype for 'search_mca_table' [-Wmissing-prototypes]
     504 | search_mca_table (const struct mca_table_entry *first,
         | ^~~~~~~~~~~~~~~~
   arch/ia64/kernel/mca.c:607:1: warning: no previous prototype for 'ia64_mca_register_cpev' [-Wmissing-prototypes]
     607 | ia64_mca_register_cpev (int cpev)
         | ^~~~~~~~~~~~~~~~~~~~~~
   arch/ia64/kernel/mca.c:1284:1: warning: no previous prototype for 'ia64_mca_handler' [-Wmissing-prototypes]
    1284 | ia64_mca_handler(struct pt_regs *regs, struct switch_stack *sw,
         | ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/kexec.h:36,
                    from arch/ia64/kernel/smp.c:34:
>> arch/ia64/include/asm/kexec.h:27:24: warning: 'struct ia64_boot_param' declared inside parameter list will not be visible outside of this definition or declaration
      27 |                 struct ia64_boot_param *, unsigned long);
         |                        ^~~~~~~~~~~~~~~
--
   In file included from include/linux/kexec.h:36,
                    from arch/ia64/kernel/machine_kexec.c:12:
>> arch/ia64/include/asm/kexec.h:27:24: warning: 'struct ia64_boot_param' declared inside parameter list will not be visible outside of this definition or declaration
      27 |                 struct ia64_boot_param *, unsigned long);
         |                        ^~~~~~~~~~~~~~~
>> arch/ia64/kernel/machine_kexec.c:32:48: warning: 'struct ia64_boot_param' declared inside parameter list will not be visible outside of this definition or declaration
      32 |                                         struct ia64_boot_param *boot_param,
         |                                                ^~~~~~~~~~~~~~~
   arch/ia64/kernel/machine_kexec.c: In function 'ia64_machine_kexec':
   arch/ia64/kernel/machine_kexec.c:132:43: error: 'ia64_boot_param' undeclared (first use in this function)
     132 |         (*rnk)(image->head, image->start, ia64_boot_param,
         |                                           ^~~~~~~~~~~~~~~
   arch/ia64/kernel/machine_kexec.c:132:43: note: each undeclared identifier is reported only once for each function it appears in


vim +27 arch/ia64/include/asm/kexec.h

a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  18  
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  19  #define kexec_flush_icache_page(page) do { \
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  20                  unsigned long page_addr = (unsigned long)page_address(page); \
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  21                  flush_icache_range(page_addr, page_addr + PAGE_SIZE); \
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  22          } while(0)
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  23  
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  24  extern struct kimage *ia64_kimage;
c5a69d57eb48e3 include/asm-ia64/kexec.h Tobias Klauser 2007-02-17  25  extern const unsigned int relocate_new_kernel_size;
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  26  extern void relocate_new_kernel(unsigned long, unsigned long,
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07 @27  		struct ia64_boot_param *, unsigned long);
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  28  static inline void
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  29  crash_setup_regs(struct pt_regs *newregs, struct pt_regs *oldregs)
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  30  {
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  31  }
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  32  extern struct resource efi_memmap_res;
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  33  extern struct resource boot_param_res;
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  34  extern void kdump_smp_send_stop(void);
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  35  extern void kdump_smp_send_init(void);
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  36  extern void kexec_disable_iosapic(void);
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  37  extern void crash_save_this_cpu(void);
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  38  struct rsvd_region;
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  39  extern unsigned long kdump_find_rsvd_region(unsigned long size,
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  40  		struct rsvd_region *rsvd_regions, int n);
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  41  extern void kdump_cpu_freeze(struct unw_frame_info *info, void *arg);
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  42  extern int kdump_status[];
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  43  extern atomic_t kdump_cpu_freezed;
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  44  extern atomic_t kdump_in_progress;
a79561134f38de include/asm-ia64/kexec.h Zou Nan hai    2006-12-07  45  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
