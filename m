Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B96659
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 07:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675148982; x=1706684982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b9RM2StDCB5n+iCZxpZaADaNalqAjFqGmrWulv8eDpk=;
  b=PM5VPdiG6v5vzag4xaD+5gr1fYef9JtbBbSvSUflwNK/dNE5AaRmi79O
   +zmyMhef0mW0n/DfCxWpd9/oYJ6LuCOK1eOHRUoMOy+Q8eRDps66rucmC
   RyIPqzMbs6uZ//yjNV5lAYHCcR+7ukiXWGdz3vOYbGqM+dptnQOgOMAoI
   xrMmYeruxfA1L+VNNNX8fe3x67xClKPHkNUts9k0KHeV+mcLRch7zjuIG
   88ie9oxqS00J4QoaNQr9pLf0vhb8jUoA/bsITqxbi5Ipifx2MycWjUo5A
   LjfXF2Z2B+OH3eexNiwf50giHfJTzLjMU+5+rwtD/gWBzUJUdoz4Dfgan
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="311392432"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="311392432"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 23:09:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="806998880"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="806998880"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2023 23:09:41 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMklw-0004GA-28;
	Tue, 31 Jan 2023 07:09:40 +0000
Date: Tue, 31 Jan 2023 15:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/ia64/include/asm/kexec.h:27:24: warning: 'struct
 ia64_boot_param' declared inside parameter list will not be visible outside
 of this definition or declaration
Message-ID: <202301311520.z27dymN0-lkp@intel.com>
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
config: ia64-randconfig-r026-20230130 (https://download.01.org/0day-ci/archive/20230131/202301311520.z27dymN0-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash arch/ia64/kernel/ drivers/cxl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

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
