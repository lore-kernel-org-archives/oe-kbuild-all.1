Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F386B14830F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 01:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749606175; cv=none; b=fBE0u3PaSWvpKN1zGe5GNCfcQSuQtbtxpA3x7EMHU0eLO+lh7+P6TH7lF1LohgqvTsTWkP6dieU5Q+maYC7XmdDhKrVlUNenQGCiHq9zl4JogjvhtU9U0C6YowHTnT2p1IQYfdu2qsHaKGGCYHa+xtp2w94j6NTTQjumACNxqqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749606175; c=relaxed/simple;
	bh=ItN/waBlaFU07+nmiHcRrRERVXONOBTvrBJ1wd4He5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A1Cz5hZtrKQn3k/PNMBeyA8LNHh7513+aVEySpasAv7Cd+a8v2giNFH4BV4ymFa/j29xQGE7DNGpSyv2wwE6cpDI8Uq/iOunh72mqiR6ZsUvAGGyhoRnhcV+YnpZ+oSxfJ3NRFQELEzg4DT7O610/ovqdV4Uaf/tkxBTJO48h0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YznC04Bc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YznC04Bc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749606166; x=1781142166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ItN/waBlaFU07+nmiHcRrRERVXONOBTvrBJ1wd4He5o=;
  b=YznC04BcG/eGnGTU0xXP7/FJBvbCgByuOZ+/+vbwyJBRKiupqOSOoT5I
   PESpMXs2RVuFVySLNh6VOwbA7Y1/QvBPMtgfQISyXmodyJT8jt31DtzJG
   a/qqWbQ/HtYz7Jw3gOe9ik6cwLmaVHpFzoFqcPHtD7e5UxmH5jP7aa70N
   Ipi6JSBH+tA43Gbm/HT6jvClNmkSaNNnZztYKrz1nEBNmMM8alMDlkGcQ
   NaZUY4SkJEBok5igmbhzvLHN2z5GmGVpP9r/pZo7ietsiqhd5FWli1RuE
   Rs04i4xvOsH9EOu6LLGWS+OnZcYmASViziNZD3iO6bSadaXlbI2mJiV2C
   g==;
X-CSE-ConnectionGUID: pm5Nl4qsQseB/aVSuH5Rnw==
X-CSE-MsgGUID: 6H0WCWD3ReSievqB4Xst5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51593581"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="51593581"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 18:42:45 -0700
X-CSE-ConnectionGUID: Zxfp/maiSu6C32xaMIZHGg==
X-CSE-MsgGUID: DR5do/nHRmqEWNOFwx0irQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="152157559"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2025 18:42:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uP0sM-0008Sj-0h;
	Tue, 10 Jun 2025 15:26:58 +0000
Date: Tue, 10 Jun 2025 23:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-direct-pfn 4/8] mm/hmm.c:753:47: error: passing
 argument 2 of 'dma_iova_update_state' from incompatible pointer type
Message-ID: <202506102342.Gkidw2fW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8wjzmNvoQ0j7X1k0"
Content-Disposition: inline


--8wjzmNvoQ0j7X1k0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-direct-pfn
head:   0577e06979d000543caf764193c6628c6fdd67a0
commit: ac2584d7ae3294dc92c58a6f06888cd21cf9391d [4/8] mm/hmm: Rely on DMA IOVA API to calculate p2p map
config: arc-randconfig-002-20250610
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build):

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506102342.Gkidw2fW-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/hmm.c: In function 'hmm_dma_map_pfn':
>> mm/hmm.c:753:47: error: passing argument 2 of 'dma_iova_update_state' from incompatible pointer type [-Wincompatible-pointer-types]
     753 |         dma_addr = dma_iova_update_state(dev, &state, paddr);
         |                                               ^~~~~~
         |                                               |
         |                                               struct dma_iova_state **
   In file included from include/linux/hmm-dma.h:6,
                    from mm/hmm.c:13:
   include/linux/dma-iova.h:36:71: note: expected 'struct dma_iova_state *' but argument is of type 'struct dma_iova_state **'
      36 |                                                struct dma_iova_state *state,
         |                                                ~~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> mm/hmm.c:763:26: error: passing argument 1 of 'dma_iova_p2p' from incompatible pointer type [-Wincompatible-pointer-types]
     763 |         if (dma_iova_p2p(&state)) {
         |                          ^~~~~~
         |                          |
         |                          struct dma_iova_state **
   include/linux/dma-iova.h:62:56: note: expected 'struct dma_iova_state *' but argument is of type 'struct dma_iova_state **'
      62 | static inline bool dma_iova_p2p(struct dma_iova_state *state)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~^~~~~


vim +/dma_iova_update_state +753 mm/hmm.c

   691	
   692	/**
   693	 * hmm_dma_map_pfn - Map a physical HMM page to DMA address
   694	 * @dev: Device to map the page for
   695	 * @map: HMM map
   696	 * @idx: Index into the PFN and dma address arrays
   697	 *
   698	 * dma_alloc_iova() allocates IOVA based on the size specified by their use in
   699	 * iova->size. Call this function after IOVA allocation to link whole @page
   700	 * to get the DMA address. Note that very first call to this function
   701	 * will have @offset set to 0 in the IOVA space allocated from
   702	 * dma_alloc_iova(). For subsequent calls to this function on same @iova,
   703	 * @offset needs to be advanced by the caller with the size of previous
   704	 * page that was linked + DMA address returned for the previous page that was
   705	 * linked by this function.
   706	 */
   707	dma_addr_t hmm_dma_map_pfn(struct device *dev, struct hmm_dma_map *map,
   708				   size_t idx)
   709	{
   710		struct dma_iova_state *state = &map->state;
   711		dma_addr_t *dma_addrs = map->dma_list;
   712		unsigned long *pfns = map->pfn_list;
   713		struct page *page = hmm_pfn_to_page(pfns[idx]);
   714		phys_addr_t paddr = hmm_pfn_to_phys(pfns[idx]);
   715		size_t offset = idx * map->dma_entry_size;
   716		unsigned long attrs = 0;
   717		dma_addr_t dma_addr;
   718		int ret;
   719	
   720		if ((pfns[idx] & HMM_PFN_DMA_MAPPED) &&
   721		    !(pfns[idx] & HMM_PFN_P2PDMA_BUS)) {
   722			/*
   723			 * We are in this flow when there is a need to resync flags,
   724			 * for example when page was already linked in prefetch call
   725			 * with READ flag and now we need to add WRITE flag
   726			 *
   727			 * This page was already programmed to HW and we don't want/need
   728			 * to unlink and link it again just to resync flags.
   729			 */
   730			if (dma_use_iova(state))
   731				return state->addr + offset;
   732	
   733			/*
   734			 * Without dma_need_unmap, the dma_addrs array is NULL, thus we
   735			 * need to regenerate the address below even if there already
   736			 * was a mapping. But !dma_need_unmap implies that the
   737			 * mapping stateless, so this is fine.
   738			 */
   739			if (dma_need_unmap(dev))
   740				return dma_addrs[idx];
   741	
   742			/* Continue to remapping */
   743		}
   744	
   745		/*
   746		 * HMM is different from typical DMA IOVA users because every page can
   747		 * have different properties and all transactions are per-page.
   748		 * In opposite to other users who preserve same properties accross
   749		 * whole transaction for all pages at once.
   750		 *
   751		 * So we change state properties on every page call.
   752		 */
 > 753		dma_addr = dma_iova_update_state(dev, &state, paddr);
   754		if (dma_mapping_error(dev, dma_addr))
   755			goto error;
   756	
   757		if (dma_addr) {
   758			/* PCI_P2PDMA_MAP_BUS_ADDR case */
   759			pfns[idx] |= HMM_PFN_P2PDMA_BUS | HMM_PFN_DMA_MAPPED;
   760			return dma_addr;
   761		}
   762	
 > 763		if (dma_iova_p2p(&state)) {
   764			/* PCI_P2PDMA_MAP_THRU_HOST_BRIDGE case */
   765			attrs |= DMA_ATTR_SKIP_CPU_SYNC;
   766			pfns[idx] |= HMM_PFN_P2PDMA;
   767		}
   768	
   769		if (dma_use_iova(state)) {
   770			ret = dma_iova_link(dev, state, paddr, offset,
   771					    map->dma_entry_size, DMA_BIDIRECTIONAL,
   772					    attrs);
   773			if (ret)
   774				goto error;
   775	
   776			ret = dma_iova_sync(dev, state, offset, map->dma_entry_size);
   777			if (ret) {
   778				dma_iova_unlink(dev, state, offset, map->dma_entry_size,
   779						DMA_BIDIRECTIONAL, attrs);
   780				goto error;
   781			}
   782	
   783			dma_addr = state->addr + offset;
   784		} else {
   785			if (WARN_ON_ONCE(dma_need_unmap(dev) && !dma_addrs))
   786				goto error;
   787	
   788			dma_addr = dma_map_page(dev, page, 0, map->dma_entry_size,
   789						DMA_BIDIRECTIONAL);
   790			if (dma_mapping_error(dev, dma_addr))
   791				goto error;
   792	
   793			if (dma_need_unmap(dev))
   794				dma_addrs[idx] = dma_addr;
   795		}
   796		pfns[idx] |= HMM_PFN_DMA_MAPPED;
   797		return dma_addr;
   798	error:
   799		pfns[idx] &= ~HMM_PFN_P2PDMA;
   800		return DMA_MAPPING_ERROR;
   801	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--8wjzmNvoQ0j7X1k0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

reproduce (this is a W=1 build):
        git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
        # https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/commit/?id=ac2584d7ae3294dc92c58a6f06888cd21cf9391d
        git remote add leon-rdma https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git
        git fetch --no-tags leon-rdma dma-direct-pfn
        git checkout ac2584d7ae3294dc92c58a6f06888cd21cf9391d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-14.3.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-14.3.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash mm/

--8wjzmNvoQ0j7X1k0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/arc 6.16.0-rc1 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="arc-linux-gcc (GCC) 14.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=140300
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=24400
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=24400
CONFIG_LLD_VERSION=0
CONFIG_RUSTC_VERSION=0
CONFIG_RUSTC_LLVM_VERSION=0
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_LD_CAN_USE_KEEP_IN_OVERLAY=y
CONFIG_PAHOLE_VERSION=130
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_LZMA=y
# CONFIG_KERNEL_GZIP is not set
CONFIG_KERNEL_LZMA=y
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_WATCH_QUEUE=y
CONFIG_CROSS_MEMORY_ATTACH=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_TIME_KUNIT_TEST=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
# end of BPF subsystem

CONFIG_PREEMPT_NONE_BUILD=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_TINY_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_NEED_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_TASKS_TRACE_RCU_READ_MB=y
CONFIG_RCU_DOUBLE_CHECK_CB_TIME=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=y
CONFIG_LOG_BUF_SHIFT=17
CONFIG_PRINTK_INDEX=y
CONFIG_GENERIC_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC10_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_GCC_NO_STRINGOP_OVERFLOW=y
CONFIG_CC_NO_STRINGOP_OVERFLOW=y
CONFIG_SLAB_OBJ_EXT=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
# CONFIG_MEMCG_V1 is not set
# CONFIG_BLK_CGROUP is not set
# CONFIG_CGROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
# CONFIG_CGROUP_DMEM is not set
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_MISC=y
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_RD_GZIP is not set
# CONFIG_RD_BZIP2 is not set
CONFIG_RD_LZMA=y
# CONFIG_RD_XZ is not set
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
# CONFIG_BOOT_CONFIG_FORCE is not set
# CONFIG_BOOT_CONFIG_EMBED is not set
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
CONFIG_INITRAMFS_TEST=y
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL=y
CONFIG_SYSFS_SYSCALL=y
# CONFIG_EXPERT is not set
CONFIG_MULTIUSER=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_FUTEX_PRIVATE_HASH=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_GCOV_PROFILE_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KCMP=y
CONFIG_CACHESTAT_SYSCALL=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_SELFTEST=y
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# end of Kernel Performance Events And Counters

CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y

#
# Kexec and crash features
#
# end of Kexec and crash features
# end of General setup

CONFIG_ARC=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_GENERIC_CSUM=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_MMU=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_STACKTRACE_SUPPORT=y

#
# ARC Architecture Configuration
#

#
# ARC Platform/SoC/Board
#
CONFIG_ARC_PLAT_TB10X=y
CONFIG_ARC_PLAT_AXS10X=y
CONFIG_AXS103=y
# CONFIG_ARC_SOC_HSDK is not set
# end of ARC Platform/SoC/Board

# CONFIG_ISA_ARCOMPACT is not set
CONFIG_ISA_ARCV2=y

#
# ARC CPU Configuration
#
CONFIG_ARC_CPU_HS=y
CONFIG_ARC_TUNE_MCPU=""
# CONFIG_CPU_BIG_ENDIAN is not set
# CONFIG_SMP is not set
CONFIG_ARC_MCIP=y
CONFIG_ARC_CACHE=y
CONFIG_ARC_CACHE_LINE_SHIFT=6
CONFIG_ARC_HAS_ICACHE=y
# CONFIG_ARC_HAS_DCACHE is not set
# CONFIG_ARC_CACHE_PAGES is not set
# CONFIG_ARC_HAS_ICCM is not set
CONFIG_ARC_HAS_DCCM=y
CONFIG_ARC_DCCM_SZ=64
CONFIG_ARC_DCCM_BASE=0xA0000000
CONFIG_ARC_MMU_V4=y
# CONFIG_ARC_PAGE_SIZE_8K is not set
CONFIG_ARC_PAGE_SIZE_16K=y
# CONFIG_ARC_PAGE_SIZE_4K is not set
CONFIG_ARC_HUGEPAGE_2M=y
# CONFIG_ARC_HUGEPAGE_16M is not set
CONFIG_PGTABLE_LEVELS=2
CONFIG_ARC_FPU_SAVE_RESTORE=y
# CONFIG_ARC_HAS_LLSC is not set
# CONFIG_ARC_HAS_SWAPE is not set
# CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS is not set
CONFIG_ARC_HAS_LL64=y
# CONFIG_ARC_HAS_DIV_REM is not set
CONFIG_ARC_HAS_ACCL_REGS=y
CONFIG_ARC_DSP_HANDLED=y
# CONFIG_ARC_DSP_NONE is not set
CONFIG_ARC_DSP_KERNEL=y
# CONFIG_ARC_DSP_USERSPACE is not set
# CONFIG_ARC_DSP_AGU_USERSPACE is not set
# CONFIG_ARC_IRQ_NO_AUTOSAVE is not set
# CONFIG_ARC_LPB_DISABLE is not set
# end of ARC CPU Configuration

CONFIG_LINUX_LINK_BASE=0x80000000
CONFIG_LINUX_RAM_BASE=0x80000000
# CONFIG_HIGHMEM is not set
# CONFIG_ARC_HAS_PAE40 is not set
CONFIG_ARC_KVADDR_SIZE=256
CONFIG_ARC_CURR_IN_REG=y
CONFIG_HZ=100
CONFIG_ARC_METAWARE_HLINK=y
CONFIG_ARC_DBG=y
# CONFIG_ARC_DW2_UNWIND is not set
# CONFIG_ARC_DBG_JUMP_LABEL is not set
CONFIG_BUILTIN_DTB_NAME="nsim_700"
# end of ARC Architecture Configuration

CONFIG_ARCH_FORCE_MAX_ORDER=10
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
CONFIG_PM_GENERIC_DOMAINS=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_PM_GENERIC_DOMAINS_OF=y
# CONFIG_ENERGY_MODEL is not set
CONFIG_CPU_MITIGATIONS=y

#
# General architecture-dependent options
#
# CONFIG_KPROBES is not set
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_MMU_LAZY_TLB_REFCOUNT=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_ARCH_WANT_PMD_MKWRITE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_PAGE_SIZE_16KB=y
CONFIG_PAGE_SIZE_16KB=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_PAGE_SHIFT=14
CONFIG_CLONE_BACKWARDS=y
# CONFIG_COMPAT_32BIT_TIME is not set
# CONFIG_LOCK_EVENT_COUNTS is not set

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
# end of GCOV-based kernel profiling

CONFIG_FUNCTION_ALIGNMENT=0
CONFIG_CC_HAS_MIN_FUNCTION_ALIGNMENT=y
CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT=y
CONFIG_ARCH_NEED_CMPXCHG_1_EMU=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
# CONFIG_MODULES is not set
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_WRITE_MOUNTED=y
# CONFIG_BLK_DEV_ZONED is not set
CONFIG_BLK_WBT=y
# CONFIG_BLK_WBT_MQ is not set
# CONFIG_BLK_DEBUG_FS is not set
# CONFIG_BLK_SED_OPAL is not set
CONFIG_BLK_INLINE_ENCRYPTION=y
# CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
CONFIG_ACORN_PARTITION=y
# CONFIG_ACORN_PARTITION_CUMANA is not set
CONFIG_ACORN_PARTITION_EESOX=y
# CONFIG_ACORN_PARTITION_ICS is not set
# CONFIG_ACORN_PARTITION_ADFS is not set
CONFIG_ACORN_PARTITION_POWERTEC=y
# CONFIG_ACORN_PARTITION_RISCIX is not set
# CONFIG_AIX_PARTITION is not set
# CONFIG_OSF_PARTITION is not set
CONFIG_AMIGA_PARTITION=y
# CONFIG_ATARI_PARTITION is not set
# CONFIG_MAC_PARTITION is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_BSD_DISKLABEL=y
CONFIG_MINIX_SUBPARTITION=y
CONFIG_SOLARIS_X86_PARTITION=y
CONFIG_UNIXWARE_DISKLABEL=y
# CONFIG_LDM_PARTITION is not set
# CONFIG_SGI_PARTITION is not set
CONFIG_ULTRIX_PARTITION=y
# CONFIG_SUN_PARTITION is not set
CONFIG_KARMA_PARTITION=y
CONFIG_EFI_PARTITION=y
CONFIG_SYSV68_PARTITION=y
# CONFIG_CMDLINE_PARTITION is not set
CONFIG_OF_PARTITION=y
# end of Partition Types

CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_ELF_KUNIT_TEST=y
CONFIG_ELFCORE=y
# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
CONFIG_EXEC_KUNIT_TEST=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_ZPOOL=y
CONFIG_SWAP=y
CONFIG_ZSWAP=y
CONFIG_ZSWAP_DEFAULT_ON=y
# CONFIG_ZSWAP_SHRINKER_DEFAULT_ON is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lz4hc"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC=y
CONFIG_ZSWAP_ZPOOL_DEFAULT="zsmalloc"
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y
CONFIG_ZSMALLOC_CHAIN_SIZE=8

#
# Slab allocator options
#
CONFIG_SLUB=y
# CONFIG_SLAB_MERGE_DEFAULT is not set
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
# CONFIG_SLAB_BUCKETS is not set
# CONFIG_SLUB_STATS is not set
# CONFIG_RANDOM_KMALLOC_CACHES is not set
# end of Slab allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_COMPAT_BRK=y
CONFIG_FLATMEM=y
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_PCP_BATCH_SCALE_MAX=5
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_MM_ID=y
CONFIG_TRANSPARENT_HUGEPAGE=y
# CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_TRANSPARENT_HUGEPAGE_NEVER=y
CONFIG_READ_ONLY_THP_FOR_FS=y
CONFIG_NO_PAGE_MAPCOUNT=y
CONFIG_PGTABLE_HAS_HUGE_LEAVES=y
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CMA is not set
CONFIG_PAGE_BLOCK_ORDER=10
CONFIG_PAGE_IDLE_FLAG=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CPU_CACHE_ALIASING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_HMM_MIRROR=y
CONFIG_VMAP_PFN=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_DMAPOOL_TEST=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_MEMFD_CREATE=y
# CONFIG_ANON_VMA_NAME is not set
# CONFIG_USERFAULTFD is not set
# CONFIG_LRU_GEN is not set
CONFIG_LOCK_MM_AND_FIND_VMA=y

#
# Data Access Monitoring
#
CONFIG_DAMON=y
CONFIG_DAMON_KUNIT_TEST=y
CONFIG_DAMON_VADDR=y
# CONFIG_DAMON_PADDR is not set
CONFIG_DAMON_VADDR_KUNIT_TEST=y
CONFIG_DAMON_SYSFS=y
CONFIG_DAMON_SYSFS_KUNIT_TEST=y
# end of Data Access Monitoring
# end of Memory Management options

# CONFIG_NET is not set

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_PCI=y
CONFIG_PCI_SYSCALL=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=y
# CONFIG_PCIEAER_CXL is not set
# CONFIG_PCIE_ECRC is not set
CONFIG_PCIEASPM=y
# CONFIG_PCIEASPM_DEFAULT is not set
CONFIG_PCIEASPM_POWERSAVE=y
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_QUIRKS=y
CONFIG_PCI_REALLOC_ENABLE_AUTO=y
# CONFIG_PCI_STUB is not set
CONFIG_PCI_PF_STUB=y
CONFIG_PCI_ATS=y
CONFIG_PCI_DOE=y
CONFIG_PCI_ECAM=y
CONFIG_PCI_BRIDGE_EMUL=y
CONFIG_PCI_IOV=y
# CONFIG_PCI_NPEM is not set
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCIE_TPH is not set
CONFIG_PCI_DYNAMIC_OF_NODES=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_CPCI=y
CONFIG_HOTPLUG_PCI_OCTEONEP=y
# CONFIG_HOTPLUG_PCI_SHPC is not set

#
# PCI controller drivers
#
CONFIG_PCI_HOST_COMMON=y
CONFIG_PCI_AARDVARK=y
# CONFIG_PCIE_ALTERA is not set
# CONFIG_PCIE_APPLE is not set
CONFIG_PCI_VERSATILE=y
CONFIG_PCIE_BRCMSTB=y
CONFIG_PCI_HOST_THUNDER_PEM=y
# CONFIG_PCI_HOST_THUNDER_ECAM is not set
# CONFIG_PCI_FTPCI100 is not set
# CONFIG_PCI_HOST_GENERIC is not set
# CONFIG_PCI_LOONGSON is not set
CONFIG_PCIE_MEDIATEK=y
CONFIG_PCIE_MEDIATEK_GEN3=y
# CONFIG_PCIE_MT7621 is not set
# CONFIG_PCI_TEGRA is not set
# CONFIG_PCIE_RCAR_HOST is not set
# CONFIG_PCIE_RCAR_EP is not set
CONFIG_PCIE_ROCKCHIP=y
CONFIG_PCIE_ROCKCHIP_HOST=y
# CONFIG_PCIE_ROCKCHIP_EP is not set
# CONFIG_PCI_V3_SEMI is not set
# CONFIG_PCI_XGENE is not set
CONFIG_PCIE_XILINX=y
CONFIG_PCIE_XILINX_DMA_PL=y
CONFIG_PCIE_XILINX_NWL=y
# CONFIG_PCIE_XILINX_CPM is not set

#
# Cadence-based PCIe controllers
#
CONFIG_PCIE_CADENCE=y
CONFIG_PCIE_CADENCE_HOST=y
CONFIG_PCIE_CADENCE_EP=y
CONFIG_PCIE_CADENCE_PLAT=y
# CONFIG_PCIE_CADENCE_PLAT_HOST is not set
CONFIG_PCIE_CADENCE_PLAT_EP=y
CONFIG_PCI_J721E=y
CONFIG_PCI_J721E_HOST=y
# CONFIG_PCI_J721E_EP is not set
# end of Cadence-based PCIe controllers

#
# DesignWare-based PCIe controllers
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_DEBUGFS=y
CONFIG_PCIE_DW_HOST=y
CONFIG_PCIE_DW_EP=y
CONFIG_PCIE_AL=y
CONFIG_PCIE_AMD_MDB=y
CONFIG_PCI_MESON=y
CONFIG_PCIE_ARTPEC6=y
# CONFIG_PCIE_ARTPEC6_HOST is not set
CONFIG_PCIE_ARTPEC6_EP=y
CONFIG_PCIE_BT1=y
CONFIG_PCI_IMX6=y
CONFIG_PCI_IMX6_HOST=y
CONFIG_PCI_IMX6_EP=y
CONFIG_PCI_LAYERSCAPE=y
CONFIG_PCI_LAYERSCAPE_EP=y
CONFIG_PCI_HISI=y
# CONFIG_PCIE_KIRIN is not set
# CONFIG_PCIE_HISI_STB is not set
CONFIG_PCIE_INTEL_GW=y
CONFIG_PCIE_KEEMBAY=y
CONFIG_PCIE_KEEMBAY_HOST=y
# CONFIG_PCIE_KEEMBAY_EP is not set
# CONFIG_PCIE_ARMADA_8K is not set
CONFIG_PCIE_TEGRA194=y
CONFIG_PCIE_TEGRA194_HOST=y
CONFIG_PCIE_TEGRA194_EP=y
CONFIG_PCIE_DW_PLAT=y
CONFIG_PCIE_DW_PLAT_HOST=y
CONFIG_PCIE_DW_PLAT_EP=y
# CONFIG_PCIE_QCOM is not set
# CONFIG_PCIE_QCOM_EP is not set
CONFIG_PCIE_RCAR_GEN4=y
CONFIG_PCIE_RCAR_GEN4_HOST=y
CONFIG_PCIE_RCAR_GEN4_EP=y
CONFIG_PCIE_ROCKCHIP_DW=y
# CONFIG_PCIE_ROCKCHIP_DW_HOST is not set
CONFIG_PCIE_ROCKCHIP_DW_EP=y
CONFIG_PCI_EXYNOS=y
CONFIG_PCIE_FU740=y
CONFIG_PCIE_UNIPHIER=y
# CONFIG_PCIE_UNIPHIER_EP is not set
# CONFIG_PCIE_SPEAR13XX is not set
CONFIG_PCI_DRA7XX=y
CONFIG_PCI_DRA7XX_HOST=y
CONFIG_PCI_DRA7XX_EP=y
# CONFIG_PCI_KEYSTONE_HOST is not set
# CONFIG_PCI_KEYSTONE_EP is not set
# CONFIG_PCIE_VISCONTI_HOST is not set
# end of DesignWare-based PCIe controllers

#
# Mobiveil-based PCIe controllers
#
CONFIG_PCIE_MOBIVEIL=y
CONFIG_PCIE_MOBIVEIL_HOST=y
CONFIG_PCIE_LAYERSCAPE_GEN4=y
CONFIG_PCIE_MOBIVEIL_PLAT=y
# end of Mobiveil-based PCIe controllers

#
# PLDA-based PCIe controllers
#
CONFIG_PCIE_PLDA_HOST=y
# CONFIG_PCIE_MICROCHIP_HOST is not set
CONFIG_PCIE_STARFIVE_HOST=y
# end of PLDA-based PCIe controllers
# end of PCI controller drivers

#
# PCI Endpoint
#
CONFIG_PCI_ENDPOINT=y
CONFIG_PCI_ENDPOINT_CONFIGFS=y
CONFIG_PCI_EPF_TEST=y
CONFIG_PCI_EPF_NTB=y
# CONFIG_PCI_EPF_VNTB is not set
CONFIG_PCI_EPF_MHI=y
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_PCI_PWRCTRL_SLOT is not set
CONFIG_CXL_BUS=y
CONFIG_CXL_PCI=y
# CONFIG_CXL_MEM_RAW_COMMANDS is not set
# CONFIG_CXL_MEM is not set
# CONFIG_CXL_FEATURES is not set
CONFIG_CXL_PORT=y
CONFIG_PCCARD=y
# CONFIG_PCMCIA is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
CONFIG_YENTA=y
CONFIG_YENTA_O2=y
CONFIG_YENTA_RICOH=y
CONFIG_YENTA_TI=y
CONFIG_YENTA_ENE_TUNE=y
CONFIG_YENTA_TOSHIBA=y
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
CONFIG_DEVTMPFS_SAFE=y
# CONFIG_STANDALONE is not set
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
CONFIG_FW_LOADER_COMPRESS=y
CONFIG_FW_LOADER_COMPRESS_XZ=y
CONFIG_FW_LOADER_COMPRESS_ZSTD=y
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
CONFIG_PM_QOS_KUNIT_TEST=y
CONFIG_DM_KUNIT_TEST=y
CONFIG_DRIVER_PE_KUNIT_TEST=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_KUNIT=y
# CONFIG_REGMAP_BUILD is not set
CONFIG_REGMAP_AC97=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_RAM=y
CONFIG_REGMAP_I3C=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_ARM_INTEGRATOR_LM=y
# CONFIG_BT1_APB is not set
# CONFIG_BT1_AXI is not set
# CONFIG_IMX_WEIM is not set
CONFIG_INTEL_IXP4XX_EB=y
# CONFIG_QCOM_EBI2 is not set
# CONFIG_STM32_FIREWALL is not set
# CONFIG_FSL_MC_BUS is not set
# CONFIG_MHI_BUS is not set
CONFIG_MHI_BUS_EP=y
# end of Bus devices

#
# Cache Drivers
#
# end of Cache Drivers

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
CONFIG_ARM_SCMI_PROTOCOL=y
CONFIG_ARM_SCMI_NEED_DEBUGFS=y
CONFIG_ARM_SCMI_RAW_MODE_SUPPORT=y
# CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX is not set
CONFIG_ARM_SCMI_DEBUG_COUNTERS=y
CONFIG_ARM_SCMI_QUIRKS=y

#
# SCMI Transport Drivers
#
CONFIG_ARM_SCMI_HAVE_TRANSPORT=y
CONFIG_ARM_SCMI_HAVE_SHMEM=y
CONFIG_ARM_SCMI_HAVE_MSG=y
CONFIG_ARM_SCMI_TRANSPORT_MAILBOX=y
CONFIG_ARM_SCMI_TRANSPORT_VIRTIO=y
CONFIG_ARM_SCMI_TRANSPORT_VIRTIO_VERSION1_COMPLIANCE=y
CONFIG_ARM_SCMI_TRANSPORT_VIRTIO_ATOMIC_ENABLE=y
# end of SCMI Transport Drivers

#
# ARM SCMI NXP i.MX Vendor Protocols
#
# CONFIG_IMX_SCMI_BBM_EXT is not set
# end of ARM SCMI NXP i.MX Vendor Protocols

CONFIG_ARM_SCMI_POWER_CONTROL=y
# end of ARM System Control and Management Interface Protocol

CONFIG_ARM_SCPI_PROTOCOL=y
CONFIG_MTK_ADSP_IPC=y
CONFIG_TH1520_AON_PROTOCOL=y
CONFIG_TI_SCI_PROTOCOL=y
CONFIG_TURRIS_MOX_RWTM=y
CONFIG_TURRIS_MOX_RWTM_KEYCTL=y
CONFIG_BCM47XX_NVRAM=y
# CONFIG_BCM47XX_SPROM is not set
CONFIG_FW_CS_DSP=y
CONFIG_FW_CS_DSP_KUNIT_TEST_UTILS=y
CONFIG_FW_CS_DSP_KUNIT_TEST=y
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_GOOGLE_COREBOOT_TABLE is not set
# CONFIG_IMX_SCMI_CPU_DRV is not set
# CONFIG_IMX_SCMI_LMM_DRV is not set
# CONFIG_IMX_SCMI_MISC_DRV is not set

#
# Qualcomm firmware drivers
#
CONFIG_QCOM_SCM=y
CONFIG_QCOM_TZMEM=y
CONFIG_QCOM_TZMEM_MODE_GENERIC=y
# CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE is not set
CONFIG_QCOM_QSEECOM=y
# end of Qualcomm firmware drivers

CONFIG_EXYNOS_ACPM_PROTOCOL=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_FWCTL is not set
CONFIG_GNSS=y
# CONFIG_GNSS_MTK_SERIAL is not set
CONFIG_GNSS_SIRF_SERIAL=y
# CONFIG_GNSS_UBX_SERIAL is not set
# CONFIG_GNSS_USB is not set
CONFIG_MTD=y

#
# Partition parsers
#
# CONFIG_MTD_BCM63XX_PARTS is not set
# CONFIG_MTD_BRCM_U_BOOT is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_OF_PARTS=y
CONFIG_MTD_OF_PARTS_BCM4908=y
# CONFIG_MTD_OF_PARTS_LINKSYS_NS is not set
# CONFIG_MTD_PARSER_IMAGETAG is not set
CONFIG_MTD_PARSER_TPLINK_SAFELOADER=y
# CONFIG_MTD_PARSER_TRX is not set
CONFIG_MTD_SHARPSL_PARTS=y
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
CONFIG_FTL=y
CONFIG_NFTL=y
# CONFIG_NFTL_RW is not set
CONFIG_INFTL=y
CONFIG_RFD_FTL=y
# CONFIG_SSFDC is not set
CONFIG_SM_FTL=y
CONFIG_MTD_OOPS=y
CONFIG_MTD_SWAP=y
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y
CONFIG_MTD_ABSENT=y
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_SC520CDP is not set
CONFIG_MTD_NETSC520=y
CONFIG_MTD_TS5500=y
# CONFIG_MTD_PCI is not set
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_PMC551=y
# CONFIG_MTD_PMC551_BUGFIX is not set
# CONFIG_MTD_PMC551_DEBUG is not set
# CONFIG_MTD_SPEAR_SMI is not set
# CONFIG_MTD_SLRAM is not set
CONFIG_MTD_PHRAM=y
# CONFIG_MTD_MTDRAM is not set
CONFIG_MTD_BLOCK2MTD=y

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=y
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
CONFIG_MTD_ONENAND=y
# CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
CONFIG_MTD_ONENAND_GENERIC=y
CONFIG_MTD_ONENAND_SAMSUNG=y
CONFIG_MTD_ONENAND_OTP=y
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
CONFIG_MTD_RAW_NAND=y

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_DENALI=y
CONFIG_MTD_NAND_DENALI_PCI=y
# CONFIG_MTD_NAND_DENALI_DT is not set
CONFIG_MTD_NAND_AMS_DELTA=y
CONFIG_MTD_NAND_OMAP2=y
# CONFIG_MTD_NAND_OMAP_BCH is not set
# CONFIG_MTD_NAND_SHARPSL is not set
CONFIG_MTD_NAND_CAFE=y
# CONFIG_MTD_NAND_ATMEL is not set
CONFIG_MTD_NAND_MARVELL=y
CONFIG_MTD_NAND_SLC_LPC32XX=y
CONFIG_MTD_NAND_MLC_LPC32XX=y
CONFIG_MTD_NAND_BRCMNAND=y
CONFIG_MTD_NAND_BRCMNAND_BCM63XX=y
CONFIG_MTD_NAND_BRCMNAND_BCMBCA=y
# CONFIG_MTD_NAND_BRCMNAND_BRCMSTB is not set
# CONFIG_MTD_NAND_BRCMNAND_IPROC is not set
CONFIG_MTD_NAND_VF610_NFC=y
CONFIG_MTD_NAND_MXC=y
CONFIG_MTD_NAND_SH_FLCTL=y
CONFIG_MTD_NAND_TXX9NDFMC=y
# CONFIG_MTD_NAND_JZ4780 is not set
CONFIG_MTD_NAND_FSMC=y
CONFIG_MTD_NAND_SUNXI=y
CONFIG_MTD_NAND_HISI504=y
CONFIG_MTD_NAND_QCOM=y
CONFIG_MTD_NAND_MTK=y
CONFIG_MTD_NAND_MXIC=y
# CONFIG_MTD_NAND_TEGRA is not set
# CONFIG_MTD_NAND_STM32_FMC2 is not set
# CONFIG_MTD_NAND_MESON is not set
CONFIG_MTD_NAND_GPIO=y
# CONFIG_MTD_NAND_PLATFORM is not set
CONFIG_MTD_NAND_CADENCE=y
CONFIG_MTD_NAND_ARASAN=y
CONFIG_MTD_NAND_INTEL_LGM=y
CONFIG_MTD_NAND_RENESAS=y
CONFIG_MTD_NAND_NUVOTON_MA35=y
# CONFIG_MTD_NAND_LOONGSON1 is not set

#
# Misc
#
CONFIG_MTD_SM_COMMON=y
CONFIG_MTD_NAND_NANDSIM=y
CONFIG_MTD_NAND_RICOH=y
CONFIG_MTD_NAND_DISKONCHIP=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=y
# CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
CONFIG_MTD_NAND_ECC_SW_BCH=y
# CONFIG_MTD_NAND_ECC_MXIC is not set
CONFIG_MTD_NAND_ECC_MEDIATEK=y
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
# CONFIG_MTD_UBI_GLUEBI is not set
CONFIG_MTD_UBI_BLOCK=y
# CONFIG_MTD_UBI_NVMEM is not set
CONFIG_MTD_HYPERBUS=y
# CONFIG_HBMC_AM654 is not set
CONFIG_DTC=y
CONFIG_GENERIC_BUILTIN_DTB=y
CONFIG_OF=y
CONFIG_OF_UNITTEST=y
CONFIG_OF_KUNIT_TEST=y
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y
CONFIG_OF_OVERLAY_KUNIT_TEST=y
# CONFIG_PARPORT is not set
# CONFIG_BLK_DEV is not set

#
# NVME Support
#
CONFIG_NVME_KEYRING=y
CONFIG_NVME_AUTH=y
CONFIG_NVME_CORE=y
CONFIG_BLK_DEV_NVME=y
# CONFIG_NVME_MULTIPATH is not set
# CONFIG_NVME_VERBOSE_ERRORS is not set
CONFIG_NVME_HWMON=y
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
CONFIG_NVME_HOST_AUTH=y
CONFIG_NVME_TARGET=y
# CONFIG_NVME_TARGET_DEBUGFS is not set
# CONFIG_NVME_TARGET_PASSTHRU is not set
# CONFIG_NVME_TARGET_LOOP is not set
# CONFIG_NVME_TARGET_FC is not set
CONFIG_NVME_TARGET_AUTH=y
CONFIG_NVME_TARGET_PCI_EPF=y
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
CONFIG_DUMMY_IRQ=y
# CONFIG_PHANTOM is not set
CONFIG_RPMB=y
# CONFIG_TI_FPC202 is not set
CONFIG_TIFM_CORE=y
CONFIG_TIFM_7XX1=y
CONFIG_ICS932S401=y
CONFIG_ATMEL_SSC=y
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_SMPRO_ERRMON is not set
# CONFIG_SMPRO_MISC is not set
CONFIG_HI6421V600_IRQ=y
# CONFIG_HP_ILO is not set
CONFIG_QCOM_COINCELL=y
CONFIG_QCOM_FASTRPC=y
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
# CONFIG_ISL29020 is not set
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=y
# CONFIG_DS1682 is not set
# CONFIG_PCH_PHUB is not set
CONFIG_SRAM=y
CONFIG_DW_XDATA_PCIE=y
CONFIG_PCI_ENDPOINT_TEST=y
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=y
CONFIG_HISI_HIKEY_USB=y
CONFIG_OPEN_DICE=y
# CONFIG_NTSYNC is not set
# CONFIG_VCPU_STALL_DETECTOR is not set
CONFIG_NSM=y
CONFIG_MCHP_LAN966X_PCI=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=y
# CONFIG_EEPROM_IDT_89HPESX is not set
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

CONFIG_CB710_CORE=y
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y
CONFIG_SENSORS_LIS3_I2C=y
CONFIG_ALTERA_STAPL=y
CONFIG_BCM_VK=y
# CONFIG_BCM_VK_TTY is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
CONFIG_MISC_RTSX_USB=y
# CONFIG_UACCE is not set
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
CONFIG_PVPANIC_PCI=y
CONFIG_GP_PCI1XXXX=y
CONFIG_KEBA_CP500=y
# CONFIG_AMD_SBRMI_I2C is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
# CONFIG_SCSI_PROC_FS is not set
CONFIG_SCSI_LIB_KUNIT_TEST=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
CONFIG_CHR_DEV_ST=y
# CONFIG_CHR_DEV_SG is not set
CONFIG_BLK_DEV_BSG=y
# CONFIG_CHR_DEV_SCH is not set
CONFIG_SCSI_ENCLOSURE=y
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
# CONFIG_SCSI_SCAN_ASYNC is not set
CONFIG_SCSI_PROTO_TEST=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=y
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
# CONFIG_SCSI_DH_ALUA is not set
# end of SCSI device support

CONFIG_ATA=y
CONFIG_SATA_HOST=y
# CONFIG_ATA_VERBOSE_ERROR is not set
CONFIG_ATA_FORCE=y
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=y
CONFIG_SATA_MOBILE_LPM_POLICY=3
CONFIG_SATA_AHCI_PLATFORM=y
CONFIG_AHCI_BRCM=y
CONFIG_AHCI_DA850=y
CONFIG_AHCI_DM816=y
CONFIG_AHCI_DWC=y
# CONFIG_AHCI_ST is not set
CONFIG_AHCI_IMX=y
CONFIG_AHCI_CEVA=y
# CONFIG_AHCI_MTK is not set
CONFIG_AHCI_MVEBU=y
CONFIG_AHCI_SUNXI=y
# CONFIG_AHCI_TEGRA is not set
CONFIG_AHCI_XGENE=y
CONFIG_AHCI_QORIQ=y
CONFIG_SATA_FSL=y
# CONFIG_SATA_GEMINI is not set
# CONFIG_SATA_AHCI_SEATTLE is not set
CONFIG_SATA_INIC162X=y
CONFIG_SATA_ACARD_AHCI=y
CONFIG_SATA_SIL24=y
# CONFIG_ATA_SFF is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
# CONFIG_MD_BITMAP_FILE is not set
CONFIG_MD_LINEAR=y
# CONFIG_MD_RAID0 is not set
CONFIG_MD_RAID1=y
CONFIG_MD_RAID10=y
# CONFIG_MD_RAID456 is not set
CONFIG_BCACHE=y
CONFIG_BCACHE_DEBUG=y
CONFIG_BCACHE_ASYNC_REGISTRATION=y
# CONFIG_BLK_DEV_DM is not set
# CONFIG_TARGET_CORE is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
CONFIG_FIREWIRE_NOSY=y
# end of IEEE 1394 (FireWire) support

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_KUNIT_TEST=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADC=y
CONFIG_KEYBOARD_ADP5588=y
CONFIG_KEYBOARD_ADP5589=y
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
CONFIG_KEYBOARD_QT1070=y
CONFIG_KEYBOARD_QT2160=y
CONFIG_KEYBOARD_CLPS711X=y
CONFIG_KEYBOARD_DLINK_DIR685=y
CONFIG_KEYBOARD_LKKBD=y
CONFIG_KEYBOARD_EP93XX=y
CONFIG_KEYBOARD_GPIO=y
CONFIG_KEYBOARD_GPIO_POLLED=y
# CONFIG_KEYBOARD_TCA6416 is not set
CONFIG_KEYBOARD_TCA8418=y
CONFIG_KEYBOARD_MATRIX=y
CONFIG_KEYBOARD_LM8323=y
# CONFIG_KEYBOARD_LM8333 is not set
CONFIG_KEYBOARD_LPC32XX=y
CONFIG_KEYBOARD_MAX7359=y
CONFIG_KEYBOARD_MPR121=y
CONFIG_KEYBOARD_SNVS_PWRKEY=y
CONFIG_KEYBOARD_IMX=y
# CONFIG_KEYBOARD_IMX_BBM_SCMI is not set
CONFIG_KEYBOARD_NEWTON=y
CONFIG_KEYBOARD_TEGRA=y
CONFIG_KEYBOARD_OPENCORES=y
CONFIG_KEYBOARD_PINEPHONE=y
CONFIG_KEYBOARD_PXA27x=y
# CONFIG_KEYBOARD_PMIC8XXX is not set
CONFIG_KEYBOARD_SAMSUNG=y
CONFIG_KEYBOARD_GOLDFISH_EVENTS=y
CONFIG_KEYBOARD_STOWAWAY=y
# CONFIG_KEYBOARD_ST_KEYSCAN is not set
CONFIG_KEYBOARD_SUNKBD=y
# CONFIG_KEYBOARD_SH_KEYSC is not set
CONFIG_KEYBOARD_IQS62X=y
# CONFIG_KEYBOARD_OMAP4 is not set
# CONFIG_KEYBOARD_SPEAR is not set
CONFIG_KEYBOARD_TM2_TOUCHKEY=y
# CONFIG_KEYBOARD_TWL4030 is not set
CONFIG_KEYBOARD_XTKBD=y
CONFIG_KEYBOARD_CROS_EC=y
CONFIG_KEYBOARD_CAP11XX=y
# CONFIG_KEYBOARD_BCM is not set
# CONFIG_KEYBOARD_MT6779 is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
CONFIG_JOYSTICK_ANALOG=y
# CONFIG_JOYSTICK_A3D is not set
CONFIG_JOYSTICK_ADC=y
CONFIG_JOYSTICK_ADI=y
CONFIG_JOYSTICK_COBRA=y
# CONFIG_JOYSTICK_GF2K is not set
CONFIG_JOYSTICK_GRIP=y
CONFIG_JOYSTICK_GRIP_MP=y
CONFIG_JOYSTICK_GUILLEMOT=y
CONFIG_JOYSTICK_INTERACT=y
CONFIG_JOYSTICK_SIDEWINDER=y
# CONFIG_JOYSTICK_TMDC is not set
CONFIG_JOYSTICK_IFORCE=y
# CONFIG_JOYSTICK_IFORCE_USB is not set
# CONFIG_JOYSTICK_IFORCE_232 is not set
CONFIG_JOYSTICK_WARRIOR=y
# CONFIG_JOYSTICK_MAGELLAN is not set
CONFIG_JOYSTICK_SPACEORB=y
CONFIG_JOYSTICK_SPACEBALL=y
# CONFIG_JOYSTICK_STINGER is not set
CONFIG_JOYSTICK_TWIDJOY=y
# CONFIG_JOYSTICK_ZHENHUA is not set
CONFIG_JOYSTICK_AS5011=y
# CONFIG_JOYSTICK_JOYDUMP is not set
CONFIG_JOYSTICK_XPAD=y
CONFIG_JOYSTICK_XPAD_FF=y
CONFIG_JOYSTICK_XPAD_LEDS=y
CONFIG_JOYSTICK_PXRC=y
CONFIG_JOYSTICK_QWIIC=y
# CONFIG_JOYSTICK_FSIA6B is not set
# CONFIG_JOYSTICK_SENSEHAT is not set
CONFIG_JOYSTICK_SEESAW=y
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=y
# CONFIG_TABLET_USB_AIPTEK is not set
# CONFIG_TABLET_USB_HANWANG is not set
# CONFIG_TABLET_USB_KBTAB is not set
CONFIG_TABLET_USB_PEGASUS=y
CONFIG_TABLET_SERIAL_WACOM4=y
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
CONFIG_RMI4_SMB=y
# CONFIG_RMI4_F03 is not set
CONFIG_RMI4_2D_SENSOR=y
# CONFIG_RMI4_F11 is not set
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
CONFIG_SERIO_APBPS2=y
CONFIG_SERIO_OLPC_APSP=y
CONFIG_SERIO_SUN4I_PS2=y
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_EMU10K1=y
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LEGACY_TIOCSTI=y
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_MEN_MCB=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
# CONFIG_SERIAL_8250_MANY_PORTS is not set
# CONFIG_SERIAL_8250_ASPEED_VUART is not set
CONFIG_SERIAL_8250_PCI1XXXX=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
CONFIG_SERIAL_8250_DETECT_IRQ=y
CONFIG_SERIAL_8250_RSA=y
# CONFIG_SERIAL_8250_BCM2835AUX is not set
# CONFIG_SERIAL_8250_FSL is not set
# CONFIG_SERIAL_8250_DW is not set
CONFIG_SERIAL_8250_EM=y
CONFIG_SERIAL_8250_IOC3=y
CONFIG_SERIAL_8250_RT288X=y
# CONFIG_SERIAL_8250_OMAP is not set
CONFIG_SERIAL_8250_LPC18XX=y
CONFIG_SERIAL_8250_MT6577=y
# CONFIG_SERIAL_8250_UNIPHIER is not set
CONFIG_SERIAL_8250_INGENIC=y
# CONFIG_SERIAL_8250_LPSS is not set
# CONFIG_SERIAL_8250_MID is not set
CONFIG_SERIAL_8250_PERICOM=y
# CONFIG_SERIAL_8250_PXA is not set
CONFIG_SERIAL_8250_TEGRA=y
CONFIG_SERIAL_8250_BCM7271=y
CONFIG_SERIAL_8250_NI=y
# CONFIG_SERIAL_OF_PLATFORM is not set

#
# Non-8250 serial port support
#
CONFIG_SERIAL_AMBA_PL010=y
# CONFIG_SERIAL_AMBA_PL010_CONSOLE is not set
CONFIG_SERIAL_ATMEL=y
# CONFIG_SERIAL_ATMEL_CONSOLE is not set
# CONFIG_SERIAL_ATMEL_PDC is not set
# CONFIG_SERIAL_ATMEL_TTYAT is not set
# CONFIG_SERIAL_MESON is not set
# CONFIG_SERIAL_CLPS711X is not set
# CONFIG_SERIAL_SAMSUNG is not set
CONFIG_SERIAL_TEGRA=y
CONFIG_SERIAL_TEGRA_TCU=y
CONFIG_SERIAL_TEGRA_TCU_CONSOLE=y
CONFIG_SERIAL_TEGRA_UTC=y
CONFIG_SERIAL_TEGRA_UTC_CONSOLE=y
CONFIG_SERIAL_IMX=y
CONFIG_SERIAL_IMX_CONSOLE=y
CONFIG_SERIAL_IMX_EARLYCON=y
CONFIG_SERIAL_UARTLITE=y
# CONFIG_SERIAL_UARTLITE_CONSOLE is not set
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_SH_SCI=y
CONFIG_SERIAL_SH_SCI_NR_UARTS=2
CONFIG_SERIAL_SH_SCI_CONSOLE=y
# CONFIG_SERIAL_HS_LPC32XX is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_ICOM=y
CONFIG_SERIAL_MSM=y
# CONFIG_SERIAL_MSM_CONSOLE is not set
CONFIG_SERIAL_QCOM_GENI=y
# CONFIG_SERIAL_QCOM_GENI_CONSOLE is not set
CONFIG_SERIAL_VT8500=y
CONFIG_SERIAL_VT8500_CONSOLE=y
CONFIG_SERIAL_OMAP=y
CONFIG_SERIAL_OMAP_CONSOLE=y
CONFIG_SERIAL_SIFIVE=y
CONFIG_SERIAL_SIFIVE_CONSOLE=y
CONFIG_SERIAL_LANTIQ=y
CONFIG_SERIAL_LANTIQ_CONSOLE=y
# CONFIG_SERIAL_QE is not set
CONFIG_SERIAL_SCCNXP=y
# CONFIG_SERIAL_SCCNXP_CONSOLE is not set
CONFIG_SERIAL_SC16IS7XX=y
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_TIMBERDALE=y
CONFIG_SERIAL_BCM63XX=y
CONFIG_SERIAL_BCM63XX_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=y
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
CONFIG_SERIAL_PCH_UART=y
CONFIG_SERIAL_PCH_UART_CONSOLE=y
CONFIG_SERIAL_MXS_AUART=y
CONFIG_SERIAL_MXS_AUART_CONSOLE=y
CONFIG_SERIAL_XILINX_PS_UART=y
# CONFIG_SERIAL_XILINX_PS_UART_CONSOLE is not set
CONFIG_SERIAL_MPS2_UART_CONSOLE=y
CONFIG_SERIAL_MPS2_UART=y
CONFIG_SERIAL_ARC=y
CONFIG_SERIAL_ARC_CONSOLE=y
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
CONFIG_SERIAL_FSL_LINFLEXUART=y
# CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE is not set
# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
CONFIG_SERIAL_ST_ASC=y
CONFIG_SERIAL_ST_ASC_CONSOLE=y
CONFIG_SERIAL_MEN_Z135=y
CONFIG_SERIAL_SPRD=y
# CONFIG_SERIAL_SPRD_CONSOLE is not set
# CONFIG_SERIAL_STM32 is not set
# CONFIG_SERIAL_MVEBU_UART is not set
CONFIG_SERIAL_OWL=y
CONFIG_SERIAL_OWL_CONSOLE=y
CONFIG_SERIAL_RDA=y
# CONFIG_SERIAL_RDA_CONSOLE is not set
CONFIG_SERIAL_MILBEAUT_USIO=y
CONFIG_SERIAL_MILBEAUT_USIO_PORTS=4
# CONFIG_SERIAL_MILBEAUT_USIO_CONSOLE is not set
CONFIG_SERIAL_LITEUART=y
CONFIG_SERIAL_LITEUART_MAX_PORTS=1
CONFIG_SERIAL_LITEUART_CONSOLE=y
CONFIG_SERIAL_SUNPLUS=y
CONFIG_SERIAL_SUNPLUS_CONSOLE=y
CONFIG_SERIAL_NUVOTON_MA35D1=y
CONFIG_SERIAL_NUVOTON_MA35D1_CONSOLE=y
CONFIG_SERIAL_ESP32=y
CONFIG_SERIAL_ESP32_ACM=y
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
CONFIG_N_HDLC=y
CONFIG_NOZOMI=y
CONFIG_NULL_TTY=y
CONFIG_HVC_DRIVER=y
CONFIG_RPMSG_TTY=y
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
# CONFIG_IPMI_PANIC_STRING is not set
CONFIG_IPMI_DEVICE_INTERFACE=y
CONFIG_IPMI_SI=y
CONFIG_IPMI_SSIF=y
CONFIG_IPMI_IPMB=y
# CONFIG_IPMI_WATCHDOG is not set
CONFIG_IPMI_POWEROFF=y
CONFIG_IPMI_KCS_BMC=y
CONFIG_ASPEED_KCS_IPMI_BMC=y
CONFIG_NPCM7XX_KCS_IPMI_BMC=y
CONFIG_IPMI_KCS_BMC_CDEV_IPMI=y
CONFIG_IPMI_KCS_BMC_SERIO=y
# CONFIG_ASPEED_BT_IPMI_BMC is not set
CONFIG_SSIF_IPMI_BMC=y
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
CONFIG_HW_RANDOM_INTEL=y
CONFIG_HW_RANDOM_AIROHA=y
CONFIG_HW_RANDOM_ATMEL=y
# CONFIG_HW_RANDOM_BA431 is not set
# CONFIG_HW_RANDOM_BCM2835 is not set
CONFIG_HW_RANDOM_BCM74110=y
CONFIG_HW_RANDOM_IPROC_RNG200=y
CONFIG_HW_RANDOM_GEODE=y
CONFIG_HW_RANDOM_IXP4XX=y
CONFIG_HW_RANDOM_OMAP=y
# CONFIG_HW_RANDOM_OMAP3_ROM is not set
# CONFIG_HW_RANDOM_VIRTIO is not set
CONFIG_HW_RANDOM_MXC_RNGA=y
CONFIG_HW_RANDOM_IMX_RNGC=y
# CONFIG_HW_RANDOM_INGENIC_RNG is not set
CONFIG_HW_RANDOM_INGENIC_TRNG=y
CONFIG_HW_RANDOM_NOMADIK=y
CONFIG_HW_RANDOM_HISI=y
CONFIG_HW_RANDOM_HISTB=y
# CONFIG_HW_RANDOM_ST is not set
# CONFIG_HW_RANDOM_XGENE is not set
CONFIG_HW_RANDOM_STM32=y
# CONFIG_HW_RANDOM_PIC32 is not set
# CONFIG_HW_RANDOM_MESON is not set
# CONFIG_HW_RANDOM_MTK is not set
CONFIG_HW_RANDOM_EXYNOS=y
CONFIG_HW_RANDOM_NPCM=y
# CONFIG_HW_RANDOM_KEYSTONE is not set
# CONFIG_HW_RANDOM_CCTRNG is not set
CONFIG_HW_RANDOM_XIPHERA=y
# CONFIG_HW_RANDOM_JH7110 is not set
CONFIG_HW_RANDOM_ROCKCHIP=y
CONFIG_APPLICOM=y
CONFIG_DEVMEM=y
# CONFIG_TCG_TPM is not set
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
# CONFIG_XILLYBUS_PCIE is not set
CONFIG_XILLYBUS_OF=y
CONFIG_XILLYUSB=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
CONFIG_I2C_MUX_GPIO=y
# CONFIG_I2C_MUX_GPMUX is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=y
# CONFIG_I2C_MUX_PINCTRL is not set
CONFIG_I2C_MUX_REG=y
# CONFIG_I2C_DEMUX_PINCTRL is not set
# CONFIG_I2C_MUX_MLXCPLD is not set
CONFIG_I2C_MUX_MULE=y
# end of Multiplexer I2C Chip support

CONFIG_I2C_ATR=y
# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_CCGX_UCSI=y
# CONFIG_I2C_HIX5HD2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ALTERA is not set
CONFIG_I2C_ASPEED=y
# CONFIG_I2C_AT91 is not set
CONFIG_I2C_AXXIA=y
CONFIG_I2C_BCM2835=y
# CONFIG_I2C_BCM_IPROC is not set
# CONFIG_I2C_BCM_KONA is not set
CONFIG_I2C_BRCMSTB=y
CONFIG_I2C_CADENCE=y
CONFIG_I2C_CBUS_GPIO=y
# CONFIG_I2C_DAVINCI is not set
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DESIGNWARE_AMDISP is not set
CONFIG_I2C_DESIGNWARE_PCI=y
CONFIG_I2C_DIGICOLOR=y
CONFIG_I2C_EG20T=y
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_EXYNOS5 is not set
# CONFIG_I2C_GPIO is not set
CONFIG_I2C_GXP=y
# CONFIG_I2C_HIGHLANDER is not set
# CONFIG_I2C_HISI is not set
CONFIG_I2C_IMG=y
CONFIG_I2C_IMX=y
# CONFIG_I2C_IMX_LPI2C is not set
CONFIG_I2C_IOP3XX=y
# CONFIG_I2C_JZ4780 is not set
# CONFIG_I2C_K1 is not set
# CONFIG_I2C_KEBA is not set
# CONFIG_I2C_KEMPLD is not set
CONFIG_I2C_LPC2K=y
CONFIG_I2C_LS2X=y
CONFIG_I2C_MESON=y
# CONFIG_I2C_MICROCHIP_CORE is not set
CONFIG_I2C_MT65XX=y
CONFIG_I2C_MT7621=y
CONFIG_I2C_MV64XXX=y
# CONFIG_I2C_MXS is not set
# CONFIG_I2C_NOMADIK is not set
CONFIG_I2C_NPCM=y
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_OMAP is not set
CONFIG_I2C_OWL=y
CONFIG_I2C_APPLE=y
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_PNX=y
# CONFIG_I2C_PXA is not set
CONFIG_I2C_QCOM_CCI=y
CONFIG_I2C_QCOM_GENI=y
# CONFIG_I2C_QUP is not set
CONFIG_I2C_RIIC=y
# CONFIG_I2C_RK3X is not set
CONFIG_I2C_RTL9300=y
# CONFIG_I2C_RZV2M is not set
# CONFIG_I2C_S3C2410 is not set
# CONFIG_I2C_SH_MOBILE is not set
CONFIG_I2C_SIMTEC=y
CONFIG_I2C_SPRD=y
# CONFIG_I2C_ST is not set
CONFIG_I2C_STM32F4=y
# CONFIG_I2C_STM32F7 is not set
# CONFIG_I2C_SUN6I_P2WI is not set
CONFIG_I2C_SYNQUACER=y
# CONFIG_I2C_TEGRA is not set
CONFIG_I2C_TEGRA_BPMP=y
# CONFIG_I2C_UNIPHIER is not set
CONFIG_I2C_UNIPHIER_F=y
CONFIG_I2C_VERSATILE=y
CONFIG_I2C_WMT=y
CONFIG_I2C_XILINX=y
CONFIG_I2C_XLP9XX=y
# CONFIG_I2C_RCAR is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_DLN2 is not set
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PCI1XXXX=y
CONFIG_I2C_ROBOTFUZZ_OSIF=y
# CONFIG_I2C_TAOS_EVM is not set
CONFIG_I2C_TINY_USB=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_CROS_EC_TUNNEL=y
# CONFIG_I2C_FSI is not set
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_SLAVE_TESTUNIT=y
CONFIG_I2C_DEBUG_CORE=y
CONFIG_I2C_DEBUG_ALGO=y
CONFIG_I2C_DEBUG_BUS=y
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=y
# CONFIG_DW_I3C_MASTER is not set
# CONFIG_SVC_I3C_MASTER is not set
CONFIG_MIPI_I3C_HCI=y
# CONFIG_MIPI_I3C_HCI_PCI is not set
# CONFIG_SPI is not set
CONFIG_SPMI=y
# CONFIG_SPMI_APPLE is not set
# CONFIG_SPMI_HISI3670 is not set
CONFIG_SPMI_MSM_PMIC_ARB=y
# CONFIG_SPMI_MTK_PMIF is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
# CONFIG_HSI_CHAR is not set
CONFIG_PPS=y
CONFIG_PPS_DEBUG=y
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
CONFIG_PPS_CLIENT_LDISC=y
CONFIG_PPS_CLIENT_GPIO=y
CONFIG_PPS_GENERATOR=y
# CONFIG_PPS_GENERATOR_DUMMY is not set

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_PINCTRL_AMD=y
# CONFIG_PINCTRL_AMDISP is not set
# CONFIG_PINCTRL_AS3722 is not set
# CONFIG_PINCTRL_AT91 is not set
CONFIG_PINCTRL_AT91PIO4=y
CONFIG_PINCTRL_AW9523=y
# CONFIG_PINCTRL_BM1880 is not set
CONFIG_PINCTRL_CY8C95X0=y
CONFIG_PINCTRL_DA850_PUPD=y
CONFIG_PINCTRL_EQUILIBRIUM=y
CONFIG_PINCTRL_EYEQ5=y
CONFIG_PINCTRL_INGENIC=y
# CONFIG_PINCTRL_K230 is not set
# CONFIG_PINCTRL_LOONGSON2 is not set
CONFIG_PINCTRL_LPC18XX=y
CONFIG_PINCTRL_MAX77620=y
CONFIG_PINCTRL_MCP23S08_I2C=y
CONFIG_PINCTRL_MCP23S08=y
# CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
# CONFIG_PINCTRL_OCELOT is not set
# CONFIG_PINCTRL_PALMAS is not set
# CONFIG_PINCTRL_PISTACHIO is not set
CONFIG_PINCTRL_RK805=y
CONFIG_PINCTRL_ROCKCHIP=y
CONFIG_PINCTRL_SCMI=y
CONFIG_PINCTRL_SINGLE=y
CONFIG_PINCTRL_STMFX=y
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_TB10X=y
CONFIG_PINCTRL_TH1520=y
CONFIG_PINCTRL_MLXBF3=y
CONFIG_PINCTRL_OWL=y
# CONFIG_PINCTRL_S500 is not set
CONFIG_PINCTRL_S700=y
# CONFIG_PINCTRL_S900 is not set
CONFIG_PINCTRL_ASPEED=y
CONFIG_PINCTRL_ASPEED_G4=y
# CONFIG_PINCTRL_ASPEED_G5 is not set
# CONFIG_PINCTRL_ASPEED_G6 is not set
# CONFIG_PINCTRL_BCM281XX is not set
CONFIG_PINCTRL_BCM2835=y
# CONFIG_PINCTRL_BCM4908 is not set
CONFIG_PINCTRL_BCM63XX=y
# CONFIG_PINCTRL_BCM6318 is not set
CONFIG_PINCTRL_BCM6328=y
CONFIG_PINCTRL_BCM6358=y
# CONFIG_PINCTRL_BCM6362 is not set
# CONFIG_PINCTRL_BCM6368 is not set
CONFIG_PINCTRL_BCM63268=y
CONFIG_PINCTRL_IPROC_GPIO=y
# CONFIG_PINCTRL_CYGNUS_MUX is not set
# CONFIG_PINCTRL_NS is not set
CONFIG_PINCTRL_NSP_GPIO=y
CONFIG_PINCTRL_NS2_MUX=y
# CONFIG_PINCTRL_NSP_MUX is not set
CONFIG_PINCTRL_BERLIN=y
# CONFIG_PINCTRL_AS370 is not set
CONFIG_PINCTRL_BERLIN_BG4CT=y
# CONFIG_PINCTRL_LOCHNAGAR is not set
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L92=y
CONFIG_PINCTRL_IMX=y
CONFIG_PINCTRL_IMX_SCMI=y
CONFIG_PINCTRL_IMX_SCU=y
CONFIG_PINCTRL_IMX1_CORE=y
CONFIG_PINCTRL_IMX1=y
CONFIG_PINCTRL_IMX27=y
CONFIG_PINCTRL_IMX25=y
# CONFIG_PINCTRL_IMX35 is not set
# CONFIG_PINCTRL_IMX50 is not set
# CONFIG_PINCTRL_IMX51 is not set
CONFIG_PINCTRL_IMX53=y
CONFIG_PINCTRL_IMX6Q=y
# CONFIG_PINCTRL_IMX6SL is not set
# CONFIG_PINCTRL_IMX6SLL is not set
CONFIG_PINCTRL_IMX6SX=y
CONFIG_PINCTRL_IMX6UL=y
CONFIG_PINCTRL_IMX7D=y
CONFIG_PINCTRL_IMX7ULP=y
# CONFIG_PINCTRL_IMX8MM is not set
CONFIG_PINCTRL_IMX8MN=y
CONFIG_PINCTRL_IMX8MP=y
CONFIG_PINCTRL_IMX8MQ=y
CONFIG_PINCTRL_IMX8QM=y
CONFIG_PINCTRL_IMX8QXP=y
# CONFIG_PINCTRL_IMX8DXL is not set
CONFIG_PINCTRL_IMX8ULP=y
CONFIG_PINCTRL_IMXRT1050=y
# CONFIG_PINCTRL_IMX93 is not set
# CONFIG_PINCTRL_VF610 is not set
CONFIG_PINCTRL_IMXRT1170=y

#
# Intel pinctrl drivers
#
CONFIG_PINCTRL_BAYTRAIL=y
CONFIG_PINCTRL_CHERRYVIEW=y
CONFIG_PINCTRL_LYNXPOINT=y
CONFIG_PINCTRL_INTEL=y
CONFIG_PINCTRL_INTEL_PLATFORM=y
CONFIG_PINCTRL_ALDERLAKE=y
CONFIG_PINCTRL_BROXTON=y
# CONFIG_PINCTRL_CANNONLAKE is not set
CONFIG_PINCTRL_CEDARFORK=y
CONFIG_PINCTRL_DENVERTON=y
CONFIG_PINCTRL_ELKHARTLAKE=y
CONFIG_PINCTRL_EMMITSBURG=y
# CONFIG_PINCTRL_GEMINILAKE is not set
CONFIG_PINCTRL_ICELAKE=y
# CONFIG_PINCTRL_JASPERLAKE is not set
CONFIG_PINCTRL_LAKEFIELD=y
CONFIG_PINCTRL_LEWISBURG=y
CONFIG_PINCTRL_METEORLAKE=y
# CONFIG_PINCTRL_METEORPOINT is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
CONFIG_PINCTRL_TIGERLAKE=y
CONFIG_PINCTRL_TANGIER=y
CONFIG_PINCTRL_MERRIFIELD=y
CONFIG_PINCTRL_MOOREFIELD=y
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
CONFIG_PINCTRL_MTK_V2=y
CONFIG_PINCTRL_MTK_MOORE=y
CONFIG_PINCTRL_MTK_PARIS=y
# CONFIG_PINCTRL_MT2701 is not set
CONFIG_PINCTRL_MT7623=y
CONFIG_PINCTRL_MT7629=y
# CONFIG_PINCTRL_MT8135 is not set
# CONFIG_PINCTRL_MT8127 is not set
CONFIG_PINCTRL_AIROHA=y
# CONFIG_PINCTRL_MT2712 is not set
# CONFIG_PINCTRL_MT6765 is not set
CONFIG_PINCTRL_MT6779=y
# CONFIG_PINCTRL_MT6795 is not set
CONFIG_PINCTRL_MT6797=y
# CONFIG_PINCTRL_MT6893 is not set
CONFIG_PINCTRL_MT7622=y
# CONFIG_PINCTRL_MT7981 is not set
CONFIG_PINCTRL_MT7986=y
# CONFIG_PINCTRL_MT7988 is not set
# CONFIG_PINCTRL_MT8167 is not set
CONFIG_PINCTRL_MT8173=y
CONFIG_PINCTRL_MT8183=y
CONFIG_PINCTRL_MT8186=y
CONFIG_PINCTRL_MT8188=y
CONFIG_PINCTRL_MT8192=y
CONFIG_PINCTRL_MT8195=y
# CONFIG_PINCTRL_MT8196 is not set
# CONFIG_PINCTRL_MT8365 is not set
# CONFIG_PINCTRL_MT8516 is not set
# CONFIG_PINCTRL_MT6397 is not set
# end of MediaTek pinctrl drivers

# CONFIG_PINCTRL_MESON is not set
CONFIG_PINCTRL_NOMADIK=y
# CONFIG_PINCTRL_WPCM450 is not set
CONFIG_PINCTRL_NPCM7XX=y
# CONFIG_PINCTRL_NPCM8XX is not set
CONFIG_PINCTRL_MA35=y
CONFIG_PINCTRL_MA35D1=y
CONFIG_PINCTRL_PXA=y
CONFIG_PINCTRL_PXA25X=y
CONFIG_PINCTRL_PXA27X=y
# CONFIG_PINCTRL_MSM is not set
CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
# CONFIG_PINCTRL_LPASS_LPI is not set

#
# Renesas pinctrl drivers
#
CONFIG_PINCTRL_RENESAS=y
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
# CONFIG_PINCTRL_PFC_EMEV2 is not set
# CONFIG_PINCTRL_PFC_R8A77995 is not set
CONFIG_PINCTRL_PFC_R8A7794=y
# CONFIG_PINCTRL_PFC_R8A77990 is not set
# CONFIG_PINCTRL_PFC_R8A7779 is not set
CONFIG_PINCTRL_PFC_R8A7790=y
# CONFIG_PINCTRL_PFC_R8A77951 is not set
CONFIG_PINCTRL_PFC_R8A7778=y
CONFIG_PINCTRL_PFC_R8A7793=y
CONFIG_PINCTRL_PFC_R8A7791=y
# CONFIG_PINCTRL_PFC_R8A77965 is not set
CONFIG_PINCTRL_PFC_R8A77960=y
# CONFIG_PINCTRL_PFC_R8A77961 is not set
# CONFIG_PINCTRL_PFC_R8A779F0 is not set
CONFIG_PINCTRL_PFC_R8A7792=y
# CONFIG_PINCTRL_PFC_R8A77980 is not set
CONFIG_PINCTRL_PFC_R8A77970=y
# CONFIG_PINCTRL_PFC_R8A779A0 is not set
# CONFIG_PINCTRL_PFC_R8A779G0 is not set
CONFIG_PINCTRL_PFC_R8A779H0=y
CONFIG_PINCTRL_PFC_R8A7740=y
# CONFIG_PINCTRL_PFC_R8A73A4 is not set
# CONFIG_PINCTRL_RZA1 is not set
# CONFIG_PINCTRL_RZA2 is not set
CONFIG_PINCTRL_RZG2L=y
CONFIG_PINCTRL_PFC_R8A77470=y
CONFIG_PINCTRL_PFC_R8A7745=y
# CONFIG_PINCTRL_PFC_R8A7742 is not set
CONFIG_PINCTRL_PFC_R8A7743=y
CONFIG_PINCTRL_PFC_R8A7744=y
# CONFIG_PINCTRL_PFC_R8A774C0 is not set
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
CONFIG_PINCTRL_PFC_R8A774A1=y
CONFIG_PINCTRL_PFC_R8A774B1=y
# CONFIG_PINCTRL_RZN1 is not set
# CONFIG_PINCTRL_RZV2M is not set
# CONFIG_PINCTRL_PFC_SH7203 is not set
CONFIG_PINCTRL_PFC_SH7264=y
# CONFIG_PINCTRL_PFC_SH7269 is not set
CONFIG_PINCTRL_PFC_SH7720=y
CONFIG_PINCTRL_PFC_SH7722=y
# CONFIG_PINCTRL_PFC_SH7734 is not set
# CONFIG_PINCTRL_PFC_SH7757 is not set
# CONFIG_PINCTRL_PFC_SH7785 is not set
CONFIG_PINCTRL_PFC_SH7786=y
CONFIG_PINCTRL_PFC_SH73A0=y
# CONFIG_PINCTRL_PFC_SH7723 is not set
CONFIG_PINCTRL_PFC_SH7724=y
CONFIG_PINCTRL_PFC_SHX3=y
# end of Renesas pinctrl drivers

# CONFIG_PINCTRL_EXYNOS is not set
# CONFIG_PINCTRL_S3C64XX is not set
CONFIG_PINCTRL_SOPHGO_COMMON=y
CONFIG_PINCTRL_SOPHGO_CV18XX_OPS=y
CONFIG_PINCTRL_SOPHGO_CV1800B=y
CONFIG_PINCTRL_SOPHGO_CV1812H=y
# CONFIG_PINCTRL_SOPHGO_SG2000 is not set
# CONFIG_PINCTRL_SOPHGO_SG2002 is not set
CONFIG_PINCTRL_SOPHGO_SG2042_OPS=y
CONFIG_PINCTRL_SOPHGO_SG2042=y
CONFIG_PINCTRL_SOPHGO_SG2044=y
# CONFIG_PINCTRL_SPACEMIT_K1 is not set
# CONFIG_PINCTRL_SPRD_SC9860 is not set
# CONFIG_PINCTRL_STARFIVE_JH7100 is not set
CONFIG_PINCTRL_STARFIVE_JH7110=y
CONFIG_PINCTRL_STARFIVE_JH7110_SYS=y
CONFIG_PINCTRL_STARFIVE_JH7110_AON=y
CONFIG_PINCTRL_STM32=y
# CONFIG_PINCTRL_STM32F429 is not set
CONFIG_PINCTRL_STM32F469=y
# CONFIG_PINCTRL_STM32F746 is not set
# CONFIG_PINCTRL_STM32F769 is not set
CONFIG_PINCTRL_STM32H743=y
# CONFIG_PINCTRL_STM32MP135 is not set
CONFIG_PINCTRL_STM32MP157=y
# CONFIG_PINCTRL_STM32MP257 is not set
# CONFIG_PINCTRL_TI_IODELAY is not set
CONFIG_PINCTRL_UNIPHIER=y
# CONFIG_PINCTRL_UNIPHIER_LD4 is not set
CONFIG_PINCTRL_UNIPHIER_PRO4=y
CONFIG_PINCTRL_UNIPHIER_SLD8=y
# CONFIG_PINCTRL_UNIPHIER_PRO5 is not set
# CONFIG_PINCTRL_UNIPHIER_PXS2 is not set
CONFIG_PINCTRL_UNIPHIER_LD6B=y
CONFIG_PINCTRL_UNIPHIER_LD11=y
CONFIG_PINCTRL_UNIPHIER_LD20=y
CONFIG_PINCTRL_UNIPHIER_PXS3=y
# CONFIG_PINCTRL_UNIPHIER_NX1 is not set
# CONFIG_PINCTRL_TMPV7700 is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=y
CONFIG_GPIO_IDIO_16=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
CONFIG_GPIO_ALTERA=y
CONFIG_GPIO_ASPEED=y
# CONFIG_GPIO_ASPEED_SGPIO is not set
CONFIG_GPIO_ATH79=y
CONFIG_GPIO_RASPBERRYPI_EXP=y
CONFIG_GPIO_BCM_KONA=y
CONFIG_GPIO_BCM_XGS_IPROC=y
# CONFIG_GPIO_BLZP1600 is not set
# CONFIG_GPIO_BRCMSTB is not set
# CONFIG_GPIO_CADENCE is not set
CONFIG_GPIO_CLPS711X=y
CONFIG_GPIO_DAVINCI=y
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_EIC_SPRD is not set
# CONFIG_GPIO_EM is not set
# CONFIG_GPIO_EXAR is not set
CONFIG_GPIO_GE_FPGA=y
CONFIG_GPIO_FTGPIO010=y
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_GRANITERAPIDS=y
# CONFIG_GPIO_GRGPIO is not set
CONFIG_GPIO_HISI=y
# CONFIG_GPIO_HLWD is not set
CONFIG_GPIO_LOGICVC=y
CONFIG_GPIO_LOONGSON_64BIT=y
CONFIG_GPIO_LPC18XX=y
# CONFIG_GPIO_LPC32XX is not set
CONFIG_GPIO_MB86S7X=y
# CONFIG_GPIO_MENZ127 is not set
CONFIG_GPIO_MPC8XXX=y
CONFIG_GPIO_MT7621=y
# CONFIG_GPIO_MVEBU is not set
CONFIG_GPIO_MXC=y
CONFIG_GPIO_MXS=y
CONFIG_GPIO_NOMADIK=y
CONFIG_GPIO_NPCM_SGPIO=y
CONFIG_GPIO_OMAP=y
# CONFIG_GPIO_PL061 is not set
CONFIG_GPIO_POLARFIRE_SOC=y
CONFIG_GPIO_PXA=y
# CONFIG_GPIO_RCAR is not set
CONFIG_GPIO_RDA=y
# CONFIG_GPIO_ROCKCHIP is not set
CONFIG_GPIO_RTD=y
CONFIG_GPIO_SAMA5D2_PIOBU=y
CONFIG_GPIO_SIFIVE=y
# CONFIG_GPIO_SNPS_CREG is not set
# CONFIG_GPIO_SPACEMIT_K1 is not set
# CONFIG_GPIO_SPRD is not set
CONFIG_GPIO_STP_XWAY=y
CONFIG_GPIO_SYSCON=y
CONFIG_GPIO_TANGIER=y
CONFIG_GPIO_TB10X=y
CONFIG_GPIO_TEGRA=y
CONFIG_GPIO_TEGRA186=y
CONFIG_GPIO_TS4800=y
CONFIG_GPIO_UNIPHIER=y
# CONFIG_GPIO_VF610 is not set
CONFIG_GPIO_VISCONTI=y
CONFIG_GPIO_XGENE_SB=y
CONFIG_GPIO_XILINX=y
CONFIG_GPIO_XLP=y
# CONFIG_GPIO_ZYNQ is not set
# CONFIG_GPIO_ZYNQMP_MODEPIN is not set
# CONFIG_GPIO_AMD_FCH is not set
# CONFIG_GPIO_MSC313 is not set
CONFIG_GPIO_IDT3243X=y
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADNP is not set
# CONFIG_GPIO_FXL6408 is not set
# CONFIG_GPIO_DS4520 is not set
CONFIG_GPIO_GW_PLD=y
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
# CONFIG_GPIO_MAX732X_IRQ is not set
# CONFIG_GPIO_PCA953X is not set
CONFIG_GPIO_PCA9570=y
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=y
CONFIG_GPIO_TS4900=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5585=y
CONFIG_GPIO_ARIZONA=y
# CONFIG_GPIO_BD71815 is not set
# CONFIG_GPIO_BD71828 is not set
# CONFIG_GPIO_BD9571MWV is not set
CONFIG_GPIO_CROS_EC=y
# CONFIG_GPIO_CRYSTAL_COVE is not set
CONFIG_GPIO_DA9052=y
CONFIG_GPIO_DA9055=y
CONFIG_GPIO_DLN2=y
# CONFIG_HTC_EGPIO is not set
CONFIG_GPIO_ELKHARTLAKE=y
CONFIG_GPIO_JANZ_TTL=y
CONFIG_GPIO_KEMPLD=y
# CONFIG_GPIO_LP3943 is not set
# CONFIG_GPIO_MADERA is not set
CONFIG_GPIO_MAX77620=y
# CONFIG_GPIO_MAX77650 is not set
CONFIG_GPIO_PALMAS=y
# CONFIG_GPIO_PMIC_EIC_SPRD is not set
CONFIG_GPIO_SL28CPLD=y
CONFIG_GPIO_TIMBERDALE=y
# CONFIG_GPIO_TN48M_CPLD is not set
# CONFIG_GPIO_TPS65086 is not set
CONFIG_GPIO_TPS65218=y
# CONFIG_GPIO_TPS65219 is not set
# CONFIG_GPIO_TPS65912 is not set
CONFIG_GPIO_TWL4030=y
CONFIG_GPIO_WM831X=y
# CONFIG_GPIO_WM8994 is not set
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
CONFIG_GPIO_BT8XX=y
# CONFIG_GPIO_MLXBF3 is not set
CONFIG_GPIO_ML_IOH=y
# CONFIG_GPIO_PCH is not set
CONFIG_GPIO_PCI_IDIO_16=y
# CONFIG_GPIO_PCIE_IDIO_24 is not set
CONFIG_GPIO_RDC321X=y
# end of PCI GPIO expanders

#
# USB GPIO expanders
#
# CONFIG_GPIO_MPSSE is not set
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
CONFIG_GPIO_LATCH=y
# CONFIG_GPIO_MOCKUP is not set
CONFIG_GPIO_VIRTIO=y
CONFIG_GPIO_SIM=y
# end of Virtual GPIO drivers

#
# GPIO Debugging utilities
#
CONFIG_GPIO_VIRTUSER=y
# end of GPIO Debugging utilities

CONFIG_DEV_SYNC_PROBE=y
CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_AMD_AXI=y
# CONFIG_W1_MASTER_MATROX is not set
CONFIG_W1_MASTER_DS2490=y
# CONFIG_W1_MASTER_DS2482 is not set
CONFIG_W1_MASTER_MXC=y
# CONFIG_W1_MASTER_GPIO is not set
# CONFIG_HDQ_MASTER_OMAP is not set
CONFIG_W1_MASTER_SGI=y
# CONFIG_W1_MASTER_UART is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=y
# CONFIG_W1_SLAVE_DS2408 is not set
CONFIG_W1_SLAVE_DS2413=y
# CONFIG_W1_SLAVE_DS2406 is not set
# CONFIG_W1_SLAVE_DS2423 is not set
CONFIG_W1_SLAVE_DS2805=y
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=y
# CONFIG_W1_SLAVE_DS2433 is not set
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS250X=y
# CONFIG_W1_SLAVE_DS2780 is not set
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
CONFIG_W1_SLAVE_DS28E17=y
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_AS3722 is not set
# CONFIG_POWER_RESET_ATC260X is not set
# CONFIG_POWER_RESET_BRCMKONA is not set
# CONFIG_POWER_RESET_BRCMSTB is not set
# CONFIG_POWER_RESET_EP93XX is not set
CONFIG_POWER_RESET_GEMINI_POWEROFF=y
# CONFIG_POWER_RESET_GPIO is not set
CONFIG_POWER_RESET_GPIO_RESTART=y
# CONFIG_POWER_RESET_OCELOT_RESET is not set
# CONFIG_POWER_RESET_ODROID_GO_ULTRA_POWEROFF is not set
# CONFIG_POWER_RESET_LTC2952 is not set
# CONFIG_POWER_RESET_REGULATOR is not set
# CONFIG_POWER_RESET_RESTART is not set
# CONFIG_POWER_RESET_TORADEX_EC is not set
# CONFIG_POWER_RESET_TPS65086 is not set
# CONFIG_POWER_RESET_KEYSTONE is not set
CONFIG_POWER_RESET_SYSCON=y
CONFIG_POWER_RESET_SYSCON_POWEROFF=y
CONFIG_POWER_RESET_RMOBILE=y
# CONFIG_SYSCON_REBOOT_MODE is not set
CONFIG_POWER_RESET_SC27XX=y
# CONFIG_NVMEM_REBOOT_MODE is not set
CONFIG_POWER_SEQUENCING=y
CONFIG_POWER_SEQUENCING_QCOM_WCN=y
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
# CONFIG_POWER_SUPPLY_HWMON is not set
CONFIG_GENERIC_ADC_BATTERY=y
# CONFIG_IP5XXX_POWER is not set
CONFIG_MAX8925_POWER=y
CONFIG_WM831X_BACKUP=y
CONFIG_WM831X_POWER=y
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
CONFIG_BATTERY_ACT8945A=y
# CONFIG_BATTERY_CHAGALL is not set
CONFIG_BATTERY_CW2015=y
# CONFIG_BATTERY_DS2760 is not set
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
# CONFIG_BATTERY_LEGO_EV3 is not set
# CONFIG_BATTERY_LENOVO_YOGA_C630 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
CONFIG_BATTERY_SBS=y
CONFIG_CHARGER_SBS=y
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
# CONFIG_BATTERY_BQ27XXX_I2C is not set
# CONFIG_BATTERY_BQ27XXX_HDQ is not set
CONFIG_BATTERY_DA9052=y
# CONFIG_BATTERY_DA9150 is not set
CONFIG_BATTERY_MAX17040=y
# CONFIG_BATTERY_MAX17042 is not set
CONFIG_BATTERY_MAX1720X=y
CONFIG_BATTERY_MAX1721X=y
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=y
# CONFIG_CHARGER_TWL4030 is not set
# CONFIG_CHARGER_TWL6030 is not set
CONFIG_CHARGER_LP8727=y
# CONFIG_CHARGER_GPIO is not set
CONFIG_CHARGER_MANAGER=y
CONFIG_CHARGER_LT3651=y
CONFIG_CHARGER_LTC4162L=y
CONFIG_CHARGER_MAX14577=y
CONFIG_CHARGER_DETECTOR_MAX14656=y
CONFIG_CHARGER_MAX77650=y
CONFIG_CHARGER_MAX77693=y
CONFIG_CHARGER_MAX77976=y
# CONFIG_CHARGER_MAX8971 is not set
# CONFIG_CHARGER_MAX8997 is not set
# CONFIG_CHARGER_MAX8998 is not set
# CONFIG_CHARGER_MP2629 is not set
CONFIG_CHARGER_MT6360=y
# CONFIG_CHARGER_QCOM_SMBB is not set
CONFIG_BATTERY_PM8916_BMS_VM=y
# CONFIG_CHARGER_PM8916_LBC is not set
CONFIG_CHARGER_BQ2415X=y
CONFIG_CHARGER_BQ24190=y
# CONFIG_CHARGER_BQ24257 is not set
CONFIG_CHARGER_BQ24735=y
# CONFIG_CHARGER_BQ2515X is not set
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_BQ25980=y
CONFIG_CHARGER_BQ256XX=y
CONFIG_CHARGER_RK817=y
# CONFIG_CHARGER_SMB347 is not set
CONFIG_CHARGER_TPS65090=y
# CONFIG_CHARGER_TPS65217 is not set
CONFIG_BATTERY_GAUGE_LTC2941=y
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT5033=y
# CONFIG_CHARGER_RT9455 is not set
CONFIG_CHARGER_RT9467=y
CONFIG_CHARGER_RT9471=y
CONFIG_CHARGER_SC2731=y
CONFIG_FUEL_GAUGE_SC27XX=y
CONFIG_FUEL_GAUGE_STC3117=y
# CONFIG_CHARGER_UCS1002 is not set
CONFIG_CHARGER_BD99954=y
CONFIG_BATTERY_ACER_A500=y
CONFIG_BATTERY_UG3105=y
CONFIG_FUEL_GAUGE_MM8013=y
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
CONFIG_SENSORS_SMPRO=y
# CONFIG_SENSORS_AD7414 is not set
CONFIG_SENSORS_AD7418=y
CONFIG_SENSORS_ADM1025=y
CONFIG_SENSORS_ADM1026=y
# CONFIG_SENSORS_ADM1029 is not set
CONFIG_SENSORS_ADM1031=y
CONFIG_SENSORS_ADM1177=y
CONFIG_SENSORS_ADM9240=y
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7410=y
CONFIG_SENSORS_ADT7411=y
# CONFIG_SENSORS_ADT7462 is not set
# CONFIG_SENSORS_ADT7470 is not set
# CONFIG_SENSORS_ADT7475 is not set
CONFIG_SENSORS_AHT10=y
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=y
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
# CONFIG_SENSORS_KBATT is not set
# CONFIG_SENSORS_KFAN is not set
# CONFIG_SENSORS_ARM_SCMI is not set
# CONFIG_SENSORS_ARM_SCPI is not set
CONFIG_SENSORS_ASB100=y
CONFIG_SENSORS_ASPEED=y
CONFIG_SENSORS_ATXP1=y
CONFIG_SENSORS_BT1_PVT=y
# CONFIG_SENSORS_BT1_PVT_ALARMS is not set
CONFIG_SENSORS_CHIPCAP2=y
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=y
# CONFIG_SENSORS_DS1621 is not set
CONFIG_SENSORS_DA9052_ADC=y
CONFIG_SENSORS_DA9055=y
CONFIG_SENSORS_I5K_AMB=y
CONFIG_SENSORS_SPARX5=y
CONFIG_SENSORS_F75375S=y
CONFIG_SENSORS_GSC=y
CONFIG_SENSORS_MC13783_ADC=y
# CONFIG_SENSORS_FSCHMD is not set
CONFIG_SENSORS_FTSTEUTATES=y
# CONFIG_SENSORS_GL518SM is not set
CONFIG_SENSORS_GL520SM=y
CONFIG_SENSORS_G760A=y
CONFIG_SENSORS_G762=y
CONFIG_SENSORS_GPIO_FAN=y
CONFIG_SENSORS_GXP_FAN_CTRL=y
CONFIG_SENSORS_HIH6130=y
# CONFIG_SENSORS_HS3001 is not set
# CONFIG_SENSORS_HTU31 is not set
CONFIG_SENSORS_IBMAEM=y
# CONFIG_SENSORS_IBMPEX is not set
CONFIG_SENSORS_IIO_HWMON=y
CONFIG_SENSORS_ISL28022=y
CONFIG_SENSORS_JC42=y
CONFIG_SENSORS_POWERZ=y
# CONFIG_SENSORS_POWR1220 is not set
# CONFIG_SENSORS_LAN966X is not set
CONFIG_SENSORS_LINEAGE=y
CONFIG_SENSORS_LOCHNAGAR=y
CONFIG_SENSORS_LTC2945=y
CONFIG_SENSORS_LTC2947=y
CONFIG_SENSORS_LTC2947_I2C=y
CONFIG_SENSORS_LTC2990=y
CONFIG_SENSORS_LTC2991=y
CONFIG_SENSORS_LTC2992=y
# CONFIG_SENSORS_LTC4151 is not set
# CONFIG_SENSORS_LTC4215 is not set
CONFIG_SENSORS_LTC4222=y
CONFIG_SENSORS_LTC4245=y
CONFIG_SENSORS_LTC4260=y
CONFIG_SENSORS_LTC4261=y
CONFIG_SENSORS_LTC4282=y
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=y
CONFIG_SENSORS_MAX1619=y
CONFIG_SENSORS_MAX1668=y
# CONFIG_SENSORS_MAX197 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX31760 is not set
CONFIG_MAX31827=y
CONFIG_SENSORS_MAX6620=y
CONFIG_SENSORS_MAX6621=y
# CONFIG_SENSORS_MAX6639 is not set
# CONFIG_SENSORS_MAX6650 is not set
CONFIG_SENSORS_MAX6697=y
CONFIG_SENSORS_MAX31790=y
# CONFIG_SENSORS_MC34VR500 is not set
CONFIG_SENSORS_MCP3021=y
CONFIG_SENSORS_TC654=y
CONFIG_SENSORS_TPS23861=y
# CONFIG_SENSORS_MENF21BMC_HWMON is not set
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_LM63 is not set
# CONFIG_SENSORS_LM73 is not set
CONFIG_SENSORS_LM75=y
CONFIG_SENSORS_LM77=y
CONFIG_SENSORS_LM78=y
# CONFIG_SENSORS_LM80 is not set
# CONFIG_SENSORS_LM83 is not set
CONFIG_SENSORS_LM85=y
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=y
CONFIG_SENSORS_LM92=y
CONFIG_SENSORS_LM93=y
# CONFIG_SENSORS_LM95234 is not set
CONFIG_SENSORS_LM95241=y
# CONFIG_SENSORS_LM95245 is not set
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6775_CORE=y
CONFIG_SENSORS_NCT6775_I2C=y
# CONFIG_SENSORS_NCT7363 is not set
CONFIG_SENSORS_NCT7802=y
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
CONFIG_SENSORS_NSA320=y
CONFIG_SENSORS_OCC_P8_I2C=y
CONFIG_SENSORS_OCC=y
CONFIG_SENSORS_PCF8591=y
CONFIG_SENSORS_PECI_CPUTEMP=y
# CONFIG_SENSORS_PECI_DIMMTEMP is not set
CONFIG_SENSORS_PECI=y
CONFIG_PMBUS=y
CONFIG_SENSORS_PMBUS=y
CONFIG_SENSORS_ACBEL_FSG032=y
CONFIG_SENSORS_ADM1266=y
# CONFIG_SENSORS_ADM1275 is not set
CONFIG_SENSORS_ADP1050=y
CONFIG_SENSORS_BEL_PFE=y
# CONFIG_SENSORS_BPA_RS600 is not set
CONFIG_SENSORS_CRPS=y
CONFIG_SENSORS_DELTA_AHE50DC_FAN=y
# CONFIG_SENSORS_FSP_3Y is not set
CONFIG_SENSORS_IBM_CFFPS=y
# CONFIG_SENSORS_DPS920AB is not set
CONFIG_SENSORS_INA233=y
# CONFIG_SENSORS_INSPUR_IPSPS is not set
CONFIG_SENSORS_IR35221=y
# CONFIG_SENSORS_IR36021 is not set
CONFIG_SENSORS_IR38064=y
CONFIG_SENSORS_IR38064_REGULATOR=y
CONFIG_SENSORS_IRPS5401=y
CONFIG_SENSORS_ISL68137=y
CONFIG_SENSORS_LM25066=y
# CONFIG_SENSORS_LM25066_REGULATOR is not set
# CONFIG_SENSORS_LT3074 is not set
CONFIG_SENSORS_LT7182S=y
CONFIG_SENSORS_LTC2978=y
# CONFIG_SENSORS_LTC2978_REGULATOR is not set
CONFIG_SENSORS_LTC3815=y
# CONFIG_SENSORS_LTC4286 is not set
# CONFIG_SENSORS_MAX15301 is not set
CONFIG_SENSORS_MAX16064=y
CONFIG_SENSORS_MAX16601=y
CONFIG_SENSORS_MAX20730=y
CONFIG_SENSORS_MAX20751=y
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=y
CONFIG_SENSORS_MAX8688=y
CONFIG_SENSORS_MP2856=y
CONFIG_SENSORS_MP2888=y
CONFIG_SENSORS_MP2891=y
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_MP2993 is not set
CONFIG_SENSORS_MP5023=y
CONFIG_SENSORS_MP5920=y
# CONFIG_SENSORS_MP5990 is not set
# CONFIG_SENSORS_MP9941 is not set
# CONFIG_SENSORS_MPQ7932 is not set
# CONFIG_SENSORS_MPQ8785 is not set
CONFIG_SENSORS_PIM4328=y
CONFIG_SENSORS_PLI1209BC=y
# CONFIG_SENSORS_PLI1209BC_REGULATOR is not set
CONFIG_SENSORS_PM6764TR=y
# CONFIG_SENSORS_PXE1610 is not set
CONFIG_SENSORS_Q54SJ108A2=y
CONFIG_SENSORS_STPDDC60=y
CONFIG_SENSORS_TDA38640=y
# CONFIG_SENSORS_TDA38640_REGULATOR is not set
CONFIG_SENSORS_TPS25990=y
CONFIG_SENSORS_TPS25990_REGULATOR=y
CONFIG_SENSORS_TPS40422=y
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_TPS546D24=y
CONFIG_SENSORS_UCD9000=y
CONFIG_SENSORS_UCD9200=y
# CONFIG_SENSORS_XDP710 is not set
CONFIG_SENSORS_XDPE152=y
CONFIG_SENSORS_XDPE122=y
# CONFIG_SENSORS_XDPE122_REGULATOR is not set
# CONFIG_SENSORS_ZL6100 is not set
# CONFIG_SENSORS_PT5161L is not set
# CONFIG_SENSORS_PWM_FAN is not set
# CONFIG_SENSORS_QNAP_MCU_HWMON is not set
# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
CONFIG_SENSORS_SL28CPLD=y
CONFIG_SENSORS_SBTSI=y
CONFIG_SENSORS_SHT15=y
CONFIG_SENSORS_SHT21=y
CONFIG_SENSORS_SHT3x=y
CONFIG_SENSORS_SHT4x=y
CONFIG_SENSORS_SHTC1=y
# CONFIG_SENSORS_SY7636A is not set
CONFIG_SENSORS_EMC1403=y
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=y
# CONFIG_SENSORS_SMSC47M192 is not set
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SFCTEMP is not set
CONFIG_SENSORS_SG2042_MCU=y
# CONFIG_SENSORS_ADC128D818 is not set
# CONFIG_SENSORS_ADS7828 is not set
CONFIG_SENSORS_AMC6821=y
CONFIG_SENSORS_INA209=y
CONFIG_SENSORS_INA2XX=y
CONFIG_SENSORS_INA238=y
CONFIG_SENSORS_INA3221=y
CONFIG_SENSORS_SPD5118=y
# CONFIG_SENSORS_SPD5118_DETECT is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=y
# CONFIG_SENSORS_TMP102 is not set
CONFIG_SENSORS_TMP103=y
CONFIG_SENSORS_TMP108=y
# CONFIG_SENSORS_TMP401 is not set
CONFIG_SENSORS_TMP421=y
# CONFIG_SENSORS_TMP464 is not set
CONFIG_SENSORS_TMP513=y
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=y
CONFIG_SENSORS_W83791D=y
CONFIG_SENSORS_W83792D=y
CONFIG_SENSORS_W83793=y
CONFIG_SENSORS_W83795=y
CONFIG_SENSORS_W83795_FANCTRL=y
CONFIG_SENSORS_W83L785TS=y
# CONFIG_SENSORS_W83L786NG is not set
CONFIG_SENSORS_WM831X=y
CONFIG_THERMAL=y
CONFIG_THERMAL_STATISTICS=y
# CONFIG_THERMAL_DEBUGFS is not set
# CONFIG_THERMAL_CORE_TESTING is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_HWMON is not set
CONFIG_THERMAL_OF=y
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_DEFAULT_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
# CONFIG_THERMAL_GOV_USER_SPACE is not set
CONFIG_CPU_THERMAL=y
# CONFIG_DEVFREQ_THERMAL is not set
# CONFIG_PCIE_THERMAL is not set
# CONFIG_THERMAL_EMULATION is not set
CONFIG_THERMAL_MMIO=y
CONFIG_HISI_THERMAL=y
CONFIG_IMX_THERMAL=y
# CONFIG_IMX8MM_THERMAL is not set
# CONFIG_K3_THERMAL is not set
# CONFIG_MAX77620_THERMAL is not set
# CONFIG_QORIQ_THERMAL is not set
# CONFIG_AIROHA_THERMAL is not set
CONFIG_SPEAR_THERMAL=y
CONFIG_SUN8I_THERMAL=y
CONFIG_ROCKCHIP_THERMAL=y
CONFIG_KIRKWOOD_THERMAL=y
# CONFIG_DOVE_THERMAL is not set
CONFIG_ARMADA_THERMAL=y
CONFIG_DA9062_THERMAL=y

#
# Mediatek thermal drivers
#
# CONFIG_MTK_THERMAL is not set
# end of Mediatek thermal drivers

#
# Intel thermal drivers
#

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers
# end of Intel thermal drivers

#
# Broadcom thermal drivers
#
CONFIG_BCM2711_THERMAL=y
CONFIG_BCM2835_THERMAL=y
# CONFIG_BRCMSTB_THERMAL is not set
# CONFIG_BCM_NS_THERMAL is not set
# CONFIG_BCM_SR_THERMAL is not set
# end of Broadcom thermal drivers

#
# Texas Instruments thermal drivers
#
CONFIG_TI_SOC_THERMAL=y
CONFIG_TI_THERMAL=y
CONFIG_OMAP3_THERMAL=y
CONFIG_OMAP4_THERMAL=y
CONFIG_OMAP5_THERMAL=y
# CONFIG_DRA752_THERMAL is not set
# end of Texas Instruments thermal drivers

#
# Samsung thermal drivers
#
CONFIG_EXYNOS_THERMAL=y
# end of Samsung thermal drivers

CONFIG_RCAR_THERMAL=y
CONFIG_RCAR_GEN3_THERMAL=y
CONFIG_RZG2L_THERMAL=y

#
# NVIDIA Tegra thermal drivers
#
# CONFIG_TEGRA_SOCTHERM is not set
# CONFIG_TEGRA_BPMP_THERMAL is not set
CONFIG_TEGRA30_TSENSOR=y
# end of NVIDIA Tegra thermal drivers

CONFIG_GENERIC_ADC_THERMAL=y

#
# Qualcomm thermal drivers
#
# CONFIG_QCOM_TSENS is not set
CONFIG_QCOM_SPMI_ADC_TM5=y
CONFIG_QCOM_SPMI_TEMP_ALARM=y
# end of Qualcomm thermal drivers

# CONFIG_UNIPHIER_THERMAL is not set
CONFIG_SPRD_THERMAL=y
CONFIG_KHADAS_MCU_FAN_THERMAL=y
CONFIG_LOONGSON2_THERMAL=y
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=y
# CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=y
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
# CONFIG_SOFT_WATCHDOG_PRETIMEOUT is not set
# CONFIG_BD96801_WATCHDOG is not set
# CONFIG_CROS_EC_WATCHDOG is not set
# CONFIG_DA9052_WATCHDOG is not set
CONFIG_DA9055_WATCHDOG=y
CONFIG_DA9063_WATCHDOG=y
CONFIG_DA9062_WATCHDOG=y
CONFIG_GPIO_WATCHDOG=y
# CONFIG_GPIO_WATCHDOG_ARCH_INITCALL is not set
CONFIG_MENF21BMC_WATCHDOG=y
CONFIG_MENZ069_WATCHDOG=y
CONFIG_WM831X_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
CONFIG_XILINX_WINDOW_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=y
CONFIG_RAVE_SP_WATCHDOG=y
CONFIG_MLX_WDT=y
CONFIG_SL28CPLD_WATCHDOG=y
CONFIG_AIROHA_WATCHDOG=y
CONFIG_ARMADA_37XX_WATCHDOG=y
CONFIG_ASM9260_WATCHDOG=y
CONFIG_AT91RM9200_WATCHDOG=y
CONFIG_AT91SAM9X_WATCHDOG=y
CONFIG_SAMA5D4_WATCHDOG=y
CONFIG_CADENCE_WATCHDOG=y
CONFIG_FTWDT010_WATCHDOG=y
CONFIG_S3C2410_WATCHDOG=y
CONFIG_SA1100_WATCHDOG=y
# CONFIG_DW_WATCHDOG is not set
CONFIG_EP93XX_WATCHDOG=y
# CONFIG_OMAP_WATCHDOG is not set
CONFIG_PNX4008_WATCHDOG=y
CONFIG_DAVINCI_WATCHDOG=y
# CONFIG_K3_RTI_WATCHDOG is not set
CONFIG_RN5T618_WATCHDOG=y
CONFIG_SUNXI_WATCHDOG=y
# CONFIG_NPCM7XX_WATCHDOG is not set
# CONFIG_TWL4030_WATCHDOG is not set
# CONFIG_STMP3XXX_RTC_WATCHDOG is not set
CONFIG_TS4800_WATCHDOG=y
CONFIG_TS72XX_WATCHDOG=y
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_MAX77620_WATCHDOG=y
CONFIG_IMX2_WDT=y
# CONFIG_IMX7ULP_WDT is not set
# CONFIG_S32G_WDT is not set
CONFIG_RETU_WATCHDOG=y
# CONFIG_MOXART_WDT is not set
# CONFIG_ST_LPC_WATCHDOG is not set
# CONFIG_TEGRA_WATCHDOG is not set
# CONFIG_QCOM_WDT is not set
CONFIG_MESON_GXBB_WATCHDOG=y
# CONFIG_MESON_WATCHDOG is not set
CONFIG_MEDIATEK_WATCHDOG=y
CONFIG_DIGICOLOR_WATCHDOG=y
CONFIG_LPC18XX_WATCHDOG=y
# CONFIG_RENESAS_WDT is not set
CONFIG_RENESAS_RZAWDT=y
CONFIG_RENESAS_RZN1WDT=y
CONFIG_RENESAS_RZG2LWDT=y
CONFIG_RENESAS_RZV2HWDT=y
CONFIG_ASPEED_WATCHDOG=y
# CONFIG_STM32_WATCHDOG is not set
# CONFIG_STPMIC1_WATCHDOG is not set
# CONFIG_UNIPHIER_WATCHDOG is not set
CONFIG_RTD119X_WATCHDOG=y
CONFIG_REALTEK_OTTO_WDT=y
# CONFIG_SPRD_WATCHDOG is not set
CONFIG_VISCONTI_WATCHDOG=y
# CONFIG_MSC313E_WATCHDOG is not set
CONFIG_APPLE_WATCHDOG=y
CONFIG_SUNPLUS_WATCHDOG=y
CONFIG_ALIM1535_WDT=y
CONFIG_ALIM7101_WDT=y
CONFIG_SC520_WDT=y
CONFIG_I6300ESB_WDT=y
# CONFIG_HP_WATCHDOG is not set
CONFIG_KEMPLD_WDT=y
# CONFIG_RDC321X_WDT is not set
CONFIG_TQMX86_WDT=y
CONFIG_VIA_WDT=y
CONFIG_BCM47XX_WDT=y
# CONFIG_JZ4740_WDT is not set
CONFIG_BCM2835_WDT=y
CONFIG_BCM_KONA_WDT=y
# CONFIG_BCM_KONA_WDT_DEBUG is not set
CONFIG_BCM7038_WDT=y
CONFIG_IMGPDC_WDT=y
CONFIG_LOONGSON1_WDT=y
CONFIG_GXP_WATCHDOG=y
CONFIG_MT7621_WDT=y
# CONFIG_MPC5200_WDT is not set
# CONFIG_MEN_A21_WDT is not set
CONFIG_STARFIVE_WATCHDOG=y
CONFIG_UML_WATCHDOG=y

#
# PCI-based Watchdog Cards
#

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
# CONFIG_SSB_SDIOHOST is not set
# CONFIG_SSB_HOST_SOC is not set
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_DRIVER_MIPS is not set
# CONFIG_BCMA_SFLASH is not set
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_ADP5585=y
# CONFIG_MFD_ACT8945A is not set
# CONFIG_MFD_SUN4I_GPADC is not set
CONFIG_MFD_AS3711=y
CONFIG_MFD_SMPRO=y
CONFIG_MFD_AS3722=y
# CONFIG_PMIC_ADP5520 is not set
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_AT91_USART=y
CONFIG_MFD_ATMEL_FLEXCOM=y
CONFIG_MFD_ATMEL_HLCDC=y
# CONFIG_MFD_BCM590XX is not set
CONFIG_MFD_BD9571MWV=y
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_CROS_EC_DEV is not set
# CONFIG_MFD_CS42L43_I2C is not set
CONFIG_MFD_MADERA=y
# CONFIG_MFD_MADERA_I2C is not set
CONFIG_MFD_MAX5970=y
CONFIG_MFD_CS47L15=y
# CONFIG_MFD_CS47L35 is not set
# CONFIG_MFD_CS47L85 is not set
# CONFIG_MFD_CS47L90 is not set
CONFIG_MFD_CS47L92=y
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_I2C=y
CONFIG_MFD_DA9055=y
# CONFIG_MFD_DA9062 is not set
CONFIG_MFD_DA9063=y
CONFIG_MFD_DA9150=y
CONFIG_MFD_DLN2=y
CONFIG_MFD_ENE_KB3930=y
# CONFIG_MFD_EXYNOS_LPASS is not set
CONFIG_MFD_GATEWORKS_GSC=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
# CONFIG_MFD_MXS_LRADC is not set
CONFIG_MFD_MX25_TSADC=y
CONFIG_MFD_HI6421_PMIC=y
CONFIG_MFD_HI6421_SPMI=y
CONFIG_MFD_HI655X_PMIC=y
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
CONFIG_INTEL_SOC_PMIC=y
CONFIG_MFD_IQS62X=y
CONFIG_MFD_JANZ_CMODIO=y
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_88PM886_PMIC is not set
CONFIG_MFD_MAX14577=y
CONFIG_MFD_MAX77541=y
CONFIG_MFD_MAX77620=y
CONFIG_MFD_MAX77650=y
CONFIG_MFD_MAX77686=y
CONFIG_MFD_MAX77693=y
# CONFIG_MFD_MAX77705 is not set
CONFIG_MFD_MAX77714=y
# CONFIG_MFD_MAX77759 is not set
# CONFIG_MFD_MAX77843 is not set
CONFIG_MFD_MAX8907=y
CONFIG_MFD_MAX8925=y
CONFIG_MFD_MAX8997=y
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6360=y
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=y
# CONFIG_MFD_VIPERBOARD is not set
CONFIG_MFD_NTXEC=y
CONFIG_MFD_RETU=y
CONFIG_MFD_PM8XXX=y
# CONFIG_MFD_SPMI_PMIC is not set
CONFIG_MFD_SY7636A=y
CONFIG_MFD_RDC321X=y
CONFIG_MFD_RT4831=y
CONFIG_MFD_RT5033=y
# CONFIG_MFD_RT5120 is not set
# CONFIG_MFD_RC5T583 is not set
CONFIG_MFD_RK8XX=y
CONFIG_MFD_RK8XX_I2C=y
# CONFIG_MFD_RN5T618 is not set
# CONFIG_MFD_SEC_ACPM is not set
# CONFIG_MFD_SEC_I2C is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SIMPLE_MFD_I2C=y
CONFIG_MFD_SL28CPLD=y
# CONFIG_MFD_SM501 is not set
CONFIG_MFD_SKY81452=y
# CONFIG_RZ_MTU3 is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_STMPE is not set
CONFIG_MFD_SUN6I_PRCM=y
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=y
CONFIG_MFD_PALMAS=y
# CONFIG_TPS6105X is not set
CONFIG_TPS65010=y
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TPS65217=y
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TI_LP87565 is not set
CONFIG_MFD_TPS65218=y
CONFIG_MFD_TPS65219=y
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
# CONFIG_MFD_TPS6594_I2C is not set
CONFIG_TWL4030_CORE=y
CONFIG_MFD_TWL4030_AUDIO=y
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
CONFIG_MFD_TIMBERDALE=y
# CONFIG_MFD_TC3589X is not set
CONFIG_MFD_TQMX86=y
CONFIG_MFD_VX855=y
CONFIG_MFD_LOCHNAGAR=y
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
CONFIG_MFD_WM8997=y
CONFIG_MFD_WM8998=y
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=y
CONFIG_MFD_STW481X=y
CONFIG_MFD_ROHM_BD718XX=y
CONFIG_MFD_ROHM_BD71828=y
# CONFIG_MFD_ROHM_BD957XMUF is not set
CONFIG_MFD_ROHM_BD96801=y
CONFIG_MFD_STM32_LPTIMER=y
CONFIG_MFD_STM32_TIMERS=y
CONFIG_MFD_STPMIC1=y
CONFIG_MFD_STMFX=y
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
CONFIG_MFD_KHADAS_MCU=y
CONFIG_MFD_ACER_A500_EC=y
# CONFIG_MFD_QCOM_PM8008 is not set
# CONFIG_MFD_CS40L50_I2C is not set
CONFIG_RAVE_SP_CORE=y
CONFIG_MFD_QNAP_MCU=y
CONFIG_MFD_RSMU_I2C=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
CONFIG_REGULATOR_88PG86X=y
CONFIG_REGULATOR_88PM800=y
CONFIG_REGULATOR_ACT8865=y
CONFIG_REGULATOR_AD5398=y
# CONFIG_REGULATOR_ADP5055 is not set
CONFIG_REGULATOR_ANATOP=y
CONFIG_REGULATOR_AAT2870=y
# CONFIG_REGULATOR_ARIZONA_LDO1 is not set
# CONFIG_REGULATOR_ARIZONA_MICSUPP is not set
# CONFIG_REGULATOR_ARM_SCMI is not set
CONFIG_REGULATOR_AS3711=y
# CONFIG_REGULATOR_AS3722 is not set
CONFIG_REGULATOR_ATC260X=y
CONFIG_REGULATOR_AW37503=y
CONFIG_REGULATOR_BD71815=y
CONFIG_REGULATOR_BD71828=y
CONFIG_REGULATOR_BD718XX=y
CONFIG_REGULATOR_BD9571MWV=y
CONFIG_REGULATOR_BD96801=y
CONFIG_REGULATOR_CROS_EC=y
# CONFIG_REGULATOR_DA9052 is not set
# CONFIG_REGULATOR_DA9055 is not set
# CONFIG_REGULATOR_DA9063 is not set
# CONFIG_REGULATOR_DA9121 is not set
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_FAN53880=y
CONFIG_REGULATOR_GPIO=y
# CONFIG_REGULATOR_HI6421 is not set
CONFIG_REGULATOR_HI6421V530=y
# CONFIG_REGULATOR_HI655X is not set
CONFIG_REGULATOR_HI6421V600=y
CONFIG_REGULATOR_ISL9305=y
# CONFIG_REGULATOR_ISL6271A is not set
CONFIG_REGULATOR_LM363X=y
# CONFIG_REGULATOR_LOCHNAGAR is not set
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
CONFIG_REGULATOR_LP872X=y
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=y
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX5970=y
CONFIG_REGULATOR_MAX77503=y
CONFIG_REGULATOR_MAX77541=y
CONFIG_REGULATOR_MAX77620=y
CONFIG_REGULATOR_MAX77650=y
# CONFIG_REGULATOR_MAX77857 is not set
CONFIG_REGULATOR_MAX8649=y
CONFIG_REGULATOR_MAX8660=y
# CONFIG_REGULATOR_MAX8893 is not set
CONFIG_REGULATOR_MAX8907=y
CONFIG_REGULATOR_MAX8925=y
CONFIG_REGULATOR_MAX8952=y
CONFIG_REGULATOR_MAX8973=y
CONFIG_REGULATOR_MAX8997=y
CONFIG_REGULATOR_MAX8998=y
# CONFIG_REGULATOR_MAX20086 is not set
# CONFIG_REGULATOR_MAX20411 is not set
CONFIG_REGULATOR_MAX77686=y
# CONFIG_REGULATOR_MAX77693 is not set
# CONFIG_REGULATOR_MAX77802 is not set
CONFIG_REGULATOR_MAX77826=y
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
CONFIG_REGULATOR_MC13892=y
# CONFIG_REGULATOR_MCP16502 is not set
CONFIG_REGULATOR_MP5416=y
# CONFIG_REGULATOR_MP8859 is not set
CONFIG_REGULATOR_MP886X=y
CONFIG_REGULATOR_MPQ7920=y
# CONFIG_REGULATOR_MT6311 is not set
# CONFIG_REGULATOR_MT6315 is not set
# CONFIG_REGULATOR_MT6360 is not set
CONFIG_REGULATOR_MT6380=y
CONFIG_REGULATOR_PALMAS=y
# CONFIG_REGULATOR_PBIAS is not set
# CONFIG_REGULATOR_PCA9450 is not set
CONFIG_REGULATOR_PF9453=y
CONFIG_REGULATOR_PF8X00=y
CONFIG_REGULATOR_PFUZE100=y
CONFIG_REGULATOR_PV88060=y
# CONFIG_REGULATOR_PV88080 is not set
CONFIG_REGULATOR_PV88090=y
CONFIG_REGULATOR_QCOM_REFGEN=y
CONFIG_REGULATOR_QCOM_RPMH=y
# CONFIG_REGULATOR_QCOM_SMD_RPM is not set
# CONFIG_REGULATOR_QCOM_SPMI is not set
CONFIG_REGULATOR_QCOM_USB_VBUS=y
CONFIG_REGULATOR_RAA215300=y
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=y
CONFIG_REGULATOR_RK808=y
CONFIG_REGULATOR_ROHM=y
CONFIG_REGULATOR_RT4801=y
CONFIG_REGULATOR_RT4803=y
CONFIG_REGULATOR_RT4831=y
CONFIG_REGULATOR_RT5033=y
# CONFIG_REGULATOR_RT5190A is not set
# CONFIG_REGULATOR_RT5739 is not set
CONFIG_REGULATOR_RT5759=y
CONFIG_REGULATOR_RT6160=y
CONFIG_REGULATOR_RT6190=y
CONFIG_REGULATOR_RT6245=y
# CONFIG_REGULATOR_RTQ2134 is not set
CONFIG_REGULATOR_RTMV20=y
CONFIG_REGULATOR_RTQ6752=y
CONFIG_REGULATOR_RTQ2208=y
# CONFIG_REGULATOR_S2MPA01 is not set
CONFIG_REGULATOR_S2MPS11=y
CONFIG_REGULATOR_S5M8767=y
CONFIG_REGULATOR_SC2731=y
CONFIG_REGULATOR_SKY81452=y
CONFIG_REGULATOR_SLG51000=y
# CONFIG_REGULATOR_STM32_BOOSTER is not set
CONFIG_REGULATOR_STM32_VREFBUF=y
# CONFIG_REGULATOR_STM32_PWR is not set
# CONFIG_REGULATOR_STPMIC1 is not set
CONFIG_REGULATOR_TI_ABB=y
CONFIG_REGULATOR_STW481X_VMMC=y
CONFIG_REGULATOR_SUN20I=y
# CONFIG_REGULATOR_SY7636A is not set
# CONFIG_REGULATOR_SY8106A is not set
CONFIG_REGULATOR_SY8824X=y
CONFIG_REGULATOR_SY8827N=y
# CONFIG_REGULATOR_TPS51632 is not set
CONFIG_REGULATOR_TPS62360=y
# CONFIG_REGULATOR_TPS6286X is not set
CONFIG_REGULATOR_TPS6287X=y
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=y
CONFIG_REGULATOR_TPS65086=y
CONFIG_REGULATOR_TPS65090=y
CONFIG_REGULATOR_TPS65132=y
# CONFIG_REGULATOR_TPS65217 is not set
CONFIG_REGULATOR_TPS65218=y
CONFIG_REGULATOR_TPS65219=y
CONFIG_REGULATOR_TPS65912=y
CONFIG_REGULATOR_TPS68470=y
CONFIG_REGULATOR_TWL4030=y
CONFIG_REGULATOR_UNIPHIER=y
CONFIG_REGULATOR_RZG2L_VBCTRL=y
# CONFIG_REGULATOR_VCTRL is not set
CONFIG_REGULATOR_WM831X=y
CONFIG_REGULATOR_WM8994=y
CONFIG_REGULATOR_QCOM_LABIBB=y
# CONFIG_RC_CORE is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
# CONFIG_MEDIA_SUPPORT_FILTER is not set
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
# CONFIG_VIDEO_DEV is not set
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=y
# end of Media core support

#
# Media controller options
#
CONFIG_MEDIA_CONTROLLER_DVB=y
# end of Media controller options

#
# Digital TV options
#
CONFIG_DVB_MAX_ADAPTERS=16
# CONFIG_DVB_DYNAMIC_MINORS is not set
CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=y
CONFIG_DVB_ULE_DEBUG=y
# end of Digital TV options

#
# Media drivers
#

#
# Media drivers
#
CONFIG_MEDIA_USB_SUPPORT=y

#
# Webcam devices
#

#
# Analog TV USB devices
#

#
# Analog/digital TV USB devices
#

#
# Digital TV USB devices
#
CONFIG_DVB_AS102=y
CONFIG_DVB_B2C2_FLEXCOP_USB=y
# CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG is not set
# CONFIG_DVB_USB_V2 is not set
# CONFIG_SMS_USB_DRV is not set
CONFIG_DVB_TTUSB_BUDGET=y
CONFIG_DVB_TTUSB_DEC=y

#
# Webcam, TV (analog/digital) USB devices
#

#
# Software defined radio USB devices
#
# CONFIG_MEDIA_PCI_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_DRIVERS is not set

#
# MMC/SDIO DVB adapters
#
# CONFIG_SMS_SDIO_DRV is not set
CONFIG_DVB_TEST_DRIVERS=y
CONFIG_DVB_VIDTV=y
CONFIG_DVB_B2C2_FLEXCOP=y
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_FC0011=y
CONFIG_MEDIA_TUNER_FC0012=y
CONFIG_MEDIA_TUNER_FC0013=y
CONFIG_MEDIA_TUNER_IT913X=y
CONFIG_MEDIA_TUNER_M88RS6000T=y
# CONFIG_MEDIA_TUNER_MAX2165 is not set
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_MT2060=y
# CONFIG_MEDIA_TUNER_MT2063 is not set
CONFIG_MEDIA_TUNER_MT20XX=y
# CONFIG_MEDIA_TUNER_MT2131 is not set
# CONFIG_MEDIA_TUNER_MT2266 is not set
# CONFIG_MEDIA_TUNER_MXL301RF is not set
CONFIG_MEDIA_TUNER_MXL5005S=y
CONFIG_MEDIA_TUNER_MXL5007T=y
CONFIG_MEDIA_TUNER_QM1D1B0004=y
CONFIG_MEDIA_TUNER_QM1D1C0042=y
# CONFIG_MEDIA_TUNER_QT1010 is not set
# CONFIG_MEDIA_TUNER_R820T is not set
CONFIG_MEDIA_TUNER_SI2157=y
CONFIG_MEDIA_TUNER_SIMPLE=y
# CONFIG_MEDIA_TUNER_TDA18212 is not set
CONFIG_MEDIA_TUNER_TDA18218=y
CONFIG_MEDIA_TUNER_TDA18250=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_TUA9001=y
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_XC5000=y
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
# CONFIG_DVB_M88DS3103 is not set
CONFIG_DVB_MXL5XX=y
# CONFIG_DVB_STB0899 is not set
CONFIG_DVB_STB6100=y
# CONFIG_DVB_STV090x is not set
CONFIG_DVB_STV0910=y
# CONFIG_DVB_STV6110x is not set
CONFIG_DVB_STV6111=y

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=y
# CONFIG_DVB_MN88472 is not set
CONFIG_DVB_MN88473=y
CONFIG_DVB_SI2165=y
# CONFIG_DVB_TDA18271C2DD is not set

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=y
CONFIG_DVB_CX24116=y
CONFIG_DVB_CX24117=y
CONFIG_DVB_CX24120=y
CONFIG_DVB_CX24123=y
CONFIG_DVB_DS3000=y
# CONFIG_DVB_MB86A16 is not set
CONFIG_DVB_MT312=y
CONFIG_DVB_S5H1420=y
CONFIG_DVB_SI21XX=y
CONFIG_DVB_STB6000=y
CONFIG_DVB_STV0288=y
CONFIG_DVB_STV0299=y
CONFIG_DVB_STV0900=y
CONFIG_DVB_STV6110=y
CONFIG_DVB_TDA10071=y
CONFIG_DVB_TDA10086=y
CONFIG_DVB_TDA8083=y
CONFIG_DVB_TDA8261=y
# CONFIG_DVB_TDA826X is not set
CONFIG_DVB_TS2020=y
CONFIG_DVB_TUA6100=y
CONFIG_DVB_TUNER_CX24113=y
CONFIG_DVB_TUNER_ITD1000=y
# CONFIG_DVB_VES1X93 is not set
CONFIG_DVB_ZL10036=y
CONFIG_DVB_ZL10039=y

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_AF9013=y
CONFIG_DVB_AS102_FE=y
CONFIG_DVB_CX22700=y
# CONFIG_DVB_CX22702 is not set
# CONFIG_DVB_CXD2820R is not set
CONFIG_DVB_CXD2841ER=y
# CONFIG_DVB_DIB3000MB is not set
CONFIG_DVB_DIB3000MC=y
# CONFIG_DVB_DIB7000M is not set
# CONFIG_DVB_DIB7000P is not set
CONFIG_DVB_DIB9000=y
# CONFIG_DVB_DRXD is not set
CONFIG_DVB_EC100=y
CONFIG_DVB_L64781=y
CONFIG_DVB_MT352=y
CONFIG_DVB_NXT6000=y
CONFIG_DVB_RTL2830=y
CONFIG_DVB_RTL2832=y
# CONFIG_DVB_S5H1432 is not set
# CONFIG_DVB_SI2168 is not set
CONFIG_DVB_SP887X=y
CONFIG_DVB_STV0367=y
CONFIG_DVB_TDA10048=y
CONFIG_DVB_TDA1004X=y
CONFIG_DVB_ZD1301_DEMOD=y
CONFIG_DVB_ZL10353=y

#
# DVB-C (cable) frontends
#
CONFIG_DVB_STV0297=y
# CONFIG_DVB_TDA10021 is not set
# CONFIG_DVB_TDA10023 is not set
CONFIG_DVB_VES1820=y

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
# CONFIG_DVB_AU8522_DTV is not set
CONFIG_DVB_BCM3510=y
CONFIG_DVB_LG2160=y
CONFIG_DVB_LGDT3305=y
CONFIG_DVB_LGDT3306A=y
CONFIG_DVB_LGDT330X=y
CONFIG_DVB_MXL692=y
CONFIG_DVB_NXT200X=y
CONFIG_DVB_OR51132=y
CONFIG_DVB_OR51211=y
CONFIG_DVB_S5H1409=y
CONFIG_DVB_S5H1411=y

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_DIB8000=y
CONFIG_DVB_MB86A20S=y
CONFIG_DVB_S921=y

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_MN88443X=y
# CONFIG_DVB_TC90522 is not set

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=y
CONFIG_DVB_TUNER_DIB0070=y
CONFIG_DVB_TUNER_DIB0090=y

#
# SEC control devices for DVB-S
#
CONFIG_DVB_A8293=y
# CONFIG_DVB_AF9033 is not set
CONFIG_DVB_ASCOT2E=y
CONFIG_DVB_ATBM8830=y
# CONFIG_DVB_HELENE is not set
# CONFIG_DVB_HORUS3A is not set
CONFIG_DVB_ISL6405=y
CONFIG_DVB_ISL6421=y
CONFIG_DVB_ISL6423=y
CONFIG_DVB_IX2505V=y
# CONFIG_DVB_LGS8GL5 is not set
CONFIG_DVB_LGS8GXX=y
CONFIG_DVB_LNBH25=y
CONFIG_DVB_LNBH29=y
CONFIG_DVB_LNBP21=y
CONFIG_DVB_LNBP22=y
# CONFIG_DVB_M88RS2000 is not set
# CONFIG_DVB_TDA665x is not set
CONFIG_DVB_DRX39XYJ=y

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=y
CONFIG_DVB_SP2=y
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO=y
CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_HD44780_COMMON=y
CONFIG_HD44780=y
CONFIG_LCD2S=y
# CONFIG_PANEL_CHANGE_MESSAGE is not set
CONFIG_CHARLCD_BL_OFF=y
# CONFIG_CHARLCD_BL_ON is not set
# CONFIG_CHARLCD_BL_FLASH is not set
CONFIG_LINEDISP=y
# CONFIG_IMG_ASCII_LCD is not set
CONFIG_HT16K33=y
# CONFIG_MAX6959 is not set
CONFIG_SEG_LED_GPIO=y
CONFIG_TEGRA_HOST1X_CONTEXT_BUS=y
CONFIG_TEGRA_HOST1X=y
# CONFIG_TEGRA_HOST1X_FIREWALL is not set
CONFIG_IMX_IPUV3_CORE=y
CONFIG_DRM=y

#
# DRM debugging options
#
# CONFIG_DRM_DEBUG_MM is not set
CONFIG_DRM_KUNIT_TEST_HELPERS=y
CONFIG_DRM_KUNIT_TEST=y
CONFIG_DRM_SCHED_KUNIT_TEST=y
# end of DRM debugging options

CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_DRAW=y
CONFIG_DRM_PANIC=y
CONFIG_DRM_PANIC_FOREGROUND_COLOR=0xffffff
CONFIG_DRM_PANIC_BACKGROUND_COLOR=0x000000
# CONFIG_DRM_PANIC_DEBUG is not set
CONFIG_DRM_PANIC_SCREEN="user"
CONFIG_DRM_CLIENT=y
CONFIG_DRM_CLIENT_LIB=y
CONFIG_DRM_CLIENT_SELECTION=y
CONFIG_DRM_CLIENT_SETUP=y

#
# Supported DRM clients
#
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
CONFIG_DRM_CLIENT_LOG=y
CONFIG_DRM_CLIENT_DEFAULT_FBDEV=y
# CONFIG_DRM_CLIENT_DEFAULT_LOG is not set
CONFIG_DRM_CLIENT_DEFAULT="fbdev"
# end of Supported DRM clients

# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_DISPLAY_DP_AUX_BUS=y
CONFIG_DRM_DISPLAY_HELPER=y
CONFIG_DRM_BRIDGE_CONNECTOR=y
# CONFIG_DRM_DISPLAY_DP_AUX_CEC is not set
# CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV is not set
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_DSC_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_STATE_HELPER=y
CONFIG_DRM_TTM=y
CONFIG_DRM_EXEC=y
CONFIG_DRM_GPUVM=y
CONFIG_DRM_BUDDY=y
CONFIG_DRM_VRAM_HELPER=y
CONFIG_DRM_TTM_HELPER=y
CONFIG_DRM_GEM_DMA_HELPER=y
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_SUBALLOC_HELPER=y
CONFIG_DRM_SCHED=y

#
# Drivers for system framebuffers
#
CONFIG_DRM_SYSFB_HELPER=y
# CONFIG_DRM_OFDRM is not set
CONFIG_DRM_SIMPLEDRM=y
# end of Drivers for system framebuffers

#
# ARM devices
#
# CONFIG_DRM_HDLCD is not set
# CONFIG_DRM_MALI_DISPLAY is not set
CONFIG_DRM_KOMEDA=y
# end of ARM devices

CONFIG_DRM_RADEON=y
CONFIG_DRM_RADEON_USERPTR=y
CONFIG_DRM_AMDGPU=y
CONFIG_DRM_AMDGPU_SI=y
# CONFIG_DRM_AMDGPU_CIK is not set
# CONFIG_DRM_AMDGPU_USERPTR is not set

#
# ACP (Audio CoProcessor) Configuration
#
# CONFIG_DRM_AMD_ACP is not set
# end of ACP (Audio CoProcessor) Configuration

#
# Display Engine Configuration
#
# CONFIG_DRM_AMD_DC is not set
# end of Display Engine Configuration

CONFIG_DRM_NOUVEAU=y
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
CONFIG_NOUVEAU_DEBUG_MMU=y
# CONFIG_NOUVEAU_DEBUG_PUSH is not set
CONFIG_DRM_NOUVEAU_BACKLIGHT=y
CONFIG_DRM_NOUVEAU_GSP_DEFAULT=y
# CONFIG_DRM_NOUVEAU_CH7006 is not set
CONFIG_DRM_NOUVEAU_SIL164=y
CONFIG_DRM_XE=y
CONFIG_DRM_XE_FORCE_PROBE=""
CONFIG_DRM_XE_JOB_TIMEOUT_MAX=10000
CONFIG_DRM_XE_JOB_TIMEOUT_MIN=1
CONFIG_DRM_XE_TIMESLICE_MAX=10000000
CONFIG_DRM_XE_TIMESLICE_MIN=1
CONFIG_DRM_XE_PREEMPT_TIMEOUT=640000
CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX=10000000
CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN=1
CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT=y
CONFIG_DRM_KMB_DISPLAY=y
CONFIG_DRM_VGEM=y
# CONFIG_DRM_VKMS is not set
CONFIG_DRM_EXYNOS=y

#
# CRTCs
#
CONFIG_DRM_EXYNOS5433_DECON=y
# CONFIG_DRM_EXYNOS_MIXER is not set
CONFIG_DRM_EXYNOS_VIDI=y

#
# Encoders and Bridges
#
CONFIG_DRM_EXYNOS_DSI=y
# CONFIG_DRM_EXYNOS_HDMI is not set
# CONFIG_DRM_EXYNOS_MIC is not set

#
# Sub-drivers
#
CONFIG_DRM_EXYNOS_G2D=y
CONFIG_DRM_EXYNOS_IPP=y
CONFIG_DRM_EXYNOS_FIMC=y
CONFIG_DRM_EXYNOS_ROTATOR=y
CONFIG_DRM_EXYNOS_SCALER=y
# CONFIG_DRM_EXYNOS_GSC is not set
# CONFIG_DRM_UDL is not set
CONFIG_DRM_AST=y
CONFIG_DRM_MGAG200=y
CONFIG_DRM_ATMEL_HLCDC=y
# CONFIG_DRM_RCAR_DU is not set
CONFIG_DRM_RCAR_DW_HDMI=y
CONFIG_DRM_RCAR_USE_LVDS=y
CONFIG_DRM_RCAR_USE_MIPI_DSI=y
# CONFIG_DRM_RZG2L_USE_MIPI_DSI is not set
CONFIG_DRM_SHMOBILE=y
# CONFIG_DRM_SUN4I is not set
# CONFIG_DRM_OMAP is not set
# CONFIG_DRM_VIRTIO_GPU is not set
# CONFIG_DRM_TEGRA is not set
CONFIG_DRM_STM=y
CONFIG_DRM_STM_DSI=y
CONFIG_DRM_STM_LVDS=y
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_ARM_VERSATILE=y
# CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596 is not set
# CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0 is not set
# CONFIG_DRM_PANEL_BOE_HIMAX8279D is not set
# CONFIG_DRM_PANEL_BOE_TD4320 is not set
CONFIG_DRM_PANEL_BOE_TH101MB31UIG002_28A=y
CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=y
CONFIG_DRM_PANEL_BOE_TV101WUM_LL2=y
CONFIG_DRM_PANEL_EBBG_FT8719=y
CONFIG_DRM_PANEL_ELIDA_KD35T133=y
# CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02 is not set
CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D=y
# CONFIG_DRM_PANEL_DSI_CM is not set
# CONFIG_DRM_PANEL_LVDS is not set
# CONFIG_DRM_PANEL_HIMAX_HX8279 is not set
# CONFIG_DRM_PANEL_HIMAX_HX83102 is not set
CONFIG_DRM_PANEL_HIMAX_HX83112A=y
CONFIG_DRM_PANEL_HIMAX_HX8394=y
CONFIG_DRM_PANEL_ILITEK_ILI9805=y
# CONFIG_DRM_PANEL_ILITEK_ILI9806E is not set
# CONFIG_DRM_PANEL_ILITEK_ILI9881C is not set
# CONFIG_DRM_PANEL_ILITEK_ILI9882T is not set
CONFIG_DRM_PANEL_INNOLUX_P079ZCA=y
CONFIG_DRM_PANEL_JADARD_JD9365DA_H3=y
CONFIG_DRM_PANEL_JDI_LPM102A188A=y
CONFIG_DRM_PANEL_JDI_LT070ME05000=y
CONFIG_DRM_PANEL_JDI_R63452=y
CONFIG_DRM_PANEL_KHADAS_TS050=y
CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04=y
CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W=y
# CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829 is not set
CONFIG_DRM_PANEL_LINCOLNTECH_LCD197=y
CONFIG_DRM_PANEL_LG_SW43408=y
CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=y
CONFIG_DRM_PANEL_NEWVISION_NV3051D=y
CONFIG_DRM_PANEL_NOVATEK_NT35510=y
CONFIG_DRM_PANEL_NOVATEK_NT35560=y
# CONFIG_DRM_PANEL_NOVATEK_NT35950 is not set
# CONFIG_DRM_PANEL_NOVATEK_NT36523 is not set
# CONFIG_DRM_PANEL_NOVATEK_NT36672A is not set
CONFIG_DRM_PANEL_NOVATEK_NT36672E=y
# CONFIG_DRM_PANEL_NOVATEK_NT37801 is not set
CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=y
CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS=y
CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=y
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
CONFIG_DRM_PANEL_RAYDIUM_RM67191=y
CONFIG_DRM_PANEL_RAYDIUM_RM67200=y
# CONFIG_DRM_PANEL_RAYDIUM_RM68200 is not set
CONFIG_DRM_PANEL_RAYDIUM_RM692E5=y
CONFIG_DRM_PANEL_RAYDIUM_RM69380=y
# CONFIG_DRM_PANEL_RONBO_RB070D30 is not set
CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01=y
CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08=y
CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24=y
CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01=y
# CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E3FA7=y
# CONFIG_DRM_PANEL_SAMSUNG_S6D16D0 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0=y
# CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=y
# CONFIG_DRM_PANEL_SAMSUNG_S6E63M0 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
# CONFIG_DRM_PANEL_SAMSUNG_SOFEF00 is not set
CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
# CONFIG_DRM_PANEL_SHARP_LQ101R1SX01 is not set
# CONFIG_DRM_PANEL_SHARP_LS037V7DW01 is not set
CONFIG_DRM_PANEL_SHARP_LS043T1LE01=y
CONFIG_DRM_PANEL_SHARP_LS060T1SX01=y
# CONFIG_DRM_PANEL_SITRONIX_ST7701 is not set
# CONFIG_DRM_PANEL_SITRONIX_ST7703 is not set
# CONFIG_DRM_PANEL_SONY_TD4353_JDI is not set
# CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521 is not set
CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=y
# CONFIG_DRM_PANEL_EDP is not set
# CONFIG_DRM_PANEL_SIMPLE is not set
CONFIG_DRM_PANEL_SUMMIT=y
CONFIG_DRM_PANEL_SYNAPTICS_R63353=y
CONFIG_DRM_PANEL_TDO_TL070WSH30=y
CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=y
# CONFIG_DRM_PANEL_VISIONOX_G2647FB105 is not set
CONFIG_DRM_PANEL_VISIONOX_R66451=y
CONFIG_DRM_PANEL_VISIONOX_RM69299=y
CONFIG_DRM_PANEL_VISIONOX_RM692E5=y
CONFIG_DRM_PANEL_VISIONOX_VTDR6130=y
# CONFIG_DRM_PANEL_XINPENG_XPP055C272 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y
CONFIG_DRM_AUX_BRIDGE=y
CONFIG_DRM_AUX_HPD_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_CHIPONE_ICN6211=y
CONFIG_DRM_CHRONTEL_CH7033=y
# CONFIG_DRM_CROS_EC_ANX7688 is not set
CONFIG_DRM_DISPLAY_CONNECTOR=y
CONFIG_DRM_FSL_LDB=y
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_ITE_IT6263 is not set
CONFIG_DRM_ITE_IT6505=y
CONFIG_DRM_LONTIUM_LT8912B=y
# CONFIG_DRM_LONTIUM_LT9211 is not set
# CONFIG_DRM_LONTIUM_LT9611 is not set
# CONFIG_DRM_LONTIUM_LT9611UXC is not set
CONFIG_DRM_ITE_IT66121=y
CONFIG_DRM_LVDS_CODEC=y
CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW=y
# CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER is not set
# CONFIG_DRM_NWL_MIPI_DSI is not set
# CONFIG_DRM_NXP_PTN3460 is not set
# CONFIG_DRM_PARADE_PS8622 is not set
# CONFIG_DRM_PARADE_PS8640 is not set
CONFIG_DRM_SAMSUNG_DSIM=y
CONFIG_DRM_SIL_SII8620=y
# CONFIG_DRM_SII902X is not set
CONFIG_DRM_SII9234=y
CONFIG_DRM_SIMPLE_BRIDGE=y
CONFIG_DRM_THINE_THC63LVD1024=y
# CONFIG_DRM_TOSHIBA_TC358762 is not set
CONFIG_DRM_TOSHIBA_TC358764=y
CONFIG_DRM_TOSHIBA_TC358767=y
# CONFIG_DRM_TOSHIBA_TC358768 is not set
# CONFIG_DRM_TOSHIBA_TC358775 is not set
CONFIG_DRM_TI_DLPC3433=y
CONFIG_DRM_TI_TDP158=y
CONFIG_DRM_TI_TFP410=y
CONFIG_DRM_TI_SN65DSI83=y
# CONFIG_DRM_TI_SN65DSI86 is not set
CONFIG_DRM_TI_TPD12S015=y
CONFIG_DRM_ANALOGIX_ANX6345=y
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
CONFIG_DRM_ANALOGIX_DP=y
CONFIG_DRM_ANALOGIX_ANX7625=y
CONFIG_DRM_I2C_ADV7511=y
CONFIG_DRM_I2C_ADV7511_AUDIO=y
# CONFIG_DRM_I2C_ADV7511_CEC is not set
CONFIG_DRM_CDNS_DSI=y
# CONFIG_DRM_CDNS_DSI_J721E is not set
# CONFIG_DRM_CDNS_MHDP8546 is not set
CONFIG_DRM_IMX_LDB_HELPER=y
CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=y
CONFIG_DRM_IMX8MP_HDMI_PVI=y
CONFIG_DRM_IMX8QM_LDB=y
CONFIG_DRM_IMX8QXP_LDB=y
# CONFIG_DRM_IMX8QXP_PIXEL_COMBINER is not set
# CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI is not set
CONFIG_DRM_IMX93_MIPI_DSI=y
CONFIG_DRM_DW_HDMI=y
CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
CONFIG_DRM_DW_HDMI_GP_AUDIO=y
CONFIG_DRM_DW_HDMI_CEC=y
CONFIG_DRM_DW_MIPI_DSI=y
# end of Display Interface Bridges

CONFIG_DRM_STI=y
CONFIG_DRM_IMX_DCSS=y
# CONFIG_DRM_IMX is not set
# CONFIG_DRM_IMX_LCDC is not set
CONFIG_DRM_V3D=y
CONFIG_DRM_VC4=y
CONFIG_DRM_VC4_HDMI_CEC=y
CONFIG_DRM_VC4_KUNIT_TEST=y
CONFIG_DRM_LOONGSON=y
CONFIG_DRM_ETNAVIV=y
CONFIG_DRM_ETNAVIV_THERMAL=y
CONFIG_DRM_HISI_HIBMC=y
CONFIG_DRM_HISI_KIRIN=y
# CONFIG_DRM_LOGICVC is not set
CONFIG_DRM_MEDIATEK=y
CONFIG_DRM_MEDIATEK_DP=y
# CONFIG_DRM_MEDIATEK_HDMI is not set
# CONFIG_DRM_MXSFB is not set
# CONFIG_DRM_IMX_LCDIF is not set
CONFIG_DRM_MESON=y
# CONFIG_DRM_MESON_DW_HDMI is not set
CONFIG_DRM_MESON_DW_MIPI_DSI=y
# CONFIG_DRM_APPLETBDRM is not set
# CONFIG_DRM_ARCPGU is not set
# CONFIG_DRM_BOCHS is not set
# CONFIG_DRM_CIRRUS_QEMU is not set
# CONFIG_DRM_GM12U320 is not set
# CONFIG_DRM_PL111 is not set
# CONFIG_DRM_LIMA is not set
CONFIG_DRM_ASPEED_GFX=y
# CONFIG_DRM_TIDSS is not set
CONFIG_DRM_GUD=y
# CONFIG_DRM_ST7571_I2C is not set
CONFIG_DRM_SSD130X=y
# CONFIG_DRM_SSD130X_I2C is not set
# CONFIG_DRM_SPRD is not set
CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS=y
CONFIG_DRM_LIB_RANDOM=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB=y
# CONFIG_FB_CIRRUS is not set
CONFIG_FB_PM2=y
CONFIG_FB_PM2_FIFO_DISCONNECT=y
CONFIG_FB_CLPS711X=y
CONFIG_FB_IMX=y
# CONFIG_FB_CONTROL is not set
# CONFIG_FB_ASILIANT is not set
CONFIG_FB_IMSTT=y
# CONFIG_FB_GBE is not set
CONFIG_FB_PVR2=y
CONFIG_FB_OPENCORES=y
# CONFIG_FB_S1D13XXX is not set
CONFIG_FB_ATMEL=y
# CONFIG_FB_NVIDIA is not set
CONFIG_FB_RIVA=y
# CONFIG_FB_RIVA_I2C is not set
CONFIG_FB_RIVA_DEBUG=y
# CONFIG_FB_RIVA_BACKLIGHT is not set
CONFIG_FB_I740=y
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
CONFIG_FB_ATY=y
# CONFIG_FB_ATY_CT is not set
CONFIG_FB_ATY_GX=y
CONFIG_FB_ATY_BACKLIGHT=y
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_KYRO is not set
CONFIG_FB_VOODOO1=y
CONFIG_FB_PM3=y
CONFIG_FB_CARMINE=y
CONFIG_FB_CARMINE_DRAM_EVAL=y
# CONFIG_CARMINE_DRAM_CUSTOM is not set
# CONFIG_FB_WM8505 is not set
CONFIG_FB_PXA168=y
CONFIG_FB_S3C=y
CONFIG_FB_S3C_DEBUG_REGWRITE=y
CONFIG_FB_SMSCUFX=y
CONFIG_FB_IBM_GXT4500=y
CONFIG_FB_GOLDFISH=y
CONFIG_FB_VIRTUAL=y
CONFIG_FB_METRONOME=y
CONFIG_FB_MB862XX=y
CONFIG_FB_MB862XX_PCI_GDC=y
CONFIG_FB_MB862XX_I2C=y
# CONFIG_FB_BROADSHEET is not set
# CONFIG_FB_SSD1307 is not set
CONFIG_MMP_DISP=y
CONFIG_MMP_DISP_CONTROLLER=y
CONFIG_MMP_FB=y
CONFIG_FB_CORE=y
CONFIG_FB_NOTIFY=y
# CONFIG_FIRMWARE_EDID is not set
# CONFIG_FB_DEVICE is not set
CONFIG_FB_DDC=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYSMEM_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_DMAMEM_HELPERS=y
CONFIG_FB_DMAMEM_HELPERS_DEFERRED=y
CONFIG_FB_IOMEM_FOPS=y
CONFIG_FB_IOMEM_HELPERS=y
CONFIG_FB_SYSMEM_HELPERS=y
CONFIG_FB_SYSMEM_HELPERS_DEFERRED=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
# CONFIG_LCD_PLATFORM is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_ATMEL_LCDC=y
CONFIG_BACKLIGHT_KTD253=y
# CONFIG_BACKLIGHT_KTD2801 is not set
# CONFIG_BACKLIGHT_KTZ8866 is not set
# CONFIG_BACKLIGHT_LM3533 is not set
CONFIG_BACKLIGHT_OMAP1=y
CONFIG_BACKLIGHT_DA9052=y
CONFIG_BACKLIGHT_MAX8925=y
# CONFIG_BACKLIGHT_APPLE_DWI is not set
# CONFIG_BACKLIGHT_QCOM_WLED is not set
CONFIG_BACKLIGHT_RT4831=y
CONFIG_BACKLIGHT_WM831X=y
# CONFIG_BACKLIGHT_ADP8860 is not set
CONFIG_BACKLIGHT_ADP8870=y
CONFIG_BACKLIGHT_AAT2870=y
# CONFIG_BACKLIGHT_LM3509 is not set
CONFIG_BACKLIGHT_LM3639=y
# CONFIG_BACKLIGHT_PANDORA is not set
# CONFIG_BACKLIGHT_SKY81452 is not set
CONFIG_BACKLIGHT_TPS65217=y
CONFIG_BACKLIGHT_AS3711=y
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
# CONFIG_BACKLIGHT_BD6107 is not set
CONFIG_BACKLIGHT_ARCXCNN=y
CONFIG_BACKLIGHT_RAVE_SP=y
CONFIG_BACKLIGHT_LED=y
# end of Backlight & LCD device support

CONFIG_VGASTATE=y
CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
CONFIG_LOGO_LINUX_VGA16=y
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_DRM_ACCEL is not set
CONFIG_SOUND=y
CONFIG_SOUND_OSS_CORE=y
CONFIG_SOUND_OSS_CORE_PRECLAIM=y
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_PCM_ELD=y
CONFIG_SND_PCM_IEC958=y
CONFIG_SND_DMAENGINE_PCM=y
CONFIG_SND_HWDEP=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_RAWMIDI=y
# CONFIG_SND_CORE_TEST is not set
CONFIG_SND_COMPRESS_OFFLOAD=y
CONFIG_SND_COMPRESS_ACCEL=y
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
CONFIG_SND_MIXER_OSS=y
CONFIG_SND_PCM_OSS=y
CONFIG_SND_PCM_OSS_PLUGINS=y
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_HRTIMER=y
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=y
# CONFIG_SND_VERBOSE_PROCFS is not set
CONFIG_SND_CTL_FAST_LOOKUP=y
# CONFIG_SND_DEBUG is not set
# CONFIG_SND_CTL_INPUT_VALIDATION is not set
CONFIG_SND_UTIMER=y
CONFIG_SND_VMASTER=y
CONFIG_SND_CTL_LED=y
CONFIG_SND_SEQUENCER=y
# CONFIG_SND_SEQ_DUMMY is not set
# CONFIG_SND_SEQUENCER_OSS is not set
CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
CONFIG_SND_SEQ_MIDI_EVENT=y
CONFIG_SND_SEQ_MIDI=y
CONFIG_SND_SEQ_UMP=y
CONFIG_SND_AC97_CODEC=y
# CONFIG_SND_DRIVERS is not set
CONFIG_SND_PCI=y
# CONFIG_SND_AD1889 is not set
CONFIG_SND_ATIIXP=y
CONFIG_SND_ATIIXP_MODEM=y
CONFIG_SND_AW2=y
CONFIG_SND_BT87X=y
# CONFIG_SND_BT87X_OVERCLOCK is not set
# CONFIG_SND_DARLA20 is not set
# CONFIG_SND_GINA20 is not set
CONFIG_SND_LAYLA20=y
CONFIG_SND_DARLA24=y
# CONFIG_SND_GINA24 is not set
CONFIG_SND_LAYLA24=y
# CONFIG_SND_MONA is not set
CONFIG_SND_MIA=y
CONFIG_SND_ECHO3G=y
CONFIG_SND_INDIGO=y
CONFIG_SND_INDIGOIO=y
CONFIG_SND_INDIGODJ=y
# CONFIG_SND_INDIGOIOX is not set
CONFIG_SND_INDIGODJX=y
# CONFIG_SND_HDSP is not set
CONFIG_SND_HDSPM=y
CONFIG_SND_INTEL8X0=y
# CONFIG_SND_INTEL8X0M is not set
# CONFIG_SND_KORG1212 is not set
CONFIG_SND_LOLA=y
CONFIG_SND_MIXART=y
CONFIG_SND_NM256=y
# CONFIG_SND_RME32 is not set
CONFIG_SND_RME96=y
CONFIG_SND_RME9652=y

#
# HD-Audio
#
CONFIG_SND_HDA=y
CONFIG_SND_HDA_GENERIC_LEDS=y
# CONFIG_SND_HDA_INTEL is not set
# CONFIG_SND_HDA_HWDEP is not set
CONFIG_SND_HDA_RECONFIG=y
# CONFIG_SND_HDA_INPUT_BEEP is not set
CONFIG_SND_HDA_PATCH_LOADER=y
CONFIG_SND_HDA_SCODEC_COMPONENT=y
CONFIG_SND_HDA_CODEC_REALTEK=y
CONFIG_SND_HDA_CODEC_ANALOG=y
# CONFIG_SND_HDA_CODEC_SIGMATEL is not set
CONFIG_SND_HDA_CODEC_VIA=y
CONFIG_SND_HDA_CODEC_HDMI=y
# CONFIG_SND_HDA_CODEC_CIRRUS is not set
CONFIG_SND_HDA_CODEC_CS8409=y
# CONFIG_SND_HDA_CODEC_CONEXANT is not set
CONFIG_SND_HDA_CODEC_SENARYTECH=y
CONFIG_SND_HDA_CODEC_CA0110=y
CONFIG_SND_HDA_CODEC_CA0132=y
CONFIG_SND_HDA_CODEC_CA0132_DSP=y
# CONFIG_SND_HDA_CODEC_CMEDIA is not set
# CONFIG_SND_HDA_CODEC_SI3054 is not set
CONFIG_SND_HDA_GENERIC=y
CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
# end of HD-Audio

CONFIG_SND_HDA_CORE=y
CONFIG_SND_HDA_DSP_LOADER=y
CONFIG_SND_HDA_COMPONENT=y
CONFIG_SND_HDA_I915=y
CONFIG_SND_HDA_EXT_CORE=y
CONFIG_SND_HDA_PREALLOC_SIZE=64
CONFIG_SND_INTEL_DSP_CONFIG=y
CONFIG_SND_PXA2XX_LIB=y
CONFIG_SND_USB=y
# CONFIG_SND_USB_AUDIO is not set
CONFIG_SND_USB_UA101=y
CONFIG_SND_USB_CAIAQ=y
CONFIG_SND_USB_CAIAQ_INPUT=y
CONFIG_SND_USB_US122L=y
CONFIG_SND_USB_6FIRE=y
# CONFIG_SND_USB_HIFACE is not set
CONFIG_SND_BCD2000=y
CONFIG_SND_USB_LINE6=y
CONFIG_SND_USB_POD=y
# CONFIG_SND_USB_PODHD is not set
# CONFIG_SND_USB_TONEPORT is not set
# CONFIG_SND_USB_VARIAX is not set
CONFIG_SND_SOC=y
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y
CONFIG_SND_SOC_TOPOLOGY=y
# CONFIG_SND_SOC_TOPOLOGY_BUILD is not set
CONFIG_SND_SOC_TOPOLOGY_KUNIT_TEST=y
CONFIG_SND_SOC_CARD_KUNIT_TEST=y
CONFIG_SND_SOC_UTILS_KUNIT_TEST=y
CONFIG_SND_SOC_OPS_KUNIT_TEST=y
# CONFIG_SND_SOC_ADI is not set
CONFIG_SND_SOC_AMD_ACP=y
CONFIG_SND_SOC_AMD_CZ_RT5645_MACH=y
# CONFIG_SND_AMD_ACP_CONFIG is not set
CONFIG_SND_SOC_APPLE_MCA=y
CONFIG_SND_ATMEL_SOC=y
CONFIG_SND_ATMEL_SOC_PDC=y
CONFIG_SND_ATMEL_SOC_DMA=y
CONFIG_SND_ATMEL_SOC_SSC=y
# CONFIG_SND_ATMEL_SOC_SSC_PDC is not set
CONFIG_SND_ATMEL_SOC_SSC_DMA=y
# CONFIG_SND_AT91_SOC_SAM9G20_WM8731 is not set
CONFIG_SND_ATMEL_SOC_WM8904=y
# CONFIG_SND_AT91_SOC_SAM9X5_WM8731 is not set
CONFIG_SND_ATMEL_SOC_CLASSD=y
CONFIG_SND_ATMEL_SOC_PDMIC=y
CONFIG_SND_ATMEL_SOC_I2S=y
CONFIG_SND_SOC_MIKROE_PROTO=y
# CONFIG_SND_MCHP_SOC_I2S_MCC is not set
# CONFIG_SND_MCHP_SOC_SPDIFTX is not set
# CONFIG_SND_MCHP_SOC_SPDIFRX is not set
CONFIG_SND_MCHP_SOC_PDMC=y
CONFIG_SND_BCM2835_SOC_I2S=y
# CONFIG_SND_SOC_CYGNUS is not set
# CONFIG_SND_BCM63XX_I2S_WHISTLER is not set
# CONFIG_SND_EP93XX_SOC is not set
CONFIG_SND_DESIGNWARE_I2S=y
# CONFIG_SND_DESIGNWARE_PCM is not set

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
CONFIG_SND_SOC_FSL_ASRC=y
CONFIG_SND_SOC_FSL_SAI=y
CONFIG_SND_SOC_FSL_MQS=y
CONFIG_SND_SOC_FSL_AUDMIX=y
CONFIG_SND_SOC_FSL_SSI=y
CONFIG_SND_SOC_FSL_SPDIF=y
CONFIG_SND_SOC_FSL_ESAI=y
# CONFIG_SND_SOC_FSL_MICFIL is not set
CONFIG_SND_SOC_FSL_EASRC=y
CONFIG_SND_SOC_FSL_XCVR=y
CONFIG_SND_SOC_FSL_AUD2HTX=y
CONFIG_SND_SOC_FSL_UTILS=y
# CONFIG_SND_SOC_FSL_RPMSG is not set
CONFIG_SND_SOC_FSL_LPC3XXX=y
CONFIG_SND_SOC_IMX_PCM_DMA=y
CONFIG_SND_SOC_IMX_AUDMUX=y
CONFIG_SND_IMX_SOC=y

#
# SoC Audio support for Freescale i.MX boards:
#
# CONFIG_SND_SOC_IMX_ES8328 is not set
CONFIG_SND_SOC_IMX_SGTL5000=y
# CONFIG_SND_SOC_FSL_ASOC_CARD is not set
# CONFIG_SND_SOC_IMX_AUDMIX is not set
CONFIG_SND_SOC_IMX_HDMI=y
# CONFIG_SND_SOC_IMX_RPMSG is not set
CONFIG_SND_SOC_IMX_CARD=y
# end of SoC Audio for Freescale CPUs

CONFIG_SND_SOC_CHV3_I2S=y
CONFIG_SND_I2S_HI6210_I2S=y
# CONFIG_SND_JZ4740_SOC_I2S is not set
CONFIG_SND_KIRKWOOD_SOC=y
CONFIG_SND_KIRKWOOD_SOC_ARMADA370_DB=y

#
# SoC Audio for Loongson CPUs
#
CONFIG_SND_SOC_LOONGSON_CARD=y
CONFIG_SND_SOC_LOONGSON_I2S_PCI=y
CONFIG_SND_SOC_LOONGSON_I2S_PLATFORM=y
# end of SoC Audio for Loongson CPUs

# CONFIG_SND_SOC_IMG is not set
# CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
CONFIG_SND_SOC_INTEL_KEEMBAY=y
CONFIG_SND_SOC_INTEL_AVS=y

#
# Intel AVS Machine drivers
#

#
# Available DSP configurations
#
# CONFIG_SND_SOC_INTEL_AVS_CARDNAME_OBSOLETE is not set
# CONFIG_SND_SOC_INTEL_AVS_MACH_DA7219 is not set
CONFIG_SND_SOC_INTEL_AVS_MACH_DMIC=y
CONFIG_SND_SOC_INTEL_AVS_MACH_HDAUDIO=y
CONFIG_SND_SOC_INTEL_AVS_MACH_I2S_TEST=y
CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98927=y
# CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98357A is not set
CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98373=y
CONFIG_SND_SOC_INTEL_AVS_MACH_NAU8825=y
CONFIG_SND_SOC_INTEL_AVS_MACH_PCM3168A=y
CONFIG_SND_SOC_INTEL_AVS_MACH_PROBE=y
# CONFIG_SND_SOC_INTEL_AVS_MACH_RT274 is not set
# CONFIG_SND_SOC_INTEL_AVS_MACH_RT286 is not set
CONFIG_SND_SOC_INTEL_AVS_MACH_RT298=y
CONFIG_SND_SOC_INTEL_AVS_MACH_RT5514=y
# CONFIG_SND_SOC_INTEL_AVS_MACH_RT5663 is not set
CONFIG_SND_SOC_INTEL_AVS_MACH_RT5682=y
# CONFIG_SND_SOC_INTEL_AVS_MACH_SSM4567 is not set
# end of Intel AVS Machine drivers

CONFIG_SND_SOC_MEDIATEK=y
CONFIG_SND_SOC_MT8186=y
CONFIG_SND_SOC_MT8186_MT6366=y
# CONFIG_SND_SOC_MTK_BTCVSD is not set
# CONFIG_SND_SOC_MT8188 is not set
# CONFIG_SND_SOC_MT8195 is not set
CONFIG_SND_SOC_MT8365=y
# CONFIG_SND_SOC_MT8365_MT6357 is not set

#
# ASoC support for Amlogic platforms
#
CONFIG_SND_MESON_AIU=y
CONFIG_SND_MESON_AXG_FIFO=y
CONFIG_SND_MESON_AXG_FRDDR=y
CONFIG_SND_MESON_AXG_TODDR=y
CONFIG_SND_MESON_AXG_TDM_FORMATTER=y
CONFIG_SND_MESON_AXG_TDM_INTERFACE=y
CONFIG_SND_MESON_AXG_TDMIN=y
# CONFIG_SND_MESON_AXG_TDMOUT is not set
# CONFIG_SND_MESON_AXG_SOUND_CARD is not set
CONFIG_SND_MESON_AXG_SPDIFOUT=y
CONFIG_SND_MESON_AXG_SPDIFIN=y
# CONFIG_SND_MESON_AXG_PDM is not set
CONFIG_SND_MESON_CODEC_GLUE=y
# CONFIG_SND_MESON_GX_SOUND_CARD is not set
CONFIG_SND_MESON_G12A_TOACODEC=y
CONFIG_SND_MESON_G12A_TOHDMITX=y
# CONFIG_SND_SOC_MESON_T9015 is not set
# end of ASoC support for Amlogic platforms

CONFIG_SND_MXS_SOC=y
CONFIG_SND_SOC_MXS_SGTL5000=y
CONFIG_SND_PXA2XX_SOC=y
# CONFIG_SND_SOC_QCOM is not set

#
# SoC Audio support for Renesas SoCs
#
# CONFIG_SND_SOC_SH4_FSI is not set
CONFIG_SND_SOC_RCAR=y
# CONFIG_SND_SOC_MSIOF is not set
CONFIG_SND_SOC_RZ=y
# end of SoC Audio support for Renesas SoCs

# CONFIG_SND_SOC_ROCKCHIP is not set
# CONFIG_SND_SOC_SAMSUNG is not set
CONFIG_SND_SOC_SDCA_OPTIONAL=y
# CONFIG_SND_SOC_SOF_TOPLEVEL is not set
CONFIG_SND_SOC_SPRD=y
CONFIG_SND_SOC_SPRD_MCDT=y
CONFIG_SND_SOC_STARFIVE=y
CONFIG_SND_SOC_JH7110_PWMDAC=y
CONFIG_SND_SOC_JH7110_TDM=y
CONFIG_SND_SOC_STI=y

#
# STMicroelectronics STM32 SOC audio support
#
# CONFIG_SND_SOC_STM32_SAI is not set
CONFIG_SND_SOC_STM32_I2S=y
CONFIG_SND_SOC_STM32_SPDIFRX=y
# end of STMicroelectronics STM32 SOC audio support

#
# Allwinner SoC Audio support
#
# CONFIG_SND_SUN4I_CODEC is not set
# CONFIG_SND_SUN8I_CODEC is not set
CONFIG_SND_SUN8I_CODEC_ANALOG=y
CONFIG_SND_SUN50I_CODEC_ANALOG=y
CONFIG_SND_SUN4I_I2S=y
# CONFIG_SND_SUN4I_SPDIF is not set
CONFIG_SND_SUN50I_DMIC=y
CONFIG_SND_SUN8I_ADDA_PR_REGMAP=y
# end of Allwinner SoC Audio support

CONFIG_SND_SOC_TEGRA=y
CONFIG_SND_SOC_TEGRA20_AC97=y
CONFIG_SND_SOC_TEGRA20_DAS=y
CONFIG_SND_SOC_TEGRA20_I2S=y
CONFIG_SND_SOC_TEGRA20_SPDIF=y
CONFIG_SND_SOC_TEGRA30_AHUB=y
CONFIG_SND_SOC_TEGRA30_I2S=y
# CONFIG_SND_SOC_TEGRA210_AHUB is not set
CONFIG_SND_SOC_TEGRA210_DMIC=y
CONFIG_SND_SOC_TEGRA210_I2S=y
# CONFIG_SND_SOC_TEGRA210_OPE is not set
# CONFIG_SND_SOC_TEGRA186_ASRC is not set
CONFIG_SND_SOC_TEGRA186_DSPK=y
CONFIG_SND_SOC_TEGRA210_ADMAIF=y
# CONFIG_SND_SOC_TEGRA210_MVC is not set
# CONFIG_SND_SOC_TEGRA210_SFC is not set
CONFIG_SND_SOC_TEGRA210_AMX=y
CONFIG_SND_SOC_TEGRA210_ADX=y
# CONFIG_SND_SOC_TEGRA210_MIXER is not set
CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD=y
CONFIG_SND_SOC_TEGRA_MACHINE_DRV=y
# CONFIG_SND_SOC_TEGRA_RT5631 is not set
CONFIG_SND_SOC_TEGRA_RT5640=y
# CONFIG_SND_SOC_TEGRA_WM8753 is not set
# CONFIG_SND_SOC_TEGRA_WM8903 is not set
# CONFIG_SND_SOC_TEGRA_WM9712 is not set
CONFIG_SND_SOC_TEGRA_TRIMSLICE=y
CONFIG_SND_SOC_TEGRA_ALC5632=y
CONFIG_SND_SOC_TEGRA_MAX98090=y
# CONFIG_SND_SOC_TEGRA_MAX98088 is not set
CONFIG_SND_SOC_TEGRA_RT5677=y
CONFIG_SND_SOC_TEGRA_SGTL5000=y

#
# Audio support for Texas Instruments SoCs
#
CONFIG_SND_SOC_TI_SDMA_PCM=y

#
# Texas Instruments DAI support for:
#
# CONFIG_SND_SOC_DAVINCI_ASP is not set
# CONFIG_SND_SOC_DAVINCI_MCASP is not set
CONFIG_SND_SOC_OMAP_DMIC=y
CONFIG_SND_SOC_OMAP_MCBSP=y
CONFIG_SND_SOC_OMAP_MCPDM=y

#
# Audio support for boards with Texas Instruments SoCs
#
CONFIG_SND_SOC_OMAP3_TWL4030=y
CONFIG_SND_SOC_OMAP_AMS_DELTA=y
CONFIG_SND_SOC_OMAP_HDMI=y
# CONFIG_SND_SOC_J721E_EVM is not set
# end of Audio support for Texas Instruments SoCs

CONFIG_SND_SOC_UNIPHIER=y
CONFIG_SND_SOC_UNIPHIER_AIO=y
# CONFIG_SND_SOC_UNIPHIER_LD11 is not set
# CONFIG_SND_SOC_UNIPHIER_PXS2 is not set
# CONFIG_SND_SOC_UNIPHIER_EVEA_CODEC is not set
CONFIG_SND_SOC_XILINX_I2S=y
# CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER is not set
CONFIG_SND_SOC_XILINX_SPDIF=y
CONFIG_SND_SOC_XTFPGA_I2S=y
CONFIG_SND_SOC_I2C_AND_SPI=y

#
# CODEC drivers
#
CONFIG_SND_SOC_ALL_CODECS=y
# CONFIG_SND_SOC_88PM860X is not set
CONFIG_SND_SOC_ARIZONA=y
CONFIG_SND_SOC_WM_HUBS=y
CONFIG_SND_SOC_WM_ADSP=y
# CONFIG_SND_SOC_AB8500_CODEC is not set
CONFIG_SND_SOC_AC97_CODEC=y
# CONFIG_SND_SOC_AD1836 is not set
CONFIG_SND_SOC_AD193X=y
# CONFIG_SND_SOC_AD193X_SPI is not set
CONFIG_SND_SOC_AD193X_I2C=y
CONFIG_SND_SOC_AD1980=y
CONFIG_SND_SOC_AD73311=y
CONFIG_SND_SOC_ADAU_UTILS=y
CONFIG_SND_SOC_ADAU1372=y
CONFIG_SND_SOC_ADAU1372_I2C=y
# CONFIG_SND_SOC_ADAU1372_SPI is not set
CONFIG_SND_SOC_ADAU1373=y
# CONFIG_SND_SOC_ADAU1701 is not set
CONFIG_SND_SOC_ADAU17X1=y
CONFIG_SND_SOC_ADAU1761=y
CONFIG_SND_SOC_ADAU1761_I2C=y
# CONFIG_SND_SOC_ADAU1761_SPI is not set
CONFIG_SND_SOC_ADAU1781=y
CONFIG_SND_SOC_ADAU1781_I2C=y
# CONFIG_SND_SOC_ADAU1781_SPI is not set
CONFIG_SND_SOC_ADAU1977=y
# CONFIG_SND_SOC_ADAU1977_SPI is not set
CONFIG_SND_SOC_ADAU1977_I2C=y
# CONFIG_SND_SOC_ADAU7002 is not set
CONFIG_SND_SOC_ADAU7118=y
CONFIG_SND_SOC_ADAU7118_HW=y
CONFIG_SND_SOC_ADAU7118_I2C=y
CONFIG_SND_SOC_ADAV80X=y
# CONFIG_SND_SOC_ADAV801 is not set
CONFIG_SND_SOC_ADAV803=y
CONFIG_SND_SOC_ADS117X=y
# CONFIG_SND_SOC_AK4104 is not set
CONFIG_SND_SOC_AK4118=y
CONFIG_SND_SOC_AK4375=y
CONFIG_SND_SOC_AK4458=y
CONFIG_SND_SOC_AK4535=y
# CONFIG_SND_SOC_AK4554 is not set
# CONFIG_SND_SOC_AK4613 is not set
CONFIG_SND_SOC_AK4619=y
CONFIG_SND_SOC_AK4641=y
CONFIG_SND_SOC_AK4642=y
CONFIG_SND_SOC_AK4671=y
# CONFIG_SND_SOC_AK5386 is not set
CONFIG_SND_SOC_AK5558=y
CONFIG_SND_SOC_ALC5623=y
CONFIG_SND_SOC_ALC5632=y
CONFIG_SND_SOC_AUDIO_IIO_AUX=y
CONFIG_SND_SOC_AW8738=y
CONFIG_SND_SOC_AW88395_LIB=y
CONFIG_SND_SOC_AW88395=y
CONFIG_SND_SOC_AW88166=y
CONFIG_SND_SOC_AW88261=y
# CONFIG_SND_SOC_AW88081 is not set
CONFIG_SND_SOC_AW87390=y
CONFIG_SND_SOC_AW88399=y
CONFIG_SND_SOC_BD28623=y
CONFIG_SND_SOC_BT_SCO=y
CONFIG_SND_SOC_CHV3_CODEC=y
CONFIG_SND_SOC_CPCAP=y
CONFIG_SND_SOC_CQ0093VC=y
CONFIG_SND_SOC_CROS_EC_CODEC=y
CONFIG_SND_SOC_CS_AMP_LIB=y
CONFIG_SND_SOC_CS_AMP_LIB_TEST=y
CONFIG_SND_SOC_CS35L32=y
CONFIG_SND_SOC_CS35L33=y
CONFIG_SND_SOC_CS35L34=y
CONFIG_SND_SOC_CS35L35=y
# CONFIG_SND_SOC_CS35L36 is not set
CONFIG_SND_SOC_CS35L41_LIB=y
CONFIG_SND_SOC_CS35L41=y
# CONFIG_SND_SOC_CS35L41_SPI is not set
CONFIG_SND_SOC_CS35L41_I2C=y
CONFIG_SND_SOC_CS35L45=y
# CONFIG_SND_SOC_CS35L45_SPI is not set
CONFIG_SND_SOC_CS35L45_I2C=y
CONFIG_SND_SOC_CS35L56=y
CONFIG_SND_SOC_CS35L56_SHARED=y
CONFIG_SND_SOC_CS35L56_I2C=y
# CONFIG_SND_SOC_CS35L56_SPI is not set
# CONFIG_SND_SOC_CS35L56_SDW is not set
# CONFIG_SND_SOC_CS40L50 is not set
CONFIG_SND_SOC_CS42L42_CORE=y
CONFIG_SND_SOC_CS42L42=y
# CONFIG_SND_SOC_CS42L42_SDW is not set
# CONFIG_SND_SOC_CS42L43 is not set
# CONFIG_SND_SOC_CS42L43_SDW is not set
CONFIG_SND_SOC_CS42L51=y
# CONFIG_SND_SOC_CS42L51_I2C is not set
CONFIG_SND_SOC_CS42L52=y
CONFIG_SND_SOC_CS42L56=y
CONFIG_SND_SOC_CS42L73=y
# CONFIG_SND_SOC_CS42L83 is not set
CONFIG_SND_SOC_CS42L84=y
# CONFIG_SND_SOC_CS4234 is not set
# CONFIG_SND_SOC_CS4265 is not set
# CONFIG_SND_SOC_CS4270 is not set
CONFIG_SND_SOC_CS4271=y
CONFIG_SND_SOC_CS4271_I2C=y
# CONFIG_SND_SOC_CS4271_SPI is not set
CONFIG_SND_SOC_CS42XX8=y
CONFIG_SND_SOC_CS42XX8_I2C=y
# CONFIG_SND_SOC_CS43130 is not set
CONFIG_SND_SOC_CS4341=y
# CONFIG_SND_SOC_CS4349 is not set
CONFIG_SND_SOC_CS47L15=y
CONFIG_SND_SOC_CS47L24=y
# CONFIG_SND_SOC_CS47L35 is not set
# CONFIG_SND_SOC_CS47L85 is not set
# CONFIG_SND_SOC_CS47L90 is not set
CONFIG_SND_SOC_CS47L92=y
# CONFIG_SND_SOC_CS48L32 is not set
# CONFIG_SND_SOC_CS53L30 is not set
# CONFIG_SND_SOC_CS530X_I2C is not set
CONFIG_SND_SOC_CX20442=y
CONFIG_SND_SOC_CX2072X=y
CONFIG_SND_SOC_JZ4740_CODEC=y
CONFIG_SND_SOC_JZ4725B_CODEC=y
CONFIG_SND_SOC_JZ4760_CODEC=y
CONFIG_SND_SOC_JZ4770_CODEC=y
CONFIG_SND_SOC_DA7210=y
# CONFIG_SND_SOC_DA7213 is not set
CONFIG_SND_SOC_DA7218=y
CONFIG_SND_SOC_DA7219=y
CONFIG_SND_SOC_DA732X=y
CONFIG_SND_SOC_DA9055=y
CONFIG_SND_SOC_DMIC=y
CONFIG_SND_SOC_HDMI_CODEC=y
# CONFIG_SND_SOC_ES7134 is not set
CONFIG_SND_SOC_ES7241=y
CONFIG_SND_SOC_ES8311=y
CONFIG_SND_SOC_ES8316=y
# CONFIG_SND_SOC_ES8323 is not set
CONFIG_SND_SOC_ES8326=y
CONFIG_SND_SOC_ES8328=y
CONFIG_SND_SOC_ES8328_I2C=y
# CONFIG_SND_SOC_ES8328_SPI is not set
CONFIG_SND_SOC_ES8375=y
CONFIG_SND_SOC_ES8389=y
# CONFIG_SND_SOC_FRAMER is not set
# CONFIG_SND_SOC_GTM601 is not set
CONFIG_SND_SOC_HDAC_HDMI=y
CONFIG_SND_SOC_HDAC_HDA=y
CONFIG_SND_SOC_HDA=y
CONFIG_SND_SOC_ICS43432=y
# CONFIG_SND_SOC_IDT821034 is not set
# CONFIG_SND_SOC_INNO_RK3036 is not set
CONFIG_SND_SOC_ISABELLE=y
CONFIG_SND_SOC_LM49453=y
# CONFIG_SND_SOC_LOCHNAGAR_SC is not set
CONFIG_SND_SOC_MADERA=y
CONFIG_SND_SOC_MAX98088=y
CONFIG_SND_SOC_MAX98090=y
CONFIG_SND_SOC_MAX98095=y
CONFIG_SND_SOC_MAX98357A=y
CONFIG_SND_SOC_MAX98371=y
CONFIG_SND_SOC_MAX98504=y
# CONFIG_SND_SOC_MAX9867 is not set
CONFIG_SND_SOC_MAX98925=y
CONFIG_SND_SOC_MAX98926=y
CONFIG_SND_SOC_MAX98927=y
# CONFIG_SND_SOC_MAX98520 is not set
# CONFIG_SND_SOC_MAX98363 is not set
CONFIG_SND_SOC_MAX98373=y
# CONFIG_SND_SOC_MAX98373_I2C is not set
# CONFIG_SND_SOC_MAX98373_SDW is not set
# CONFIG_SND_SOC_MAX98388 is not set
CONFIG_SND_SOC_MAX98390=y
CONFIG_SND_SOC_MAX98396=y
CONFIG_SND_SOC_MAX9850=y
# CONFIG_SND_SOC_MAX9860 is not set
CONFIG_SND_SOC_MSM8916_WCD_ANALOG=y
CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=y
# CONFIG_SND_SOC_PCM1681 is not set
CONFIG_SND_SOC_PCM1789=y
CONFIG_SND_SOC_PCM1789_I2C=y
CONFIG_SND_SOC_PCM179X=y
CONFIG_SND_SOC_PCM179X_I2C=y
# CONFIG_SND_SOC_PCM179X_SPI is not set
CONFIG_SND_SOC_PCM186X=y
CONFIG_SND_SOC_PCM186X_I2C=y
# CONFIG_SND_SOC_PCM186X_SPI is not set
CONFIG_SND_SOC_PCM3008=y
CONFIG_SND_SOC_PCM3060=y
CONFIG_SND_SOC_PCM3060_I2C=y
# CONFIG_SND_SOC_PCM3060_SPI is not set
CONFIG_SND_SOC_PCM3168A=y
CONFIG_SND_SOC_PCM3168A_I2C=y
# CONFIG_SND_SOC_PCM3168A_SPI is not set
CONFIG_SND_SOC_PCM5102A=y
CONFIG_SND_SOC_PCM512x=y
CONFIG_SND_SOC_PCM512x_I2C=y
# CONFIG_SND_SOC_PCM512x_SPI is not set
CONFIG_SND_SOC_PCM6240=y
# CONFIG_SND_SOC_PEB2466 is not set
CONFIG_SND_SOC_RK3308=y
CONFIG_SND_SOC_RK3328=y
CONFIG_SND_SOC_RK817=y
CONFIG_SND_SOC_RL6231=y
CONFIG_SND_SOC_RL6347A=y
CONFIG_SND_SOC_RT274=y
CONFIG_SND_SOC_RT286=y
CONFIG_SND_SOC_RT298=y
CONFIG_SND_SOC_RT1011=y
CONFIG_SND_SOC_RT1015=y
CONFIG_SND_SOC_RT1015P=y
CONFIG_SND_SOC_RT1016=y
# CONFIG_SND_SOC_RT1017_SDCA_SDW is not set
CONFIG_SND_SOC_RT1019=y
CONFIG_SND_SOC_RT1305=y
CONFIG_SND_SOC_RT1308=y
# CONFIG_SND_SOC_RT1308_SDW is not set
# CONFIG_SND_SOC_RT1316_SDW is not set
CONFIG_SND_SOC_RT1318=y
# CONFIG_SND_SOC_RT1318_SDW is not set
# CONFIG_SND_SOC_RT1320_SDW is not set
CONFIG_SND_SOC_RT5514=y
# CONFIG_SND_SOC_RT5616 is not set
CONFIG_SND_SOC_RT5631=y
CONFIG_SND_SOC_RT5640=y
CONFIG_SND_SOC_RT5645=y
CONFIG_SND_SOC_RT5651=y
# CONFIG_SND_SOC_RT5659 is not set
CONFIG_SND_SOC_RT5660=y
CONFIG_SND_SOC_RT5663=y
CONFIG_SND_SOC_RT5665=y
CONFIG_SND_SOC_RT5668=y
CONFIG_SND_SOC_RT5670=y
CONFIG_SND_SOC_RT5677=y
CONFIG_SND_SOC_RT5682=y
CONFIG_SND_SOC_RT5682_I2C=y
# CONFIG_SND_SOC_RT5682_SDW is not set
CONFIG_SND_SOC_RT5682S=y
# CONFIG_SND_SOC_RT700_SDW is not set
# CONFIG_SND_SOC_RT711_SDW is not set
# CONFIG_SND_SOC_RT711_SDCA_SDW is not set
# CONFIG_SND_SOC_RT712_SDCA_SDW is not set
# CONFIG_SND_SOC_RT712_SDCA_DMIC_SDW is not set
# CONFIG_SND_SOC_RT721_SDCA_SDW is not set
# CONFIG_SND_SOC_RT722_SDCA_SDW is not set
# CONFIG_SND_SOC_RT715_SDW is not set
# CONFIG_SND_SOC_RT715_SDCA_SDW is not set
CONFIG_SND_SOC_RT9120=y
CONFIG_SND_SOC_RT9123=y
# CONFIG_SND_SOC_RT9123P is not set
CONFIG_SND_SOC_RTQ9128=y
# CONFIG_SND_SOC_SDW_MOCKUP is not set
CONFIG_SND_SOC_SGTL5000=y
CONFIG_SND_SOC_SI476X=y
CONFIG_SND_SOC_SIGMADSP=y
CONFIG_SND_SOC_SIGMADSP_REGMAP=y
# CONFIG_SND_SOC_SIMPLE_AMPLIFIER is not set
# CONFIG_SND_SOC_SIMPLE_MUX is not set
CONFIG_SND_SOC_SMA1303=y
CONFIG_SND_SOC_SMA1307=y
CONFIG_SND_SOC_SPDIF=y
# CONFIG_SND_SOC_SRC4XXX_I2C is not set
CONFIG_SND_SOC_SSM2305=y
CONFIG_SND_SOC_SSM2518=y
CONFIG_SND_SOC_SSM2602=y
# CONFIG_SND_SOC_SSM2602_SPI is not set
CONFIG_SND_SOC_SSM2602_I2C=y
# CONFIG_SND_SOC_SSM3515 is not set
CONFIG_SND_SOC_SSM4567=y
# CONFIG_SND_SOC_STA32X is not set
CONFIG_SND_SOC_STA350=y
CONFIG_SND_SOC_STA529=y
CONFIG_SND_SOC_STAC9766=y
CONFIG_SND_SOC_STI_SAS=y
# CONFIG_SND_SOC_TAS2552 is not set
CONFIG_SND_SOC_TAS2562=y
# CONFIG_SND_SOC_TAS2764 is not set
CONFIG_SND_SOC_TAS2770=y
# CONFIG_SND_SOC_TAS2780 is not set
CONFIG_SND_SOC_TAS2781_COMLIB=y
CONFIG_SND_SOC_TAS2781_COMLIB_I2C=y
CONFIG_SND_SOC_TAS2781_FMWLIB=y
CONFIG_SND_SOC_TAS2781_I2C=y
CONFIG_SND_SOC_TAS5086=y
CONFIG_SND_SOC_TAS571X=y
CONFIG_SND_SOC_TAS5720=y
CONFIG_SND_SOC_TAS5805M=y
# CONFIG_SND_SOC_TAS6424 is not set
# CONFIG_SND_SOC_TDA7419 is not set
CONFIG_SND_SOC_TFA9879=y
# CONFIG_SND_SOC_TFA989X is not set
CONFIG_SND_SOC_TLV320ADC3XXX=y
CONFIG_SND_SOC_TLV320AIC23=y
CONFIG_SND_SOC_TLV320AIC23_I2C=y
# CONFIG_SND_SOC_TLV320AIC23_SPI is not set
# CONFIG_SND_SOC_TLV320AIC26 is not set
# CONFIG_SND_SOC_TLV320AIC31XX is not set
CONFIG_SND_SOC_TLV320AIC32X4=y
CONFIG_SND_SOC_TLV320AIC32X4_I2C=y
# CONFIG_SND_SOC_TLV320AIC32X4_SPI is not set
# CONFIG_SND_SOC_TLV320AIC3X_I2C is not set
# CONFIG_SND_SOC_TLV320AIC3X_SPI is not set
CONFIG_SND_SOC_TLV320DAC33=y
CONFIG_SND_SOC_TLV320ADCX140=y
CONFIG_SND_SOC_TS3A227E=y
# CONFIG_SND_SOC_TSCS42XX is not set
CONFIG_SND_SOC_TSCS454=y
CONFIG_SND_SOC_TWL4030=y
# CONFIG_SND_SOC_TWL6040 is not set
# CONFIG_SND_SOC_UDA1334 is not set
# CONFIG_SND_SOC_UDA1342 is not set
CONFIG_SND_SOC_UDA1380=y
# CONFIG_SND_SOC_WCD9335 is not set
# CONFIG_SND_SOC_WCD934X is not set
# CONFIG_SND_SOC_WCD937X_SDW is not set
# CONFIG_SND_SOC_WCD938X_SDW is not set
# CONFIG_SND_SOC_WCD939X_SDW is not set
CONFIG_SND_SOC_WL1273=y
# CONFIG_SND_SOC_WM0010 is not set
CONFIG_SND_SOC_WM1250_EV1=y
CONFIG_SND_SOC_WM2000=y
CONFIG_SND_SOC_WM2200=y
CONFIG_SND_SOC_WM5100=y
CONFIG_SND_SOC_WM5102=y
# CONFIG_SND_SOC_WM5110 is not set
# CONFIG_SND_SOC_WM8350 is not set
# CONFIG_SND_SOC_WM8400 is not set
CONFIG_SND_SOC_WM8510=y
CONFIG_SND_SOC_WM8523=y
CONFIG_SND_SOC_WM8524=y
# CONFIG_SND_SOC_WM8580 is not set
# CONFIG_SND_SOC_WM8711 is not set
CONFIG_SND_SOC_WM8727=y
# CONFIG_SND_SOC_WM8728 is not set
CONFIG_SND_SOC_WM8731=y
# CONFIG_SND_SOC_WM8731_I2C is not set
# CONFIG_SND_SOC_WM8731_SPI is not set
CONFIG_SND_SOC_WM8737=y
CONFIG_SND_SOC_WM8741=y
CONFIG_SND_SOC_WM8750=y
CONFIG_SND_SOC_WM8753=y
# CONFIG_SND_SOC_WM8770 is not set
# CONFIG_SND_SOC_WM8776 is not set
CONFIG_SND_SOC_WM8782=y
CONFIG_SND_SOC_WM8804=y
CONFIG_SND_SOC_WM8804_I2C=y
# CONFIG_SND_SOC_WM8804_SPI is not set
CONFIG_SND_SOC_WM8900=y
CONFIG_SND_SOC_WM8903=y
CONFIG_SND_SOC_WM8904=y
CONFIG_SND_SOC_WM8940=y
CONFIG_SND_SOC_WM8955=y
CONFIG_SND_SOC_WM8960=y
CONFIG_SND_SOC_WM8961=y
CONFIG_SND_SOC_WM8962=y
CONFIG_SND_SOC_WM8971=y
CONFIG_SND_SOC_WM8974=y
CONFIG_SND_SOC_WM8978=y
CONFIG_SND_SOC_WM8983=y
CONFIG_SND_SOC_WM8985=y
CONFIG_SND_SOC_WM8988=y
CONFIG_SND_SOC_WM8990=y
CONFIG_SND_SOC_WM8991=y
CONFIG_SND_SOC_WM8993=y
CONFIG_SND_SOC_WM8994=y
CONFIG_SND_SOC_WM8995=y
CONFIG_SND_SOC_WM8996=y
CONFIG_SND_SOC_WM8997=y
CONFIG_SND_SOC_WM8998=y
CONFIG_SND_SOC_WM9081=y
CONFIG_SND_SOC_WM9090=y
CONFIG_SND_SOC_WM9705=y
CONFIG_SND_SOC_WM9712=y
CONFIG_SND_SOC_WM9713=y
# CONFIG_SND_SOC_WSA881X is not set
# CONFIG_SND_SOC_WSA883X is not set
# CONFIG_SND_SOC_WSA884X is not set
# CONFIG_SND_SOC_ZL38060 is not set
CONFIG_SND_SOC_LM4857=y
CONFIG_SND_SOC_MAX9759=y
CONFIG_SND_SOC_MAX9768=y
CONFIG_SND_SOC_MAX9877=y
CONFIG_SND_SOC_MC13783=y
CONFIG_SND_SOC_ML26124=y
# CONFIG_SND_SOC_MT6351 is not set
CONFIG_SND_SOC_MT6357=y
CONFIG_SND_SOC_MT6358=y
CONFIG_SND_SOC_MT6359=y
# CONFIG_SND_SOC_MT6359_ACCDET is not set
CONFIG_SND_SOC_MT6660=y
CONFIG_SND_SOC_NAU8315=y
# CONFIG_SND_SOC_NAU8540 is not set
CONFIG_SND_SOC_NAU8810=y
CONFIG_SND_SOC_NAU8821=y
CONFIG_SND_SOC_NAU8822=y
# CONFIG_SND_SOC_NAU8824 is not set
CONFIG_SND_SOC_NAU8825=y
CONFIG_SND_SOC_NTPFW=y
CONFIG_SND_SOC_NTP8918=y
CONFIG_SND_SOC_NTP8835=y
# CONFIG_SND_SOC_TPA6130A2 is not set
CONFIG_SND_SOC_LPASS_MACRO_COMMON=y
CONFIG_SND_SOC_LPASS_WSA_MACRO=y
CONFIG_SND_SOC_LPASS_VA_MACRO=y
CONFIG_SND_SOC_LPASS_RX_MACRO=y
CONFIG_SND_SOC_LPASS_TX_MACRO=y
# end of CODEC drivers

CONFIG_SND_SIMPLE_CARD_UTILS=y
CONFIG_SND_SIMPLE_CARD=y
CONFIG_SND_AUDIO_GRAPH_CARD=y
# CONFIG_SND_AUDIO_GRAPH_CARD2 is not set
CONFIG_SND_TEST_COMPONENT=y
CONFIG_SND_VIRTIO=y
CONFIG_AC97_BUS=y
# CONFIG_HID_SUPPORT is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
CONFIG_USB_ULPI_BUS=y
CONFIG_USB_CONN_GPIO=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_PCI is not set
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
CONFIG_USB_OTG=y
# CONFIG_USB_OTG_PRODUCTLIST is not set
CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB=y
# CONFIG_USB_OTG_FSM is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_DEFAULT_AUTHORIZATION_MODE=1
# CONFIG_USB_MON is not set

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PLATFORM=y
CONFIG_USB_XHCI_HISTB=y
CONFIG_USB_XHCI_MTK=y
CONFIG_USB_XHCI_MVEBU=y
CONFIG_USB_XHCI_RCAR=y
CONFIG_USB_XHCI_RZV2M=y
# CONFIG_USB_XHCI_SIDEBAND is not set
CONFIG_USB_BRCMSTB=y
# CONFIG_USB_EHCI_HCD is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
CONFIG_USB_OHCI_HCD=y
# CONFIG_USB_OHCI_HCD_SPEAR is not set
CONFIG_USB_OHCI_HCD_STI=y
# CONFIG_USB_OHCI_HCD_S3C2410 is not set
CONFIG_USB_OHCI_HCD_LPC32XX=y
CONFIG_USB_OHCI_HCD_AT91=y
# CONFIG_USB_OHCI_HCD_OMAP3 is not set
CONFIG_USB_OHCI_HCD_DAVINCI=y
# CONFIG_USB_OHCI_HCD_SSB is not set
CONFIG_USB_OHCI_EXYNOS=y
CONFIG_USB_OHCI_HCD_PLATFORM=y
# CONFIG_USB_SL811_HCD is not set
CONFIG_USB_R8A66597_HCD=y
CONFIG_USB_HCD_BCMA=y
# CONFIG_USB_HCD_SSB is not set
CONFIG_USB_HCD_TEST_MODE=y
# CONFIG_USB_RENESAS_USBHS is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=y
CONFIG_USB_WDM=y
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed; see USB_STORAGE Help for more info
#
# CONFIG_USB_STORAGE is not set

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
CONFIG_USB_MICROTEK=y

#
# USB dual-mode controller drivers
#
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_FOTG210 is not set
CONFIG_USB_MTU3=y
# CONFIG_USB_MTU3_HOST is not set
# CONFIG_USB_MTU3_GADGET is not set
CONFIG_USB_MTU3_DUAL_ROLE=y
# CONFIG_USB_MTU3_DEBUG is not set
CONFIG_USB_MUSB_HDRC=y
# CONFIG_USB_MUSB_HOST is not set
# CONFIG_USB_MUSB_GADGET is not set
CONFIG_USB_MUSB_DUAL_ROLE=y

#
# Platform Glue Layer
#
# CONFIG_USB_MUSB_TUSB6010 is not set
CONFIG_USB_MUSB_DSPS=y
CONFIG_USB_MUSB_UX500=y
CONFIG_USB_MUSB_MEDIATEK=y
# CONFIG_USB_MUSB_POLARFIRE_SOC is not set

#
# MUSB DMA mode
#
# CONFIG_MUSB_PIO_ONLY is not set
# CONFIG_USB_UX500_DMA is not set
CONFIG_USB_INVENTRA_DMA=y
# CONFIG_USB_DWC3 is not set
CONFIG_USB_DWC2=y
CONFIG_USB_DWC2_HOST=y

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
# CONFIG_USB_DWC2_PERIPHERAL is not set
# CONFIG_USB_DWC2_DUAL_ROLE is not set
CONFIG_USB_DWC2_DEBUG=y
CONFIG_USB_DWC2_VERBOSE=y
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
CONFIG_USB_DWC2_DEBUG_PERIODIC=y
CONFIG_USB_CHIPIDEA=y
CONFIG_USB_CHIPIDEA_UDC=y
CONFIG_USB_CHIPIDEA_MSM=y
CONFIG_USB_CHIPIDEA_NPCM=y
CONFIG_USB_CHIPIDEA_IMX=y
CONFIG_USB_CHIPIDEA_GENERIC=y
CONFIG_USB_CHIPIDEA_TEGRA=y
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1761_UDC=y
# CONFIG_USB_ISP1760_HOST_ROLE is not set
CONFIG_USB_ISP1760_GADGET_ROLE=y
# CONFIG_USB_ISP1760_DUAL_ROLE is not set

#
# USB port drivers
#
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
# CONFIG_USB_SERIAL_GENERIC is not set
CONFIG_USB_SERIAL_SIMPLE=y
CONFIG_USB_SERIAL_AIRCABLE=y
CONFIG_USB_SERIAL_ARK3116=y
CONFIG_USB_SERIAL_BELKIN=y
CONFIG_USB_SERIAL_CH341=y
CONFIG_USB_SERIAL_WHITEHEAT=y
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
CONFIG_USB_SERIAL_CP210X=y
CONFIG_USB_SERIAL_CYPRESS_M8=y
CONFIG_USB_SERIAL_EMPEG=y
CONFIG_USB_SERIAL_FTDI_SIO=y
CONFIG_USB_SERIAL_VISOR=y
# CONFIG_USB_SERIAL_IPAQ is not set
CONFIG_USB_SERIAL_IR=y
# CONFIG_USB_SERIAL_EDGEPORT is not set
CONFIG_USB_SERIAL_EDGEPORT_TI=y
CONFIG_USB_SERIAL_F81232=y
# CONFIG_USB_SERIAL_F8153X is not set
# CONFIG_USB_SERIAL_GARMIN is not set
# CONFIG_USB_SERIAL_IPW is not set
CONFIG_USB_SERIAL_IUU=y
CONFIG_USB_SERIAL_KEYSPAN_PDA=y
# CONFIG_USB_SERIAL_KEYSPAN is not set
CONFIG_USB_SERIAL_KLSI=y
CONFIG_USB_SERIAL_KOBIL_SCT=y
CONFIG_USB_SERIAL_MCT_U232=y
CONFIG_USB_SERIAL_METRO=y
CONFIG_USB_SERIAL_MOS7720=y
CONFIG_USB_SERIAL_MOS7840=y
# CONFIG_USB_SERIAL_MXUPORT is not set
CONFIG_USB_SERIAL_NAVMAN=y
CONFIG_USB_SERIAL_PL2303=y
# CONFIG_USB_SERIAL_OTI6858 is not set
# CONFIG_USB_SERIAL_QCAUX is not set
CONFIG_USB_SERIAL_QUALCOMM=y
CONFIG_USB_SERIAL_SPCP8X5=y
CONFIG_USB_SERIAL_SAFE=y
CONFIG_USB_SERIAL_SAFE_PADDED=y
CONFIG_USB_SERIAL_SIERRAWIRELESS=y
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
CONFIG_USB_SERIAL_CYBERJACK=y
CONFIG_USB_SERIAL_WWAN=y
CONFIG_USB_SERIAL_OPTION=y
CONFIG_USB_SERIAL_OMNINET=y
# CONFIG_USB_SERIAL_OPTICON is not set
CONFIG_USB_SERIAL_XSENS_MT=y
CONFIG_USB_SERIAL_WISHBONE=y
CONFIG_USB_SERIAL_SSU100=y
CONFIG_USB_SERIAL_QT2=y
CONFIG_USB_SERIAL_UPD78F0730=y
CONFIG_USB_SERIAL_XR=y
CONFIG_USB_SERIAL_DEBUG=y

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
CONFIG_USB_EMI26=y
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
CONFIG_USB_LEGOTOWER=y
# CONFIG_USB_LCD is not set
CONFIG_USB_CYPRESS_CY7C63=y
# CONFIG_USB_CYTHERM is not set
CONFIG_USB_IDMOUSE=y
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_USB_QCOM_EUD is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
CONFIG_USB_SISUSBVGA=y
CONFIG_USB_LD=y
CONFIG_USB_TRANCEVIBRATOR=y
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
CONFIG_USB_EZUSB_FX2=y
CONFIG_USB_HUB_USB251XB=y
CONFIG_USB_HSIC_USB3503=y
CONFIG_USB_HSIC_USB4604=y
CONFIG_USB_LINK_LAYER_TEST=y
CONFIG_USB_CHAOSKEY=y
# CONFIG_BRCM_USB_PINMAP is not set
CONFIG_USB_ONBOARD_DEV=y
CONFIG_USB_ONBOARD_DEV_USB5744=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_KEYSTONE_USB_PHY=y
CONFIG_NOP_USB_XCEIV=y
CONFIG_AM335X_CONTROL_USB=y
CONFIG_AM335X_PHY_USB=y
CONFIG_TAHVO_USB=y
CONFIG_TAHVO_USB_HOST_BY_DEFAULT=y
CONFIG_USB_ISP1301=y
CONFIG_USB_TEGRA_PHY=y
CONFIG_USB_ULPI=y
CONFIG_USB_ULPI_VIEWPORT=y
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=y
CONFIG_USB_GADGET_DEBUG_FILES=y
CONFIG_USB_GADGET_DEBUG_FS=y
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
CONFIG_U_SERIAL_CONSOLE=y

#
# USB Peripheral Controller
#
CONFIG_USB_LPC32XX=y
CONFIG_USB_GR_UDC=y
# CONFIG_USB_R8A66597 is not set
CONFIG_USB_RZV2M_USB3DRD=y
CONFIG_USB_RENESAS_USB3=y
# CONFIG_USB_RENESAS_USBF is not set
CONFIG_USB_PXA27X=y
# CONFIG_USB_SNP_UDC_PLAT is not set
CONFIG_USB_M66592=y
# CONFIG_USB_BDC_UDC is not set
# CONFIG_USB_GADGET_XILINX is not set
CONFIG_USB_ASPEED_UDC=y
# CONFIG_USB_ASPEED_VHUB is not set
CONFIG_USB_DUMMY_HCD=y
# end of USB Peripheral Controller

CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_F_SS_LB=y
CONFIG_USB_U_SERIAL=y
CONFIG_USB_U_AUDIO=y
CONFIG_USB_F_SERIAL=y
CONFIG_USB_F_OBEX=y
CONFIG_USB_F_MASS_STORAGE=y
CONFIG_USB_F_FS=y
CONFIG_USB_F_UAC1=y
CONFIG_USB_F_MIDI=y
CONFIG_USB_F_HID=y
# CONFIG_USB_CONFIGFS is not set

#
# USB Gadget precomposed configurations
#
CONFIG_USB_ZERO=y
# CONFIG_USB_ZERO_HNPTEST is not set
CONFIG_USB_AUDIO=y
CONFIG_GADGET_UAC1=y
# CONFIG_GADGET_UAC1_LEGACY is not set
CONFIG_USB_GADGETFS=y
CONFIG_USB_FUNCTIONFS=y
CONFIG_USB_FUNCTIONFS_GENERIC=y
# CONFIG_USB_MASS_STORAGE is not set
CONFIG_USB_G_SERIAL=y
CONFIG_USB_MIDI_GADGET=y
# CONFIG_USB_G_PRINTER is not set
CONFIG_USB_G_ACM_MS=y
CONFIG_USB_G_HID=y
# CONFIG_USB_G_DBGP is not set
CONFIG_USB_RAW_GADGET=y
# end of USB Gadget precomposed configurations

CONFIG_TYPEC=y
CONFIG_TYPEC_TCPM=y
# CONFIG_TYPEC_TCPCI is not set
CONFIG_TYPEC_FUSB302=y
CONFIG_TYPEC_QCOM_PMIC=y
CONFIG_TYPEC_UCSI=y
CONFIG_UCSI_CCG=y
# CONFIG_UCSI_STM32G0 is not set
# CONFIG_UCSI_LENOVO_YOGA_C630 is not set
# CONFIG_TYPEC_TPS6598X is not set
# CONFIG_TYPEC_ANX7411 is not set
CONFIG_TYPEC_RT1719=y
CONFIG_TYPEC_HD3SS3220=y
CONFIG_TYPEC_STUSB160X=y
CONFIG_TYPEC_WUSB3801=y

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
CONFIG_TYPEC_MUX_FSA4480=y
CONFIG_TYPEC_MUX_GPIO_SBU=y
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
CONFIG_TYPEC_MUX_IT5205=y
CONFIG_TYPEC_MUX_NB7VPQ904M=y
# CONFIG_TYPEC_MUX_PS883X is not set
# CONFIG_TYPEC_MUX_PTN36502 is not set
CONFIG_TYPEC_MUX_TUSB1046=y
# CONFIG_TYPEC_MUX_WCD939X_USBSS is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
CONFIG_TYPEC_DP_ALTMODE=y
CONFIG_TYPEC_NVIDIA_ALTMODE=y
CONFIG_TYPEC_TBT_ALTMODE=y
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=y
CONFIG_PWRSEQ_EMMC=y
# CONFIG_PWRSEQ_SIMPLE is not set
CONFIG_MMC_BLOCK=y
CONFIG_MMC_BLOCK_MINORS=8
# CONFIG_SDIO_UART is not set
CONFIG_MMC_TEST=y
# CONFIG_MMC_CRYPTO is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SUNPLUS=y
# CONFIG_MMC_SDHCI is not set
CONFIG_MMC_MESON_GX=y
CONFIG_MMC_MESON_MX_SDHC=y
# CONFIG_MMC_MESON_MX_SDIO is not set
CONFIG_MMC_MOXART=y
CONFIG_MMC_OMAP_HS=y
CONFIG_MMC_TIFM_SD=y
# CONFIG_MMC_DAVINCI is not set
CONFIG_MMC_TMIO_CORE=y
# CONFIG_MMC_SDHI is not set
CONFIG_MMC_UNIPHIER=y
CONFIG_MMC_CB710=y
# CONFIG_MMC_VIA_SDMMC is not set
CONFIG_MMC_DW=y
CONFIG_MMC_DW_PLTFM=y
CONFIG_MMC_DW_BLUEFIELD=y
# CONFIG_MMC_DW_EXYNOS is not set
CONFIG_MMC_DW_HI3798CV200=y
CONFIG_MMC_DW_HI3798MV200=y
CONFIG_MMC_DW_K3=y
CONFIG_MMC_DW_PCI=y
# CONFIG_MMC_SH_MMCIF is not set
CONFIG_MMC_VUB300=y
CONFIG_MMC_USHC=y
CONFIG_MMC_USDHI6ROL0=y
CONFIG_MMC_REALTEK_USB=y
CONFIG_MMC_CQHCI=y
CONFIG_MMC_HSQ=y
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_BCM2835 is not set
CONFIG_MMC_MTK=y
CONFIG_MMC_OWL=y
CONFIG_MMC_LITEX=y
CONFIG_SCSI_UFSHCD=y
CONFIG_SCSI_UFS_BSG=y
CONFIG_SCSI_UFS_CRYPTO=y
# CONFIG_SCSI_UFS_HWMON is not set
CONFIG_SCSI_UFSHCD_PCI=y
CONFIG_SCSI_UFS_DWC_TC_PCI=y
# CONFIG_SCSI_UFSHCD_PLATFORM is not set
# CONFIG_SCSI_UFS_TI_J721E is not set
CONFIG_MEMSTICK=y
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y
CONFIG_MSPRO_BLOCK=y
# CONFIG_MS_BLOCK is not set

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
CONFIG_MEMSTICK_JMICRON_38X=y
CONFIG_MEMSTICK_R592=y
CONFIG_MEMSTICK_REALTEK_USB=y
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
CONFIG_LEDS_CLASS_MULTICOLOR=y
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y
CONFIG_LEDS_KUNIT_TEST=y

#
# LED drivers
#
# CONFIG_LEDS_AN30259A is not set
# CONFIG_LEDS_ARIEL is not set
CONFIG_LEDS_AW200XX=y
CONFIG_LEDS_AW2013=y
CONFIG_LEDS_BCM6328=y
CONFIG_LEDS_BCM6358=y
CONFIG_LEDS_TURRIS_OMNIA=y
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3532=y
# CONFIG_LEDS_LM3533 is not set
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_LM3692X=y
# CONFIG_LEDS_COBALT_QUBE is not set
# CONFIG_LEDS_COBALT_RAQ is not set
CONFIG_LEDS_SUN50I_A100=y
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=y
CONFIG_LEDS_LP3952=y
CONFIG_LEDS_LP50XX=y
CONFIG_LEDS_LP55XX_COMMON=y
# CONFIG_LEDS_LP5521 is not set
# CONFIG_LEDS_LP5523 is not set
CONFIG_LEDS_LP5562=y
# CONFIG_LEDS_LP5569 is not set
CONFIG_LEDS_LP8501=y
CONFIG_LEDS_LP8860=y
CONFIG_LEDS_LP8864=y
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
CONFIG_LEDS_PCA995X=y
# CONFIG_LEDS_QNAP_MCU is not set
# CONFIG_LEDS_WM831X_STATUS is not set
# CONFIG_LEDS_DA9052 is not set
CONFIG_LEDS_REGULATOR=y
CONFIG_LEDS_BD2606MVV=y
CONFIG_LEDS_BD2802=y
CONFIG_LEDS_LT3593=y
# CONFIG_LEDS_MAX5970 is not set
CONFIG_LEDS_MC13783=y
CONFIG_LEDS_NS2=y
CONFIG_LEDS_NETXBIG=y
CONFIG_LEDS_TCA6507=y
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_MAX77650=y
CONFIG_LEDS_MAX8997=y
CONFIG_LEDS_LM355x=y
CONFIG_LEDS_MENF21BMC=y
# CONFIG_LEDS_IS31FL319X is not set
CONFIG_LEDS_IS31FL32XX=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
# CONFIG_LEDS_BLINKM_MULTICOLOR is not set
# CONFIG_LEDS_SYSCON is not set
# CONFIG_LEDS_PM8058 is not set
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM3697=y
# CONFIG_LEDS_LM36274 is not set
CONFIG_LEDS_ST1202=y
# CONFIG_LEDS_IP30 is not set
CONFIG_LEDS_ACER_A500=y
# CONFIG_LEDS_BCM63138 is not set
CONFIG_LEDS_LGM=y

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AAT1290=y
CONFIG_LEDS_AS3645A=y
# CONFIG_LEDS_KTD2692 is not set
# CONFIG_LEDS_LM3601X is not set
# CONFIG_LEDS_MAX77693 is not set
CONFIG_LEDS_MT6360=y
CONFIG_LEDS_QCOM_FLASH=y
# CONFIG_LEDS_RT4505 is not set
# CONFIG_LEDS_RT8515 is not set
CONFIG_LEDS_SGM3140=y
CONFIG_LEDS_SY7802=y
# CONFIG_LEDS_TPS6131X is not set

#
# RGB LED drivers
#
# CONFIG_LEDS_GROUP_MULTICOLOR is not set
# CONFIG_LEDS_KTD202X is not set
CONFIG_LEDS_NCP5623=y

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=y
# CONFIG_LEDS_TRIGGER_DISK is not set
# CONFIG_LEDS_TRIGGER_MTD is not set
# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
# CONFIG_LEDS_TRIGGER_CPU is not set
CONFIG_LEDS_TRIGGER_ACTIVITY=y
CONFIG_LEDS_TRIGGER_GPIO=y
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
# CONFIG_LEDS_TRIGGER_CAMERA is not set
CONFIG_LEDS_TRIGGER_PANIC=y
CONFIG_LEDS_TRIGGER_PATTERN=y
CONFIG_LEDS_TRIGGER_TTY=y
CONFIG_LEDS_TRIGGER_INPUT_EVENTS=y

#
# Simatic LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
# CONFIG_UDMABUF is not set
CONFIG_DMABUF_MOVE_NOTIFY=y
CONFIG_DMABUF_DEBUG=y
CONFIG_DMABUF_SELFTESTS=y
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_UIO=y
CONFIG_UIO_CIF=y
# CONFIG_UIO_PDRV_GENIRQ is not set
CONFIG_UIO_DMEM_GENIRQ=y
# CONFIG_UIO_AEC is not set
# CONFIG_UIO_SERCOS3 is not set
# CONFIG_UIO_PCI_GENERIC is not set
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_MF624 is not set
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_ADMIN_LEGACY=y
# CONFIG_VIRTIO_PCI_LEGACY is not set
CONFIG_VIRTIO_BALLOON=y
# CONFIG_VIRTIO_INPUT is not set
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DEBUG=y
# CONFIG_VIRTIO_RTC is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=y
CONFIG_GREYBUS_BEAGLEPLAY=y
CONFIG_GREYBUS_ES2=y
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_GOLDFISH is not set
CONFIG_CHROME_PLATFORMS=y
CONFIG_CHROMEOS_OF_HW_PROBER=y
CONFIG_CROS_EC=y
CONFIG_CROS_EC_I2C=y
CONFIG_CROS_EC_RPMSG=y
CONFIG_CROS_EC_PROTO=y
CONFIG_CROS_KUNIT_EC_PROTO_TEST=y
CONFIG_CZNIC_PLATFORMS=y
CONFIG_TURRIS_OMNIA_MCU=y
CONFIG_TURRIS_OMNIA_MCU_GPIO=y
# CONFIG_TURRIS_OMNIA_MCU_WATCHDOG is not set
# CONFIG_TURRIS_OMNIA_MCU_TRNG is not set
CONFIG_TURRIS_OMNIA_MCU_KEYCTL=y
CONFIG_TURRIS_SIGNING_KEY=y
# CONFIG_MELLANOX_PLATFORM is not set
# CONFIG_OLPC_XO175 is not set
CONFIG_SURFACE_PLATFORMS=y
CONFIG_ARM64_PLATFORM_DEVICES=y
CONFIG_EC_ACER_ASPIRE1=y
# CONFIG_EC_HUAWEI_GAOKUN is not set
CONFIG_EC_LENOVO_YOGA_C630=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=y

#
# Clock driver for ARM Reference designs
#
# CONFIG_CLK_ICST is not set
# CONFIG_CLK_SP810 is not set
# end of Clock driver for ARM Reference designs

# CONFIG_CLK_HSDK is not set
# CONFIG_COMMON_CLK_APPLE_NCO is not set
# CONFIG_COMMON_CLK_MAX77686 is not set
CONFIG_COMMON_CLK_MAX9485=y
CONFIG_COMMON_CLK_RK808=y
CONFIG_COMMON_CLK_HI655X=y
CONFIG_COMMON_CLK_SCMI=y
CONFIG_COMMON_CLK_SCPI=y
CONFIG_COMMON_CLK_SI5341=y
CONFIG_COMMON_CLK_SI5351=y
CONFIG_COMMON_CLK_SI514=y
CONFIG_COMMON_CLK_SI544=y
CONFIG_COMMON_CLK_SI570=y
# CONFIG_COMMON_CLK_BM1880 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
CONFIG_COMMON_CLK_TPS68470=y
CONFIG_COMMON_CLK_CDCE925=y
CONFIG_COMMON_CLK_CS2000_CP=y
# CONFIG_COMMON_CLK_EN7523 is not set
# CONFIG_COMMON_CLK_EP93XX is not set
CONFIG_COMMON_CLK_EYEQ=y
# CONFIG_COMMON_CLK_FSL_FLEXSPI is not set
# CONFIG_COMMON_CLK_FSL_SAI is not set
CONFIG_COMMON_CLK_GEMINI=y
CONFIG_COMMON_CLK_LAN966X=y
# CONFIG_COMMON_CLK_ASPEED is not set
# CONFIG_COMMON_CLK_S2MPS11 is not set
# CONFIG_CLK_TWL is not set
CONFIG_COMMON_CLK_AXI_CLKGEN=y
CONFIG_CLK_QORIQ=y
# CONFIG_CLK_LS1028A_PLLDIG is not set
# CONFIG_COMMON_CLK_XGENE is not set
# CONFIG_COMMON_CLK_LOCHNAGAR is not set
# CONFIG_COMMON_CLK_NPCM8XX is not set
# CONFIG_COMMON_CLK_LOONGSON2 is not set
# CONFIG_COMMON_CLK_PALMAS is not set
CONFIG_COMMON_CLK_RS9_PCIE=y
# CONFIG_COMMON_CLK_SI521XX is not set
# CONFIG_COMMON_CLK_VC3 is not set
CONFIG_COMMON_CLK_VC5=y
# CONFIG_COMMON_CLK_VC7 is not set
CONFIG_COMMON_CLK_MMP2_AUDIO=y
CONFIG_COMMON_CLK_BD718XX=y
# CONFIG_COMMON_CLK_FIXED_MMIO is not set
# CONFIG_COMMON_CLK_SP7021 is not set
# CONFIG_CLK_ACTIONS is not set
# CONFIG_CLK_BAIKAL_T1 is not set
# CONFIG_CLK_BCM2711_DVP is not set
CONFIG_CLK_BCM2835=y
# CONFIG_CLK_BCM_63XX is not set
CONFIG_CLK_BCM_63XX_GATE=y
CONFIG_CLK_BCM63268_TIMER=y
# CONFIG_CLK_BCM_KONA is not set
CONFIG_COMMON_CLK_IPROC=y
CONFIG_CLK_BCM_CYGNUS=y
CONFIG_CLK_BCM_HR2=y
# CONFIG_CLK_BCM_NSP is not set
CONFIG_CLK_BCM_NS2=y
# CONFIG_CLK_BCM_SR is not set
CONFIG_CLK_RASPBERRYPI=y
CONFIG_COMMON_CLK_HI3516CV300=y
CONFIG_COMMON_CLK_HI3519=y
# CONFIG_COMMON_CLK_HI3559A is not set
CONFIG_COMMON_CLK_HI3660=y
# CONFIG_COMMON_CLK_HI3670 is not set
# CONFIG_COMMON_CLK_HI3798CV200 is not set
# CONFIG_COMMON_CLK_HI6220 is not set
CONFIG_RESET_HISI=y
CONFIG_STUB_CLK_HI3660=y
CONFIG_COMMON_CLK_BOSTON=y
CONFIG_MXC_CLK=y
CONFIG_CLK_IMX8MM=y
CONFIG_CLK_IMX8MN=y
CONFIG_CLK_IMX8MP=y
# CONFIG_CLK_IMX8MQ is not set
CONFIG_CLK_IMX8ULP=y
# CONFIG_CLK_IMX93 is not set
CONFIG_CLK_IMX95_BLK_CTL=y
CONFIG_CLK_IMXRT1050=y

#
# Ingenic SoCs drivers
#
CONFIG_INGENIC_CGU_COMMON=y
# CONFIG_INGENIC_CGU_JZ4740 is not set
CONFIG_INGENIC_CGU_JZ4755=y
CONFIG_INGENIC_CGU_JZ4725B=y
# CONFIG_INGENIC_CGU_JZ4760 is not set
# CONFIG_INGENIC_CGU_JZ4770 is not set
CONFIG_INGENIC_CGU_JZ4780=y
# CONFIG_INGENIC_CGU_X1000 is not set
CONFIG_INGENIC_CGU_X1830=y
CONFIG_INGENIC_TCU_CLK=y
# end of Ingenic SoCs drivers

CONFIG_COMMON_CLK_KEYSTONE=y
CONFIG_TI_SCI_CLK=y
CONFIG_TI_SCI_CLK_PROBE_FROM_FW=y
# CONFIG_TI_SYSCON_CLK is not set

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
CONFIG_COMMON_CLK_MEDIATEK_FHCTL=y
CONFIG_COMMON_CLK_MT2701=y
# CONFIG_COMMON_CLK_MT2701_MMSYS is not set
CONFIG_COMMON_CLK_MT2701_IMGSYS=y
# CONFIG_COMMON_CLK_MT2701_VDECSYS is not set
# CONFIG_COMMON_CLK_MT2701_HIFSYS is not set
CONFIG_COMMON_CLK_MT2701_ETHSYS=y
# CONFIG_COMMON_CLK_MT2701_BDPSYS is not set
# CONFIG_COMMON_CLK_MT2701_AUDSYS is not set
# CONFIG_COMMON_CLK_MT2701_G3DSYS is not set
CONFIG_COMMON_CLK_MT2712=y
CONFIG_COMMON_CLK_MT2712_BDPSYS=y
CONFIG_COMMON_CLK_MT2712_IMGSYS=y
# CONFIG_COMMON_CLK_MT2712_JPGDECSYS is not set
CONFIG_COMMON_CLK_MT2712_MFGCFG=y
# CONFIG_COMMON_CLK_MT2712_MMSYS is not set
# CONFIG_COMMON_CLK_MT2712_VDECSYS is not set
CONFIG_COMMON_CLK_MT2712_VENCSYS=y
CONFIG_COMMON_CLK_MT6735=y
CONFIG_COMMON_CLK_MT6735_IMGSYS=y
# CONFIG_COMMON_CLK_MT6735_MFGCFG is not set
CONFIG_COMMON_CLK_MT6735_VDECSYS=y
# CONFIG_COMMON_CLK_MT6735_VENCSYS is not set
CONFIG_COMMON_CLK_MT6765=y
CONFIG_COMMON_CLK_MT6765_AUDIOSYS=y
CONFIG_COMMON_CLK_MT6765_CAMSYS=y
# CONFIG_COMMON_CLK_MT6765_GCESYS is not set
CONFIG_COMMON_CLK_MT6765_MMSYS=y
# CONFIG_COMMON_CLK_MT6765_IMGSYS is not set
CONFIG_COMMON_CLK_MT6765_VCODECSYS=y
CONFIG_COMMON_CLK_MT6765_MFGSYS=y
CONFIG_COMMON_CLK_MT6765_MIPI0ASYS=y
# CONFIG_COMMON_CLK_MT6765_MIPI0BSYS is not set
# CONFIG_COMMON_CLK_MT6765_MIPI1ASYS is not set
# CONFIG_COMMON_CLK_MT6765_MIPI1BSYS is not set
# CONFIG_COMMON_CLK_MT6765_MIPI2ASYS is not set
CONFIG_COMMON_CLK_MT6765_MIPI2BSYS=y
CONFIG_COMMON_CLK_MT6779=y
# CONFIG_COMMON_CLK_MT6779_MMSYS is not set
# CONFIG_COMMON_CLK_MT6779_IMGSYS is not set
CONFIG_COMMON_CLK_MT6779_IPESYS=y
CONFIG_COMMON_CLK_MT6779_CAMSYS=y
CONFIG_COMMON_CLK_MT6779_VDECSYS=y
# CONFIG_COMMON_CLK_MT6779_VENCSYS is not set
# CONFIG_COMMON_CLK_MT6779_MFGCFG is not set
CONFIG_COMMON_CLK_MT6779_AUDSYS=y
# CONFIG_COMMON_CLK_MT6795 is not set
CONFIG_COMMON_CLK_MT6797=y
CONFIG_COMMON_CLK_MT6797_MMSYS=y
CONFIG_COMMON_CLK_MT6797_IMGSYS=y
# CONFIG_COMMON_CLK_MT6797_VDECSYS is not set
# CONFIG_COMMON_CLK_MT6797_VENCSYS is not set
# CONFIG_COMMON_CLK_MT7622 is not set
CONFIG_COMMON_CLK_MT7629=y
# CONFIG_COMMON_CLK_MT7629_ETHSYS is not set
CONFIG_COMMON_CLK_MT7629_HIFSYS=y
# CONFIG_COMMON_CLK_MT7981 is not set
CONFIG_COMMON_CLK_MT7986=y
CONFIG_COMMON_CLK_MT7986_ETHSYS=y
CONFIG_COMMON_CLK_MT7988=y
CONFIG_COMMON_CLK_MT8135=y
# CONFIG_COMMON_CLK_MT8167 is not set
CONFIG_COMMON_CLK_MT8173=y
# CONFIG_COMMON_CLK_MT8173_IMGSYS is not set
CONFIG_COMMON_CLK_MT8173_MMSYS=y
# CONFIG_COMMON_CLK_MT8173_VDECSYS is not set
CONFIG_COMMON_CLK_MT8173_VENCSYS=y
# CONFIG_COMMON_CLK_MT8183 is not set
# CONFIG_COMMON_CLK_MT8186 is not set
# CONFIG_COMMON_CLK_MT8188 is not set
CONFIG_COMMON_CLK_MT8192=y
CONFIG_COMMON_CLK_MT8192_AUDSYS=y
CONFIG_COMMON_CLK_MT8192_CAMSYS=y
# CONFIG_COMMON_CLK_MT8192_IMGSYS is not set
CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP=y
CONFIG_COMMON_CLK_MT8192_IPESYS=y
# CONFIG_COMMON_CLK_MT8192_MDPSYS is not set
CONFIG_COMMON_CLK_MT8192_MFGCFG=y
# CONFIG_COMMON_CLK_MT8192_MMSYS is not set
CONFIG_COMMON_CLK_MT8192_MSDC=y
# CONFIG_COMMON_CLK_MT8192_SCP_ADSP is not set
CONFIG_COMMON_CLK_MT8192_VDECSYS=y
CONFIG_COMMON_CLK_MT8192_VENCSYS=y
CONFIG_COMMON_CLK_MT8195=y
CONFIG_COMMON_CLK_MT8195_APUSYS=y
CONFIG_COMMON_CLK_MT8195_IMP_IIC_WRAP=y
CONFIG_COMMON_CLK_MT8195_MFGCFG=y
CONFIG_COMMON_CLK_MT8195_SCP_ADSP=y
CONFIG_COMMON_CLK_MT8195_VDOSYS=y
CONFIG_COMMON_CLK_MT8195_VPPSYS=y
CONFIG_COMMON_CLK_MT8195_CAMSYS=y
CONFIG_COMMON_CLK_MT8195_IMGSYS=y
CONFIG_COMMON_CLK_MT8195_IPESYS=y
CONFIG_COMMON_CLK_MT8195_WPESYS=y
CONFIG_COMMON_CLK_MT8195_VDECSYS=y
CONFIG_COMMON_CLK_MT8195_VENCSYS=y
CONFIG_COMMON_CLK_MT8365=y
# CONFIG_COMMON_CLK_MT8365_APU is not set
# CONFIG_COMMON_CLK_MT8365_CAM is not set
CONFIG_COMMON_CLK_MT8365_MFG=y
# CONFIG_COMMON_CLK_MT8365_MMSYS is not set
# CONFIG_COMMON_CLK_MT8365_VDEC is not set
# CONFIG_COMMON_CLK_MT8365_VENC is not set
# CONFIG_COMMON_CLK_MT8516 is not set
# end of Clock driver for MediaTek SoC

#
# Clock support for Amlogic platforms
#
# CONFIG_COMMON_CLK_AXG_AUDIO is not set
# end of Clock support for Amlogic platforms

# CONFIG_MSTAR_MSC313_CPUPLL is not set
# CONFIG_MSTAR_MSC313_MPLL is not set
CONFIG_MCHP_CLK_MPFS=y
# CONFIG_COMMON_CLK_NUVOTON is not set
# CONFIG_COMMON_CLK_PISTACHIO is not set
CONFIG_QCOM_GDSC=y
CONFIG_COMMON_CLK_QCOM=y
# CONFIG_CLK_X1E80100_CAMCC is not set
CONFIG_CLK_X1E80100_DISPCC=y
CONFIG_CLK_X1E80100_GCC=y
# CONFIG_CLK_X1E80100_GPUCC is not set
CONFIG_CLK_X1E80100_TCSRCC=y
# CONFIG_CLK_X1P42100_GPUCC is not set
CONFIG_CLK_QCM2290_GPUCC=y
# CONFIG_QCOM_A53PLL is not set
CONFIG_QCOM_A7PLL=y
CONFIG_QCOM_CLK_APCS_MSM8916=y
# CONFIG_QCOM_CLK_APCS_SDX55 is not set
CONFIG_QCOM_CLK_SMD_RPM=y
CONFIG_APQ_GCC_8084=y
CONFIG_APQ_MMCC_8084=y
CONFIG_IPQ_APSS_PLL=y
CONFIG_IPQ_CMN_PLL=y
CONFIG_IPQ_GCC_4019=y
CONFIG_IPQ_GCC_5018=y
CONFIG_IPQ_GCC_5332=y
CONFIG_IPQ_GCC_5424=y
CONFIG_IPQ_GCC_6018=y
CONFIG_IPQ_GCC_806X=y
CONFIG_IPQ_LCC_806X=y
CONFIG_IPQ_GCC_8074=y
# CONFIG_IPQ_GCC_9574 is not set
CONFIG_MSM_GCC_8660=y
# CONFIG_MSM_GCC_8909 is not set
CONFIG_MSM_GCC_8916=y
CONFIG_MSM_GCC_8917=y
# CONFIG_MSM_GCC_8939 is not set
CONFIG_MSM_GCC_8960=y
# CONFIG_MSM_LCC_8960 is not set
CONFIG_MDM_GCC_9607=y
CONFIG_MDM_GCC_9615=y
CONFIG_MSM_MMCC_8960=y
# CONFIG_MSM_GCC_8953 is not set
# CONFIG_MSM_GCC_8974 is not set
# CONFIG_MSM_MMCC_8974 is not set
CONFIG_MSM_GCC_8976=y
# CONFIG_MSM_MMCC_8994 is not set
CONFIG_MSM_GCC_8994=y
CONFIG_MSM_GCC_8996=y
CONFIG_MSM_MMCC_8996=y
# CONFIG_MSM_GCC_8998 is not set
# CONFIG_MSM_GPUCC_8998 is not set
# CONFIG_MSM_MMCC_8998 is not set
CONFIG_QCM_GCC_2290=y
CONFIG_QCM_DISPCC_2290=y
CONFIG_QCS_GCC_404=y
CONFIG_SA_CAMCC_8775P=y
# CONFIG_QCS_GCC_8300 is not set
# CONFIG_QCS_GCC_615 is not set
CONFIG_SC_CAMCC_7180=y
CONFIG_SC_CAMCC_7280=y
CONFIG_SC_CAMCC_8280XP=y
CONFIG_SA_DISPCC_8775P=y
CONFIG_SC_DISPCC_7180=y
CONFIG_SC_DISPCC_7280=y
CONFIG_SC_DISPCC_8280XP=y
CONFIG_SA_GCC_8775P=y
# CONFIG_SA_GPUCC_8775P is not set
CONFIG_SAR_GCC_2130P=y
# CONFIG_SAR_GPUCC_2130P is not set
CONFIG_SC_GCC_7180=y
CONFIG_SC_GCC_7280=y
CONFIG_SC_GCC_8180X=y
CONFIG_SC_GCC_8280XP=y
CONFIG_SC_GPUCC_7180=y
CONFIG_SC_GPUCC_7280=y
# CONFIG_SC_GPUCC_8280XP is not set
# CONFIG_SC_LPASSCC_7280 is not set
CONFIG_SC_LPASSCC_8280XP=y
CONFIG_SC_LPASS_CORECC_7180=y
CONFIG_SC_LPASS_CORECC_7280=y
CONFIG_SC_VIDEOCC_7180=y
CONFIG_SC_VIDEOCC_7280=y
CONFIG_SDM_CAMCC_845=y
CONFIG_SDM_GCC_660=y
CONFIG_SDM_MMCC_660=y
CONFIG_SDM_GPUCC_660=y
# CONFIG_QCS_TURING_404 is not set
# CONFIG_QCS_Q6SSTOP_404 is not set
CONFIG_QDU_GCC_1000=y
# CONFIG_QDU_ECPRICC_1000 is not set
CONFIG_SDM_GCC_845=y
CONFIG_SDM_GPUCC_845=y
# CONFIG_SDM_VIDEOCC_845 is not set
CONFIG_SDM_DISPCC_845=y
CONFIG_SDM_LPASSCC_845=y
CONFIG_SDX_GCC_55=y
CONFIG_SDX_GCC_65=y
# CONFIG_SDX_GCC_75 is not set
# CONFIG_SM_CAMCC_4450 is not set
CONFIG_SM_CAMCC_6350=y
CONFIG_SM_CAMCC_7150=y
# CONFIG_SM_CAMCC_8150 is not set
# CONFIG_SM_CAMCC_8250 is not set
CONFIG_SM_CAMCC_8450=y
# CONFIG_SM_CAMCC_8550 is not set
CONFIG_SM_CAMCC_8650=y
# CONFIG_SM_DISPCC_4450 is not set
# CONFIG_SM_DISPCC_6115 is not set
# CONFIG_SM_DISPCC_6125 is not set
CONFIG_SM_DISPCC_7150=y
# CONFIG_SM_DISPCC_8250 is not set
CONFIG_SM_DISPCC_6350=y
# CONFIG_SM_DISPCC_6375 is not set
# CONFIG_SM_DISPCC_8450 is not set
CONFIG_SM_DISPCC_8550=y
CONFIG_SM_DISPCC_8750=y
CONFIG_SM_GCC_4450=y
CONFIG_SM_GCC_6115=y
CONFIG_SM_GCC_6125=y
CONFIG_SM_GCC_6350=y
CONFIG_SM_GCC_6375=y
CONFIG_SM_GCC_7150=y
CONFIG_SM_GCC_8150=y
CONFIG_SM_GCC_8250=y
CONFIG_SM_GCC_8350=y
CONFIG_SM_GCC_8450=y
CONFIG_SM_GCC_8550=y
CONFIG_SM_GCC_8650=y
CONFIG_SM_GCC_8750=y
# CONFIG_SM_GPUCC_4450 is not set
CONFIG_SM_GPUCC_6115=y
CONFIG_SM_GPUCC_6125=y
CONFIG_SM_GPUCC_6375=y
CONFIG_SM_GPUCC_6350=y
# CONFIG_SM_GPUCC_8150 is not set
CONFIG_SM_GPUCC_8250=y
CONFIG_SM_GPUCC_8350=y
CONFIG_SM_GPUCC_8450=y
CONFIG_SM_GPUCC_8550=y
# CONFIG_SM_GPUCC_8650 is not set
CONFIG_SM_LPASSCC_6115=y
CONFIG_SM_TCSRCC_8550=y
CONFIG_SM_TCSRCC_8650=y
CONFIG_SM_TCSRCC_8750=y
# CONFIG_SA_VIDEOCC_8775P is not set
CONFIG_SM_VIDEOCC_7150=y
CONFIG_SM_VIDEOCC_8150=y
# CONFIG_SM_VIDEOCC_8250 is not set
# CONFIG_SM_VIDEOCC_8350 is not set
CONFIG_SM_VIDEOCC_8550=y
CONFIG_SPMI_PMIC_CLKDIV=y
CONFIG_QCOM_HFPLL=y
CONFIG_KPSS_XCC=y
# CONFIG_CLK_GFM_LPASS_SM8250 is not set
CONFIG_SM_VIDEOCC_8450=y
CONFIG_CLK_MT7621=y
# CONFIG_CLK_MTMIPS is not set
# CONFIG_CLK_RENESAS is not set
# CONFIG_COMMON_CLK_SAMSUNG is not set
CONFIG_CLK_SIFIVE=y
# CONFIG_CLK_SIFIVE_PRCI is not set
# CONFIG_CLK_INTEL_SOCFPGA is not set
# CONFIG_CLK_SOPHGO_CV1800 is not set
CONFIG_CLK_SOPHGO_SG2042_PLL=y
# CONFIG_CLK_SOPHGO_SG2042_CLKGEN is not set
# CONFIG_CLK_SOPHGO_SG2044 is not set
# CONFIG_CLK_SOPHGO_SG2044_PLL is not set
# CONFIG_SPACEMIT_CCU is not set
# CONFIG_SPRD_COMMON_CLK is not set
CONFIG_CLK_STARFIVE_JH71X0=y
# CONFIG_CLK_STARFIVE_JH7100 is not set
CONFIG_CLK_STARFIVE_JH7110_PLL=y
CONFIG_CLK_STARFIVE_JH7110_SYS=y
# CONFIG_CLK_STARFIVE_JH7110_AON is not set
# CONFIG_CLK_STARFIVE_JH7110_STG is not set
CONFIG_CLK_STARFIVE_JH7110_ISP=y
CONFIG_CLK_STARFIVE_JH7110_VOUT=y
# CONFIG_CLK_SUNXI is not set
# CONFIG_SUNXI_CCU is not set
# CONFIG_COMMON_CLK_STM32MP is not set
CONFIG_COMMON_CLK_TI_ADPLL=y
# CONFIG_CLK_UNIPHIER is not set
# CONFIG_COMMON_CLK_VISCONTI is not set
# CONFIG_CLK_LGM_CGU is not set
CONFIG_XILINX_VCU=y
CONFIG_COMMON_CLK_XLNX_CLKWZRD=y
CONFIG_COMMON_CLK_ZYNQMP=y
CONFIG_CLK_KUNIT_TEST=y
CONFIG_CLK_FIXED_RATE_KUNIT_TEST=y
CONFIG_CLK_GATE_KUNIT_TEST=y
CONFIG_CLK_FD_KUNIT_TEST=y
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
CONFIG_BCM2835_TIMER=y
# CONFIG_BCM_KONA_TIMER is not set
CONFIG_DAVINCI_TIMER=y
# CONFIG_DIGICOLOR_TIMER is not set
# CONFIG_OMAP_DM_TIMER is not set
CONFIG_DW_APB_TIMER=y
# CONFIG_ECONET_EN751221_TIMER is not set
# CONFIG_FTTMR010_TIMER is not set
CONFIG_IXP4XX_TIMER=y
CONFIG_MESON6_TIMER=y
# CONFIG_OWL_TIMER is not set
# CONFIG_RDA_TIMER is not set
# CONFIG_REALTEK_OTTO_TIMER is not set
# CONFIG_SUN4I_TIMER is not set
# CONFIG_SUN5I_HSTIMER is not set
# CONFIG_TEGRA_TIMER is not set
# CONFIG_TEGRA186_TIMER is not set
# CONFIG_VT8500_TIMER is not set
CONFIG_NPCM7XX_TIMER=y
CONFIG_CADENCE_TTC_TIMER=y
# CONFIG_ASM9260_TIMER is not set
CONFIG_CLKSRC_DBX500_PRCMU=y
CONFIG_CLPS711X_TIMER=y
# CONFIG_MXS_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
# CONFIG_INTEGRATOR_AP_TIMER is not set
# CONFIG_CLKSRC_PISTACHIO is not set
# CONFIG_CLKSRC_TI_32K is not set
CONFIG_CLKSRC_STM32_LP=y
# CONFIG_CLKSRC_MPS2 is not set
CONFIG_ARC_TIMERS=y
CONFIG_ARC_TIMERS_64BIT=y
# CONFIG_ARM_TIMER_SP804 is not set
CONFIG_ARMV7M_SYSTICK=y
CONFIG_ATMEL_PIT=y
# CONFIG_ATMEL_ST is not set
CONFIG_CLKSRC_SAMSUNG_PWM=y
# CONFIG_FSL_FTM_TIMER is not set
CONFIG_MTK_TIMER=y
CONFIG_MTK_CPUX_TIMER=y
# CONFIG_CLKSRC_JCORE_PIT is not set
CONFIG_SH_TIMER_CMT=y
CONFIG_SH_TIMER_MTU2=y
CONFIG_RENESAS_OSTM=y
# CONFIG_SH_TIMER_TMU is not set
CONFIG_EM_TIMER_STI=y
CONFIG_CLKSRC_VERSATILE=y
CONFIG_CLKSRC_PXA=y
# CONFIG_TIMER_IMX_SYS_CTR is not set
# CONFIG_CLKSRC_LOONGSON1_PWM is not set
CONFIG_CLKSRC_ST_LPC=y
CONFIG_GXP_TIMER=y
# CONFIG_MSC313E_TIMER is not set
# CONFIG_INGENIC_TIMER is not set
CONFIG_INGENIC_SYSOST=y
CONFIG_INGENIC_OST=y
# CONFIG_RALINK_TIMER is not set
# CONFIG_NXP_STM_TIMER is not set
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_ARM_MHU_V3=y
# CONFIG_CV1800_MBOX is not set
# CONFIG_EXYNOS_MBOX is not set
# CONFIG_IMX_MBOX is not set
CONFIG_PLATFORM_MHU=y
CONFIG_ARMADA_37XX_RWTM_MBOX=y
CONFIG_OMAP2PLUS_MBOX=y
# CONFIG_ROCKCHIP_MBOX is not set
CONFIG_ALTERA_MBOX=y
CONFIG_TI_MESSAGE_MANAGER=y
# CONFIG_MAILBOX_TEST is not set
CONFIG_POLARFIRE_SOC_MAILBOX=y
# CONFIG_QCOM_APCS_IPC is not set
CONFIG_BCM_PDC_MBOX=y
# CONFIG_STM32_IPCC is not set
CONFIG_MTK_ADSP_MBOX=y
CONFIG_MTK_CMDQ_MBOX=y
# CONFIG_SUN6I_MSGBOX is not set
CONFIG_SPRD_MBOX=y
# CONFIG_QCOM_IPCC is not set
CONFIG_THEAD_TH1520_MBOX=y
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_CTRL=y
# CONFIG_RPMSG_NS is not set
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
CONFIG_MESON_CANVAS=y
# CONFIG_MESON_CLK_MEASURE is not set
# CONFIG_MESON_GX_SOCINFO is not set
CONFIG_MESON_MX_SOCINFO=y
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
# CONFIG_APPLE_SART is not set
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
# CONFIG_ASPEED_LPC_CTRL is not set
CONFIG_ASPEED_LPC_SNOOP=y
# CONFIG_ASPEED_UART_ROUTING is not set
CONFIG_ASPEED_P2A_CTRL=y
# CONFIG_ASPEED_SOCINFO is not set
# end of ASPEED SoC drivers

CONFIG_AT91_SOC_ID=y
CONFIG_AT91_SOC_SFR=y

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BRCMSTB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
CONFIG_QUICC_ENGINE=y
# CONFIG_CPM_TSA is not set
CONFIG_DPAA2_CONSOLE=y
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# Hisilicon SoC drivers
#
# end of Hisilicon SoC drivers

#
# i.MX SoC drivers
#
CONFIG_SOC_IMX8M=y
# CONFIG_SOC_IMX9 is not set
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
CONFIG_IXP4XX_QMGR=y
CONFIG_IXP4XX_NPE=y
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
CONFIG_LITEX=y
CONFIG_LITEX_SOC_CONTROLLER=y
# end of Enable LiteX SoC Builder specific drivers

CONFIG_LOONGSON2_GUTS=y

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=y
CONFIG_MTK_DEVAPC=y
CONFIG_MTK_INFRACFG=y
CONFIG_MTK_PMIC_WRAP=y
# CONFIG_MTK_REGULATOR_COUPLER is not set
CONFIG_MTK_MMSYS=y
# CONFIG_MTK_SVS is not set
CONFIG_MTK_SOCINFO=y
# end of MediaTek SoC drivers

# CONFIG_POLARFIRE_SOC_SYS_CTRL is not set
CONFIG_WPCM450_SOC=y

#
# Qualcomm SoC drivers
#
CONFIG_QCOM_AOSS_QMP=y
# CONFIG_QCOM_COMMAND_DB is not set
CONFIG_QCOM_GENI_SE=y
# CONFIG_QCOM_GSBI is not set
CONFIG_QCOM_LLCC=y
# CONFIG_QCOM_PMIC_PDCHARGER_ULOG is not set
CONFIG_QCOM_RAMP_CTRL=y
CONFIG_QCOM_RMTFS_MEM=y
CONFIG_QCOM_RPM_MASTER_STATS=y
# CONFIG_QCOM_RPMH is not set
CONFIG_QCOM_SMD_RPM=y
CONFIG_QCOM_SPM=y
CONFIG_QCOM_WCNSS_CTRL=y
CONFIG_QCOM_ICC_BWMON=y
CONFIG_QCOM_PBS=y
# end of Qualcomm SoC drivers

CONFIG_SOC_RENESAS=y
# CONFIG_PWC_RZV2M is not set
# CONFIG_RST_RCAR is not set
# CONFIG_SYSC_RZ is not set
# CONFIG_SYSC_R9A08G045 is not set
# CONFIG_SYS_R9A09G047 is not set
# CONFIG_SYS_R9A09G056 is not set
# CONFIG_SYS_R9A09G057 is not set
CONFIG_ROCKCHIP_GRF=y
CONFIG_ROCKCHIP_IODOMAIN=y
# CONFIG_SOC_SAMSUNG is not set

#
# Sophgo SoC drivers
#
# CONFIG_SOPHGO_CV1800_RTCSYS is not set
# CONFIG_SOPHGO_SG2044_TOPSYS is not set
# end of Sophgo SoC drivers

CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER=y
# CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TI is not set
CONFIG_UX500_SOC_ID=y
# CONFIG_SOC_INTEGRATOR_CM is not set
# CONFIG_SOC_REALVIEW is not set

#
# VIA/WonderMedia SoC drivers
#
# CONFIG_WMT_SOCINFO is not set
# end of VIA/WonderMedia SoC drivers

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

#
# PM Domains
#
# CONFIG_OWL_PM_DOMAINS is not set

#
# Amlogic PM Domains
#
CONFIG_MESON_EE_PM_DOMAINS=y
# end of Amlogic PM Domains

CONFIG_APPLE_PMGR_PWRSTATE=y
CONFIG_ARM_SCMI_PERF_DOMAIN=y
CONFIG_ARM_SCMI_POWER_DOMAIN=y
# CONFIG_ARM_SCPI_POWER_DOMAIN is not set

#
# Broadcom PM Domains
#
CONFIG_BCM2835_POWER=y
# CONFIG_BCM_PMB is not set
# CONFIG_BCM63XX_POWER is not set
# end of Broadcom PM Domains

#
# i.MX PM Domains
#
# CONFIG_IMX_GPCV2_PM_DOMAINS is not set
# end of i.MX PM Domains

#
# MediaTek PM Domains
#
CONFIG_MTK_SCPSYS=y
CONFIG_MTK_SCPSYS_PM_DOMAINS=y
# end of MediaTek PM Domains

#
# Qualcomm PM Domains
#
# CONFIG_QCOM_RPMPD is not set
# end of Qualcomm PM Domains

CONFIG_SYSC_RCAR=y
CONFIG_SYSC_RCAR_GEN4=y
CONFIG_SYSC_R8A77995=y
# CONFIG_SYSC_R8A7794 is not set
CONFIG_SYSC_R8A77990=y
CONFIG_SYSC_R8A7779=y
CONFIG_SYSC_R8A7790=y
CONFIG_SYSC_R8A7795=y
CONFIG_SYSC_R8A7791=y
CONFIG_SYSC_R8A77965=y
# CONFIG_SYSC_R8A77960 is not set
# CONFIG_SYSC_R8A77961 is not set
# CONFIG_SYSC_R8A779F0 is not set
# CONFIG_SYSC_R8A7792 is not set
# CONFIG_SYSC_R8A77980 is not set
# CONFIG_SYSC_R8A77970 is not set
CONFIG_SYSC_R8A779A0=y
# CONFIG_SYSC_R8A779G0 is not set
# CONFIG_SYSC_R8A779H0 is not set
# CONFIG_SYSC_RMOBILE is not set
CONFIG_SYSC_R8A77470=y
# CONFIG_SYSC_R8A7745 is not set
# CONFIG_SYSC_R8A7742 is not set
# CONFIG_SYSC_R8A7743 is not set
CONFIG_SYSC_R8A774C0=y
CONFIG_SYSC_R8A774E1=y
# CONFIG_SYSC_R8A774A1 is not set
CONFIG_SYSC_R8A774B1=y
CONFIG_UX500_PM_DOMAIN=y
CONFIG_JH71XX_PMU=y
CONFIG_SUN20I_PPU=y
# CONFIG_SUN50I_H6_PRCM_PPU is not set
CONFIG_TH1520_PM_DOMAINS=y
# end of PM Domains

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
CONFIG_ARM_IMX_BUS_DEVFREQ=y
# CONFIG_ARM_TEGRA_DEVFREQ is not set
CONFIG_ARM_MEDIATEK_CCI_DEVFREQ=y
CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ=y
CONFIG_PM_DEVFREQ_EVENT=y
# CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP is not set
CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y
CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=y
CONFIG_EXTCON_FSA9480=y
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_LC824206XA=y
CONFIG_EXTCON_MAX14577=y
# CONFIG_EXTCON_MAX3355 is not set
# CONFIG_EXTCON_MAX77693 is not set
CONFIG_EXTCON_MAX8997=y
CONFIG_EXTCON_PALMAS=y
CONFIG_EXTCON_PTN5150=y
CONFIG_EXTCON_QCOM_SPMI_MISC=y
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
CONFIG_EXTCON_USBC_CROS_EC=y
CONFIG_EXTCON_USBC_TUSB320=y
CONFIG_EXTCON_RTK_TYPE_C=y
CONFIG_MEMORY=y
# CONFIG_ATMEL_EBI is not set
CONFIG_BRCMSTB_DPFE=y
CONFIG_BRCMSTB_MEMC=y
# CONFIG_BT1_L2_CTL is not set
# CONFIG_TI_AEMIF is not set
# CONFIG_TI_EMIF is not set
CONFIG_OMAP_GPMC=y
# CONFIG_OMAP_GPMC_DEBUG is not set
CONFIG_MVEBU_DEVBUS=y
CONFIG_FSL_CORENET_CF=y
# CONFIG_FSL_IFC is not set
CONFIG_JZ4780_NEMC=y
# CONFIG_MTK_SMI is not set
CONFIG_DA8XX_DDRCTL=y
CONFIG_RENESAS_RPCIF=y
CONFIG_STM32_FMC2_EBI=y
# CONFIG_STM32_OMM is not set
# CONFIG_SAMSUNG_MC is not set
# CONFIG_TEGRA_MC is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=y
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_GTS_HELPER=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
# CONFIG_IIO_SW_DEVICE is not set
CONFIG_IIO_SW_TRIGGER=y
# CONFIG_IIO_TRIGGERED_EVENT is not set
CONFIG_IIO_BACKEND=y

#
# Accelerometers
#
CONFIG_ADXL313=y
CONFIG_ADXL313_I2C=y
CONFIG_ADXL345=y
CONFIG_ADXL345_I2C=y
CONFIG_ADXL355=y
CONFIG_ADXL355_I2C=y
# CONFIG_ADXL367_I2C is not set
CONFIG_ADXL372=y
CONFIG_ADXL372_I2C=y
CONFIG_ADXL380=y
CONFIG_ADXL380_I2C=y
CONFIG_BMA180=y
# CONFIG_BMA400 is not set
# CONFIG_BMC150_ACCEL is not set
CONFIG_BMI088_ACCEL=y
CONFIG_BMI088_ACCEL_I2C=y
# CONFIG_DA280 is not set
CONFIG_DA311=y
CONFIG_DMARD06=y
CONFIG_DMARD09=y
# CONFIG_DMARD10 is not set
CONFIG_FXLS8962AF=y
CONFIG_FXLS8962AF_I2C=y
# CONFIG_IIO_KX022A_I2C is not set
CONFIG_KXSD9=y
CONFIG_KXSD9_I2C=y
CONFIG_KXCJK1013=y
CONFIG_MC3230=y
CONFIG_MMA7455=y
CONFIG_MMA7455_I2C=y
# CONFIG_MMA7660 is not set
# CONFIG_MMA8452 is not set
CONFIG_MMA9551_CORE=y
# CONFIG_MMA9551 is not set
CONFIG_MMA9553=y
CONFIG_MSA311=y
CONFIG_MXC4005=y
CONFIG_MXC6255=y
CONFIG_STK8312=y
# CONFIG_STK8BA50 is not set
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_IIO_ADC_HELPER=y
CONFIG_AD7091R=y
CONFIG_AD7091R5=y
CONFIG_AD7291=y
CONFIG_AD799X=y
CONFIG_ADI_AXI_ADC=y
# CONFIG_ASPEED_ADC is not set
CONFIG_AT91_ADC=y
# CONFIG_AT91_SAMA5D2_ADC is not set
CONFIG_BCM_IPROC_ADC=y
# CONFIG_BERLIN2_ADC is not set
CONFIG_CC10001_ADC=y
# CONFIG_DA9150_GPADC is not set
CONFIG_DLN2_ADC=y
CONFIG_ENVELOPE_DETECTOR=y
CONFIG_EP93XX_ADC=y
CONFIG_EXYNOS_ADC=y
# CONFIG_FSL_MX25_ADC is not set
CONFIG_GEHC_PMC_ADC=y
CONFIG_HX711=y
# CONFIG_INGENIC_ADC is not set
# CONFIG_IMX7D_ADC is not set
# CONFIG_IMX8QXP_ADC is not set
CONFIG_IMX93_ADC=y
CONFIG_LPC18XX_ADC=y
CONFIG_LPC32XX_ADC=y
CONFIG_LTC2309=y
CONFIG_LTC2471=y
CONFIG_LTC2485=y
CONFIG_LTC2497=y
# CONFIG_MAX1363 is not set
# CONFIG_MAX34408 is not set
# CONFIG_MAX77541_ADC is not set
CONFIG_MAX9611=y
CONFIG_MCP3422=y
CONFIG_MEDIATEK_MT6360_ADC=y
# CONFIG_MEDIATEK_MT6577_AUXADC is not set
# CONFIG_MEN_Z188_ADC is not set
# CONFIG_MESON_SARADC is not set
CONFIG_MP2629_ADC=y
# CONFIG_NAU7802 is not set
# CONFIG_NCT7201 is not set
# CONFIG_NPCM_ADC is not set
CONFIG_PAC1921=y
# CONFIG_PAC1934 is not set
# CONFIG_PALMAS_GPADC is not set
CONFIG_QCOM_VADC_COMMON=y
CONFIG_QCOM_PM8XXX_XOADC=y
# CONFIG_QCOM_SPMI_IADC is not set
CONFIG_QCOM_SPMI_VADC=y
CONFIG_QCOM_SPMI_ADC5=y
CONFIG_RCAR_GYRO_ADC=y
# CONFIG_ROHM_BD79124 is not set
# CONFIG_ROCKCHIP_SARADC is not set
CONFIG_RICHTEK_RTQ6056=y
CONFIG_RZG2L_ADC=y
# CONFIG_SC27XX_ADC is not set
CONFIG_SOPHGO_CV1800B_ADC=y
# CONFIG_SPEAR_ADC is not set
CONFIG_SD_ADC_MODULATOR=y
# CONFIG_STM32_ADC_CORE is not set
# CONFIG_STM32_DFSDM_CORE is not set
# CONFIG_STM32_DFSDM_ADC is not set
# CONFIG_SUN20I_GPADC is not set
CONFIG_TI_ADC081C=y
CONFIG_TI_ADS1015=y
# CONFIG_TI_ADS1100 is not set
CONFIG_TI_ADS1119=y
# CONFIG_TI_ADS7138 is not set
CONFIG_TI_ADS7924=y
# CONFIG_TI_AM335X_ADC is not set
# CONFIG_TWL4030_MADC is not set
# CONFIG_TWL6030_GPADC is not set
CONFIG_VF610_ADC=y
CONFIG_XILINX_XADC=y
CONFIG_XILINX_AMS=y
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_HMC425=y
# end of Amplifiers

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
CONFIG_AD7746=y
# end of Capacitance to digital converters

#
# Chemical Sensors
#
# CONFIG_AOSONG_AGS02MA is not set
# CONFIG_ATLAS_PH_SENSOR is not set
# CONFIG_ATLAS_EZO_SENSOR is not set
CONFIG_BME680=y
CONFIG_BME680_I2C=y
# CONFIG_CCS811 is not set
CONFIG_ENS160=y
CONFIG_ENS160_I2C=y
# CONFIG_IAQCORE is not set
# CONFIG_MHZ19B is not set
CONFIG_PMS7003=y
# CONFIG_SCD30_CORE is not set
# CONFIG_SCD4X is not set
# CONFIG_SEN0322 is not set
# CONFIG_SENSIRION_SGP30 is not set
# CONFIG_SENSIRION_SGP40 is not set
CONFIG_SPS30=y
CONFIG_SPS30_I2C=y
CONFIG_SPS30_SERIAL=y
CONFIG_SENSEAIR_SUNRISE_CO2=y
# CONFIG_VZ89X is not set
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_INV_SENSORS_TIMESTAMP=y
CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
CONFIG_IIO_SCMI=y
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
CONFIG_AD3552R_HS=y
CONFIG_AD3552R_LIB=y
CONFIG_AD5064=y
CONFIG_AD5380=y
CONFIG_AD5446=y
CONFIG_AD5592R_BASE=y
CONFIG_AD5593R=y
CONFIG_ADI_AXI_DAC=y
# CONFIG_AD5696_I2C is not set
CONFIG_DPOT_DAC=y
CONFIG_DS4424=y
CONFIG_LPC18XX_DAC=y
CONFIG_M62332=y
CONFIG_MAX517=y
# CONFIG_MAX5821 is not set
CONFIG_MCP4725=y
# CONFIG_MCP4728 is not set
# CONFIG_STM32_DAC is not set
CONFIG_TI_DAC5571=y
CONFIG_VF610_DAC=y
# end of Digital to analog converters

#
# IIO dummy driver
#
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
CONFIG_ADMFM2000=y
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
CONFIG_BMG160=y
CONFIG_BMG160_I2C=y
# CONFIG_FXAS21002C is not set
# CONFIG_MPU3050_I2C is not set
# CONFIG_IIO_ST_GYRO_3AXIS is not set
CONFIG_ITG3200=y
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
# CONFIG_AFE4404 is not set
# CONFIG_MAX30100 is not set
CONFIG_MAX30102=y
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
CONFIG_DHT11=y
CONFIG_ENS210=y
CONFIG_HDC100X=y
CONFIG_HDC2010=y
# CONFIG_HDC3020 is not set
# CONFIG_HTS221 is not set
# CONFIG_HTU21 is not set
# CONFIG_SI7005 is not set
CONFIG_SI7020=y
# end of Humidity sensors

#
# Inertial measurement units
#
# CONFIG_BMI160_I2C is not set
# CONFIG_BMI270_I2C is not set
# CONFIG_BMI323_I2C is not set
CONFIG_BOSCH_BNO055=y
CONFIG_BOSCH_BNO055_SERIAL=y
CONFIG_BOSCH_BNO055_I2C=y
CONFIG_FXOS8700=y
CONFIG_FXOS8700_I2C=y
CONFIG_KMX61=y
CONFIG_INV_ICM42600=y
CONFIG_INV_ICM42600_I2C=y
CONFIG_INV_MPU6050_IIO=y
CONFIG_INV_MPU6050_I2C=y
CONFIG_IIO_ST_LSM6DSX=y
CONFIG_IIO_ST_LSM6DSX_I2C=y
CONFIG_IIO_ST_LSM6DSX_I3C=y
# end of Inertial measurement units

#
# Light sensors
#
CONFIG_ADJD_S311=y
CONFIG_ADUX1020=y
CONFIG_AL3000A=y
CONFIG_AL3010=y
# CONFIG_AL3320A is not set
CONFIG_APDS9160=y
CONFIG_APDS9300=y
# CONFIG_APDS9306 is not set
# CONFIG_APDS9960 is not set
CONFIG_AS73211=y
CONFIG_BH1745=y
CONFIG_BH1750=y
CONFIG_BH1780=y
# CONFIG_CM32181 is not set
CONFIG_CM3232=y
CONFIG_CM3323=y
# CONFIG_CM3605 is not set
CONFIG_CM36651=y
CONFIG_GP2AP002=y
CONFIG_GP2AP020A00F=y
CONFIG_IQS621_ALS=y
CONFIG_SENSORS_ISL29018=y
CONFIG_SENSORS_ISL29028=y
CONFIG_ISL29125=y
CONFIG_ISL76682=y
# CONFIG_JSA1212 is not set
# CONFIG_ROHM_BU27034 is not set
CONFIG_RPR0521=y
CONFIG_SENSORS_LM3533=y
CONFIG_LTR390=y
# CONFIG_LTR501 is not set
CONFIG_LTRF216A=y
# CONFIG_LV0104CS is not set
CONFIG_MAX44000=y
CONFIG_MAX44009=y
CONFIG_NOA1305=y
# CONFIG_OPT3001 is not set
CONFIG_OPT4001=y
# CONFIG_OPT4060 is not set
# CONFIG_PA12203001 is not set
# CONFIG_SI1133 is not set
CONFIG_SI1145=y
# CONFIG_STK3310 is not set
CONFIG_ST_UVIS25=y
CONFIG_ST_UVIS25_I2C=y
# CONFIG_TCS3414 is not set
CONFIG_TCS3472=y
# CONFIG_SENSORS_TSL2563 is not set
CONFIG_TSL2583=y
CONFIG_TSL2591=y
CONFIG_TSL2772=y
CONFIG_TSL4531=y
CONFIG_US5182D=y
# CONFIG_VCNL4000 is not set
CONFIG_VCNL4035=y
CONFIG_VEML3235=y
# CONFIG_VEML6030 is not set
# CONFIG_VEML6040 is not set
CONFIG_VEML6070=y
CONFIG_VEML6075=y
CONFIG_VL6180=y
CONFIG_ZOPT2201=y
# end of Light sensors

#
# Magnetometer sensors
#
# CONFIG_AF8133J is not set
CONFIG_AK8974=y
CONFIG_AK8975=y
CONFIG_AK09911=y
CONFIG_ALS31300=y
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
CONFIG_MAG3110=y
CONFIG_MMC35240=y
CONFIG_IIO_ST_MAGN_3AXIS=y
# CONFIG_IIO_ST_MAGN_I2C_3AXIS is not set
# CONFIG_SENSORS_HMC5843_I2C is not set
# CONFIG_SENSORS_RM3100_I2C is not set
CONFIG_SI7210=y
CONFIG_TI_TMAG5273=y
CONFIG_YAMAHA_YAS530=y
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=y
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

CONFIG_IIO_GTS_KUNIT_TEST=y
CONFIG_IIO_FORMAT_KUNIT_TEST=y

#
# Triggers - standalone
#
# CONFIG_IIO_HRTIMER_TRIGGER is not set
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
CONFIG_IIO_STM32_TIMER_TRIGGER=y
CONFIG_IIO_TIGHTLOOP_TRIGGER=y
CONFIG_IIO_SYSFS_TRIGGER=y
# end of Triggers - standalone

#
# Linear and angular position sensors
#
# CONFIG_IQS624_POS is not set
# end of Linear and angular position sensors

#
# Digital potentiometers
#
# CONFIG_AD5110 is not set
CONFIG_AD5272=y
CONFIG_DS1803=y
CONFIG_MAX5432=y
CONFIG_MCP4018=y
# CONFIG_MCP4531 is not set
# CONFIG_TPL0102 is not set
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=y
# end of Digital potentiostats

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
CONFIG_ROHM_BM1390=y
CONFIG_BMP280=y
CONFIG_BMP280_I2C=y
CONFIG_DLHL60D=y
CONFIG_DPS310=y
# CONFIG_HP03 is not set
CONFIG_HSC030PA=y
CONFIG_HSC030PA_I2C=y
CONFIG_ICP10100=y
CONFIG_MPL115=y
CONFIG_MPL115_I2C=y
CONFIG_MPL3115=y
CONFIG_MPRLS0025PA=y
CONFIG_MPRLS0025PA_I2C=y
# CONFIG_MS5611 is not set
# CONFIG_MS5637 is not set
CONFIG_SDP500=y
CONFIG_IIO_ST_PRESS=y
CONFIG_IIO_ST_PRESS_I2C=y
CONFIG_T5403=y
CONFIG_HP206C=y
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
# CONFIG_CROS_EC_MKBP_PROXIMITY is not set
# CONFIG_HX9023S is not set
# CONFIG_IRSD200 is not set
# CONFIG_ISL29501 is not set
CONFIG_LIDAR_LITE_V2=y
CONFIG_MB1232=y
# CONFIG_PING is not set
# CONFIG_RFD77402 is not set
# CONFIG_SRF04 is not set
CONFIG_SX_COMMON=y
CONFIG_SX9310=y
# CONFIG_SX9324 is not set
# CONFIG_SX9360 is not set
CONFIG_SX9500=y
CONFIG_SRF08=y
# CONFIG_VCNL3020 is not set
CONFIG_VL53L0X_I2C=y
CONFIG_AW96103=y
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
# CONFIG_IQS620AT_TEMP is not set
# CONFIG_MLX90614 is not set
CONFIG_MLX90632=y
# CONFIG_MLX90635 is not set
CONFIG_TMP006=y
CONFIG_TMP007=y
# CONFIG_TMP117 is not set
# CONFIG_TSYS01 is not set
CONFIG_TSYS02D=y
CONFIG_MAX30208=y
CONFIG_MCP9600=y
# end of Temperature sensors

CONFIG_NTB=y
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_SWITCHTEC is not set
CONFIG_NTB_PINGPONG=y
CONFIG_NTB_TOOL=y
CONFIG_NTB_PERF=y
CONFIG_NTB_TRANSPORT=y
# CONFIG_PWM is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_IRQ_MSI_LIB=y
CONFIG_AL_FIC=y
CONFIG_DW_APB_ICTL=y
CONFIG_LAN966X_OIC=y
CONFIG_MADERA_IRQ=y
CONFIG_JCORE_AIC=y
# CONFIG_RENESAS_INTC_IRQPIN is not set
CONFIG_RENESAS_IRQC=y
CONFIG_RENESAS_RZA1_IRQC=y
# CONFIG_RENESAS_RZG2L_IRQC is not set
# CONFIG_RENESAS_RZV2H_ICU is not set
# CONFIG_SL28CPLD_INTC is not set
CONFIG_TB10X_IRQC=y
CONFIG_TS4800_IRQ=y
# CONFIG_XILINX_INTC is not set
CONFIG_INGENIC_TCU_IRQ=y
CONFIG_STM32MP_EXTI=y
# CONFIG_IRQ_UNIPHIER_AIDET is not set
# CONFIG_MESON_IRQ_GPIO is not set
CONFIG_IMX_IRQSTEER=y
CONFIG_IMX_INTMUX=y
CONFIG_IMX_MU_MSI=y
CONFIG_TI_SCI_INTR_IRQCHIP=y
CONFIG_STARFIVE_JH8100_INTC=y
CONFIG_EXYNOS_IRQ_COMBINER=y
# CONFIG_MST_IRQ is not set
CONFIG_MCHP_EIC=y
CONFIG_SOPHGO_SG2042_MSI=y
# CONFIG_SUNPLUS_SP7021_INTC is not set
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_BOARD_TPCI200 is not set
CONFIG_SERIAL_IPOCTAL=y
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_A10SR=y
CONFIG_RESET_ATH79=y
# CONFIG_RESET_AXS10X is not set
# CONFIG_RESET_BCM6345 is not set
# CONFIG_RESET_BERLIN is not set
CONFIG_RESET_BRCMSTB=y
CONFIG_RESET_BRCMSTB_RESCAL=y
# CONFIG_RESET_EYEQ is not set
CONFIG_RESET_GPIO=y
# CONFIG_RESET_HSDK is not set
# CONFIG_RESET_IMX7 is not set
CONFIG_RESET_IMX8MP_AUDIOMIX=y
CONFIG_RESET_INTEL_GW=y
CONFIG_RESET_K210=y
CONFIG_RESET_LANTIQ=y
# CONFIG_RESET_LPC18XX is not set
CONFIG_RESET_MCHP_SPARX5=y
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_NUVOTON_MA35D1 is not set
CONFIG_RESET_PISTACHIO=y
# CONFIG_RESET_POLARFIRE_SOC is not set
CONFIG_RESET_QCOM_AOSS=y
# CONFIG_RESET_QCOM_PDC is not set
CONFIG_RESET_RASPBERRYPI=y
CONFIG_RESET_RZG2L_USBPHY_CTRL=y
# CONFIG_RESET_RZV2H_USB2PHY is not set
CONFIG_RESET_SCMI=y
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_SOCFPGA is not set
# CONFIG_RESET_SUNPLUS is not set
CONFIG_RESET_SUNXI=y
# CONFIG_RESET_TH1520 is not set
CONFIG_RESET_TI_SCI=y
# CONFIG_RESET_TI_SYSCON is not set
CONFIG_RESET_TI_TPS380X=y
CONFIG_RESET_TN48M_CPLD=y
CONFIG_RESET_UNIPHIER=y
CONFIG_RESET_UNIPHIER_GLUE=y
# CONFIG_RESET_ZYNQ is not set
CONFIG_RESET_ZYNQMP=y
CONFIG_RESET_MESON_COMMON=y
# CONFIG_RESET_MESON is not set
CONFIG_RESET_MESON_AUX=y
CONFIG_RESET_MESON_AUDIO_ARB=y
CONFIG_RESET_STARFIVE_JH71X0=y
CONFIG_RESET_STARFIVE_JH7100=y
CONFIG_RESET_STARFIVE_JH7110=y
# CONFIG_STIH407_RESET is not set
CONFIG_COMMON_RESET_HI3660=y
CONFIG_COMMON_RESET_HI6220=y
CONFIG_RESET_TEGRA_BPMP=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
CONFIG_PHY_LPC18XX_USB_OTG=y
CONFIG_PHY_PISTACHIO_USB=y
# CONFIG_PHY_SNPS_EUSB2 is not set
CONFIG_PHY_XGENE=y
CONFIG_USB_LGM_PHY=y
# CONFIG_PHY_CAN_TRANSCEIVER is not set
# CONFIG_PHY_AIROHA_PCIE is not set
CONFIG_PHY_NXP_PTN3222=y
# CONFIG_PHY_SUN4I_USB is not set
# CONFIG_PHY_SUN6I_MIPI_DPHY is not set
# CONFIG_PHY_SUN9I_USB is not set
CONFIG_PHY_SUN50I_USB3=y
# CONFIG_PHY_MESON8_HDMI_TX is not set
CONFIG_PHY_MESON8B_USB2=y
CONFIG_PHY_MESON_GXL_USB2=y
CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG=y
CONFIG_PHY_MESON_G12A_USB2=y
# CONFIG_PHY_MESON_G12A_USB3_PCIE is not set
# CONFIG_PHY_MESON_AXG_PCIE is not set
CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG=y
CONFIG_PHY_MESON_AXG_MIPI_DPHY=y

#
# PHY drivers for Broadcom platforms
#
CONFIG_PHY_BCM63XX_USBH=y
CONFIG_PHY_CYGNUS_PCIE=y
CONFIG_PHY_BCM_SR_USB=y
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_BCM_NS_USB2 is not set
CONFIG_PHY_NS2_USB_DRD=y
CONFIG_PHY_BRCM_SATA=y
# CONFIG_PHY_BRCM_USB is not set
CONFIG_PHY_BCM_SR_PCIE=y
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_CADENCE_TORRENT=y
# CONFIG_PHY_CADENCE_DPHY is not set
# CONFIG_PHY_CADENCE_DPHY_RX is not set
CONFIG_PHY_CADENCE_SIERRA=y
CONFIG_PHY_CADENCE_SALVO=y
CONFIG_PHY_FSL_IMX8MQ_USB=y
# CONFIG_PHY_MIXEL_LVDS_PHY is not set
# CONFIG_PHY_MIXEL_MIPI_DPHY is not set
CONFIG_PHY_FSL_IMX8M_PCIE=y
# CONFIG_PHY_FSL_IMX8QM_HSIO is not set
# CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY is not set
CONFIG_PHY_FSL_LYNX_28G=y
CONFIG_PHY_HI6220_USB=y
# CONFIG_PHY_HI3660_USB is not set
# CONFIG_PHY_HI3670_USB is not set
CONFIG_PHY_HI3670_PCIE=y
# CONFIG_PHY_HISTB_COMBPHY is not set
CONFIG_PHY_HISI_INNO_USB2=y
CONFIG_PHY_INGENIC_USB=y
CONFIG_PHY_LANTIQ_VRX200_PCIE=y
# CONFIG_PHY_LANTIQ_RCU_USB2 is not set
CONFIG_ARMADA375_USBCLUSTER_PHY=y
CONFIG_PHY_BERLIN_SATA=y
CONFIG_PHY_BERLIN_USB=y
CONFIG_PHY_MVEBU_A3700_UTMI=y
CONFIG_PHY_MVEBU_A38X_COMPHY=y
# CONFIG_PHY_MVEBU_CP110_UTMI is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
CONFIG_PHY_PXA_28NM_USB2=y
# CONFIG_PHY_PXA_USB is not set
CONFIG_PHY_MMP3_USB=y
CONFIG_PHY_MMP3_HSIC=y
# CONFIG_PHY_MTK_PCIE is not set
CONFIG_PHY_MTK_XFI_TPHY=y
CONFIG_PHY_MTK_TPHY=y
CONFIG_PHY_MTK_UFS=y
CONFIG_PHY_MTK_XSPHY=y
CONFIG_PHY_MTK_HDMI=y
CONFIG_PHY_MTK_MIPI_CSI_0_5=y
CONFIG_PHY_MTK_MIPI_DSI=y
CONFIG_PHY_MTK_DP=y
# CONFIG_PHY_SPARX5_SERDES is not set
CONFIG_PHY_LAN966X_SERDES=y
# CONFIG_PHY_CPCAP_USB is not set
CONFIG_PHY_MAPPHONE_MDM6600=y
# CONFIG_PHY_OCELOT_SERDES is not set
CONFIG_PHY_MA35_USB=y
CONFIG_PHY_ATH79_USB=y
# CONFIG_PHY_QCOM_EDP is not set
CONFIG_PHY_QCOM_IPQ4019_USB=y
CONFIG_PHY_QCOM_PCIE2=y
CONFIG_PHY_QCOM_QMP=y
CONFIG_PHY_QCOM_QMP_COMBO=y
CONFIG_PHY_QCOM_QMP_PCIE=y
CONFIG_PHY_QCOM_QMP_PCIE_8996=y
CONFIG_PHY_QCOM_QMP_UFS=y
# CONFIG_PHY_QCOM_QMP_USB is not set
CONFIG_PHY_QCOM_QMP_USB_LEGACY=y
CONFIG_PHY_QCOM_QUSB2=y
CONFIG_PHY_QCOM_EUSB2_REPEATER=y
CONFIG_PHY_QCOM_M31_USB=y
CONFIG_PHY_QCOM_USB_HS=y
CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
# CONFIG_PHY_QCOM_USB_HSIC is not set
CONFIG_PHY_QCOM_USB_HS_28NM=y
CONFIG_PHY_QCOM_USB_SS=y
CONFIG_PHY_QCOM_IPQ806X_USB=y
CONFIG_PHY_QCOM_SGMII_ETH=y
# CONFIG_PHY_MT7621_PCI is not set
# CONFIG_PHY_RALINK_USB is not set
CONFIG_PHY_RTK_RTD_USB2PHY=y
CONFIG_PHY_RTK_RTD_USB3PHY=y
# CONFIG_PHY_R8A779F0_ETHERNET_SERDES is not set
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
CONFIG_PHY_ROCKCHIP_DPHY_RX0=y
# CONFIG_PHY_ROCKCHIP_INNO_HDMI is not set
CONFIG_PHY_ROCKCHIP_INNO_USB2=y
CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY=y
# CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY is not set
CONFIG_PHY_ROCKCHIP_PCIE=y
# CONFIG_PHY_ROCKCHIP_SAMSUNG_DCPHY is not set
CONFIG_PHY_ROCKCHIP_SAMSUNG_HDPTX=y
CONFIG_PHY_ROCKCHIP_SNPS_PCIE3=y
CONFIG_PHY_ROCKCHIP_TYPEC=y
CONFIG_PHY_EXYNOS_DP_VIDEO=y
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
# CONFIG_PHY_EXYNOS_PCIE is not set
# CONFIG_PHY_SAMSUNG_UFS is not set
# CONFIG_PHY_SAMSUNG_USB2 is not set
CONFIG_PHY_UNIPHIER_USB2=y
# CONFIG_PHY_UNIPHIER_USB3 is not set
CONFIG_PHY_UNIPHIER_PCIE=y
# CONFIG_PHY_UNIPHIER_AHCI is not set
CONFIG_PHY_ST_SPEAR1310_MIPHY=y
CONFIG_PHY_ST_SPEAR1340_MIPHY=y
CONFIG_PHY_STIH407_USB=y
# CONFIG_PHY_STM32_COMBOPHY is not set
CONFIG_PHY_STM32_USBPHYC=y
CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=y
# CONFIG_PHY_STARFIVE_JH7110_DPHY_TX is not set
CONFIG_PHY_STARFIVE_JH7110_PCIE=y
CONFIG_PHY_STARFIVE_JH7110_USB=y
# CONFIG_PHY_SUNPLUS_USB is not set
CONFIG_PHY_TEGRA194_P2U=y
CONFIG_PHY_DA8XX_USB=y
CONFIG_PHY_DM816X_USB=y
CONFIG_PHY_AM654_SERDES=y
CONFIG_PHY_J721E_WIZ=y
CONFIG_OMAP_CONTROL_PHY=y
CONFIG_TI_PIPE3=y
CONFIG_PHY_TUSB1210=y
CONFIG_PHY_INTEL_KEEMBAY_EMMC=y
CONFIG_PHY_INTEL_KEEMBAY_USB=y
CONFIG_PHY_INTEL_LGM_COMBO=y
# CONFIG_PHY_INTEL_LGM_EMMC is not set
CONFIG_PHY_XILINX_ZYNQMP=y
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_ARM_SCMI_POWERCAP=y
CONFIG_DTPM=y
CONFIG_MCB=y
CONFIG_MCB_PCI=y
CONFIG_MCB_LPC=y
CONFIG_RAS=y
CONFIG_USB4=y
# CONFIG_USB4_DEBUGFS_WRITE is not set
CONFIG_USB4_KUNIT_TEST=y
# CONFIG_USB4_DMA_TEST is not set

#
# Android
#
CONFIG_ANDROID_BINDER_IPC=y
CONFIG_ANDROID_BINDERFS=y
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
# CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
# end of Android

CONFIG_DAX=y
# CONFIG_DEV_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_LAYOUTS=y

#
# Layout Types
#
CONFIG_NVMEM_LAYOUT_SL28_VPD=y
CONFIG_NVMEM_LAYOUT_ONIE_TLV=y
# CONFIG_NVMEM_LAYOUT_U_BOOT_ENV is not set
# end of Layout Types

CONFIG_NVMEM_APPLE_EFUSES=y
# CONFIG_NVMEM_APPLE_SPMI is not set
CONFIG_NVMEM_BCM_OCOTP=y
CONFIG_NVMEM_BRCM_NVRAM=y
CONFIG_NVMEM_IMX_IIM=y
CONFIG_NVMEM_IMX_OCOTP=y
CONFIG_NVMEM_IMX_OCOTP_ELE=y
# CONFIG_NVMEM_JZ4780_EFUSE is not set
CONFIG_NVMEM_LAN9662_OTPC=y
CONFIG_NVMEM_LAYERSCAPE_SFP=y
# CONFIG_NVMEM_LPC18XX_EEPROM is not set
# CONFIG_NVMEM_LPC18XX_OTP is not set
CONFIG_NVMEM_MESON_MX_EFUSE=y
CONFIG_NVMEM_MICROCHIP_OTPC=y
CONFIG_NVMEM_MTK_EFUSE=y
# CONFIG_NVMEM_MXS_OCOTP is not set
CONFIG_NVMEM_NINTENDO_OTP=y
CONFIG_NVMEM_QCOM_QFPROM=y
CONFIG_NVMEM_QCOM_SEC_QFPROM=y
CONFIG_NVMEM_RAVE_SP_EEPROM=y
# CONFIG_NVMEM_RCAR_EFUSE is not set
CONFIG_NVMEM_RMEM=y
CONFIG_NVMEM_ROCKCHIP_EFUSE=y
# CONFIG_NVMEM_ROCKCHIP_OTP is not set
CONFIG_NVMEM_SC27XX_EFUSE=y
CONFIG_NVMEM_SNVS_LPGPR=y
# CONFIG_NVMEM_SPMI_SDAM is not set
# CONFIG_NVMEM_SPRD_EFUSE is not set
# CONFIG_NVMEM_STM32_ROMEM is not set
CONFIG_NVMEM_SUNPLUS_OCOTP=y
# CONFIG_NVMEM_U_BOOT_ENV is not set
CONFIG_NVMEM_UNIPHIER_EFUSE=y
CONFIG_NVMEM_VF610_OCOTP=y
CONFIG_NVMEM_QORIQ_EFUSE=y

#
# HW tracing support
#
CONFIG_STM=y
CONFIG_STM_PROTO_BASIC=y
CONFIG_STM_PROTO_SYS_T=y
CONFIG_STM_DUMMY=y
CONFIG_STM_SOURCE_CONSOLE=y
# CONFIG_STM_SOURCE_HEARTBEAT is not set
CONFIG_STM_SOURCE_FTRACE=y
CONFIG_INTEL_TH=y
CONFIG_INTEL_TH_PCI=y
CONFIG_INTEL_TH_GTH=y
CONFIG_INTEL_TH_STH=y
CONFIG_INTEL_TH_MSU=y
# CONFIG_INTEL_TH_PTI is not set
CONFIG_INTEL_TH_DEBUG=y
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_FPGA_MGR_SOCFPGA=y
CONFIG_FPGA_MGR_SOCFPGA_A10=y
CONFIG_ALTERA_PR_IP_CORE=y
CONFIG_ALTERA_PR_IP_CORE_PLAT=y
# CONFIG_FPGA_MGR_ALTERA_CVP is not set
CONFIG_FPGA_MGR_ZYNQ_FPGA=y
CONFIG_FPGA_MGR_XILINX_CORE=y
CONFIG_FPGA_MGR_XILINX_SELECTMAP=y
# CONFIG_FPGA_BRIDGE is not set
# CONFIG_FPGA_DFL is not set
CONFIG_FPGA_MGR_ZYNQMP_FPGA=y
CONFIG_FPGA_MGR_VERSAL_FPGA=y
CONFIG_FSI=y
CONFIG_FSI_NEW_DEV_NODE=y
CONFIG_FSI_MASTER_GPIO=y
CONFIG_FSI_MASTER_HUB=y
CONFIG_FSI_MASTER_AST_CF=y
# CONFIG_FSI_MASTER_ASPEED is not set
# CONFIG_FSI_MASTER_I2CR is not set
CONFIG_FSI_SCOM=y
# CONFIG_FSI_SBEFIFO is not set
# CONFIG_TEE is not set
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
# CONFIG_MUX_ADG792A is not set
CONFIG_MUX_GPIO=y
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
CONFIG_INTERCONNECT=y
# CONFIG_INTERCONNECT_IMX is not set
CONFIG_INTERCONNECT_MTK=y
CONFIG_INTERCONNECT_QCOM_OSM_L3=y
# CONFIG_INTERCONNECT_SAMSUNG is not set
CONFIG_INTERCONNECT_CLK=y
CONFIG_COUNTER=y
CONFIG_FTM_QUADDEC=y
CONFIG_INTERRUPT_CNT=y
# CONFIG_MICROCHIP_TCB_CAPTURE is not set
CONFIG_STM32_LPTIMER_CNT=y
# CONFIG_STM32_TIMER_CNT is not set
# CONFIG_TI_ECAP_CAPTURE is not set
CONFIG_TI_EQEP=y
# CONFIG_MOST is not set
CONFIG_PECI=y
CONFIG_PECI_CPU=y
CONFIG_PECI_ASPEED=y
CONFIG_PECI_NPCM=y
CONFIG_HTE=y
CONFIG_HTE_TEGRA194=y
# CONFIG_HTE_TEGRA194_TEST is not set
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_FS_STACK=y
CONFIG_BUFFER_HEAD=y
CONFIG_LEGACY_DIRECT_IO=y
# CONFIG_EXT2_FS is not set
CONFIG_EXT3_FS=y
CONFIG_EXT3_FS_POSIX_ACL=y
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=y
# CONFIG_EXT4_USE_FOR_EXT2 is not set
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
CONFIG_EXT4_DEBUG=y
CONFIG_EXT4_KUNIT_TESTS=y
CONFIG_JBD2=y
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=y
CONFIG_JFS_FS=y
CONFIG_JFS_POSIX_ACL=y
# CONFIG_JFS_SECURITY is not set
# CONFIG_JFS_DEBUG is not set
# CONFIG_JFS_STATISTICS is not set
CONFIG_XFS_FS=y
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_SUPPORT_ASCII_CI=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_DRAIN_INTENTS=y
CONFIG_XFS_LIVE_HOOKS=y
CONFIG_XFS_MEMORY_BUFS=y
CONFIG_XFS_BTREE_IN_MEM=y
CONFIG_XFS_ONLINE_SCRUB=y
# CONFIG_XFS_ONLINE_SCRUB_STATS is not set
CONFIG_XFS_ONLINE_REPAIR=y
CONFIG_XFS_DEBUG=y
CONFIG_XFS_DEBUG_EXPENSIVE=y
CONFIG_XFS_ASSERT_FATAL=y
# CONFIG_GFS2_FS is not set
# CONFIG_BTRFS_FS is not set
CONFIG_NILFS2_FS=y
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
# CONFIG_F2FS_FS_SECURITY is not set
CONFIG_F2FS_CHECK_FS=y
CONFIG_F2FS_FAULT_INJECTION=y
CONFIG_F2FS_FS_COMPRESSION=y
# CONFIG_F2FS_FS_LZO is not set
# CONFIG_F2FS_FS_LZ4 is not set
CONFIG_F2FS_FS_ZSTD=y
CONFIG_F2FS_IOSTAT=y
# CONFIG_BCACHEFS_FS is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
# CONFIG_INOTIFY_USER is not set
CONFIG_FANOTIFY=y
# CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
CONFIG_QUOTA=y
CONFIG_QUOTA_DEBUG=y
CONFIG_QUOTA_TREE=y
CONFIG_QFMT_V1=y
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
CONFIG_VIRTIO_FS=y
# CONFIG_FUSE_PASSTHROUGH is not set
CONFIG_FUSE_IO_URING=y
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
# CONFIG_OVERLAY_FS_INDEX is not set
CONFIG_OVERLAY_FS_METACOPY=y
CONFIG_OVERLAY_FS_DEBUG=y

#
# Caches
#
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
# CONFIG_JOLIET is not set
CONFIG_ZISOFS=y
CONFIG_UDF_FS=y
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=y
# CONFIG_VFAT_FS is not set
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_KUNIT_TEST=y
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
CONFIG_NTFS3_FS=y
CONFIG_NTFS3_LZX_XPRESS=y
# CONFIG_NTFS3_FS_POSIX_ACL is not set
CONFIG_NTFS_FS=y
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_TMPFS_QUOTA=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
CONFIG_NLS_CODEPAGE_737=y
CONFIG_NLS_CODEPAGE_775=y
CONFIG_NLS_CODEPAGE_850=y
# CONFIG_NLS_CODEPAGE_852 is not set
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
# CONFIG_NLS_CODEPAGE_860 is not set
CONFIG_NLS_CODEPAGE_861=y
# CONFIG_NLS_CODEPAGE_862 is not set
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
# CONFIG_NLS_CODEPAGE_936 is not set
CONFIG_NLS_CODEPAGE_950=y
CONFIG_NLS_CODEPAGE_932=y
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=y
# CONFIG_NLS_ASCII is not set
# CONFIG_NLS_ISO8859_1 is not set
CONFIG_NLS_ISO8859_2=y
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=y
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
# CONFIG_NLS_KOI8_U is not set
# CONFIG_NLS_MAC_ROMAN is not set
CONFIG_NLS_MAC_CELTIC=y
# CONFIG_NLS_MAC_CENTEURO is not set
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=y
CONFIG_NLS_MAC_GAELIC=y
CONFIG_NLS_MAC_GREEK=y
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=y
# CONFIG_NLS_MAC_TURKISH is not set
CONFIG_NLS_UTF8=y
CONFIG_NLS_UCS2_UTILS=y
CONFIG_UNICODE=y
CONFIG_UNICODE_NORMALIZATION_KUNIT_TEST=y
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_BIG_KEYS=y
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
CONFIG_KEY_DH_OPERATIONS=y
CONFIG_KEY_NOTIFICATIONS=y
CONFIG_SECURITY_DMESG_RESTRICT=y
# CONFIG_PROC_MEM_ALWAYS_FORCE is not set
CONFIG_PROC_MEM_FORCE_PTRACE=y
# CONFIG_PROC_MEM_NO_FORCE is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,ipe,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
CONFIG_ZERO_CALL_USED_REGS=y
# end of Memory initialization

#
# Bounds checking
#
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_DEFAULT_ON=y
# end of Bounds checking

#
# Hardening of kernel data structures
#
CONFIG_LIST_HARDENED=y
CONFIG_BUG_ON_DATA_CORRUPTION=y
# end of Hardening of kernel data structures

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SIG=y
CONFIG_CRYPTO_SIG2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
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
CONFIG_CRYPTO_HKDF=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_KRB5ENC=y
CONFIG_CRYPTO_ENGINE=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=y
# CONFIG_CRYPTO_ECRDSA is not set
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
# CONFIG_CRYPTO_SERPENT is not set
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_LRW is not set
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_GENIV=y
CONFIG_CRYPTO_SEQIV=y
# CONFIG_CRYPTO_ECHAINIV is not set
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3_GENERIC=y
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_WP512=y
# CONFIG_CRYPTO_XCBC is not set
# CONFIG_CRYPTO_XXHASH is not set
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_JITTERENTROPY_MEMORY_BLOCKS=64
CONFIG_CRYPTO_JITTERENTROPY_MEMORY_BLOCKSIZE=32
CONFIG_CRYPTO_JITTERENTROPY_OSR=1
CONFIG_CRYPTO_KDF800108_CTR=y
# end of Random number generation

#
# Userspace interface
#
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_ALLWINNER is not set
# CONFIG_CRYPTO_DEV_SL3516 is not set
CONFIG_CRYPTO_DEV_HIFN_795X=y
# CONFIG_CRYPTO_DEV_HIFN_795X_RNG is not set
CONFIG_CRYPTO_DEV_FSL_CAAM_COMMON=y
CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_DESC=y
CONFIG_CRYPTO_DEV_FSL_CAAM=y
# CONFIG_CRYPTO_DEV_FSL_CAAM_DEBUG is not set
CONFIG_CRYPTO_DEV_FSL_CAAM_JR=y
CONFIG_CRYPTO_DEV_FSL_CAAM_RINGSIZE=9
CONFIG_CRYPTO_DEV_FSL_CAAM_INTC=y
CONFIG_CRYPTO_DEV_FSL_CAAM_INTC_COUNT_THLD=255
CONFIG_CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD=2048
CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API=y
# CONFIG_CRYPTO_DEV_FSL_CAAM_AHASH_API is not set
CONFIG_CRYPTO_DEV_FSL_CAAM_PKC_API=y
CONFIG_CRYPTO_DEV_FSL_CAAM_RNG_API=y
CONFIG_CRYPTO_DEV_FSL_CAAM_PRNG_API=y
CONFIG_CRYPTO_DEV_FSL_CAAM_RNG_TEST=y
# CONFIG_CRYPTO_DEV_EXYNOS_RNG is not set
# CONFIG_CRYPTO_DEV_S5P is not set
# CONFIG_CRYPTO_DEV_ATMEL_AES is not set
CONFIG_CRYPTO_DEV_ATMEL_TDES=y
CONFIG_CRYPTO_DEV_ATMEL_SHA=y
CONFIG_CRYPTO_DEV_ATMEL_I2C=y
CONFIG_CRYPTO_DEV_ATMEL_ECC=y
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_MARVELL=y
CONFIG_CRYPTO_DEV_MARVELL_CESA=y
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4=y
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4_ECB is not set
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4_CTS=y
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_ECC=y
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_HCU=y
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_HCU_HMAC_SHA224 is not set
CONFIG_CRYPTO_DEV_IXP4XX=y
CONFIG_CRYPTO_DEV_QAT=y
CONFIG_CRYPTO_DEV_QAT_DH895xCC=y
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
# CONFIG_CRYPTO_DEV_QAT_C62X is not set
CONFIG_CRYPTO_DEV_QAT_4XXX=y
# CONFIG_CRYPTO_DEV_QAT_420XX is not set
# CONFIG_CRYPTO_DEV_QAT_6XXX is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=y
CONFIG_CRYPTO_DEV_QAT_C62XVF=y
CONFIG_CRYPTO_DEV_QAT_ERROR_INJECTION=y
CONFIG_CRYPTO_DEV_QCE=y
CONFIG_CRYPTO_DEV_QCE_SKCIPHER=y
# CONFIG_CRYPTO_DEV_QCE_ENABLE_ALL is not set
CONFIG_CRYPTO_DEV_QCE_ENABLE_SKCIPHER=y
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SHA is not set
# CONFIG_CRYPTO_DEV_QCE_ENABLE_AEAD is not set
CONFIG_CRYPTO_DEV_QCE_SW_MAX_LEN=512
CONFIG_CRYPTO_DEV_QCOM_RNG=y
CONFIG_CRYPTO_DEV_IMGTEC_HASH=y
CONFIG_CRYPTO_DEV_TEGRA=y
# CONFIG_CRYPTO_DEV_ZYNQMP_AES is not set
# CONFIG_CRYPTO_DEV_ZYNQMP_SHA3 is not set
# CONFIG_CRYPTO_DEV_VIRTIO is not set
CONFIG_CRYPTO_DEV_SAFEXCEL=y
CONFIG_CRYPTO_DEV_CCREE=y
CONFIG_CRYPTO_DEV_HISI_SEC=y
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
CONFIG_CRYPTO_DEV_SA2UL=y
CONFIG_CRYPTO_DEV_ASPEED=y
# CONFIG_CRYPTO_DEV_ASPEED_DEBUG is not set
# CONFIG_CRYPTO_DEV_ASPEED_HACE_HASH is not set
# CONFIG_CRYPTO_DEV_ASPEED_HACE_CRYPTO is not set
CONFIG_CRYPTO_DEV_ASPEED_ACRY=y
CONFIG_CRYPTO_DEV_JH7110=y
CONFIG_CRYPTO_DEV_EIP93=y
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
CONFIG_PKCS7_MESSAGE_PARSER=y
CONFIG_FIPS_SIGNATURE_SELFTEST=y
CONFIG_FIPS_SIGNATURE_SELFTEST_RSA=y
CONFIG_FIPS_SIGNATURE_SELFTEST_ECDSA=y

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
CONFIG_SECONDARY_TRUSTED_KEYRING=y
# CONFIG_SECONDARY_TRUSTED_KEYRING_SIGNED_BY_BUILTIN is not set
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

CONFIG_CRYPTO_KRB5=y
CONFIG_CRYPTO_KRB5_SELFTESTS=y
CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519_INTERNAL=y
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_LIB_SHA256_GENERIC=y
CONFIG_CRYPTO_LIB_SM3=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_CRC8=y
CONFIG_CRC_OPTIMIZATIONS=y
CONFIG_XXHASH=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_ARM64=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_RISCV=y
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_CLOSURES=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_DMA=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_ARCH_HAS_SETUP_DMA_OPS=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
CONFIG_ARCH_HAS_DMA_PREP_COHERENT=y
CONFIG_DMA_NEED_SYNC=y
CONFIG_DMA_NONCOHERENT_MMAP=y
CONFIG_DMA_COHERENT_POOL=y
CONFIG_DMA_DIRECT_REMAP=y
CONFIG_DMA_API_DEBUG=y
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_FORCE_NR_CPUS=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_FONT_SUPPORT=y
CONFIG_FONTS=y
CONFIG_FONT_8x8=y
# CONFIG_FONT_8x16 is not set
# CONFIG_FONT_6x11 is not set
# CONFIG_FONT_7x14 is not set
# CONFIG_FONT_PEARL_8x8 is not set
# CONFIG_FONT_ACORN_8x8 is not set
CONFIG_FONT_MINI_4x6=y
# CONFIG_FONT_6x10 is not set
# CONFIG_FONT_10x18 is not set
CONFIG_FONT_SUN8x16=y
# CONFIG_FONT_SUN12x22 is not set
CONFIG_FONT_TER16x32=y
# CONFIG_FONT_6x8 is not set
CONFIG_SG_SPLIT=y
CONFIG_SG_POOL=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_MAX_FRAMES=64
CONFIG_SBITMAP=y
CONFIG_PARMAN=y
# CONFIG_OBJAGG is not set
CONFIG_LWQ_TEST=y
# end of Library routines

CONFIG_GENERIC_IOREMAP=y
CONFIG_POLYNOMIAL=y
CONFIG_FIRMWARE_TABLE=y
CONFIG_MIN_HEAP=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
CONFIG_STACKTRACE_BUILD_ID=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_DYNAMIC_DEBUG is not set
# CONFIG_DYNAMIC_DEBUG_CORE is not set
CONFIG_SYMBOLIC_ERRNAME=y
# end of printk and dmesg options

# CONFIG_DEBUG_KERNEL is not set

#
# Compile-time checks and compiler options
#
CONFIG_AS_HAS_NON_CONST_ULEB128=y
CONFIG_FRAME_WARN=0
# CONFIG_STRIP_ASM_SYMS is not set
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
# CONFIG_MAGIC_SYSRQ_SERIAL is not set
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_HAVE_ARCH_KGDB=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_POISONING=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
CONFIG_CODE_TAGGING=y
CONFIG_MEM_ALLOC_PROFILING=y
CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=y
CONFIG_MEM_ALLOC_PROFILING_DEBUG=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# end of Memory Debugging

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# CONFIG_SCHEDSTATS is not set
# end of Scheduler Debugging

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_WW_MUTEX_SELFTEST=y
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set

#
# Debug kernel data structures
#
# CONFIG_DEBUG_CLOSURES is not set
# end of Debug kernel data structures

#
# RCU Debugging
#
# end of RCU Debugging

CONFIG_NOP_TRACER=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_SCHED_TRACER is not set
# CONFIG_HWLAT_TRACER is not set
CONFIG_OSNOISE_TRACER=y
CONFIG_TIMERLAT_TRACER=y
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_TRACE_BRANCH_PROFILING=y
# CONFIG_BRANCH_PROFILE_NONE is not set
CONFIG_PROFILE_ANNOTATED_BRANCHES=y
# CONFIG_PROFILE_ALL_BRANCHES is not set
CONFIG_TRACING_BRANCHES=y
CONFIG_BRANCH_TRACER=y
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_DYNAMIC_EVENTS=y
CONFIG_SYNTH_EVENTS=y
CONFIG_USER_EVENTS=y
# CONFIG_TRACE_EVENT_INJECT is not set
CONFIG_TRACEPOINT_BENCHMARK=y
CONFIG_RING_BUFFER_BENCHMARK=y
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_GCOV_PROFILE_FTRACE is not set
CONFIG_FTRACE_SELFTEST=y
CONFIG_FTRACE_STARTUP_TEST=y
# CONFIG_EVENT_TRACE_STARTUP_TEST is not set
CONFIG_RING_BUFFER_STARTUP_TEST=y
CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS=y
# CONFIG_RV is not set
# CONFIG_SAMPLES is not set
# CONFIG_STRICT_DEVMEM is not set

#
# arc Debugging
#
# CONFIG_16KSTACKS is not set
# end of arc Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
CONFIG_KUNIT_DEBUGFS=y
CONFIG_KUNIT_FAULT_TEST=y
CONFIG_KUNIT_TEST=y
CONFIG_KUNIT_EXAMPLE_TEST=y
CONFIG_KUNIT_ALL_TESTS=y
# CONFIG_KUNIT_DEFAULT_ENABLED is not set
# CONFIG_KUNIT_AUTORUN_ENABLED is not set
# CONFIG_RUNTIME_TESTING_MENU is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

#
# Documentation
#
# CONFIG_WARN_MISSING_DOCUMENTS is not set
# CONFIG_WARN_ABI_ERRORS is not set
# end of Documentation

--8wjzmNvoQ0j7X1k0--
