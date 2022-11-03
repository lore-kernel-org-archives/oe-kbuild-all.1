Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF157E2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Nov 2022 04:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667450592; x=1698986592;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kOHoUxF90xmpvsBuwwaZqA//IzsSG+dE6OrkGn5l+U4=;
  b=IE7V0jEMIPo15H6V5jopkHiWhfgttpTcjkmgYRUKKLjEE+KVkU9aBv9e
   P7zuq6uf1sSUM56LDXFmJjHtqdnSos//TzIqH/xl3lkP9i1eNyoMTi+8Y
   waF29LkR+utlD8uffafxK5Dc0UFkqLWEz3Db1lbdFon8wBZfqP7ErXpTa
   86IHPzdB6EXt9DneseLuzuBMqXy+fseVHTfKuuOqdMKUMRmf1N8vibvbM
   oiBZSpwJCMGXnr0BBpWjcfseN7Ehdg66X3Lj74iHgYQkmBUEudkKBxPji
   U0EjTz3D3SVkA0LljcVXlPWs7zl7AK3KSwPmDhDp1weThPU1hk/ilEwOY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="309582380"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="309582380"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 21:43:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="777161857"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="777161857"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2022 21:43:09 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqS4L-000FUS-0J;
	Thu, 03 Nov 2022 04:43:09 +0000
Date: Thu, 3 Nov 2022 12:42:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_r 19120/28792]
 drivers/usb/host/xhci-dbgtty.c:497:6: warning: no previous prototype for
 function 'xhci_dbc_tty_unregister_device'
Message-ID: <202211031258.svVxDYJk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="F+1AKTiXM4L/mNPj"
Content-Disposition: inline


--F+1AKTiXM4L/mNPj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_r
head:   7d81e670e9481722f876c125f93a1dbd7aac8cd8
commit: b652a52d36a85d1b731921ba08e701d7150ce200 [19120/28792] Merge branch 'aosp/android-4.19-stable' into android_r
config: mips-randconfig-r024-20221102
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel/linux-intel-lts/commit/b652a52d36a85d1b731921ba08e701d7150ce200
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 4.19/android_r
        git checkout b652a52d36a85d1b731921ba08e701d7150ce200
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/usb/host/ security/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-dbgtty.c:497:6: warning: no previous prototype for function 'xhci_dbc_tty_unregister_device' [-Wmissing-prototypes]
   void xhci_dbc_tty_unregister_device(struct xhci_hcd *xhci)
        ^
   drivers/usb/host/xhci-dbgtty.c:497:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xhci_dbc_tty_unregister_device(struct xhci_hcd *xhci)
   ^
   static 
   1 warning generated.
--
>> drivers/usb/host/xhci-dbgcap.c:191:6: warning: no previous prototype for function 'xhci_dbc_flush_requests' [-Wmissing-prototypes]
   void xhci_dbc_flush_requests(struct xhci_dbc *dbc)
        ^
   drivers/usb/host/xhci-dbgcap.c:191:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xhci_dbc_flush_requests(struct xhci_dbc *dbc)
   ^
   static 
   drivers/usb/host/xhci-dbgcap.c:794:8: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int                     ret;
                                   ^
   2 warnings generated.
   drivers/usb/host/xhci-dbgcap.c:18: warning: cannot understand function prototype: 'struct dbc_function *dbc_registered_func; '
--
>> security/security.c:381:5: warning: no previous prototype for function 'lsm_file_alloc' [-Wmissing-prototypes]
   int lsm_file_alloc(struct file *file)
       ^
   security/security.c:381:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int lsm_file_alloc(struct file *file)
   ^
   static 
>> security/security.c:402:5: warning: no previous prototype for function 'lsm_task_alloc' [-Wmissing-prototypes]
   int lsm_task_alloc(struct task_struct *task)
       ^
   security/security.c:402:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int lsm_task_alloc(struct task_struct *task)
   ^
   static 
>> security/security.c:482:5: warning: no previous prototype for function 'lsm_ipc_alloc' [-Wmissing-prototypes]
   int lsm_ipc_alloc(struct kern_ipc_perm *kip)
       ^
   security/security.c:482:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int lsm_ipc_alloc(struct kern_ipc_perm *kip)
   ^
   static 
>> security/security.c:504:5: warning: no previous prototype for function 'lsm_key_alloc' [-Wmissing-prototypes]
   int lsm_key_alloc(struct key *key)
       ^
   security/security.c:504:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int lsm_key_alloc(struct key *key)
   ^
   static 
>> security/security.c:526:5: warning: no previous prototype for function 'lsm_msg_msg_alloc' [-Wmissing-prototypes]
   int lsm_msg_msg_alloc(struct msg_msg *mp)
       ^
   security/security.c:526:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int lsm_msg_msg_alloc(struct msg_msg *mp)
   ^
   static 
>> security/security.c:548:5: warning: no previous prototype for function 'lsm_sock_alloc' [-Wmissing-prototypes]
   int lsm_sock_alloc(struct sock *sock, gfp_t priority)
       ^
   security/security.c:548:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int lsm_sock_alloc(struct sock *sock, gfp_t priority)
   ^
   static 
>> security/security.c:569:5: warning: no previous prototype for function 'lsm_superblock_alloc' [-Wmissing-prototypes]
   int lsm_superblock_alloc(struct super_block *sb)
       ^
   security/security.c:569:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int lsm_superblock_alloc(struct super_block *sb)
   ^
   static 
   7 warnings generated.
   security/security.c:220: warning: Function parameter or member 'lsm' not described in 'security_module_enable'
   security/security.c:220: warning: Excess function parameter 'module' description in 'security_module_enable'


vim +/xhci_dbc_tty_unregister_device +497 drivers/usb/host/xhci-dbgtty.c

dfba2174dc421e Lu Baolu             2017-12-08  496  
dfba2174dc421e Lu Baolu             2017-12-08 @497  void xhci_dbc_tty_unregister_device(struct xhci_hcd *xhci)
dfba2174dc421e Lu Baolu             2017-12-08  498  {
dfba2174dc421e Lu Baolu             2017-12-08  499  	struct xhci_dbc		*dbc = xhci->dbc;
dfba2174dc421e Lu Baolu             2017-12-08  500  	struct dbc_port		*port = &dbc->port;
77896075c45563 Prabhat Chand Pandey 2019-01-30  501  	struct tty_driver	*dbc_tty_driver =
77896075c45563 Prabhat Chand Pandey 2019-01-30  502  					(struct tty_driver *) dbc->func_priv;
dfba2174dc421e Lu Baolu             2017-12-08  503  
dfba2174dc421e Lu Baolu             2017-12-08  504  	tty_unregister_device(dbc_tty_driver, 0);
dfba2174dc421e Lu Baolu             2017-12-08  505  	xhci_dbc_tty_exit_port(port);
dfba2174dc421e Lu Baolu             2017-12-08  506  	port->registered = false;
dfba2174dc421e Lu Baolu             2017-12-08  507  
dfba2174dc421e Lu Baolu             2017-12-08  508  	kfifo_free(&port->write_fifo);
dfba2174dc421e Lu Baolu             2017-12-08  509  	xhci_dbc_free_requests(get_out_ep(xhci), &port->read_pool);
dfba2174dc421e Lu Baolu             2017-12-08  510  	xhci_dbc_free_requests(get_out_ep(xhci), &port->read_queue);
dfba2174dc421e Lu Baolu             2017-12-08  511  	xhci_dbc_free_requests(get_in_ep(xhci), &port->write_pool);
dfba2174dc421e Lu Baolu             2017-12-08  512  }
77896075c45563 Prabhat Chand Pandey 2019-01-30  513  

:::::: The code at line 497 was first introduced by commit
:::::: dfba2174dc421ecad8dc50741054a305cd3ba681 usb: xhci: Add DbC support in xHCI driver

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--F+1AKTiXM4L/mNPj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/mips 4.19.141 Kernel Configuration
#

#
# Compiler: clang version 16.0.0 (git://gitmirror/llvm_project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
#
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_LD_IS_LLD=y
CONFIG_CLANG_VERSION=160000
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_EXTABLE_SORT=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_IRQ_IPI=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_HANDLE_DOMAIN_IRQ=y
CONFIG_IRQ_FORCED_THREADING=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
CONFIG_ARCH_CLOCKSOURCE_DATA=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
# CONFIG_ANDROID_AUTO_SUSPEND_BEHAVIOR is not set
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
# CONFIG_PSI is not set
# CONFIG_CPU_ISOLATION is not set

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKHEADERS=y
CONFIG_LOG_BUF_SHIFT=17
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_GENERIC_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_CGROUPS is not set
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SCHED_TUNE is not set
CONFIG_SYSFS_DEPRECATED=y
# CONFIG_SYSFS_DEPRECATED_V2 is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
# CONFIG_RD_LZMA is not set
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_BPF=y
CONFIG_EXPERT=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
# CONFIG_SYSFS_SYSCALL is not set
# CONFIG_FHANDLE is not set
# CONFIG_POSIX_TIMERS is not set
CONFIG_PRINTK=y
CONFIG_PRINTK_NMI=y
# CONFIG_BUG is not set
# CONFIG_BASE_FULL is not set
# CONFIG_FUTEX is not set
# CONFIG_EPOLL is not set
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
# CONFIG_ADVISE_SYSCALLS is not set
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_BPF_SYSCALL=y
# CONFIG_USERFAULTFD is not set
# CONFIG_RSEQ is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# CONFIG_VM_EVENT_COUNTERS is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_SLAB=y
# CONFIG_SLUB is not set
# CONFIG_SLOB is not set
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
CONFIG_SYSTEM_DATA_VERIFICATION=y
# CONFIG_PROFILING is not set
CONFIG_MIPS=y

#
# Machine selection
#
CONFIG_MIPS_GENERIC=y
# CONFIG_MIPS_ALCHEMY is not set
# CONFIG_AR7 is not set
# CONFIG_ATH25 is not set
# CONFIG_ATH79 is not set
# CONFIG_BMIPS_GENERIC is not set
# CONFIG_BCM47XX is not set
# CONFIG_BCM63XX is not set
# CONFIG_MIPS_COBALT is not set
# CONFIG_MACH_DECSTATION is not set
# CONFIG_MACH_JAZZ is not set
# CONFIG_MACH_INGENIC is not set
# CONFIG_LANTIQ is not set
# CONFIG_LASAT is not set
# CONFIG_MACH_LOONGSON32 is not set
# CONFIG_MACH_LOONGSON64 is not set
# CONFIG_MACH_PISTACHIO is not set
# CONFIG_MIPS_MALTA is not set
# CONFIG_MACH_PIC32 is not set
# CONFIG_NEC_MARKEINS is not set
# CONFIG_MACH_VR41XX is not set
# CONFIG_NXP_STB220 is not set
# CONFIG_NXP_STB225 is not set
# CONFIG_PMC_MSP is not set
# CONFIG_RALINK is not set
# CONFIG_SGI_IP22 is not set
# CONFIG_SGI_IP27 is not set
# CONFIG_SGI_IP28 is not set
# CONFIG_SGI_IP32 is not set
# CONFIG_SIBYTE_CRHINE is not set
# CONFIG_SIBYTE_CARMEL is not set
# CONFIG_SIBYTE_CRHONE is not set
# CONFIG_SIBYTE_RHONE is not set
# CONFIG_SIBYTE_SWARM is not set
# CONFIG_SIBYTE_LITTLESUR is not set
# CONFIG_SIBYTE_SENTOSA is not set
# CONFIG_SIBYTE_BIGSUR is not set
# CONFIG_SNI_RM is not set
# CONFIG_MACH_TX39XX is not set
# CONFIG_MACH_TX49XX is not set
# CONFIG_MIKROTIK_RB532 is not set
# CONFIG_CAVIUM_OCTEON_SOC is not set
# CONFIG_NLM_XLR_BOARD is not set
# CONFIG_NLM_XLP_BOARD is not set
# CONFIG_MIPS_PARAVIRT is not set

#
# Legacy (non-UHI/non-FIT) Boards
#
# CONFIG_LEGACY_BOARD_SEAD3 is not set
# CONFIG_LEGACY_BOARD_OCELOT is not set

#
# FIT/UHI Boards
#
# CONFIG_FIT_IMAGE_FDT_BOSTON is not set
# CONFIG_FIT_IMAGE_FDT_NI169445 is not set
# CONFIG_FIT_IMAGE_FDT_XILFPGA is not set
# CONFIG_FIT_IMAGE_FDT_OCELOT_PCB123 is not set
# CONFIG_VIRT_BOARD_RANCHU is not set
CONFIG_RWSEM_GENERIC_SPINLOCK=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_BOOT_RAW=y
CONFIG_CEVT_R4K=y
CONFIG_CSRC_R4K=y
CONFIG_MIPS_CLOCK_VSYSCALL=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_DMA_MAYBE_COHERENT=y
CONFIG_DMA_PERDEV_COHERENT=y
CONFIG_DMA_NONCOHERENT=y
CONFIG_SYNC_R4K=y
CONFIG_SYS_SUPPORTS_RELOCATABLE=y
# CONFIG_CPU_BIG_ENDIAN is not set
CONFIG_CPU_LITTLE_ENDIAN=y
CONFIG_SYS_SUPPORTS_BIG_ENDIAN=y
CONFIG_SYS_SUPPORTS_LITTLE_ENDIAN=y
CONFIG_NO_EXCEPT_FILL=y
CONFIG_SWAP_IO_SPACE=y
CONFIG_MIPS_L1_CACHE_SHIFT_7=y
CONFIG_MIPS_L1_CACHE_SHIFT=7

#
# CPU selection
#
CONFIG_CPU_MIPS32_R1=y
# CONFIG_CPU_MIPS32_R2 is not set
# CONFIG_CPU_MIPS32_R6 is not set
# CONFIG_CPU_MIPS64_R1 is not set
# CONFIG_CPU_MIPS64_R2 is not set
# CONFIG_CPU_MIPS64_R6 is not set
CONFIG_SYS_HAS_CPU_MIPS32_R1=y
CONFIG_SYS_HAS_CPU_MIPS32_R2=y
CONFIG_SYS_HAS_CPU_MIPS32_R6=y
CONFIG_SYS_HAS_CPU_MIPS64_R1=y
CONFIG_SYS_HAS_CPU_MIPS64_R2=y
CONFIG_SYS_HAS_CPU_MIPS64_R6=y
CONFIG_CPU_MIPS32=y
CONFIG_CPU_MIPSR1=y
CONFIG_SYS_SUPPORTS_32BIT_KERNEL=y
CONFIG_SYS_SUPPORTS_64BIT_KERNEL=y
CONFIG_CPU_SUPPORTS_32BIT_KERNEL=y
CONFIG_HARDWARE_WATCHPOINTS=y

#
# Kernel type
#
CONFIG_32BIT=y
# CONFIG_PAGE_SIZE_4KB is not set
CONFIG_PAGE_SIZE_16KB=y
# CONFIG_PAGE_SIZE_64KB is not set
CONFIG_FORCE_MAX_ZONEORDER=11
CONFIG_BOARD_SCACHE=y
CONFIG_MIPS_CPU_SCACHE=y
CONFIG_CPU_HAS_PREFETCH=y
CONFIG_CPU_GENERIC_DUMP_TLB=y
CONFIG_CPU_R4K_FPU=y
CONFIG_CPU_R4K_CACHE_TLB=y
CONFIG_MIPS_MT_SMP=y
CONFIG_MIPS_MT=y
# CONFIG_SCHED_SMT is not set
CONFIG_SYS_SUPPORTS_SCHED_SMT=y
CONFIG_SYS_SUPPORTS_MULTITHREADING=y
CONFIG_MIPS_MT_FPAFF=y
# CONFIG_MIPS_CPS is not set
CONFIG_MIPS_CM=y
CONFIG_MIPS_CPC=y
CONFIG_CPU_NEEDS_NO_SMARTMIPS_OR_MICROMIPS=y
# CONFIG_CPU_HAS_SMARTMIPS is not set
# CONFIG_CPU_MICROMIPS is not set
CONFIG_CPU_MIPSR2_IRQ_VI=y
CONFIG_CPU_MIPSR2_IRQ_EI=y
CONFIG_CPU_HAS_SYNC=y
CONFIG_MIPS_ASID_SHIFT=0
CONFIG_MIPS_ASID_BITS=8
# CONFIG_HIGHMEM is not set
CONFIG_CPU_SUPPORTS_HIGHMEM=y
CONFIG_SYS_SUPPORTS_HIGHMEM=y
CONFIG_SYS_SUPPORTS_SMARTMIPS=y
CONFIG_SYS_SUPPORTS_MICROMIPS=y
CONFIG_SYS_SUPPORTS_MIPS16=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_SMP=y
CONFIG_SMP_UP=y
CONFIG_SYS_SUPPORTS_MIPS_CPS=y
CONFIG_SYS_SUPPORTS_SMP=y
CONFIG_NR_CPUS=2
CONFIG_MIPS_PERF_SHARED_TC_COUNTERS=y
CONFIG_MIPS_NR_CPU_NR_MAP=2
# CONFIG_HZ_24 is not set
CONFIG_HZ_48=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_128 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_256 is not set
# CONFIG_HZ_1000 is not set
# CONFIG_HZ_1024 is not set
CONFIG_SYS_SUPPORTS_ARBIT_HZ=y
CONFIG_HZ=48
CONFIG_KEXEC=y
CONFIG_CRASH_DUMP=y
CONFIG_PHYSICAL_START=0xffffffff84000000
# CONFIG_MIPS_O32_FP64_SUPPORT is not set
CONFIG_USE_OF=y
CONFIG_BUILTIN_DTB=y
CONFIG_MIPS_NO_APPENDED_DTB=y
# CONFIG_MIPS_ELF_APPENDED_DTB is not set
# CONFIG_MIPS_RAW_APPENDED_DTB is not set
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_HAVE_LATENCYTOP_SUPPORT=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_MIPS_AUTO_PFN_OFFSET=y

#
# Bus options (PCI, PCMCIA, EISA, ISA, TC)
#
CONFIG_HW_HAS_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCI_DOMAINS_GENERIC=y
CONFIG_PCI_DRIVERS_GENERIC=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCI_MSI=y
# CONFIG_PCI_QUIRKS is not set
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=y
CONFIG_PCI_ATS=y
CONFIG_PCI_IOV=y
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_HOTPLUG_PCI=y
# CONFIG_HOTPLUG_PCI_CPCI is not set
# CONFIG_HOTPLUG_PCI_SHPC is not set

#
# PCI controller drivers
#

#
# Cadence PCIe controllers support
#
# CONFIG_PCIE_CADENCE_HOST is not set
# CONFIG_PCIE_CADENCE_EP is not set
# CONFIG_PCI_FTPCI100 is not set
# CONFIG_PCI_HOST_GENERIC is not set
# CONFIG_PCIE_XILINX is not set
# CONFIG_PCI_XGENE is not set
# CONFIG_PCI_V3_SEMI is not set
CONFIG_PCIE_ALTERA=y
# CONFIG_PCI_HOST_THUNDER_PEM is not set
# CONFIG_PCI_HOST_THUNDER_ECAM is not set
# CONFIG_PCIE_ROCKCHIP_EP is not set

#
# DesignWare PCI Core Support
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_EP=y
CONFIG_PCIE_ARTPEC6=y
CONFIG_PCIE_ARTPEC6_EP=y

#
# PCI Endpoint
#
CONFIG_PCI_ENDPOINT=y
CONFIG_PCI_ENDPOINT_CONFIGFS=y
CONFIG_PCI_EPF_TEST=y

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=15
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=15
CONFIG_PCCARD=y
# CONFIG_PCMCIA is not set
# CONFIG_CARDBUS is not set

#
# PC-card bridges
#
CONFIG_YENTA=y
CONFIG_YENTA_O2=y
# CONFIG_YENTA_RICOH is not set
# CONFIG_YENTA_TI is not set
CONFIG_YENTA_TOSHIBA=y
CONFIG_RAPIDIO=y
CONFIG_RAPIDIO_DISC_TIMEOUT=30
CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=y
# CONFIG_RAPIDIO_DMA_ENGINE is not set
# CONFIG_RAPIDIO_DEBUG is not set
CONFIG_RAPIDIO_ENUM_BASIC=y
CONFIG_RAPIDIO_CHMAN=y
CONFIG_RAPIDIO_MPORT_CDEV=y

#
# RapidIO Switch drivers
#
# CONFIG_RAPIDIO_TSI57X is not set
# CONFIG_RAPIDIO_CPS_XX is not set
# CONFIG_RAPIDIO_TSI568 is not set
CONFIG_RAPIDIO_CPS_GEN2=y
# CONFIG_RAPIDIO_RXS_GEN3 is not set
CONFIG_TRAD_SIGNALS=y

#
# Power management options
#
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
CONFIG_PM_GENERIC_DOMAINS=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_PM_GENERIC_DOMAINS_OF=y
CONFIG_CPU_PM=y

#
# CPU Power Management
#

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
# CONFIG_CPU_IDLE_GOV_MENU is not set

#
# MIPS CPU Idle Drivers
#

#
# Firmware Drivers
#
CONFIG_ARM_SCMI_PROTOCOL=y
# CONFIG_ARM_SCMI_POWER_DOMAIN is not set
CONFIG_ARM_SCPI_PROTOCOL=y
CONFIG_ARM_SCPI_POWER_DOMAIN=y
# CONFIG_FIRMWARE_MEMMAP is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
CONFIG_VIRTUALIZATION=y
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HAVE_OPROFILE=y
CONFIG_JUMP_LABEL=y
CONFIG_STATIC_KEYS_SELFTEST=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
CONFIG_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR_STRONG is not set
CONFIG_LTO_NONE=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=8
CONFIG_HAVE_COPY_THREAD_TLS=y
CONFIG_CLONE_BACKWARDS=y
# CONFIG_REFCOUNT_FULL is not set
CONFIG_HAVE_ARCH_COMPILER_H=y

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
# CONFIG_MODULES is not set
# CONFIG_BLOCK is not set
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
# CONFIG_GKI_HIDDEN_DRM_CONFIGS is not set
# CONFIG_GKI_HIDDEN_REGMAP_CONFIGS is not set
# CONFIG_GKI_HIDDEN_CRYPTO_CONFIGS is not set
# CONFIG_GKI_HIDDEN_SND_CONFIGS is not set
# CONFIG_GKI_HIDDEN_SND_SOC_CONFIGS is not set
# CONFIG_GKI_HIDDEN_GPIO_CONFIGS is not set
# CONFIG_GKI_HIDDEN_VIRTUAL_CONFIGS is not set
# CONFIG_GKI_LEGACY_WEXT_ALLCONFIG is not set
# CONFIG_GKI_HIDDEN_SOC_PM_CONFIGS is not set
# CONFIG_GKI_HIDDEN_VIDEOBUF2_CONFIGS is not set
# CONFIG_GKI_HIDDEN_USB_CONFIGS is not set
# CONFIG_GKI_HIDDEN_SOC_BUS_CONFIGS is not set
# CONFIG_GKI_HIDDEN_GPU_CONFIGS is not set
# CONFIG_GKI_HIDDEN_IRQ_CONFIGS is not set
# CONFIG_GKI_HACKS_TO_FIX is not set

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ARCH_BINFMT_ELF_STATE=y
CONFIG_ELFCORE=y
CONFIG_BINFMT_SCRIPT=y
# CONFIG_BINFMT_MISC is not set
# CONFIG_COREDUMP is not set

#
# Memory Management options
#
CONFIG_FLATMEM=y
CONFIG_FLAT_NODE_MEM_MAP=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_ARCH_DISCARD_MEMBLOCK=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
# CONFIG_COMPACTION is not set
CONFIG_MIGRATION=y
CONFIG_VIRT_TO_BUS=y
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
# CONFIG_CLEANCACHE is not set
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_AREAS=7
# CONFIG_ZPOOL is not set
# CONFIG_ZBUD is not set
# CONFIG_ZSMALLOC is not set
# CONFIG_DEBUG_PANIC_ON_BAD_PAGE is not set
# CONFIG_MM_EVENT_STAT is not set
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_FRAME_VECTOR=y
CONFIG_PERCPU_STATS=y
# CONFIG_GUP_BENCHMARK is not set
# CONFIG_NET is not set
CONFIG_HAVE_CBPF_JIT=y

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_WANT_DEV_COREDUMP=y
# CONFIG_ALLOW_DEV_COREDUMP is not set
CONFIG_DEBUG_DRIVER=y
CONFIG_DEBUG_DEVRES=y
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
CONFIG_DMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=16
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8

#
# Bus devices
#
# CONFIG_BRCMSTB_GISB_ARB is not set
CONFIG_QCOM_EBI2=y
# CONFIG_SIMPLE_PM_BUS is not set
# CONFIG_DVC_TRACE_BUS is not set
# CONFIG_GNSS is not set
# CONFIG_MTD is not set
CONFIG_DTC=y
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
# CONFIG_OF_OVERLAY is not set
# CONFIG_PARPORT is not set

#
# NVME Support
#

#
# Misc devices
#
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_PHANTOM is not set
# CONFIG_INTEL_MID_PTI is not set
# CONFIG_SGI_IOC4 is not set
CONFIG_TIFM_CORE=y
CONFIG_TIFM_7XX1=y
CONFIG_ICS932S401=y
CONFIG_ATMEL_SSC=y
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_HP_ILO=y
# CONFIG_QCOM_COINCELL is not set
# CONFIG_APDS9802ALS is not set
CONFIG_ISL29003=y
CONFIG_ISL29020=y
CONFIG_SENSORS_TSL2550=y
CONFIG_SENSORS_BH1770=y
# CONFIG_SENSORS_APDS990X is not set
CONFIG_HMC6352=y
# CONFIG_DS1682 is not set
CONFIG_PCH_PHUB=y
# CONFIG_USB_SWITCH_FSA9480 is not set
# CONFIG_LATTICE_ECP3_CONFIG is not set
CONFIG_SRAM=y
CONFIG_ASPEED_LPC_CTRL=y
# CONFIG_ASPEED_LPC_SNOOP is not set
CONFIG_PCI_ENDPOINT_TEST=y
CONFIG_C2PORT=y

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
CONFIG_EEPROM_AT25=y
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_93XX46=y
# CONFIG_EEPROM_IDT_89HPESX is not set
CONFIG_CB710_CORE=y
CONFIG_CB710_DEBUG=y
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
CONFIG_ALTERA_STAPL=y

#
# Intel MIC & related support
#

#
# Intel MIC Bus Driver
#

#
# SCIF Bus Driver
#

#
# VOP Bus Driver
#

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#

#
# SCIF Driver
#

#
# Intel MIC Coprocessor State Management (COSM) Drivers
#

#
# VOP Driver
#
# CONFIG_ECHO is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_MISC_RTSX_USB is not set
CONFIG_HAVE_IDE=y

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_FUSION=y
CONFIG_FUSION_MAX_SGE=128
# CONFIG_FUSION_LOGGING is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
CONFIG_FIREWIRE_NOSY=y

#
# Input device support
#
# CONFIG_INPUT is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_PCIPS2=y
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_APBPS2 is not set
CONFIG_SERIO_OLPC_APSP=y
# CONFIG_SERIO_SUN4I_PS2 is not set
# CONFIG_SERIO_GPIO_PS2 is not set
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=y
CONFIG_GAMEPORT_L4=y
# CONFIG_GAMEPORT_EMU10K1 is not set
CONFIG_GAMEPORT_FM801=y

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
# CONFIG_UNIX98_PTYS is not set
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_ROCKETPORT is not set
# CONFIG_CYCLADES is not set
CONFIG_MOXA_INTELLIO=y
CONFIG_MOXA_SMARTIO=y
# CONFIG_SYNCLINKMP is not set
CONFIG_SYNCLINK_GT=y
CONFIG_NOZOMI=y
# CONFIG_ISI is not set
# CONFIG_N_HDLC is not set
# CONFIG_TRACE_SINK is not set
CONFIG_GOLDFISH_TTY=y
CONFIG_GOLDFISH_TTY_EARLY_CONSOLE=y
# CONFIG_CBC_LDISC is not set
CONFIG_LDISC_AUTOLOAD=y
CONFIG_DEVMEM=y
# CONFIG_DEVKMEM is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_CONSOLE=y
# CONFIG_SERIAL_8250_PCI is not set
# CONFIG_SERIAL_8250_MEN_MCB is not set
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
# CONFIG_SERIAL_8250_ASPEED_VUART is not set
# CONFIG_SERIAL_8250_DW is not set
CONFIG_SERIAL_8250_RT288X=y
# CONFIG_SERIAL_8250_LPC18XX is not set
CONFIG_SERIAL_8250_UNIPHIER=y
# CONFIG_SERIAL_8250_INGENIC is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
# CONFIG_SERIAL_8250_MOXA is not set
# CONFIG_SERIAL_OF_PLATFORM is not set

#
# Non-8250 serial port support
#
CONFIG_SERIAL_ATMEL=y
CONFIG_SERIAL_ATMEL_CONSOLE=y
# CONFIG_SERIAL_ATMEL_PDC is not set
# CONFIG_SERIAL_ATMEL_TTYAT is not set
CONFIG_SERIAL_CLPS711X=y
# CONFIG_SERIAL_CLPS711X_CONSOLE is not set
CONFIG_SERIAL_MAX3100=y
# CONFIG_SERIAL_MAX310X is not set
CONFIG_SERIAL_IMX=y
# CONFIG_SERIAL_IMX_CONSOLE is not set
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_SH_SCI=y
CONFIG_SERIAL_SH_SCI_NR_UARTS=2
# CONFIG_SERIAL_SH_SCI_CONSOLE is not set
CONFIG_SERIAL_SH_SCI_EARLYCON=y
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_MSM_GENI_HALF_SAMPLING is not set
# CONFIG_SERIAL_MSM_GENI_EARLY_CONSOLE is not set
# CONFIG_SERIAL_SCCNXP is not set
CONFIG_SERIAL_SC16IS7XX_CORE=y
CONFIG_SERIAL_SC16IS7XX=y
# CONFIG_SERIAL_SC16IS7XX_I2C is not set
CONFIG_SERIAL_SC16IS7XX_SPI=y
# CONFIG_SERIAL_TIMBERDALE is not set
CONFIG_SERIAL_BCM63XX=y
# CONFIG_SERIAL_BCM63XX_CONSOLE is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_IFX6X60 is not set
CONFIG_SERIAL_PCH_UART=y
# CONFIG_SERIAL_PCH_UART_CONSOLE is not set
# CONFIG_SERIAL_MXS_AUART is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
CONFIG_SERIAL_MPS2_UART_CONSOLE=y
CONFIG_SERIAL_MPS2_UART=y
# CONFIG_SERIAL_ARC is not set
CONFIG_SERIAL_RP2=y
CONFIG_SERIAL_RP2_NR_UARTS=32
CONFIG_SERIAL_FSL_LPUART=y
# CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
# CONFIG_SERIAL_ST_ASC is not set
CONFIG_SERIAL_MEN_Z135=y
CONFIG_SERIAL_STM32=y
CONFIG_SERIAL_STM32_CONSOLE=y
CONFIG_SERIAL_MVEBU_UART=y
# CONFIG_SERIAL_MVEBU_CONSOLE is not set
CONFIG_SERIAL_OWL=y
# CONFIG_SERIAL_OWL_CONSOLE is not set
CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_HVC_DRIVER=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=y
CONFIG_IPMI_SI=y
# CONFIG_IPMI_SSIF is not set
# CONFIG_IPMI_WATCHDOG is not set
# CONFIG_IPMI_POWEROFF is not set
# CONFIG_ASPEED_KCS_IPMI_BMC is not set
# CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
CONFIG_ASPEED_BT_IPMI_BMC=y
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
CONFIG_HW_RANDOM_VIRTIO=y
CONFIG_HW_RANDOM_STM32=y
# CONFIG_HW_RANDOM_MESON is not set
CONFIG_HW_RANDOM_MTK=y
CONFIG_HW_RANDOM_EXYNOS=y
# CONFIG_APPLICOM is not set
CONFIG_TCG_TPM=y
# CONFIG_HW_RANDOM_TPM is not set
# CONFIG_TCG_TIS is not set
# CONFIG_TCG_TIS_SPI is not set
# CONFIG_TCG_TIS_I2C_ATMEL is not set
# CONFIG_TCG_TIS_I2C_INFINEON is not set
CONFIG_TCG_TIS_I2C_NUVOTON=y
CONFIG_TCG_ATMEL=y
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=y
CONFIG_TCG_TIS_ST33ZP24_I2C=y
CONFIG_TCG_TIS_ST33ZP24_SPI=y
# CONFIG_DEVPORT is not set
# CONFIG_XILLYBUS is not set
# CONFIG_RPMB is not set
# CONFIG_RPMB_SIM is not set
# CONFIG_VIRTIO_RPMB is not set
# CONFIG_RPMB_MUX is not set
CONFIG_RANDOM_TRUST_BOOTLOADER=y

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
CONFIG_I2C_MUX_GPIO=y
# CONFIG_I2C_MUX_GPMUX is not set
CONFIG_I2C_MUX_LTC4306=y
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=y
# CONFIG_I2C_MUX_PINCTRL is not set
CONFIG_I2C_MUX_REG=y
# CONFIG_I2C_DEMUX_PINCTRL is not set
# CONFIG_I2C_MUX_MLXCPLD is not set
# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_ALI1535=y
CONFIG_I2C_ALI1563=y
CONFIG_I2C_ALI15X3=y
# CONFIG_I2C_AMD756 is not set
CONFIG_I2C_AMD8111=y
# CONFIG_I2C_HIX5HD2 is not set
# CONFIG_I2C_I801 is not set
CONFIG_I2C_ISCH=y
CONFIG_I2C_PIIX4=y
CONFIG_I2C_NFORCE2=y
CONFIG_I2C_SIS5595=y
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
CONFIG_I2C_VIA=y
CONFIG_I2C_VIAPRO=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ASPEED is not set
# CONFIG_I2C_AXXIA is not set
# CONFIG_I2C_BCM_IPROC is not set
CONFIG_I2C_BRCMSTB=y
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EFM32 is not set
# CONFIG_I2C_EG20T is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_IMG is not set
CONFIG_I2C_IMX_LPI2C=y
CONFIG_I2C_JZ4780=y
CONFIG_I2C_KEMPLD=y
# CONFIG_I2C_LPC2K is not set
CONFIG_I2C_MESON=y
# CONFIG_I2C_MT65XX is not set
CONFIG_I2C_OCORES=y
CONFIG_I2C_OWL=y
# CONFIG_I2C_PCA_PLATFORM is not set
CONFIG_I2C_RIIC=y
# CONFIG_I2C_RK3X is not set
# CONFIG_I2C_SH_MOBILE is not set
# CONFIG_I2C_SIMTEC is not set
# CONFIG_I2C_STM32F4 is not set
CONFIG_I2C_STM32F7=y
CONFIG_I2C_SUN6I_P2WI=y
CONFIG_I2C_SYNQUACER=y
CONFIG_I2C_UNIPHIER=y
CONFIG_I2C_UNIPHIER_F=y
CONFIG_I2C_VERSATILE=y
CONFIG_I2C_XILINX=y
CONFIG_I2C_XLP9XX=y
CONFIG_I2C_RCAR=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
CONFIG_I2C_DLN2=y
# CONFIG_I2C_PARPORT_LIGHT is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
CONFIG_I2C_TAOS_EVM=y
CONFIG_I2C_TINY_USB=y
CONFIG_I2C_VIPERBOARD=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_SLAVE=y
# CONFIG_I2C_SLAVE_EEPROM is not set
CONFIG_I2C_DEBUG_CORE=y
# CONFIG_I2C_DEBUG_ALGO is not set
CONFIG_I2C_DEBUG_BUS=y
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=y
CONFIG_SPI_ARMADA_3700=y
# CONFIG_SPI_ATMEL is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BCM2835 is not set
CONFIG_SPI_BCM2835AUX=y
CONFIG_SPI_BCM63XX=y
CONFIG_SPI_BCM63XX_HSSPI=y
CONFIG_SPI_BCM_QSPI=y
CONFIG_SPI_BITBANG=y
CONFIG_SPI_CADENCE=y
# CONFIG_SPI_CLPS711X is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_DLN2 is not set
CONFIG_SPI_EP93XX=y
# CONFIG_SPI_FSL_LPSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_IMG_SPFI is not set
CONFIG_SPI_IMX=y
# CONFIG_SPI_JCORE is not set
CONFIG_SPI_LP8841_RTC=y
# CONFIG_SPI_FSL_SPI is not set
# CONFIG_SPI_FSL_DSPI is not set
# CONFIG_SPI_MESON_SPICC is not set
CONFIG_SPI_MESON_SPIFC=y
CONFIG_SPI_MT65XX=y
# CONFIG_SPI_LANTIQ_SSC is not set
CONFIG_SPI_OC_TINY=y
# CONFIG_SPI_OMAP24XX is not set
# CONFIG_SPI_TI_QSPI is not set
CONFIG_SPI_OMAP_100K=y
# CONFIG_SPI_ORION is not set
CONFIG_SPI_PIC32=y
# CONFIG_SPI_PIC32_SQI is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_ROCKCHIP is not set
CONFIG_SPI_RSPI=y
CONFIG_SPI_S3C64XX=y
# CONFIG_SPI_SC18IS602 is not set
CONFIG_SPI_SH_MSIOF=y
CONFIG_SPI_SH=y
CONFIG_SPI_SH_HSPI=y
CONFIG_SPI_SPRD_ADI=y
# CONFIG_SPI_STM32 is not set
# CONFIG_SPI_ST_SSC4 is not set
CONFIG_SPI_SUN4I=y
# CONFIG_SPI_SUN6I is not set
CONFIG_SPI_TEGRA114=y
# CONFIG_SPI_TEGRA20_SFLASH is not set
CONFIG_SPI_TEGRA20_SLINK=y
CONFIG_SPI_TOPCLIFF_PCH=y
# CONFIG_SPI_TXX9 is not set
# CONFIG_SPI_UNIPHIER is not set
CONFIG_SPI_XCOMM=y
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_XLP is not set
# CONFIG_SPI_XTENSA_XTFPGA is not set
CONFIG_SPI_ZYNQMP_GQSPI=y

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
CONFIG_SPI_TLE62X0=y
CONFIG_SPI_SLAVE=y
# CONFIG_SPI_SLAVE_TIME is not set
# CONFIG_SPI_SLAVE_SYSTEM_CONTROL is not set
CONFIG_SPMI=y
CONFIG_SPMI_MSM_PMIC_ARB=y
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=y
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=y
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AXP209 is not set
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_DA850_PUPD is not set
# CONFIG_PINCTRL_LPC18XX is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_RZA1 is not set
# CONFIG_PINCTRL_SINGLE is not set
# CONFIG_PINCTRL_SX150X is not set
# CONFIG_PINCTRL_MAX77620 is not set
# CONFIG_PINCTRL_PALMAS is not set
CONFIG_PINCTRL_INGENIC=y
CONFIG_PINCTRL_OCELOT=y
# CONFIG_PINCTRL_OWL is not set
# CONFIG_PINCTRL_ASPEED_G4 is not set
# CONFIG_PINCTRL_ASPEED_G5 is not set
# CONFIG_PINCTRL_BCM281XX is not set
# CONFIG_PINCTRL_IPROC_GPIO is not set
# CONFIG_PINCTRL_CYGNUS_MUX is not set
# CONFIG_PINCTRL_NSP_GPIO is not set
# CONFIG_PINCTRL_NS2_MUX is not set
# CONFIG_PINCTRL_NSP_MUX is not set
# CONFIG_PINCTRL_AS370 is not set
# CONFIG_PINCTRL_BERLIN_BG4CT is not set
CONFIG_PINCTRL_PXA=y
CONFIG_PINCTRL_PXA25X=y
CONFIG_PINCTRL_PXA27X=y
# CONFIG_PINCTRL_APQ8064 is not set
# CONFIG_PINCTRL_APQ8084 is not set
# CONFIG_PINCTRL_IPQ4019 is not set
# CONFIG_PINCTRL_IPQ8064 is not set
# CONFIG_PINCTRL_IPQ8074 is not set
# CONFIG_PINCTRL_MSM8660 is not set
# CONFIG_PINCTRL_MSM8960 is not set
# CONFIG_PINCTRL_MDM9615 is not set
# CONFIG_PINCTRL_MSM8X74 is not set
# CONFIG_PINCTRL_MSM8916 is not set
# CONFIG_PINCTRL_MSM8994 is not set
# CONFIG_PINCTRL_MSM8996 is not set
# CONFIG_PINCTRL_MSM8998 is not set
# CONFIG_PINCTRL_QCOM_SPMI_PMIC is not set
# CONFIG_PINCTRL_QCOM_SSBI_PMIC is not set
# CONFIG_PINCTRL_SDM845 is not set
# CONFIG_PINCTRL_SPRD is not set
# CONFIG_PINCTRL_STM32F429 is not set
# CONFIG_PINCTRL_STM32F469 is not set
# CONFIG_PINCTRL_STM32F746 is not set
# CONFIG_PINCTRL_STM32F769 is not set
# CONFIG_PINCTRL_STM32H743 is not set
# CONFIG_PINCTRL_STM32MP157 is not set
# CONFIG_PINCTRL_TI_IODELAY is not set
CONFIG_PINCTRL_UNIPHIER=y
# CONFIG_PINCTRL_UNIPHIER_LD4 is not set
# CONFIG_PINCTRL_UNIPHIER_PRO4 is not set
# CONFIG_PINCTRL_UNIPHIER_SLD8 is not set
# CONFIG_PINCTRL_UNIPHIER_PRO5 is not set
# CONFIG_PINCTRL_UNIPHIER_PXS2 is not set
# CONFIG_PINCTRL_UNIPHIER_LD6B is not set
# CONFIG_PINCTRL_UNIPHIER_LD11 is not set
# CONFIG_PINCTRL_UNIPHIER_LD20 is not set
# CONFIG_PINCTRL_UNIPHIER_PXS3 is not set

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
# CONFIG_PINCTRL_MT2701 is not set
# CONFIG_PINCTRL_MT8135 is not set
# CONFIG_PINCTRL_MT8127 is not set
# CONFIG_PINCTRL_MT2712 is not set
# CONFIG_PINCTRL_MT7622 is not set
# CONFIG_PINCTRL_MT8173 is not set
# CONFIG_PINCTRL_MT6397 is not set
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L90=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_74XX_MMIO is not set
# CONFIG_GPIO_ALTERA is not set
# CONFIG_GPIO_ASPEED is not set
CONFIG_GPIO_ATH79=y
# CONFIG_GPIO_RASPBERRYPI_EXP is not set
# CONFIG_GPIO_BCM_KONA is not set
# CONFIG_GPIO_BRCMSTB is not set
CONFIG_GPIO_CLPS711X=y
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_EIC_SPRD is not set
# CONFIG_GPIO_EM is not set
# CONFIG_GPIO_FTGPIO010 is not set
CONFIG_GPIO_GENERIC_PLATFORM=y
# CONFIG_GPIO_GRGPIO is not set
# CONFIG_GPIO_HLWD is not set
# CONFIG_GPIO_INGENIC is not set
# CONFIG_GPIO_IOP is not set
# CONFIG_GPIO_LPC18XX is not set
CONFIG_GPIO_MB86S7X=y
# CONFIG_GPIO_MENZ127 is not set
# CONFIG_GPIO_MOCKUP is not set
CONFIG_GPIO_MPC8XXX=y
# CONFIG_GPIO_MT7621 is not set
# CONFIG_GPIO_PMIC_EIC_SPRD is not set
# CONFIG_GPIO_RCAR is not set
# CONFIG_GPIO_SPRD is not set
# CONFIG_GPIO_SYSCON is not set
# CONFIG_GPIO_TEGRA is not set
# CONFIG_GPIO_TEGRA186 is not set
# CONFIG_GPIO_TS4800 is not set
# CONFIG_GPIO_UNIPHIER is not set
CONFIG_GPIO_VX855=y
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_XLP is not set
# CONFIG_GPIO_ZX is not set

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_ADNP is not set
# CONFIG_GPIO_MAX7300 is not set
CONFIG_GPIO_MAX732X=y
# CONFIG_GPIO_MAX732X_IRQ is not set
# CONFIG_GPIO_PCA953X is not set
CONFIG_GPIO_PCF857X=y
# CONFIG_GPIO_TPIC2810 is not set
CONFIG_GPIO_TS4900=y

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=y
# CONFIG_GPIO_BD9571MWV is not set
CONFIG_GPIO_DA9052=y
# CONFIG_GPIO_DLN2 is not set
CONFIG_GPIO_JANZ_TTL=y
CONFIG_GPIO_KEMPLD=y
CONFIG_GPIO_LP873X=y
CONFIG_GPIO_MADERA=y
CONFIG_GPIO_MAX77620=y
# CONFIG_GPIO_PALMAS is not set
CONFIG_GPIO_TIMBERDALE=y
CONFIG_GPIO_TPS65086=y
CONFIG_GPIO_TPS6586X=y
CONFIG_GPIO_TPS65912=y
CONFIG_GPIO_TWL4030=y
# CONFIG_GPIO_WM831X is not set
CONFIG_GPIO_WM8350=y
CONFIG_GPIO_WM8994=y

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
CONFIG_GPIO_ML_IOH=y
CONFIG_GPIO_PCH=y
CONFIG_GPIO_PCI_IDIO_16=y
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set

#
# SPI GPIO expanders
#
# CONFIG_GPIO_74X164 is not set
CONFIG_GPIO_MAX3191X=y
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
CONFIG_GPIO_PISOSR=y
CONFIG_GPIO_XRA1403=y

#
# USB GPIO expanders
#
# CONFIG_GPIO_VIPERBOARD is not set
CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=y
# CONFIG_W1_MASTER_DS2490 is not set
# CONFIG_W1_MASTER_DS2482 is not set
# CONFIG_W1_MASTER_MXC is not set
CONFIG_W1_MASTER_DS1WM=y
CONFIG_W1_MASTER_GPIO=y

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=y
# CONFIG_W1_SLAVE_DS2408 is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
# CONFIG_W1_SLAVE_DS2423 is not set
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=y
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
CONFIG_W1_SLAVE_DS28E17=y
# CONFIG_POWER_AVS is not set
CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_BRCMKONA=y
# CONFIG_POWER_RESET_BRCMSTB is not set
# CONFIG_POWER_RESET_GEMINI_POWEROFF is not set
# CONFIG_POWER_RESET_GPIO is not set
# CONFIG_POWER_RESET_GPIO_RESTART is not set
CONFIG_POWER_RESET_OCELOT_RESET=y
CONFIG_POWER_RESET_PIIX4_POWEROFF=y
# CONFIG_POWER_RESET_LTC2952 is not set
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_RESET_KEYSTONE=y
# CONFIG_POWER_RESET_SYSCON is not set
# CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
# CONFIG_POWER_RESET_RMOBILE is not set
# CONFIG_POWER_RESET_ZX is not set
# CONFIG_SYSCON_REBOOT_MODE is not set
# CONFIG_POWER_RESET_SC27XX is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_PDA_POWER=y
CONFIG_GENERIC_ADC_BATTERY=y
CONFIG_MAX8925_POWER=y
# CONFIG_WM831X_BACKUP is not set
CONFIG_WM831X_POWER=y
CONFIG_WM8350_POWER=y
CONFIG_TEST_POWER=y
CONFIG_BATTERY_88PM860X=y
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_ACT8945A is not set
# CONFIG_BATTERY_DS2760 is not set
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
# CONFIG_BATTERY_LEGO_EV3 is not set
CONFIG_BATTERY_SBS=y
# CONFIG_CHARGER_SBS is not set
CONFIG_MANAGER_SBS=y
# CONFIG_BATTERY_BQ27XXX is not set
CONFIG_BATTERY_DA9052=y
CONFIG_BATTERY_DA9150=y
CONFIG_AXP20X_POWER=y
# CONFIG_AXP288_FUEL_GAUGE is not set
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=y
CONFIG_BATTERY_MAX1721X=y
# CONFIG_BATTERY_TWL4030_MADC is not set
CONFIG_CHARGER_88PM860X=y
# CONFIG_CHARGER_PCF50633 is not set
CONFIG_BATTERY_RX51=y
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=y
# CONFIG_CHARGER_TWL4030 is not set
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_LP8788=y
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
# CONFIG_CHARGER_LTC3651 is not set
CONFIG_CHARGER_MAX14577=y
# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
CONFIG_CHARGER_MAX8998=y
# CONFIG_CHARGER_QCOM_SMBB is not set
CONFIG_CHARGER_BQ2415X=y
CONFIG_CHARGER_BQ24190=y
CONFIG_CHARGER_BQ24257=y
CONFIG_CHARGER_BQ24735=y
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_SMB347=y
# CONFIG_CHARGER_TPS65090 is not set
CONFIG_BATTERY_GAUGE_LTC2941=y
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=y
# CONFIG_CHARGER_RT9455 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
# CONFIG_SENSORS_AD7314 is not set
# CONFIG_SENSORS_AD7414 is not set
CONFIG_SENSORS_AD7418=y
CONFIG_SENSORS_ADM1021=y
CONFIG_SENSORS_ADM1025=y
CONFIG_SENSORS_ADM1026=y
# CONFIG_SENSORS_ADM1029 is not set
CONFIG_SENSORS_ADM1031=y
# CONFIG_SENSORS_ADM9240 is not set
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7310=y
CONFIG_SENSORS_ADT7410=y
CONFIG_SENSORS_ADT7411=y
CONFIG_SENSORS_ADT7462=y
# CONFIG_SENSORS_ADT7470 is not set
CONFIG_SENSORS_ADT7475=y
CONFIG_SENSORS_ASC7621=y
# CONFIG_SENSORS_ARM_SCMI is not set
CONFIG_SENSORS_ARM_SCPI=y
CONFIG_SENSORS_ASPEED=y
CONFIG_SENSORS_ATXP1=y
CONFIG_SENSORS_DS620=y
# CONFIG_SENSORS_DS1621 is not set
CONFIG_SENSORS_DA9052_ADC=y
CONFIG_SENSORS_I5K_AMB=y
CONFIG_SENSORS_F71805F=y
CONFIG_SENSORS_F71882FG=y
CONFIG_SENSORS_F75375S=y
# CONFIG_SENSORS_MC13783_ADC is not set
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=y
# CONFIG_SENSORS_G760A is not set
CONFIG_SENSORS_G762=y
# CONFIG_SENSORS_GPIO_FAN is not set
CONFIG_SENSORS_HIH6130=y
# CONFIG_SENSORS_IBMAEM is not set
CONFIG_SENSORS_IBMPEX=y
# CONFIG_SENSORS_IIO_HWMON is not set
# CONFIG_SENSORS_IT87 is not set
CONFIG_SENSORS_JC42=y
CONFIG_SENSORS_POWR1220=y
# CONFIG_SENSORS_LINEAGE is not set
CONFIG_SENSORS_LTC2945=y
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC4151 is not set
CONFIG_SENSORS_LTC4215=y
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=y
# CONFIG_SENSORS_LTC4260 is not set
# CONFIG_SENSORS_LTC4261 is not set
CONFIG_SENSORS_MAX1111=y
# CONFIG_SENSORS_MAX16065 is not set
CONFIG_SENSORS_MAX1619=y
# CONFIG_SENSORS_MAX1668 is not set
CONFIG_SENSORS_MAX197=y
CONFIG_SENSORS_MAX31722=y
CONFIG_SENSORS_MAX6621=y
CONFIG_SENSORS_MAX6639=y
# CONFIG_SENSORS_MAX6642 is not set
CONFIG_SENSORS_MAX6650=y
# CONFIG_SENSORS_MAX6697 is not set
CONFIG_SENSORS_MAX31790=y
CONFIG_SENSORS_MCP3021=y
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_MENF21BMC_HWMON is not set
CONFIG_SENSORS_ADCXX=y
CONFIG_SENSORS_LM63=y
CONFIG_SENSORS_LM70=y
CONFIG_SENSORS_LM73=y
# CONFIG_SENSORS_LM75 is not set
CONFIG_SENSORS_LM77=y
# CONFIG_SENSORS_LM78 is not set
CONFIG_SENSORS_LM80=y
CONFIG_SENSORS_LM83=y
# CONFIG_SENSORS_LM85 is not set
CONFIG_SENSORS_LM87=y
# CONFIG_SENSORS_LM90 is not set
CONFIG_SENSORS_LM92=y
# CONFIG_SENSORS_LM93 is not set
CONFIG_SENSORS_LM95234=y
CONFIG_SENSORS_LM95241=y
CONFIG_SENSORS_LM95245=y
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_PC87427=y
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775=y
CONFIG_SENSORS_NCT7802=y
# CONFIG_SENSORS_NCT7904 is not set
CONFIG_SENSORS_NPCM7XX=y
# CONFIG_SENSORS_NSA320 is not set
CONFIG_SENSORS_PCF8591=y
# CONFIG_PMBUS is not set
CONFIG_SENSORS_PWM_FAN=y
CONFIG_SENSORS_RASPBERRYPI_HWMON=y
CONFIG_SENSORS_SHT15=y
CONFIG_SENSORS_SHT21=y
# CONFIG_SENSORS_SHT3x is not set
CONFIG_SENSORS_SHTC1=y
CONFIG_SENSORS_SIS5595=y
# CONFIG_SENSORS_DME1737 is not set
CONFIG_SENSORS_EMC1403=y
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC6W201=y
CONFIG_SENSORS_SMSC47M1=y
CONFIG_SENSORS_SMSC47M192=y
CONFIG_SENSORS_SMSC47B397=y
# CONFIG_SENSORS_STTS751 is not set
CONFIG_SENSORS_SMM665=y
# CONFIG_SENSORS_ADC128D818 is not set
# CONFIG_SENSORS_ADS1015 is not set
CONFIG_SENSORS_ADS7828=y
# CONFIG_SENSORS_ADS7871 is not set
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=y
CONFIG_SENSORS_INA2XX=y
CONFIG_SENSORS_INA3221=y
CONFIG_SENSORS_TC74=y
CONFIG_SENSORS_THMC50=y
CONFIG_SENSORS_TMP102=y
CONFIG_SENSORS_TMP103=y
CONFIG_SENSORS_TMP108=y
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=y
# CONFIG_SENSORS_VIA686A is not set
# CONFIG_SENSORS_VT1211 is not set
CONFIG_SENSORS_VT8231=y
CONFIG_SENSORS_W83773G=y
# CONFIG_SENSORS_W83781D is not set
CONFIG_SENSORS_W83791D=y
CONFIG_SENSORS_W83792D=y
CONFIG_SENSORS_W83793=y
CONFIG_SENSORS_W83795=y
# CONFIG_SENSORS_W83795_FANCTRL is not set
# CONFIG_SENSORS_W83L785TS is not set
CONFIG_SENSORS_W83L786NG=y
CONFIG_SENSORS_W83627HF=y
CONFIG_SENSORS_W83627EHF=y
# CONFIG_SENSORS_WM831X is not set
# CONFIG_SENSORS_WM8350 is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_HWMON is not set
CONFIG_THERMAL_OF=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
# CONFIG_THERMAL_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
# CONFIG_CLOCK_THERMAL is not set
CONFIG_DEVFREQ_THERMAL=y
# CONFIG_THERMAL_EMULATION is not set
CONFIG_HISI_THERMAL=y
# CONFIG_IMX_THERMAL is not set
# CONFIG_MAX77620_THERMAL is not set
# CONFIG_QORIQ_THERMAL is not set
# CONFIG_SPEAR_THERMAL is not set
# CONFIG_ROCKCHIP_THERMAL is not set
CONFIG_RCAR_THERMAL=y
# CONFIG_RCAR_GEN3_THERMAL is not set
# CONFIG_KIRKWOOD_THERMAL is not set
# CONFIG_DOVE_THERMAL is not set
# CONFIG_ARMADA_THERMAL is not set
# CONFIG_DA9062_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
CONFIG_MTK_THERMAL=y

#
# Broadcom thermal drivers
#
# CONFIG_BCM2835_THERMAL is not set
# CONFIG_BRCMSTB_THERMAL is not set
CONFIG_BCM_NS_THERMAL=y

#
# Texas Instruments thermal drivers
#
CONFIG_TI_SOC_THERMAL=y
CONFIG_TI_THERMAL=y
# CONFIG_OMAP3_THERMAL is not set
CONFIG_OMAP4_THERMAL=y
CONFIG_OMAP5_THERMAL=y
# CONFIG_DRA752_THERMAL is not set

#
# Samsung thermal drivers
#
# CONFIG_EXYNOS_THERMAL is not set
# CONFIG_TANGO_THERMAL is not set
# CONFIG_QCOM_SPMI_TEMP_ALARM is not set
# CONFIG_GENERIC_ADC_THERMAL is not set

#
# Qualcomm thermal drivers
#
# CONFIG_ZX2967_THERMAL is not set
# CONFIG_UNIPHIER_THERMAL is not set

#
# Trusty
#
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_ACT8945A is not set
# CONFIG_MFD_SUN4I_GPADC is not set
CONFIG_MFD_AS3711=y
# CONFIG_MFD_AS3722 is not set
CONFIG_PMIC_ADP5520=y
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_ATMEL_FLEXCOM is not set
# CONFIG_MFD_ATMEL_HLCDC is not set
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
# CONFIG_MFD_CROS_EC is not set
CONFIG_MFD_MADERA=y
CONFIG_MFD_MADERA_I2C=y
# CONFIG_MFD_MADERA_SPI is not set
CONFIG_MFD_CS47L35=y
CONFIG_MFD_CS47L85=y
CONFIG_MFD_CS47L90=y
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_SPI=y
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
CONFIG_MFD_DA9150=y
CONFIG_MFD_DLN2=y
CONFIG_MFD_EXYNOS_LPASS=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_SPI=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MXS_LRADC=y
# CONFIG_MFD_MX25_TSADC is not set
# CONFIG_MFD_HI6421_PMIC is not set
# CONFIG_MFD_HI655X_PMIC is not set
CONFIG_HTC_PASIC3=y
# CONFIG_HTC_I2CPLD is not set
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=y
CONFIG_MFD_JANZ_CMODIO=y
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
# CONFIG_MFD_88PM805 is not set
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=y
CONFIG_MFD_MAX77620=y
# CONFIG_MFD_MAX77686 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
CONFIG_MFD_MAX8907=y
CONFIG_MFD_MAX8925=y
CONFIG_MFD_MAX8997=y
CONFIG_MFD_MAX8998=y
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=y
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_CPCAP is not set
CONFIG_MFD_VIPERBOARD=y
CONFIG_MFD_RETU=y
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=y
CONFIG_PCF50633_GPIO=y
CONFIG_MFD_PM8XXX=y
# CONFIG_MFD_SPMI_PMIC is not set
# CONFIG_MFD_RDC321X is not set
CONFIG_MFD_RT5033=y
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_RK808 is not set
# CONFIG_MFD_RN5T618 is not set
CONFIG_MFD_SEC_CORE=y
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SM501 is not set
CONFIG_MFD_SKY81452=y
# CONFIG_MFD_SMSC is not set
CONFIG_MFD_SC27XX_PMIC=y
CONFIG_ABX500_CORE=y
# CONFIG_AB3100_CORE is not set
# CONFIG_MFD_STMPE is not set
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
CONFIG_MFD_LP8788=y
# CONFIG_MFD_TI_LMU is not set
CONFIG_MFD_PALMAS=y
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
# CONFIG_MFD_TPS65217 is not set
CONFIG_MFD_TI_LP873X=y
# CONFIG_MFD_TI_LP87565 is not set
# CONFIG_MFD_TPS65218 is not set
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_MFD_TPS80031 is not set
CONFIG_TWL4030_CORE=y
# CONFIG_MFD_TWL4030_AUDIO is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
# CONFIG_MFD_LM3533 is not set
CONFIG_MFD_TIMBERDALE=y
# CONFIG_MFD_TC3589X is not set
CONFIG_MFD_VX855=y
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
# CONFIG_MFD_WM831X_I2C is not set
CONFIG_MFD_WM831X_SPI=y
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=y
CONFIG_MFD_STW481X=y
# CONFIG_MFD_ROHM_BD718XX is not set
CONFIG_MFD_STM32_LPTIMER=y
CONFIG_MFD_STM32_TIMERS=y
# CONFIG_RAVE_SP_CORE is not set
CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
# CONFIG_REGULATOR_PROXY_CONSUMER is not set
CONFIG_REGULATOR_88PG86X=y
CONFIG_REGULATOR_88PM800=y
CONFIG_REGULATOR_88PM8607=y
CONFIG_REGULATOR_ACT8865=y
# CONFIG_REGULATOR_AD5398 is not set
CONFIG_REGULATOR_ANATOP=y
CONFIG_REGULATOR_AS3711=y
CONFIG_REGULATOR_AXP20X=y
CONFIG_REGULATOR_BD9571MWV=y
CONFIG_REGULATOR_DA9052=y
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
# CONFIG_REGULATOR_FAN53555 is not set
CONFIG_REGULATOR_GPIO=y
# CONFIG_REGULATOR_ISL9305 is not set
CONFIG_REGULATOR_ISL6271A=y
# CONFIG_REGULATOR_LP3971 is not set
CONFIG_REGULATOR_LP3972=y
CONFIG_REGULATOR_LP872X=y
# CONFIG_REGULATOR_LP873X is not set
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LP8788=y
# CONFIG_REGULATOR_LTC3589 is not set
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=y
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX77620=y
# CONFIG_REGULATOR_MAX8649 is not set
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8907=y
CONFIG_REGULATOR_MAX8925=y
CONFIG_REGULATOR_MAX8952=y
# CONFIG_REGULATOR_MAX8973 is not set
# CONFIG_REGULATOR_MAX8997 is not set
CONFIG_REGULATOR_MAX8998=y
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
CONFIG_REGULATOR_MC13892=y
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_PALMAS=y
# CONFIG_REGULATOR_PBIAS is not set
CONFIG_REGULATOR_PCF50633=y
# CONFIG_REGULATOR_PFUZE100 is not set
# CONFIG_REGULATOR_PV88060 is not set
# CONFIG_REGULATOR_PV88080 is not set
CONFIG_REGULATOR_PV88090=y
# CONFIG_REGULATOR_PWM is not set
CONFIG_REGULATOR_QCOM_RPMH=y
CONFIG_REGULATOR_QCOM_SPMI=y
CONFIG_REGULATOR_RT5033=y
CONFIG_REGULATOR_S2MPA01=y
CONFIG_REGULATOR_S2MPS11=y
# CONFIG_REGULATOR_S5M8767 is not set
# CONFIG_REGULATOR_SC2731 is not set
CONFIG_REGULATOR_SKY81452=y
# CONFIG_REGULATOR_STM32_VREFBUF is not set
# CONFIG_REGULATOR_STW481X_VMMC is not set
# CONFIG_REGULATOR_SY8106A is not set
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS6105X=y
CONFIG_REGULATOR_TPS62360=y
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=y
CONFIG_REGULATOR_TPS65086=y
# CONFIG_REGULATOR_TPS65090 is not set
# CONFIG_REGULATOR_TPS65132 is not set
CONFIG_REGULATOR_TPS6524X=y
# CONFIG_REGULATOR_TPS6586X is not set
CONFIG_REGULATOR_TPS65912=y
# CONFIG_REGULATOR_TWL4030 is not set
# CONFIG_REGULATOR_UNIPHIER is not set
# CONFIG_REGULATOR_VCTRL is not set
CONFIG_REGULATOR_WM831X=y
CONFIG_REGULATOR_WM8350=y
# CONFIG_REGULATOR_WM8400 is not set
CONFIG_REGULATOR_WM8994=y
CONFIG_CEC_CORE=y
CONFIG_MEDIA_SUPPORT=y

#
# Multimedia core support
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_MEDIA_CONTROLLER=y
CONFIG_MEDIA_CONTROLLER_DVB=y
CONFIG_VIDEO_DEV=y
# CONFIG_VIDEO_V4L2_SUBDEV_API is not set
CONFIG_VIDEO_V4L2=y
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_DVB_CORE=y
# CONFIG_DVB_MMAP is not set
CONFIG_DVB_MAX_ADAPTERS=16
# CONFIG_DVB_DYNAMIC_MINORS is not set
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
CONFIG_DVB_ULE_DEBUG=y

#
# Media drivers
#
CONFIG_MEDIA_USB_SUPPORT=y

#
# Webcam devices
#
# CONFIG_USB_VIDEO_CLASS is not set
CONFIG_USB_GSPCA=y
# CONFIG_USB_M5602 is not set
# CONFIG_USB_STV06XX is not set
# CONFIG_USB_GL860 is not set
# CONFIG_USB_GSPCA_BENQ is not set
# CONFIG_USB_GSPCA_CONEX is not set
# CONFIG_USB_GSPCA_CPIA1 is not set
# CONFIG_USB_GSPCA_DTCS033 is not set
# CONFIG_USB_GSPCA_ETOMS is not set
# CONFIG_USB_GSPCA_FINEPIX is not set
# CONFIG_USB_GSPCA_JEILINJ is not set
# CONFIG_USB_GSPCA_JL2005BCD is not set
# CONFIG_USB_GSPCA_KINECT is not set
# CONFIG_USB_GSPCA_KONICA is not set
# CONFIG_USB_GSPCA_MARS is not set
# CONFIG_USB_GSPCA_MR97310A is not set
# CONFIG_USB_GSPCA_NW80X is not set
# CONFIG_USB_GSPCA_OV519 is not set
# CONFIG_USB_GSPCA_OV534 is not set
# CONFIG_USB_GSPCA_OV534_9 is not set
# CONFIG_USB_GSPCA_PAC207 is not set
# CONFIG_USB_GSPCA_PAC7302 is not set
# CONFIG_USB_GSPCA_PAC7311 is not set
# CONFIG_USB_GSPCA_SE401 is not set
# CONFIG_USB_GSPCA_SN9C2028 is not set
# CONFIG_USB_GSPCA_SN9C20X is not set
# CONFIG_USB_GSPCA_SONIXB is not set
# CONFIG_USB_GSPCA_SONIXJ is not set
# CONFIG_USB_GSPCA_SPCA500 is not set
# CONFIG_USB_GSPCA_SPCA501 is not set
# CONFIG_USB_GSPCA_SPCA505 is not set
# CONFIG_USB_GSPCA_SPCA506 is not set
# CONFIG_USB_GSPCA_SPCA508 is not set
# CONFIG_USB_GSPCA_SPCA561 is not set
# CONFIG_USB_GSPCA_SPCA1528 is not set
# CONFIG_USB_GSPCA_SQ905 is not set
# CONFIG_USB_GSPCA_SQ905C is not set
# CONFIG_USB_GSPCA_SQ930X is not set
# CONFIG_USB_GSPCA_STK014 is not set
# CONFIG_USB_GSPCA_STK1135 is not set
# CONFIG_USB_GSPCA_STV0680 is not set
# CONFIG_USB_GSPCA_SUNPLUS is not set
# CONFIG_USB_GSPCA_T613 is not set
# CONFIG_USB_GSPCA_TOPRO is not set
# CONFIG_USB_GSPCA_TOUPTEK is not set
# CONFIG_USB_GSPCA_TV8532 is not set
# CONFIG_USB_GSPCA_VC032X is not set
# CONFIG_USB_GSPCA_VICAM is not set
# CONFIG_USB_GSPCA_XIRLINK_CIT is not set
# CONFIG_USB_GSPCA_ZC3XX is not set
# CONFIG_USB_PWC is not set
# CONFIG_VIDEO_CPIA2 is not set
# CONFIG_USB_ZR364XX is not set
# CONFIG_USB_STKWEBCAM is not set
# CONFIG_USB_S2255 is not set

#
# Analog TV USB devices
#
# CONFIG_VIDEO_PVRUSB2 is not set
# CONFIG_VIDEO_HDPVR is not set
# CONFIG_VIDEO_USBVISION is not set
# CONFIG_VIDEO_STK1160_COMMON is not set

#
# Analog/digital TV USB devices
#
# CONFIG_VIDEO_CX231XX is not set

#
# Digital TV USB devices
#
CONFIG_DVB_USB_V2=y
CONFIG_DVB_USB_AF9015=y
CONFIG_DVB_USB_AF9035=y
CONFIG_DVB_USB_ANYSEE=y
# CONFIG_DVB_USB_AU6610 is not set
CONFIG_DVB_USB_AZ6007=y
CONFIG_DVB_USB_CE6230=y
CONFIG_DVB_USB_EC168=y
# CONFIG_DVB_USB_GL861 is not set
CONFIG_DVB_USB_MXL111SF=y
# CONFIG_DVB_USB_RTL28XXU is not set
CONFIG_DVB_USB_DVBSKY=y
CONFIG_DVB_USB_ZD1301=y
CONFIG_DVB_TTUSB_BUDGET=y
# CONFIG_SMS_USB_DRV is not set
CONFIG_DVB_B2C2_FLEXCOP_USB=y
CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG=y

#
# Webcam, TV (analog/digital) USB devices
#
# CONFIG_VIDEO_EM28XX is not set

#
# Software defined radio USB devices
#
# CONFIG_USB_AIRSPY is not set
# CONFIG_USB_HACKRF is not set
# CONFIG_USB_MSI2500 is not set

#
# USB HDMI CEC adapters
#
# CONFIG_USB_PULSE8_CEC is not set
# CONFIG_USB_RAINSHADOW_CEC is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_V4L_MEM2MEM_DRIVERS is not set
# CONFIG_V4L_TEST_DRIVERS is not set
# CONFIG_DVB_PLATFORM_DRIVERS is not set
# CONFIG_CEC_PLATFORM_DRIVERS is not set
# CONFIG_SDR_PLATFORM_DRIVERS is not set

#
# Supported MMC/SDIO adapters
#
CONFIG_RADIO_ADAPTERS=y
# CONFIG_RADIO_SI470X is not set
# CONFIG_RADIO_SI4713 is not set
# CONFIG_USB_MR800 is not set
# CONFIG_USB_DSBR is not set
# CONFIG_RADIO_MAXIRADIO is not set
# CONFIG_RADIO_SHARK is not set
# CONFIG_RADIO_SHARK2 is not set
# CONFIG_USB_KEENE is not set
# CONFIG_USB_RAREMONO is not set
# CONFIG_USB_MA901 is not set
# CONFIG_RADIO_TEA5764 is not set
# CONFIG_RADIO_SAA7706H is not set
# CONFIG_RADIO_TEF6862 is not set
# CONFIG_RADIO_TIMBERDALE is not set
# CONFIG_RADIO_WL1273 is not set

#
# Texas Instruments WL128x FM driver (ST based)
#
# CONFIG_V4L_RADIO_ISA_DRIVERS is not set
CONFIG_VIDEO_TVEEPROM=y
CONFIG_CYPRESS_FIRMWARE=y
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_VMALLOC=y
CONFIG_DVB_B2C2_FLEXCOP=y
CONFIG_DVB_B2C2_FLEXCOP_DEBUG=y

#
# Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
#
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

#
# I2C Encoders, decoders, sensors and other helper chips
#

#
# Audio decoders, processors and mixers
#
# CONFIG_VIDEO_TVAUDIO is not set
# CONFIG_VIDEO_TDA7432 is not set
# CONFIG_VIDEO_TDA9840 is not set
# CONFIG_VIDEO_TEA6415C is not set
# CONFIG_VIDEO_TEA6420 is not set
# CONFIG_VIDEO_MSP3400 is not set
# CONFIG_VIDEO_CS3308 is not set
# CONFIG_VIDEO_CS5345 is not set
# CONFIG_VIDEO_CS53L32A is not set
# CONFIG_VIDEO_TLV320AIC23B is not set
# CONFIG_VIDEO_UDA1342 is not set
# CONFIG_VIDEO_WM8775 is not set
# CONFIG_VIDEO_WM8739 is not set
# CONFIG_VIDEO_VP27SMPX is not set
# CONFIG_VIDEO_SONY_BTF_MPX is not set

#
# RDS decoders
#
# CONFIG_VIDEO_SAA6588 is not set

#
# Video decoders
#
# CONFIG_VIDEO_ADV7183 is not set
# CONFIG_VIDEO_BT819 is not set
# CONFIG_VIDEO_BT856 is not set
# CONFIG_VIDEO_BT866 is not set
# CONFIG_VIDEO_KS0127 is not set
# CONFIG_VIDEO_ML86V7667 is not set
# CONFIG_VIDEO_AD5820 is not set
# CONFIG_VIDEO_SAA7110 is not set
# CONFIG_VIDEO_SAA711X is not set
# CONFIG_VIDEO_TVP514X is not set
# CONFIG_VIDEO_TVP5150 is not set
# CONFIG_VIDEO_TVP7002 is not set
# CONFIG_VIDEO_TW2804 is not set
# CONFIG_VIDEO_TW9903 is not set
# CONFIG_VIDEO_TW9906 is not set
# CONFIG_VIDEO_TW9910 is not set
# CONFIG_VIDEO_VPX3220 is not set

#
# Video and audio decoders
#
# CONFIG_VIDEO_SAA717X is not set
# CONFIG_VIDEO_CX25840 is not set

#
# Video encoders
#
# CONFIG_VIDEO_SAA7127 is not set
# CONFIG_VIDEO_SAA7185 is not set
# CONFIG_VIDEO_ADV7170 is not set
# CONFIG_VIDEO_ADV7175 is not set
# CONFIG_VIDEO_ADV7343 is not set
# CONFIG_VIDEO_ADV7393 is not set
# CONFIG_VIDEO_AK881X is not set
# CONFIG_VIDEO_THS8200 is not set

#
# Camera sensor devices
#
# CONFIG_VIDEO_OV2640 is not set
# CONFIG_VIDEO_OV2659 is not set
# CONFIG_VIDEO_OV2680 is not set
# CONFIG_VIDEO_OV2685 is not set
# CONFIG_VIDEO_OV6650 is not set
# CONFIG_VIDEO_OV5695 is not set
# CONFIG_VIDEO_OV772X is not set
# CONFIG_VIDEO_OV7640 is not set
# CONFIG_VIDEO_OV7670 is not set
# CONFIG_VIDEO_OV7740 is not set
# CONFIG_VIDEO_VS6624 is not set
# CONFIG_VIDEO_MT9M111 is not set
# CONFIG_VIDEO_MT9T112 is not set
# CONFIG_VIDEO_MT9V011 is not set
# CONFIG_VIDEO_MT9V111 is not set
# CONFIG_VIDEO_SR030PC30 is not set
# CONFIG_VIDEO_RJ54N1 is not set

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
# CONFIG_VIDEO_LM3560 is not set
# CONFIG_VIDEO_LM3646 is not set

#
# Video improvement chips
#
# CONFIG_VIDEO_UPD64031A is not set
# CONFIG_VIDEO_UPD64083 is not set

#
# Audio/Video compression chips
#
# CONFIG_VIDEO_SAA6752HS is not set

#
# SDR tuner chips
#
# CONFIG_SDR_MAX2175 is not set

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_THS7303 is not set
# CONFIG_VIDEO_M52790 is not set
# CONFIG_VIDEO_I2C is not set

#
# Sensors used on soc_camera driver
#

#
# SPI helper chips
#

#
# Media SPI Adapters
#
CONFIG_CXD2880_SPI_DRV=y
CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
# CONFIG_MEDIA_TUNER_SIMPLE is not set
CONFIG_MEDIA_TUNER_TDA18250=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_MSI001=y
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_MT2060=y
# CONFIG_MEDIA_TUNER_MT2063 is not set
CONFIG_MEDIA_TUNER_MT2266=y
CONFIG_MEDIA_TUNER_MT2131=y
# CONFIG_MEDIA_TUNER_QT1010 is not set
# CONFIG_MEDIA_TUNER_XC2028 is not set
CONFIG_MEDIA_TUNER_XC5000=y
# CONFIG_MEDIA_TUNER_XC4000 is not set
CONFIG_MEDIA_TUNER_MXL5005S=y
CONFIG_MEDIA_TUNER_MXL5007T=y
# CONFIG_MEDIA_TUNER_MC44S803 is not set
CONFIG_MEDIA_TUNER_MAX2165=y
# CONFIG_MEDIA_TUNER_TDA18218 is not set
# CONFIG_MEDIA_TUNER_FC0011 is not set
CONFIG_MEDIA_TUNER_FC0012=y
# CONFIG_MEDIA_TUNER_FC0013 is not set
CONFIG_MEDIA_TUNER_TDA18212=y
CONFIG_MEDIA_TUNER_E4000=y
CONFIG_MEDIA_TUNER_FC2580=y
# CONFIG_MEDIA_TUNER_M88RS6000T is not set
# CONFIG_MEDIA_TUNER_TUA9001 is not set
CONFIG_MEDIA_TUNER_SI2157=y
# CONFIG_MEDIA_TUNER_IT913X is not set
# CONFIG_MEDIA_TUNER_R820T is not set
CONFIG_MEDIA_TUNER_MXL301RF=y
# CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
CONFIG_MEDIA_TUNER_QM1D1B0004=y

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
# CONFIG_DVB_STB0899 is not set
# CONFIG_DVB_STB6100 is not set
CONFIG_DVB_STV090x=y
CONFIG_DVB_STV0910=y
CONFIG_DVB_STV6110x=y
# CONFIG_DVB_STV6111 is not set
CONFIG_DVB_MXL5XX=y
CONFIG_DVB_M88DS3103=y

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=y
# CONFIG_DVB_TDA18271C2DD is not set
CONFIG_DVB_SI2165=y
# CONFIG_DVB_MN88472 is not set
# CONFIG_DVB_MN88473 is not set

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=y
CONFIG_DVB_CX24123=y
# CONFIG_DVB_MT312 is not set
CONFIG_DVB_ZL10036=y
CONFIG_DVB_ZL10039=y
CONFIG_DVB_S5H1420=y
CONFIG_DVB_STV0288=y
# CONFIG_DVB_STB6000 is not set
CONFIG_DVB_STV0299=y
# CONFIG_DVB_STV6110 is not set
CONFIG_DVB_STV0900=y
# CONFIG_DVB_TDA8083 is not set
CONFIG_DVB_TDA10086=y
CONFIG_DVB_TDA8261=y
# CONFIG_DVB_VES1X93 is not set
CONFIG_DVB_TUNER_ITD1000=y
CONFIG_DVB_TUNER_CX24113=y
CONFIG_DVB_TDA826X=y
CONFIG_DVB_TUA6100=y
# CONFIG_DVB_CX24116 is not set
CONFIG_DVB_CX24117=y
CONFIG_DVB_CX24120=y
CONFIG_DVB_SI21XX=y
CONFIG_DVB_TS2020=y
# CONFIG_DVB_DS3000 is not set
CONFIG_DVB_MB86A16=y
# CONFIG_DVB_TDA10071 is not set

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_SP8870=y
CONFIG_DVB_SP887X=y
# CONFIG_DVB_CX22700 is not set
CONFIG_DVB_CX22702=y
CONFIG_DVB_S5H1432=y
# CONFIG_DVB_DRXD is not set
CONFIG_DVB_L64781=y
CONFIG_DVB_TDA1004X=y
# CONFIG_DVB_NXT6000 is not set
CONFIG_DVB_MT352=y
CONFIG_DVB_ZL10353=y
# CONFIG_DVB_DIB3000MB is not set
# CONFIG_DVB_DIB3000MC is not set
CONFIG_DVB_DIB7000M=y
CONFIG_DVB_DIB7000P=y
CONFIG_DVB_DIB9000=y
CONFIG_DVB_TDA10048=y
CONFIG_DVB_AF9013=y
CONFIG_DVB_EC100=y
CONFIG_DVB_STV0367=y
CONFIG_DVB_CXD2820R=y
# CONFIG_DVB_CXD2841ER is not set
CONFIG_DVB_RTL2830=y
CONFIG_DVB_RTL2832=y
CONFIG_DVB_RTL2832_SDR=y
# CONFIG_DVB_SI2168 is not set
CONFIG_DVB_ZD1301_DEMOD=y
CONFIG_DVB_CXD2880=y

#
# DVB-C (cable) frontends
#
CONFIG_DVB_VES1820=y
CONFIG_DVB_TDA10021=y
# CONFIG_DVB_TDA10023 is not set
# CONFIG_DVB_STV0297 is not set

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
# CONFIG_DVB_NXT200X is not set
# CONFIG_DVB_OR51211 is not set
CONFIG_DVB_OR51132=y
CONFIG_DVB_BCM3510=y
# CONFIG_DVB_LGDT330X is not set
# CONFIG_DVB_LGDT3305 is not set
# CONFIG_DVB_LGDT3306A is not set
CONFIG_DVB_LG2160=y
CONFIG_DVB_S5H1409=y
CONFIG_DVB_AU8522=y
# CONFIG_DVB_AU8522_DTV is not set
CONFIG_DVB_AU8522_V4L=y
CONFIG_DVB_S5H1411=y

#
# ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_S921 is not set
# CONFIG_DVB_DIB8000 is not set
CONFIG_DVB_MB86A20S=y

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_TC90522=y
# CONFIG_DVB_MN88443X is not set

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=y
# CONFIG_DVB_TUNER_DIB0070 is not set
CONFIG_DVB_TUNER_DIB0090=y

#
# SEC control devices for DVB-S
#
CONFIG_DVB_DRX39XYJ=y
CONFIG_DVB_LNBH25=y
CONFIG_DVB_LNBP21=y
CONFIG_DVB_LNBP22=y
CONFIG_DVB_ISL6405=y
CONFIG_DVB_ISL6421=y
CONFIG_DVB_ISL6423=y
CONFIG_DVB_A8293=y
# CONFIG_DVB_LGS8GL5 is not set
CONFIG_DVB_LGS8GXX=y
CONFIG_DVB_ATBM8830=y
CONFIG_DVB_TDA665x=y
CONFIG_DVB_IX2505V=y
CONFIG_DVB_M88RS2000=y
CONFIG_DVB_AF9033=y
# CONFIG_DVB_HORUS3A is not set
CONFIG_DVB_ASCOT2E=y
CONFIG_DVB_HELENE=y

#
# Common Interface (EN50221) controller drivers
#
# CONFIG_DVB_CXD2099 is not set
# CONFIG_DVB_SP2 is not set

#
# Tools to develop new frontends
#
CONFIG_DVB_DUMMY_FE=y

#
# Graphics support
#
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_IMX_IPUV3_CORE is not set
CONFIG_DRM=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DEBUG_MM is not set
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_KMS_FB_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_TTM=y
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_KMS_CMA_HELPER=y
CONFIG_DRM_VM=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
# CONFIG_DRM_I2C_SIL164 is not set
CONFIG_DRM_I2C_NXP_TDA998X=y
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
CONFIG_DRM_RADEON=y
CONFIG_DRM_RADEON_USERPTR=y
CONFIG_DRM_AMDGPU=y
CONFIG_DRM_AMDGPU_SI=y
# CONFIG_DRM_AMDGPU_CIK is not set
CONFIG_DRM_AMDGPU_USERPTR=y
# CONFIG_DRM_AMDGPU_GART_DEBUGFS is not set

#
# ACP (Audio CoProcessor) Configuration
#
# CONFIG_DRM_AMD_ACP is not set

#
# Display Engine Configuration
#
# CONFIG_DRM_AMD_DC is not set

#
# AMD Library routines
#
CONFIG_CHASH=y
# CONFIG_CHASH_STATS is not set
# CONFIG_CHASH_SELFTEST is not set
# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_VGEM=y
CONFIG_DRM_VKMS=y
CONFIG_DRM_UDL=y
# CONFIG_DRM_AST is not set
CONFIG_DRM_MGAG200=y
# CONFIG_DRM_CIRRUS_QEMU is not set
# CONFIG_DRM_RCAR_DW_HDMI is not set
# CONFIG_DRM_RCAR_LVDS is not set
CONFIG_DRM_QXL=y
CONFIG_DRM_BOCHS=y
CONFIG_DRM_VIRTIO_GPU=y
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_ARM_VERSATILE is not set
# CONFIG_DRM_PANEL_LVDS is not set
# CONFIG_DRM_PANEL_SIMPLE is not set
# CONFIG_DRM_PANEL_ILITEK_IL9322 is not set
# CONFIG_DRM_PANEL_SAMSUNG_LD9040 is not set
# CONFIG_DRM_PANEL_LG_LG4573 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
# CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
# CONFIG_DRM_PANEL_SITRONIX_ST7789V is not set
CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# CONFIG_DRM_CDNS_DSI is not set
# CONFIG_DRM_DUMB_VGA_DAC is not set
# CONFIG_DRM_LVDS_ENCODER is not set
# CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
# CONFIG_DRM_NXP_PTN3460 is not set
# CONFIG_DRM_PARADE_PS8622 is not set
# CONFIG_DRM_SIL_SII8620 is not set
# CONFIG_DRM_SII902X is not set
# CONFIG_DRM_SII9234 is not set
# CONFIG_DRM_THINE_THC63LVD1024 is not set
# CONFIG_DRM_TOSHIBA_TC358767 is not set
# CONFIG_DRM_TI_TFP410 is not set
# CONFIG_DRM_I2C_ADV7511 is not set
CONFIG_DRM_V3D=y
# CONFIG_DRM_ARCPGU is not set
CONFIG_DRM_HISI_HIBMC=y
# CONFIG_DRM_MXSFB is not set
# CONFIG_DRM_TINYDRM is not set
CONFIG_DRM_PL111=y
# CONFIG_DRM_TVE200 is not set
CONFIG_DRM_LEGACY=y
# CONFIG_DRM_TDFX is not set
# CONFIG_DRM_R128 is not set
CONFIG_DRM_MGA=y
CONFIG_DRM_VIA=y
CONFIG_DRM_SAVAGE=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_MODE_HELPERS is not set
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CLPS711X is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_TMIO is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_GOLDFISH is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_BROADSHEET is not set
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# CONFIG_FB_OMAP2 is not set
CONFIG_BACKLIGHT_LCD_SUPPORT=y
# CONFIG_LCD_CLASS_DEVICE is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_GENERIC=y
CONFIG_BACKLIGHT_PWM=y
CONFIG_BACKLIGHT_DA9052=y
# CONFIG_BACKLIGHT_MAX8925 is not set
# CONFIG_BACKLIGHT_PM8941_WLED is not set
# CONFIG_BACKLIGHT_WM831X is not set
# CONFIG_BACKLIGHT_ADP5520 is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
CONFIG_BACKLIGHT_88PM860X=y
CONFIG_BACKLIGHT_PCF50633=y
CONFIG_BACKLIGHT_LM3630A=y
CONFIG_BACKLIGHT_LM3639=y
# CONFIG_BACKLIGHT_LP855X is not set
CONFIG_BACKLIGHT_LP8788=y
# CONFIG_BACKLIGHT_PANDORA is not set
# CONFIG_BACKLIGHT_SKY81452 is not set
# CONFIG_BACKLIGHT_AS3711 is not set
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
CONFIG_HDMI=y
# CONFIG_LOGO is not set
CONFIG_SOUND=y
# CONFIG_SND is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_PCI is not set
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
CONFIG_USB_DYNAMIC_MINORS=y
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_WHITELIST is not set
# CONFIG_USB_OTG_BLACKLIST_HUB is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_MON=y
# CONFIG_USB_WUSB_CBAF is not set

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
CONFIG_USB_XHCI_DBGCAP=y
CONFIG_USB_XHCI_DBGCAP_TTY=y
# CONFIG_USB_XHCI_DBGCAP_RAW is not set
CONFIG_USB_XHCI_PLATFORM=y
CONFIG_USB_XHCI_HISTB=y
# CONFIG_USB_XHCI_MTK is not set
CONFIG_USB_XHCI_MVEBU=y
CONFIG_USB_XHCI_RCAR=y
# CONFIG_USB_EHCI_HCD is not set
CONFIG_USB_OXU210HP_HCD=y
CONFIG_USB_ISP116X_HCD=y
CONFIG_USB_ISP1362_HCD=y
CONFIG_USB_FOTG210_HCD=y
CONFIG_USB_MAX3421_HCD=y
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PLATFORM=y
CONFIG_USB_U132_HCD=y
# CONFIG_USB_SL811_HCD is not set
CONFIG_USB_R8A66597_HCD=y
CONFIG_USB_RENESAS_USBHS_HCD=y
CONFIG_USB_HCD_TEST_MODE=y
CONFIG_USB_RENESAS_USBHS=y

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=y
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
# CONFIG_USB_MTU3 is not set
# CONFIG_USB_MUSB_HDRC is not set
CONFIG_USB_DWC3=y
# CONFIG_USB_DWC3_HOST is not set
# CONFIG_USB_DWC3_GADGET is not set
CONFIG_USB_DWC3_DUAL_ROLE=y

#
# Platform Glue Driver Support
#
CONFIG_USB_DWC3_OMAP=y
CONFIG_USB_DWC3_EXYNOS=y
CONFIG_USB_DWC3_KEYSTONE=y
CONFIG_USB_DWC3_OF_SIMPLE=y
CONFIG_USB_DWC3_ST=y
CONFIG_USB_DWC3_QCOM=y
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1761_UDC=y
# CONFIG_USB_ISP1760_HOST_ROLE is not set
CONFIG_USB_ISP1760_GADGET_ROLE=y
# CONFIG_USB_ISP1760_DUAL_ROLE is not set

#
# USB port drivers
#
CONFIG_USB_SERIAL=y
# CONFIG_USB_SERIAL_CONSOLE is not set
# CONFIG_USB_SERIAL_GENERIC is not set
CONFIG_USB_SERIAL_SIMPLE=y
CONFIG_USB_SERIAL_AIRCABLE=y
# CONFIG_USB_SERIAL_ARK3116 is not set
CONFIG_USB_SERIAL_BELKIN=y
# CONFIG_USB_SERIAL_CH341 is not set
CONFIG_USB_SERIAL_WHITEHEAT=y
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
CONFIG_USB_SERIAL_CP210X=y
CONFIG_USB_SERIAL_CYPRESS_M8=y
CONFIG_USB_SERIAL_EMPEG=y
# CONFIG_USB_SERIAL_FTDI_SIO is not set
CONFIG_USB_SERIAL_VISOR=y
CONFIG_USB_SERIAL_IPAQ=y
CONFIG_USB_SERIAL_IR=y
CONFIG_USB_SERIAL_EDGEPORT=y
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
# CONFIG_USB_SERIAL_F81232 is not set
CONFIG_USB_SERIAL_F8153X=y
CONFIG_USB_SERIAL_GARMIN=y
CONFIG_USB_SERIAL_IPW=y
CONFIG_USB_SERIAL_IUU=y
CONFIG_USB_SERIAL_KEYSPAN_PDA=y
# CONFIG_USB_SERIAL_KEYSPAN is not set
CONFIG_USB_SERIAL_KLSI=y
# CONFIG_USB_SERIAL_KOBIL_SCT is not set
CONFIG_USB_SERIAL_MCT_U232=y
CONFIG_USB_SERIAL_METRO=y
CONFIG_USB_SERIAL_MOS7720=y
CONFIG_USB_SERIAL_MOS7840=y
CONFIG_USB_SERIAL_MXUPORT=y
CONFIG_USB_SERIAL_NAVMAN=y
CONFIG_USB_SERIAL_PL2303=y
CONFIG_USB_SERIAL_OTI6858=y
CONFIG_USB_SERIAL_QCAUX=y
CONFIG_USB_SERIAL_QUALCOMM=y
CONFIG_USB_SERIAL_SPCP8X5=y
# CONFIG_USB_SERIAL_SAFE is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
CONFIG_USB_SERIAL_SYMBOL=y
# CONFIG_USB_SERIAL_TI is not set
CONFIG_USB_SERIAL_CYBERJACK=y
# CONFIG_USB_SERIAL_XIRCOM is not set
CONFIG_USB_SERIAL_WWAN=y
CONFIG_USB_SERIAL_OPTION=y
# CONFIG_USB_SERIAL_OMNINET is not set
CONFIG_USB_SERIAL_OPTICON=y
CONFIG_USB_SERIAL_XSENS_MT=y
# CONFIG_USB_SERIAL_WISHBONE is not set
# CONFIG_USB_SERIAL_SSU100 is not set
CONFIG_USB_SERIAL_QT2=y
CONFIG_USB_SERIAL_UPD78F0730=y
CONFIG_USB_SERIAL_DEBUG=y

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
# CONFIG_USB_EMI26 is not set
CONFIG_USB_ADUTUX=y
CONFIG_USB_SEVSEG=y
# CONFIG_USB_LEGOTOWER is not set
CONFIG_USB_LCD=y
# CONFIG_USB_CYPRESS_CY7C63 is not set
CONFIG_USB_CYTHERM=y
CONFIG_USB_IDMOUSE=y
CONFIG_USB_FTDI_ELAN=y
# CONFIG_USB_APPLEDISPLAY is not set
CONFIG_USB_LD=y
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
CONFIG_USB_EHSET_TEST_FIXTURE=y
CONFIG_USB_ISIGHTFW=y
# CONFIG_USB_YUREX is not set
CONFIG_USB_EZUSB_FX2=y
CONFIG_USB_HUB_USB251XB=y
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
CONFIG_TAHVO_USB=y
# CONFIG_TAHVO_USB_HOST_BY_DEFAULT is not set
CONFIG_USB_ISP1301=y
CONFIG_USB_GADGET=y
# CONFIG_USB_GADGET_DEBUG is not set
# CONFIG_USB_GADGET_DEBUG_FS is not set
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2

#
# USB Peripheral Controller
#
# CONFIG_USB_FUSB300 is not set
CONFIG_USB_FOTG210_UDC=y
CONFIG_USB_GR_UDC=y
CONFIG_USB_R8A66597=y
CONFIG_USB_RENESAS_USBHS_UDC=y
# CONFIG_USB_RENESAS_USB3 is not set
# CONFIG_USB_PXA27X is not set
CONFIG_USB_MV_UDC=y
CONFIG_USB_MV_U3D=y
# CONFIG_USB_SNP_UDC_PLAT is not set
CONFIG_USB_M66592=y
# CONFIG_USB_BDC_UDC is not set
CONFIG_USB_NET2272=y
# CONFIG_USB_NET2272_DMA is not set
# CONFIG_USB_GADGET_XILINX is not set
CONFIG_USB_ASPEED_VHUB=y
CONFIG_USB_DUMMY_HCD=y
CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_PRINTER=y
# CONFIG_USB_CONFIGFS is not set
# CONFIG_USB_ZERO is not set
# CONFIG_USB_GADGETFS is not set
# CONFIG_USB_FUNCTIONFS is not set
# CONFIG_USB_G_SERIAL is not set
CONFIG_USB_G_PRINTER=y
# CONFIG_USB_G_HID is not set
# CONFIG_USB_G_DBGP is not set
# CONFIG_USB_G_WEBCAM is not set
# CONFIG_USB_RAW_GADGET is not set
CONFIG_TYPEC=y
CONFIG_TYPEC_TCPM=y
CONFIG_TYPEC_TCPCI=y
CONFIG_TYPEC_RT1711H=y
CONFIG_TYPEC_FUSB302=y
CONFIG_TYPEC_UCSI=y
CONFIG_TYPEC_TPS6598X=y

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
CONFIG_TYPEC_MUX_PI3USB30532=y

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
CONFIG_USB_ROLE_SWITCH=y
CONFIG_USB_LED_TRIG=y
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_UWB is not set
# CONFIG_MMC is not set
CONFIG_MEMSTICK=y
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=y
# CONFIG_MEMSTICK_JMICRON_38X is not set
CONFIG_MEMSTICK_R592=y
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_88PM860X=y
# CONFIG_LEDS_BCM6328 is not set
# CONFIG_LEDS_BCM6358 is not set
# CONFIG_LEDS_CR0014114 is not set
CONFIG_LEDS_LM3530=y
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_LM3692X is not set
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
CONFIG_LEDS_LP3952=y
# CONFIG_LEDS_LP5521 is not set
# CONFIG_LEDS_LP5523 is not set
# CONFIG_LEDS_LP5562 is not set
# CONFIG_LEDS_LP8501 is not set
CONFIG_LEDS_LP8788=y
# CONFIG_LEDS_LP8860 is not set
CONFIG_LEDS_PCA955X=y
# CONFIG_LEDS_PCA955X_GPIO is not set
CONFIG_LEDS_PCA963X=y
CONFIG_LEDS_WM831X_STATUS=y
CONFIG_LEDS_WM8350=y
CONFIG_LEDS_DA9052=y
CONFIG_LEDS_DAC124S085=y
# CONFIG_LEDS_PWM is not set
CONFIG_LEDS_REGULATOR=y
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_LT3593=y
CONFIG_LEDS_ADP5520=y
CONFIG_LEDS_MC13783=y
# CONFIG_LEDS_TCA6507 is not set
CONFIG_LEDS_TLC591XX=y
CONFIG_LEDS_MAX8997=y
CONFIG_LEDS_LM355x=y
CONFIG_LEDS_OT200=y
CONFIG_LEDS_MENF21BMC=y
CONFIG_LEDS_IS31FL319X=y
# CONFIG_LEDS_IS31FL32XX is not set
# CONFIG_LEDS_SC27XX_BLTC is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
# CONFIG_LEDS_SYSCON is not set
# CONFIG_LEDS_PM8058 is not set
CONFIG_LEDS_MLXREG=y
# CONFIG_LEDS_USER is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
# CONFIG_LEDS_TRIGGER_CPU is not set
CONFIG_LEDS_TRIGGER_ACTIVITY=y
CONFIG_LEDS_TRIGGER_GPIO=y
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=y
CONFIG_LEDS_TRIGGER_PANIC=y
# CONFIG_ACCESSIBILITY is not set
CONFIG_RTC_LIB=y
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
CONFIG_AUXDISPLAY=y
# CONFIG_HD44780 is not set
CONFIG_IMG_ASCII_LCD=y
CONFIG_CHARLCD=y
# CONFIG_UIO is not set
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_PCI is not set
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_MMIO=y
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_STAGING=y
CONFIG_COMEDI=y
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
CONFIG_COMEDI_BOND=y
# CONFIG_COMEDI_TEST is not set
CONFIG_COMEDI_PARPORT=y
# CONFIG_COMEDI_SSV_DNP is not set
CONFIG_COMEDI_ISA_DRIVERS=y
CONFIG_COMEDI_PCL711=y
CONFIG_COMEDI_PCL724=y
# CONFIG_COMEDI_PCL726 is not set
CONFIG_COMEDI_PCL730=y
CONFIG_COMEDI_PCL812=y
CONFIG_COMEDI_PCL816=y
CONFIG_COMEDI_PCL818=y
CONFIG_COMEDI_PCM3724=y
CONFIG_COMEDI_AMPLC_DIO200_ISA=y
CONFIG_COMEDI_AMPLC_PC236_ISA=y
CONFIG_COMEDI_AMPLC_PC263_ISA=y
CONFIG_COMEDI_RTI800=y
# CONFIG_COMEDI_RTI802 is not set
CONFIG_COMEDI_DAC02=y
CONFIG_COMEDI_DAS16M1=y
# CONFIG_COMEDI_DAS08_ISA is not set
CONFIG_COMEDI_DAS16=y
CONFIG_COMEDI_DAS800=y
CONFIG_COMEDI_DAS1800=y
CONFIG_COMEDI_DAS6402=y
# CONFIG_COMEDI_DT2801 is not set
CONFIG_COMEDI_DT2811=y
# CONFIG_COMEDI_DT2814 is not set
# CONFIG_COMEDI_DT2815 is not set
# CONFIG_COMEDI_DT2817 is not set
CONFIG_COMEDI_DT282X=y
# CONFIG_COMEDI_DMM32AT is not set
# CONFIG_COMEDI_FL512 is not set
# CONFIG_COMEDI_AIO_AIO12_8 is not set
# CONFIG_COMEDI_AIO_IIRO_16 is not set
# CONFIG_COMEDI_II_PCI20KC is not set
# CONFIG_COMEDI_C6XDIGIO is not set
CONFIG_COMEDI_MPC624=y
CONFIG_COMEDI_ADQ12B=y
# CONFIG_COMEDI_NI_AT_A2150 is not set
CONFIG_COMEDI_NI_AT_AO=y
CONFIG_COMEDI_NI_ATMIO=y
CONFIG_COMEDI_NI_ATMIO16D=y
# CONFIG_COMEDI_NI_LABPC_ISA is not set
CONFIG_COMEDI_PCMAD=y
CONFIG_COMEDI_PCMDA12=y
CONFIG_COMEDI_PCMMIO=y
CONFIG_COMEDI_PCMUIO=y
CONFIG_COMEDI_MULTIQ3=y
# CONFIG_COMEDI_S526 is not set
CONFIG_COMEDI_PCI_DRIVERS=y
CONFIG_COMEDI_8255_PCI=y
CONFIG_COMEDI_ADDI_WATCHDOG=y
# CONFIG_COMEDI_ADDI_APCI_1032 is not set
# CONFIG_COMEDI_ADDI_APCI_1500 is not set
CONFIG_COMEDI_ADDI_APCI_1516=y
CONFIG_COMEDI_ADDI_APCI_1564=y
# CONFIG_COMEDI_ADDI_APCI_16XX is not set
# CONFIG_COMEDI_ADDI_APCI_2032 is not set
# CONFIG_COMEDI_ADDI_APCI_2200 is not set
CONFIG_COMEDI_ADDI_APCI_3120=y
CONFIG_COMEDI_ADDI_APCI_3501=y
CONFIG_COMEDI_ADDI_APCI_3XXX=y
CONFIG_COMEDI_ADL_PCI6208=y
CONFIG_COMEDI_ADL_PCI7X3X=y
CONFIG_COMEDI_ADL_PCI8164=y
CONFIG_COMEDI_ADL_PCI9111=y
CONFIG_COMEDI_ADL_PCI9118=y
CONFIG_COMEDI_ADV_PCI1710=y
CONFIG_COMEDI_ADV_PCI1720=y
# CONFIG_COMEDI_ADV_PCI1723 is not set
CONFIG_COMEDI_ADV_PCI1724=y
CONFIG_COMEDI_ADV_PCI1760=y
CONFIG_COMEDI_ADV_PCI_DIO=y
CONFIG_COMEDI_AMPLC_DIO200_PCI=y
CONFIG_COMEDI_AMPLC_PC236_PCI=y
# CONFIG_COMEDI_AMPLC_PC263_PCI is not set
CONFIG_COMEDI_AMPLC_PCI224=y
# CONFIG_COMEDI_AMPLC_PCI230 is not set
CONFIG_COMEDI_CONTEC_PCI_DIO=y
CONFIG_COMEDI_DAS08_PCI=y
CONFIG_COMEDI_DT3000=y
# CONFIG_COMEDI_DYNA_PCI10XX is not set
CONFIG_COMEDI_GSC_HPDI=y
# CONFIG_COMEDI_MF6X4 is not set
CONFIG_COMEDI_ICP_MULTI=y
CONFIG_COMEDI_DAQBOARD2000=y
CONFIG_COMEDI_JR3_PCI=y
CONFIG_COMEDI_KE_COUNTER=y
CONFIG_COMEDI_CB_PCIDAS64=y
CONFIG_COMEDI_CB_PCIDAS=y
CONFIG_COMEDI_CB_PCIDDA=y
CONFIG_COMEDI_CB_PCIMDAS=y
# CONFIG_COMEDI_CB_PCIMDDA is not set
# CONFIG_COMEDI_ME4000 is not set
# CONFIG_COMEDI_ME_DAQ is not set
CONFIG_COMEDI_NI_6527=y
CONFIG_COMEDI_NI_65XX=y
# CONFIG_COMEDI_NI_660X is not set
CONFIG_COMEDI_NI_670X=y
# CONFIG_COMEDI_NI_LABPC_PCI is not set
# CONFIG_COMEDI_NI_PCIDIO is not set
CONFIG_COMEDI_NI_PCIMIO=y
CONFIG_COMEDI_RTD520=y
# CONFIG_COMEDI_S626 is not set
CONFIG_COMEDI_MITE=y
CONFIG_COMEDI_NI_TIOCMD=y
# CONFIG_COMEDI_USB_DRIVERS is not set
CONFIG_COMEDI_8254=y
CONFIG_COMEDI_8255=y
# CONFIG_COMEDI_8255_SA is not set
CONFIG_COMEDI_KCOMEDILIB=y
CONFIG_COMEDI_AMPLC_DIO200=y
CONFIG_COMEDI_AMPLC_PC236=y
CONFIG_COMEDI_DAS08=y
CONFIG_COMEDI_NI_TIO=y

#
# IIO staging drivers
#

#
# Accelerometers
#
CONFIG_ADIS16203=y
CONFIG_ADIS16240=y

#
# Analog to digital converters
#
CONFIG_AD7606=y
# CONFIG_AD7606_IFACE_PARALLEL is not set
CONFIG_AD7606_IFACE_SPI=y
# CONFIG_AD7780 is not set
# CONFIG_AD7816 is not set
# CONFIG_AD7192 is not set
CONFIG_AD7280=y

#
# Analog digital bi-direction converters
#
CONFIG_ADT7316=y
CONFIG_ADT7316_SPI=y
# CONFIG_ADT7316_I2C is not set

#
# Capacitance to digital converters
#
CONFIG_AD7150=y
# CONFIG_AD7152 is not set
# CONFIG_AD7746 is not set

#
# Direct Digital Synthesis
#
CONFIG_AD9832=y
CONFIG_AD9834=y

#
# Network Analyzer, Impedance Converters
#
CONFIG_AD5933=y

#
# Active energy metering IC
#
CONFIG_ADE7854=y
# CONFIG_ADE7854_I2C is not set
# CONFIG_ADE7854_SPI is not set

#
# Resolver to digital converters
#
CONFIG_AD2S90=y
# CONFIG_AD2S1210 is not set
# CONFIG_FB_SM750 is not set
# CONFIG_FB_XGI is not set

#
# Speakup console speech
#
CONFIG_STAGING_MEDIA=y
# CONFIG_I2C_BCM2048 is not set
# CONFIG_TEGRA_VDE is not set
# CONFIG_VIDEO_ZORAN is not set

#
# Android
#
# CONFIG_STAGING_BOARD is not set
# CONFIG_GOLDFISH_AUDIO is not set
# CONFIG_DGNC is not set
# CONFIG_GS_FPGABOOT is not set
# CONFIG_UNISYSSPAR is not set
# CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
# CONFIG_FB_TFT is not set
CONFIG_MOST=y
CONFIG_MOST_CDEV=y
# CONFIG_MOST_VIDEO is not set
# CONFIG_MOST_DIM2 is not set
# CONFIG_MOST_I2C is not set
CONFIG_GREYBUS=y
CONFIG_GREYBUS_ES2=y
# CONFIG_GREYBUS_AUDIO is not set
# CONFIG_GREYBUS_BOOTROM is not set
CONFIG_GREYBUS_FIRMWARE=y
CONFIG_GREYBUS_LIGHT=y
CONFIG_GREYBUS_LOG=y
CONFIG_GREYBUS_LOOPBACK=y
CONFIG_GREYBUS_POWER=y
CONFIG_GREYBUS_RAW=y
# CONFIG_GREYBUS_VIBRATOR is not set
# CONFIG_GREYBUS_BRIDGED_PHY is not set
# CONFIG_GREYBUS_ARCHE is not set
CONFIG_BCM_VIDEOCORE=y
# CONFIG_BCM2835_VCHIQ is not set
# CONFIG_VIDEO_BCM2835 is not set
# CONFIG_PI433 is not set

#
# Gasket devices
#
# CONFIG_XIL_AXIS_FIFO is not set
# CONFIG_IGB_AVB is not set
CONFIG_MIPS_PLATFORM_DEVICES=y
CONFIG_GOLDFISH=y
CONFIG_GOLDFISH_PIPE=y
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Common Clock Framework
#
CONFIG_COMMON_CLK_WM831X=y
# CONFIG_COMMON_CLK_VERSATILE is not set
CONFIG_CLK_HSDK=y
CONFIG_COMMON_CLK_MAX77686=y
CONFIG_COMMON_CLK_MAX9485=y
CONFIG_COMMON_CLK_HI655X=y
CONFIG_COMMON_CLK_SCMI=y
CONFIG_COMMON_CLK_SCPI=y
CONFIG_COMMON_CLK_SI5351=y
# CONFIG_COMMON_CLK_SI514 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_SI570 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CDCE925 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_GEMINI is not set
CONFIG_COMMON_CLK_ASPEED=y
CONFIG_COMMON_CLK_S2MPS11=y
# CONFIG_COMMON_CLK_AXI_CLKGEN is not set
# CONFIG_CLK_QORIQ is not set
CONFIG_COMMON_CLK_XGENE=y
CONFIG_COMMON_CLK_PALMAS=y
# CONFIG_COMMON_CLK_PWM is not set
CONFIG_COMMON_CLK_OXNAS=y
# CONFIG_COMMON_CLK_VC5 is not set
CONFIG_CLK_ACTIONS=y
CONFIG_CLK_OWL_S700=y
CONFIG_CLK_OWL_S900=y
# CONFIG_CLK_BCM_63XX is not set
# CONFIG_CLK_BCM_KONA is not set
CONFIG_COMMON_CLK_IPROC=y
# CONFIG_CLK_BCM_CYGNUS is not set
# CONFIG_CLK_BCM_HR2 is not set
# CONFIG_CLK_BCM_NSP is not set
CONFIG_CLK_BCM_NS2=y
CONFIG_CLK_BCM_SR=y
# CONFIG_COMMON_CLK_HI3516CV300 is not set
CONFIG_COMMON_CLK_HI3519=y
# CONFIG_COMMON_CLK_HI3660 is not set
CONFIG_COMMON_CLK_HI3798CV200=y
CONFIG_COMMON_CLK_HI6220=y
CONFIG_RESET_HISI=y
# CONFIG_STUB_CLK_HI6220 is not set
CONFIG_STUB_CLK_HI3660=y
# CONFIG_COMMON_CLK_BOSTON is not set
# CONFIG_COMMON_CLK_KEYSTONE is not set

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
# CONFIG_COMMON_CLK_MT2701 is not set
CONFIG_COMMON_CLK_MT2712=y
CONFIG_COMMON_CLK_MT2712_BDPSYS=y
CONFIG_COMMON_CLK_MT2712_IMGSYS=y
CONFIG_COMMON_CLK_MT2712_JPGDECSYS=y
CONFIG_COMMON_CLK_MT2712_MFGCFG=y
CONFIG_COMMON_CLK_MT2712_MMSYS=y
CONFIG_COMMON_CLK_MT2712_VDECSYS=y
# CONFIG_COMMON_CLK_MT2712_VENCSYS is not set
# CONFIG_COMMON_CLK_MT6797 is not set
# CONFIG_COMMON_CLK_MT7622 is not set
CONFIG_COMMON_CLK_MT8135=y
CONFIG_COMMON_CLK_MT8173=y
# CONFIG_COMMON_CLK_QCOM is not set
# CONFIG_SPMI_PMIC_CLKDIV is not set
# CONFIG_CLK_RENESAS is not set
CONFIG_COMMON_CLK_SAMSUNG=y
CONFIG_EXYNOS_ARM64_COMMON_CLK=y
# CONFIG_EXYNOS_AUDSS_CLK_CON is not set
CONFIG_S3C2410_COMMON_CLK=y
CONFIG_S3C2412_COMMON_CLK=y
# CONFIG_S3C2443_COMMON_CLK is not set
CONFIG_SPRD_COMMON_CLK=y
CONFIG_SPRD_SC9860_CLK=y
CONFIG_SUNXI_CCU=y
# CONFIG_SUN50I_A64_CCU is not set
# CONFIG_SUN50I_H6_CCU is not set
# CONFIG_SUN50I_H6_R_CCU is not set
CONFIG_SUN4I_A10_CCU=y
CONFIG_SUN5I_CCU=y
CONFIG_SUN6I_A31_CCU=y
CONFIG_SUN8I_A23_CCU=y
CONFIG_SUN8I_A33_CCU=y
# CONFIG_SUN8I_A83T_CCU is not set
CONFIG_SUN8I_H3_CCU=y
CONFIG_SUN8I_V3S_CCU=y
CONFIG_SUN8I_DE2_CCU=y
CONFIG_SUN8I_R40_CCU=y
CONFIG_SUN9I_A80_CCU=y
CONFIG_SUN8I_R_CCU=y
CONFIG_COMMON_CLK_TI_ADPLL=y
# CONFIG_CLK_UNIPHIER is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
# CONFIG_BCM2835_TIMER is not set
# CONFIG_BCM_KONA_TIMER is not set
# CONFIG_DIGICOLOR_TIMER is not set
CONFIG_DW_APB_TIMER=y
CONFIG_FTTMR010_TIMER=y
# CONFIG_MESON6_TIMER is not set
# CONFIG_OWL_TIMER is not set
# CONFIG_SUN4I_TIMER is not set
# CONFIG_SUN5I_HSTIMER is not set
CONFIG_VT8500_TIMER=y
CONFIG_NPCM7XX_TIMER=y
# CONFIG_CADENCE_TTC_TIMER is not set
# CONFIG_ASM9260_TIMER is not set
# CONFIG_CLKSRC_DBX500_PRCMU is not set
CONFIG_CLPS711X_TIMER=y
# CONFIG_ATLAS7_TIMER is not set
# CONFIG_MXS_TIMER is not set
# CONFIG_PRIMA2_TIMER is not set
CONFIG_NSPIRE_TIMER=y
CONFIG_INTEGRATOR_AP_TIMER=y
# CONFIG_CLKSRC_PISTACHIO is not set
CONFIG_CLKSRC_TI_32K=y
# CONFIG_CLKSRC_NPS is not set
CONFIG_CLKSRC_MPS2=y
# CONFIG_ARC_TIMERS is not set
CONFIG_ARM_TIMER_SP804=y
CONFIG_ARMV7M_SYSTICK=y
# CONFIG_ATMEL_ST is not set
CONFIG_CLKSRC_SAMSUNG_PWM=y
CONFIG_FSL_FTM_TIMER=y
CONFIG_OXNAS_RPS_TIMER=y
# CONFIG_MTK_TIMER is not set
CONFIG_SPRD_TIMER=y
# CONFIG_CLKSRC_JCORE_PIT is not set
# CONFIG_SH_TIMER_CMT is not set
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_RENESAS_OSTM is not set
CONFIG_SH_TIMER_TMU=y
# CONFIG_EM_TIMER_STI is not set
CONFIG_CLKSRC_VERSATILE=y
CONFIG_CLKSRC_MIPS_GIC=y
# CONFIG_CLKSRC_PXA is not set
# CONFIG_H8300_TMR8 is not set
# CONFIG_H8300_TMR16 is not set
# CONFIG_H8300_TPU is not set
# CONFIG_CLKSRC_ST_LPC is not set
# CONFIG_ATCPIT100_TIMER is not set
CONFIG_MAILBOX=y
CONFIG_IMX_MBOX=y
# CONFIG_PLATFORM_MHU is not set
CONFIG_ROCKCHIP_MBOX=y
# CONFIG_ALTERA_MBOX is not set
# CONFIG_HI3660_MBOX is not set
# CONFIG_HI6220_MBOX is not set
# CONFIG_MAILBOX_TEST is not set
CONFIG_QCOM_APCS_IPC=y
# CONFIG_BCM_PDC_MBOX is not set
CONFIG_MTK_CMDQ_MBOX=y
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_QCOM_GLINK_NATIVE=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
# CONFIG_RPMSG_VIRTIO is not set

#
# SOC (System On Chip) specific Drivers
#
CONFIG_OWL_PM_DOMAINS_HELPER=y
CONFIG_OWL_PM_DOMAINS=y

#
# Amlogic SoC drivers
#
# CONFIG_MESON_GX_SOCINFO is not set
# CONFIG_MESON_GX_PM_DOMAINS is not set
CONFIG_MESON_MX_SOCINFO=y
CONFIG_AT91_SOC_ID=y

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BRCMSTB is not set

#
# NXP/Freescale QorIQ SoC drivers
#

#
# i.MX SoC drivers
#
# CONFIG_IMX7_PM_DOMAINS is not set

#
# MediaTek SoC drivers
#
CONFIG_MTK_INFRACFG=y
# CONFIG_MTK_PMIC_WRAP is not set
# CONFIG_MTK_SCPSYS is not set

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_GENI_SE is not set
# CONFIG_QCOM_RPMH is not set
# CONFIG_SOC_RENESAS is not set
CONFIG_ROCKCHIP_GRF=y
# CONFIG_ROCKCHIP_PM_DOMAINS is not set
# CONFIG_SOC_SAMSUNG is not set
CONFIG_SOC_TI=y
CONFIG_UX500_SOC_ID=y

#
# Xilinx SoC drivers
#
CONFIG_XILINX_VCU=y
# CONFIG_SOC_ZTE is not set
CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
CONFIG_DEVFREQ_GOV_POWERSAVE=y
# CONFIG_DEVFREQ_GOV_USERSPACE is not set
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
CONFIG_PM_DEVFREQ_EVENT=y
# CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP is not set
CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y
CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ADC_JACK is not set
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_MAX14577=y
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_MAX8997=y
CONFIG_EXTCON_PALMAS=y
CONFIG_EXTCON_QCOM_SPMI_MISC=y
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
CONFIG_MEMORY=y
CONFIG_JZ4780_NEMC=y
CONFIG_SAMSUNG_MC=y
CONFIG_EXYNOS_SROM=y
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
# CONFIG_IIO_BUFFER_CB is not set
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=y
# CONFIG_IIO_SW_TRIGGER is not set
CONFIG_IIO_TRIGGERED_EVENT=y

#
# Accelerometers
#
CONFIG_ADIS16201=y
CONFIG_ADIS16209=y
CONFIG_ADXL345=y
# CONFIG_ADXL345_I2C is not set
CONFIG_ADXL345_SPI=y
CONFIG_BMA180=y
CONFIG_BMA220=y
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
CONFIG_BMC150_ACCEL_SPI=y
CONFIG_DA280=y
# CONFIG_DA311 is not set
# CONFIG_DMARD06 is not set
# CONFIG_DMARD09 is not set
CONFIG_DMARD10=y
# CONFIG_IIO_CROS_EC_ACCEL_LEGACY is not set
CONFIG_IIO_ST_ACCEL_3AXIS=y
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=y
CONFIG_IIO_ST_ACCEL_SPI_3AXIS=y
CONFIG_KXSD9=y
# CONFIG_KXSD9_SPI is not set
CONFIG_KXSD9_I2C=y
CONFIG_KXCJK1013=y
CONFIG_MC3230=y
# CONFIG_MMA7455_I2C is not set
# CONFIG_MMA7455_SPI is not set
CONFIG_MMA7660=y
CONFIG_MMA8452=y
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
# CONFIG_MMA9553 is not set
# CONFIG_MXC4005 is not set
CONFIG_MXC6255=y
# CONFIG_SCA3000 is not set
# CONFIG_STK8312 is not set
CONFIG_STK8BA50=y

#
# Analog to digital converters
#
CONFIG_AD7266=y
CONFIG_AD7291=y
# CONFIG_AD7298 is not set
# CONFIG_AD7476 is not set
CONFIG_AD7766=y
# CONFIG_AD7791 is not set
# CONFIG_AD7793 is not set
# CONFIG_AD7887 is not set
CONFIG_AD7923=y
CONFIG_AD799X=y
CONFIG_ASPEED_ADC=y
CONFIG_AT91_SAMA5D2_ADC=y
# CONFIG_AXP20X_ADC is not set
CONFIG_AXP288_ADC=y
# CONFIG_BCM_IPROC_ADC is not set
# CONFIG_CC10001_ADC is not set
# CONFIG_DA9150_GPADC is not set
CONFIG_DLN2_ADC=y
# CONFIG_ENVELOPE_DETECTOR is not set
# CONFIG_EXYNOS_ADC is not set
CONFIG_MXS_LRADC_ADC=y
CONFIG_HI8435=y
# CONFIG_HX711 is not set
CONFIG_IMX7D_ADC=y
CONFIG_LP8788_ADC=y
# CONFIG_LPC18XX_ADC is not set
CONFIG_LPC32XX_ADC=y
# CONFIG_LTC2471 is not set
CONFIG_LTC2485=y
CONFIG_LTC2497=y
CONFIG_MAX1027=y
CONFIG_MAX11100=y
CONFIG_MAX1118=y
# CONFIG_MAX1363 is not set
CONFIG_MAX9611=y
CONFIG_MCP320X=y
CONFIG_MCP3422=y
CONFIG_MEDIATEK_MT6577_AUXADC=y
CONFIG_MEN_Z188_ADC=y
# CONFIG_MESON_SARADC is not set
CONFIG_NAU7802=y
# CONFIG_PALMAS_GPADC is not set
CONFIG_QCOM_VADC_COMMON=y
CONFIG_QCOM_PM8XXX_XOADC=y
CONFIG_QCOM_SPMI_IADC=y
CONFIG_QCOM_SPMI_VADC=y
# CONFIG_RCAR_GYRO_ADC is not set
CONFIG_SC27XX_ADC=y
# CONFIG_SPEAR_ADC is not set
CONFIG_SD_ADC_MODULATOR=y
# CONFIG_STM32_ADC_CORE is not set
CONFIG_STM32_DFSDM_CORE=y
CONFIG_STM32_DFSDM_ADC=y
# CONFIG_TI_ADC081C is not set
# CONFIG_TI_ADC0832 is not set
CONFIG_TI_ADC084S021=y
# CONFIG_TI_ADC12138 is not set
CONFIG_TI_ADC108S102=y
CONFIG_TI_ADC128S052=y
CONFIG_TI_ADC161S626=y
CONFIG_TI_ADS1015=y
CONFIG_TI_ADS7950=y
# CONFIG_TI_ADS8688 is not set
# CONFIG_TI_TLC4541 is not set
CONFIG_TWL4030_MADC=y
# CONFIG_TWL6030_GPADC is not set
CONFIG_VF610_ADC=y
# CONFIG_VIPERBOARD_ADC is not set
CONFIG_XILINX_XADC=y

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set

#
# Amplifiers
#
CONFIG_AD8366=y

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
# CONFIG_BME680 is not set
CONFIG_CCS811=y
CONFIG_IAQCORE=y
CONFIG_VZ89X=y

#
# Hid Sensor IIO Common
#
CONFIG_IIO_MS_SENSORS_I2C=y

#
# SSP Sensor Common
#
# CONFIG_IIO_SSP_SENSORHUB is not set
CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_SPI=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Counters
#
CONFIG_STM32_LPTIMER_CNT=y

#
# Digital to analog converters
#
CONFIG_AD5064=y
CONFIG_AD5360=y
CONFIG_AD5380=y
CONFIG_AD5421=y
CONFIG_AD5446=y
# CONFIG_AD5449 is not set
# CONFIG_AD5592R is not set
# CONFIG_AD5593R is not set
# CONFIG_AD5504 is not set
CONFIG_AD5624R_SPI=y
CONFIG_LTC2632=y
CONFIG_AD5686=y
CONFIG_AD5686_SPI=y
# CONFIG_AD5696_I2C is not set
CONFIG_AD5755=y
CONFIG_AD5758=y
# CONFIG_AD5761 is not set
CONFIG_AD5764=y
CONFIG_AD5791=y
# CONFIG_AD7303 is not set
CONFIG_AD8801=y
CONFIG_DPOT_DAC=y
# CONFIG_DS4424 is not set
# CONFIG_LPC18XX_DAC is not set
# CONFIG_M62332 is not set
# CONFIG_MAX517 is not set
# CONFIG_MAX5821 is not set
# CONFIG_MCP4725 is not set
CONFIG_MCP4922=y
CONFIG_STM32_DAC=y
CONFIG_STM32_DAC_CORE=y
# CONFIG_TI_DAC082S085 is not set
# CONFIG_TI_DAC5571 is not set
CONFIG_VF610_DAC=y

#
# IIO dummy driver
#
CONFIG_IIO_SIMPLE_DUMMY=y
# CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
CONFIG_IIO_SIMPLE_DUMMY_BUFFER=y

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
CONFIG_AD9523=y

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# CONFIG_ADF4350 is not set

#
# Digital gyroscope sensors
#
# CONFIG_ADIS16080 is not set
CONFIG_ADIS16130=y
CONFIG_ADIS16136=y
# CONFIG_ADIS16260 is not set
CONFIG_ADXRS450=y
# CONFIG_BMG160 is not set
CONFIG_MPU3050=y
CONFIG_MPU3050_I2C=y
# CONFIG_IIO_ST_GYRO_3AXIS is not set
CONFIG_ITG3200=y

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4403=y
# CONFIG_AFE4404 is not set
CONFIG_MAX30100=y
# CONFIG_MAX30102 is not set

#
# Humidity sensors
#
CONFIG_AM2315=y
CONFIG_DHT11=y
CONFIG_HDC100X=y
CONFIG_HTS221=y
CONFIG_HTS221_I2C=y
CONFIG_HTS221_SPI=y
CONFIG_HTU21=y
# CONFIG_SI7005 is not set
# CONFIG_SI7020 is not set

#
# Inertial measurement units
#
# CONFIG_ADIS16400 is not set
# CONFIG_ADIS16480 is not set
CONFIG_BMI160=y
CONFIG_BMI160_I2C=y
# CONFIG_BMI160_SPI is not set
# CONFIG_KMX61 is not set
CONFIG_INV_MPU6050_IIO=y
CONFIG_INV_MPU6050_I2C=y
# CONFIG_INV_MPU6050_SPI is not set
# CONFIG_IIO_ST_LSM6DSX is not set
CONFIG_IIO_ADIS_LIB=y
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
CONFIG_ADJD_S311=y
CONFIG_AL3320A=y
CONFIG_APDS9300=y
# CONFIG_APDS9960 is not set
CONFIG_BH1750=y
CONFIG_BH1780=y
CONFIG_CM32181=y
# CONFIG_CM3232 is not set
# CONFIG_CM3323 is not set
# CONFIG_CM3605 is not set
# CONFIG_CM36651 is not set
# CONFIG_GP2AP020A00F is not set
# CONFIG_SENSORS_ISL29018 is not set
# CONFIG_SENSORS_ISL29028 is not set
CONFIG_ISL29125=y
# CONFIG_JSA1212 is not set
CONFIG_RPR0521=y
CONFIG_LTR501=y
CONFIG_LV0104CS=y
CONFIG_MAX44000=y
CONFIG_OPT3001=y
CONFIG_PA12203001=y
# CONFIG_SI1133 is not set
CONFIG_SI1145=y
# CONFIG_STK3310 is not set
CONFIG_ST_UVIS25=y
CONFIG_ST_UVIS25_I2C=y
CONFIG_ST_UVIS25_SPI=y
# CONFIG_TCS3414 is not set
CONFIG_TCS3472=y
CONFIG_SENSORS_TSL2563=y
CONFIG_TSL2583=y
CONFIG_TSL2772=y
CONFIG_TSL4531=y
# CONFIG_US5182D is not set
CONFIG_VCNL4000=y
# CONFIG_VEML6070 is not set
CONFIG_VL6180=y
CONFIG_ZOPT2201=y

#
# Magnetometer sensors
#
CONFIG_AK8974=y
CONFIG_AK8975=y
CONFIG_AK09911=y
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
CONFIG_BMC150_MAGN_SPI=y
CONFIG_MAG3110=y
CONFIG_MMC35240=y
CONFIG_IIO_ST_MAGN_3AXIS=y
CONFIG_IIO_ST_MAGN_I2C_3AXIS=y
CONFIG_IIO_ST_MAGN_SPI_3AXIS=y
CONFIG_SENSORS_HMC5843=y
CONFIG_SENSORS_HMC5843_I2C=y
CONFIG_SENSORS_HMC5843_SPI=y

#
# Multiplexers
#
CONFIG_IIO_MUX=y

#
# Inclinometer sensors
#

#
# Triggers - standalone
#
CONFIG_IIO_INTERRUPT_TRIGGER=y
# CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
CONFIG_IIO_STM32_TIMER_TRIGGER=y
# CONFIG_IIO_SYSFS_TRIGGER is not set

#
# Digital potentiometers
#
CONFIG_AD5272=y
CONFIG_DS1803=y
CONFIG_MAX5481=y
CONFIG_MAX5487=y
CONFIG_MCP4018=y
CONFIG_MCP4131=y
CONFIG_MCP4531=y
CONFIG_TPL0102=y

#
# Digital potentiostats
#
# CONFIG_LMP91000 is not set

#
# Pressure sensors
#
CONFIG_ABP060MG=y
CONFIG_BMP280=y
CONFIG_BMP280_I2C=y
CONFIG_BMP280_SPI=y
# CONFIG_HP03 is not set
CONFIG_MPL115=y
CONFIG_MPL115_I2C=y
CONFIG_MPL115_SPI=y
CONFIG_MPL3115=y
CONFIG_MS5611=y
CONFIG_MS5611_I2C=y
CONFIG_MS5611_SPI=y
CONFIG_MS5637=y
CONFIG_IIO_ST_PRESS=y
CONFIG_IIO_ST_PRESS_I2C=y
CONFIG_IIO_ST_PRESS_SPI=y
CONFIG_T5403=y
CONFIG_HP206C=y
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y
CONFIG_ZPA2326_SPI=y

#
# Lightning sensors
#
# CONFIG_AS3935 is not set

#
# Proximity and distance sensors
#
# CONFIG_ISL29501 is not set
# CONFIG_LIDAR_LITE_V2 is not set
CONFIG_RFD77402=y
CONFIG_SRF04=y
CONFIG_SX9500=y
CONFIG_SRF08=y

#
# Resolver to digital converters
#
CONFIG_AD2S1200=y

#
# Temperature sensors
#
CONFIG_MAXIM_THERMOCOUPLE=y
CONFIG_MLX90614=y
# CONFIG_MLX90632 is not set
# CONFIG_TMP006 is not set
CONFIG_TMP007=y
CONFIG_TSYS01=y
# CONFIG_TSYS02D is not set
CONFIG_NTB=y
CONFIG_NTB_IDT=y
CONFIG_NTB_SWITCHTEC=y
CONFIG_NTB_PINGPONG=y
CONFIG_NTB_TOOL=y
# CONFIG_NTB_PERF is not set
CONFIG_NTB_TRANSPORT=y
CONFIG_VME_BUS=y

#
# VME Bridge Drivers
#
# CONFIG_VME_CA91CX42 is not set
CONFIG_VME_TSI148=y
CONFIG_VME_FAKE=y

#
# VME Board Drivers
#
# CONFIG_VMIVME_7805 is not set

#
# VME Device Drivers
#
CONFIG_VME_USER=y
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_BCM_IPROC is not set
# CONFIG_PWM_CLPS711X is not set
# CONFIG_PWM_FSL_FTM is not set
# CONFIG_PWM_HIBVT is not set
CONFIG_PWM_IMG=y
CONFIG_PWM_MTK_DISP=y
# CONFIG_PWM_MEDIATEK is not set
CONFIG_PWM_PCA9685=y
CONFIG_PWM_RCAR=y
CONFIG_PWM_RENESAS_TPU=y
# CONFIG_PWM_STM32 is not set
# CONFIG_PWM_STM32_LP is not set
# CONFIG_PWM_SUN4I is not set
CONFIG_PWM_TWL=y
# CONFIG_PWM_TWL_LED is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_ARM_GIC_MAX_NR=1
CONFIG_IRQ_MIPS_CPU=y
# CONFIG_JCORE_AIC is not set
# CONFIG_TS4800_IRQ is not set
CONFIG_MIPS_GIC=y
# CONFIG_EZNPS_GIC is not set
CONFIG_IRQ_UNIPHIER_AIDET=y
# CONFIG_GOLDFISH_PIC is not set
CONFIG_IPACK_BUS=y
# CONFIG_BOARD_TPCI200 is not set
CONFIG_SERIAL_IPOCTAL=y
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_ATH79 is not set
CONFIG_RESET_AXS10X=y
CONFIG_RESET_BERLIN=y
# CONFIG_RESET_HSDK is not set
# CONFIG_RESET_IMX7 is not set
CONFIG_RESET_LANTIQ=y
CONFIG_RESET_LPC18XX=y
# CONFIG_RESET_MESON is not set
CONFIG_RESET_MESON_AUDIO_ARB=y
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_QCOM_AOSS is not set
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_STM32MP157 is not set
CONFIG_RESET_SUNXI=y
# CONFIG_RESET_TI_SYSCON is not set
# CONFIG_RESET_UNIPHIER is not set
# CONFIG_RESET_UNIPHIER_USB3 is not set
# CONFIG_RESET_ZYNQ is not set
CONFIG_COMMON_RESET_HI3660=y
CONFIG_COMMON_RESET_HI6220=y
# CONFIG_FMC is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_PHY_LPC18XX_USB_OTG is not set
# CONFIG_PHY_XGENE is not set
# CONFIG_PHY_MESON8B_USB2 is not set
# CONFIG_PHY_MESON_GXL_USB2 is not set
# CONFIG_PHY_MESON_GXL_USB3 is not set
# CONFIG_PHY_CYGNUS_PCIE is not set
CONFIG_BCM_KONA_USB2_PHY=y
# CONFIG_PHY_BCM_NS_USB2 is not set
# CONFIG_PHY_NS2_USB_DRD is not set
# CONFIG_PHY_BRCM_SATA is not set
# CONFIG_PHY_BCM_SR_PCIE is not set
CONFIG_PHY_HI6220_USB=y
CONFIG_PHY_HISTB_COMBPHY=y
CONFIG_PHY_HISI_INNO_USB2=y
# CONFIG_PHY_LANTIQ_RCU_USB2 is not set
CONFIG_ARMADA375_USBCLUSTER_PHY=y
# CONFIG_PHY_MVEBU_CP110_COMPHY is not set
CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_CPCAP_USB=y
# CONFIG_PHY_MAPPHONE_MDM6600 is not set
CONFIG_PHY_ATH79_USB=y
# CONFIG_PHY_QCOM_QMP is not set
# CONFIG_PHY_QCOM_QUSB2 is not set
CONFIG_PHY_RALINK_USB=y
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
# CONFIG_PHY_ROCKCHIP_INNO_USB2 is not set
# CONFIG_PHY_ROCKCHIP_PCIE is not set
# CONFIG_PHY_ROCKCHIP_TYPEC is not set
# CONFIG_PHY_EXYNOS_DP_VIDEO is not set
CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
# CONFIG_PHY_EXYNOS_PCIE is not set
CONFIG_PHY_ST_SPEAR1310_MIPHY=y
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
# CONFIG_PHY_STIH407_USB is not set
CONFIG_PHY_STM32_USBPHYC=y
CONFIG_OMAP_CONTROL_PHY=y
# CONFIG_POWERCAP is not set
CONFIG_MCB=y
CONFIG_MCB_PCI=y
CONFIG_MCB_LPC=y
CONFIG_RAS=y
# CONFIG_THUNDERBOLT is not set

#
# Android
#
# CONFIG_ANDROID is not set
CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_IMX_IIM=y
CONFIG_NVMEM_IMX_OCOTP=y
CONFIG_NVMEM_LPC18XX_EEPROM=y
CONFIG_NVMEM_LPC18XX_OTP=y
# CONFIG_NVMEM_MXS_OCOTP is not set
# CONFIG_MTK_EFUSE is not set
# CONFIG_QCOM_QFPROM is not set
# CONFIG_ROCKCHIP_EFUSE is not set
# CONFIG_NVMEM_BCM_OCOTP is not set
# CONFIG_UNIPHIER_EFUSE is not set
CONFIG_NVMEM_VF610_OCOTP=y
# CONFIG_MESON_MX_EFUSE is not set
# CONFIG_NVMEM_SNVS_LPGPR is not set
# CONFIG_SC27XX_EFUSE is not set

#
# HW tracing support
#
CONFIG_STM=y
# CONFIG_STM_PROTO_BASIC is not set
# CONFIG_STM_PROTO_SYS_T is not set
CONFIG_STM_DUMMY=y
# CONFIG_STM_SOURCE_CONSOLE is not set
# CONFIG_STM_SOURCE_HEARTBEAT is not set
CONFIG_FPGA=y
CONFIG_FPGA_MGR_SOCFPGA=y
# CONFIG_FPGA_MGR_SOCFPGA_A10 is not set
# CONFIG_ALTERA_PR_IP_CORE is not set
CONFIG_FPGA_MGR_ALTERA_PS_SPI=y
CONFIG_FPGA_MGR_ALTERA_CVP=y
CONFIG_FPGA_MGR_ZYNQ_FPGA=y
CONFIG_FPGA_MGR_XILINX_SPI=y
# CONFIG_FPGA_MGR_ICE40_SPI is not set
CONFIG_FPGA_MGR_MACHXO2_SPI=y
CONFIG_FPGA_BRIDGE=y
CONFIG_XILINX_PR_DECOUPLER=y
CONFIG_FPGA_REGION=y
# CONFIG_OF_FPGA_REGION is not set
# CONFIG_FPGA_DFL is not set
# CONFIG_FSI is not set
CONFIG_TEE=y

#
# TEE drivers
#
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=y
# CONFIG_MUX_ADGS1408 is not set
# CONFIG_MUX_GPIO is not set
CONFIG_MUX_MMIO=y
CONFIG_PM_OPP=y
CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=y
# CONFIG_SLIMBUS is not set
# CONFIG_LEGACY_ENERGY_MODEL_DT is not set

#
# File systems
#
CONFIG_FS_POSIX_ACL=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
# CONFIG_FILE_LOCKING is not set
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_VERITY=y
CONFIG_FS_VERITY_DEBUG=y
CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set

#
# Pseudo filesystems
#
# CONFIG_PROC_FS is not set
# CONFIG_PROC_CHILDREN is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=y
CONFIG_NLS_CODEPAGE_775=y
# CONFIG_NLS_CODEPAGE_850 is not set
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
# CONFIG_NLS_CODEPAGE_865 is not set
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
CONFIG_NLS_CODEPAGE_950=y
CONFIG_NLS_CODEPAGE_932=y
# CONFIG_NLS_CODEPAGE_949 is not set
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
# CONFIG_NLS_CODEPAGE_1250 is not set
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_9 is not set
CONFIG_NLS_ISO8859_13=y
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=y
# CONFIG_NLS_MAC_GAELIC is not set
CONFIG_NLS_MAC_GREEK=y
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=y
# CONFIG_NLS_MAC_TURKISH is not set
CONFIG_NLS_UTF8=y
# CONFIG_UNICODE is not set

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_BIG_KEYS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
# CONFIG_SECURITY_STACKING is not set
# CONFIG_SECURITY_LSM_DEBUG is not set
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_PATH=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_FALLBACK=y
# CONFIG_HARDENED_USERCOPY_PAGESPAN is not set
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
# CONFIG_SECURITY_YAMA is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
# CONFIG_INTEGRITY_ASYMMETRIC_KEYS is not set
CONFIG_IMA=y
CONFIG_IMA_MEASURE_PCR_IDX=10
# CONFIG_IMA_TEMPLATE is not set
CONFIG_IMA_NG_TEMPLATE=y
# CONFIG_IMA_SIG_TEMPLATE is not set
CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
CONFIG_IMA_DEFAULT_HASH_SHA1=y
# CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
# CONFIG_IMA_DEFAULT_HASH_WP512 is not set
CONFIG_IMA_DEFAULT_HASH="sha1"
# CONFIG_IMA_WRITE_POLICY is not set
# CONFIG_IMA_READ_POLICY is not set
# CONFIG_IMA_APPRAISE is not set
# CONFIG_EVM is not set

#
# Security Module Selection
#
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL=y
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_ECDH is not set
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
# CONFIG_CRYPTO_PCRYPT is not set
CONFIG_CRYPTO_WORKQUEUE=y
# CONFIG_CRYPTO_CRYPTD is not set
# CONFIG_CRYPTO_MCRYPTD is not set
CONFIG_CRYPTO_AUTHENC=y

#
# Authenticated Encryption with Associated Data
#
# CONFIG_CRYPTO_CCM is not set
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_AEGIS128=y
# CONFIG_CRYPTO_AEGIS128L is not set
# CONFIG_CRYPTO_AEGIS256 is not set
# CONFIG_CRYPTO_MORUS640 is not set
# CONFIG_CRYPTO_MORUS1280 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_KEYWRAP=y
# CONFIG_CRYPTO_ADIANTUM is not set

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_VMAC=y

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
# CONFIG_CRYPTO_RMD128 is not set
CONFIG_CRYPTO_RMD160=y
# CONFIG_CRYPTO_RMD256 is not set
# CONFIG_CRYPTO_RMD320 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_SM3=y
# CONFIG_CRYPTO_TGR192 is not set
CONFIG_CRYPTO_WP512=y

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
# CONFIG_CRYPTO_ANUBIS is not set
# CONFIG_CRYPTO_ARC4 is not set
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_SALSA20 is not set
CONFIG_CRYPTO_CHACHA20=y
# CONFIG_CRYPTO_SEED is not set
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=y
# CONFIG_CRYPTO_TEA is not set
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y

#
# Compression
#
# CONFIG_CRYPTO_DEFLATE is not set
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_842 is not set
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
# CONFIG_CRYPTO_ZSTD is not set

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_HASH_INFO=y
# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS7_MESSAGE_PARSER=y
CONFIG_PKCS7_TEST_KEY=y
CONFIG_SIGNED_PE_FILE_VERIFICATION=y

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
CONFIG_SECONDARY_TRUSTED_KEYRING=y
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set

#
# Library routines
#
CONFIG_BITREVERSE=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_STMP_DEVICE=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=y
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
CONFIG_CRC64=y
CONFIG_CRC4=y
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_ZLIB_INFLATE=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_XZ_DEC=y
# CONFIG_XZ_DEC_X86 is not set
# CONFIG_XZ_DEC_POWERPC is not set
# CONFIG_XZ_DEC_IA64 is not set
CONFIG_XZ_DEC_ARM=y
# CONFIG_XZ_DEC_ARMTHUMB is not set
# CONFIG_XZ_DEC_SPARC is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_HAVE_GENERIC_DMA_COHERENT=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
CONFIG_DMA_DIRECT_OPS=y
CONFIG_DMA_NONCOHERENT_OPS=y
CONFIG_DMA_NONCOHERENT_MMAP=y
CONFIG_DMA_NONCOHERENT_CACHE_SYNC=y
CONFIG_SGL_ALLOC=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
# CONFIG_CORDIC is not set
CONFIG_DDR=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
# CONFIG_PARMAN is not set
# CONFIG_STRING_SELFTEST is not set
CONFIG_GENERIC_LIB_ASHLDI3=y
CONFIG_GENERIC_LIB_ASHRDI3=y
CONFIG_GENERIC_LIB_LSHRDI3=y
CONFIG_GENERIC_LIB_CMPDI2=y
CONFIG_GENERIC_LIB_UCMPDI2=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
CONFIG_DYNAMIC_DEBUG=y

#
# Compile-time checks and compiler options
#
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=1024
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_UNUSED_SYMBOLS is not set
# CONFIG_PAGE_OWNER is not set
CONFIG_DEBUG_FS=y
CONFIG_HEADERS_CHECK=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_KERNEL=y

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_DEBUG_PAGEALLOC=y
# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
CONFIG_PAGE_POISONING=y
# CONFIG_PAGE_POISONING_NO_SANITY is not set
# CONFIG_PAGE_POISONING_ZERO is not set
CONFIG_DEBUG_OBJECTS=y
CONFIG_DEBUG_OBJECTS_SELFTEST=y
# CONFIG_DEBUG_OBJECTS_FREE is not set
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
# CONFIG_DEBUG_OBJECTS_WORK is not set
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_DEBUG_SLAB is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_DEBUG_VM is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_KASAN_STACK=0
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Lockups and Hangs
#
# CONFIG_SOFTLOCKUP_DETECTOR is not set
# CONFIG_DETECT_HUNG_TASK is not set
CONFIG_WQ_WATCHDOG=y
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_DEBUG_LOCKDEP=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=y
CONFIG_WW_MUTEX_SELFTEST=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
CONFIG_DEBUG_KOBJECT=y
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PI_LIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
# CONFIG_RCU_PERF_TEST is not set
CONFIG_RCU_TORTURE_TEST=y
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FAULT_INJECTION=y
CONFIG_FAILSLAB=y
CONFIG_FAIL_PAGE_ALLOC=y
CONFIG_FAULT_INJECTION_DEBUG_FS=y
CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACE_CLOCK=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_RUNTIME_TESTING_MENU is not set
# CONFIG_MEMTEST is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
# CONFIG_UBSAN is not set
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_CMDLINE_BOOL=y
CONFIG_CMDLINE=""
CONFIG_CMDLINE_OVERRIDE=y
# CONFIG_SPINLOCK_TEST is not set
# CONFIG_SCACHE_DEBUGFS is not set

--F+1AKTiXM4L/mNPj--
