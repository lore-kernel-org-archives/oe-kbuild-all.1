Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF591FAF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Jan 2023 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673173216; x=1704709216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FvCUmN74uq8f37/Vc4s+dj1cfVWCMmh+sT3vAdwwwhE=;
  b=iu3LN9tdWUrJrG0S61f30hMVodSIc5bb9G3KHgXdvPhWsTlWo4hkaiG/
   JAYmqSxlEvwF7UBKfxGvEqo66bViGMCKKBzMQQ2uqy6p0NfzvktTV6Kfu
   5LF0VZ8nrjlaQvvmRFmpU4Dzn1RIvPkz4x/a6d+Sp7ok66oSlrled13TB
   8+RPzq7q69rnvEwq1FaL5lgAsNjl8GLOqp4XvCDlR34mtM5Zb0W+dg1De
   ASPwCb3ku3g2wPOD9dBF9PNn/lk3UDDdp7Kci5tGVPbrMMSIjrTLvjSqn
   +Up7nsh1pKGeJIT7CopXmmoAVD5rQGQ/pKPY+GbA+oBZYkPtRwzzID+Uc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="324721480"
X-IronPort-AV: E=Sophos;i="5.96,310,1665471600"; 
   d="scan'208";a="324721480"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2023 02:20:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="830322291"
X-IronPort-AV: E=Sophos;i="5.96,310,1665471600"; 
   d="scan'208";a="830322291"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 08 Jan 2023 02:20:13 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pESmi-0005IU-1h;
	Sun, 08 Jan 2023 10:20:12 +0000
Date: Sun, 8 Jan 2023 18:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.1.x-imx 6647/19704]
 drivers/pwm/pwm-imx27.c:315:26: sparse: sparse: incorrect type in assignment
 (different base types)
Message-ID: <202301081810.8QVifo6J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="2MvctjMWrZFUohpu"
Content-Disposition: inline


--2MvctjMWrZFUohpu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.1.x-imx
head:   7f663d3247e310835206336a4d1f49659094ef3f
commit: 9e862d2ace47317c918e5f791702d86f6c5b01d5 [6647/19704] MLK-25725 pwm: imx27: workaround of the pwm output bug when decrease the duty cycle
config: h8300-randconfig-s052-20230108
compiler: h8300-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/Freescale/linux-fslc/commit/9e862d2ace47317c918e5f791702d86f6c5b01d5
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.1.x-imx
        git checkout 9e862d2ace47317c918e5f791702d86f6c5b01d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=h8300 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=h8300 SHELL=/bin/bash drivers/pwm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/pwm/pwm-imx27.c:315:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] sar_last @@     got restricted __le32 [usertype] @@
   drivers/pwm/pwm-imx27.c:315:26: sparse:     expected unsigned int [usertype] sar_last
   drivers/pwm/pwm-imx27.c:315:26: sparse:     got restricted __le32 [usertype]
>> drivers/pwm/pwm-imx27.c:316:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] sar_current @@     got restricted __le32 [usertype] @@
   drivers/pwm/pwm-imx27.c:316:29: sparse:     expected unsigned int [usertype] sar_current
   drivers/pwm/pwm-imx27.c:316:29: sparse:     got restricted __le32 [usertype]
   drivers/pwm/pwm-imx27.c: note: in included file (through include/linux/io.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/pwm/pwm-imx27.c: note: in included file (through arch/h8300/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   drivers/pwm/pwm-imx27.c: note: in included file (through include/linux/io.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/pwm/pwm-imx27.c: note: in included file (through arch/h8300/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   drivers/pwm/pwm-imx27.c: note: in included file (through include/linux/io.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address space '__iomem' of expression

vim +315 drivers/pwm/pwm-imx27.c

   231	
   232	static int pwm_imx27_apply(struct pwm_chip *chip, struct pwm_device *pwm,
   233				   const struct pwm_state *state)
   234	{
   235		unsigned long period_cycles, duty_cycles, prescale, counter_check, flags;
   236		struct pwm_imx27_chip *imx = to_pwm_imx27_chip(chip);
   237		void __iomem *reg_sar = imx->mmio_base + MX3_PWMSAR;
   238		__force u32 sar_last, sar_current;
   239		struct pwm_state cstate;
   240		unsigned long long c;
   241		unsigned long long clkrate;
   242		int ret;
   243		u32 cr, timeout = 1000;
   244	
   245		pwm_get_state(pwm, &cstate);
   246	
   247		clkrate = clk_get_rate(imx->clk_per);
   248		c = clkrate * state->period;
   249	
   250		do_div(c, NSEC_PER_SEC);
   251		period_cycles = c;
   252	
   253		prescale = period_cycles / 0x10000 + 1;
   254	
   255		period_cycles /= prescale;
   256		c = clkrate * state->duty_cycle;
   257		do_div(c, NSEC_PER_SEC);
   258		duty_cycles = c;
   259		duty_cycles /= prescale;
   260	
   261		/*
   262		 * according to imx pwm RM, the real period value should be PERIOD
   263		 * value in PWMPR plus 2.
   264		 */
   265		if (period_cycles > 2)
   266			period_cycles -= 2;
   267		else
   268			period_cycles = 0;
   269	
   270		/*
   271		 * Wait for a free FIFO slot if the PWM is already enabled, and flush
   272		 * the FIFO if the PWM was disabled and is about to be enabled.
   273		 */
   274		if (cstate.enabled) {
   275			pwm_imx27_wait_fifo_slot(chip, pwm);
   276		} else {
   277			ret = pwm_imx27_clk_prepare_enable(imx);
   278			if (ret)
   279				return ret;
   280	
   281			pwm_imx27_sw_reset(chip);
   282		}
   283	
   284		/*
   285		 * This is a limited workaround. When the SAR FIFO is empty, the new
   286		 * write value will be directly applied to SAR even the current period
   287		 * is not over.
   288		 * If the new SAR value is less than the old one, and the counter is
   289		 * greater than the new SAR value, the current period will not filp
   290		 * the level. This will result in a pulse with a duty cycle of 100%.
   291		 * So, writing the current value of the SAR to SAR here before updating
   292		 * the new SAR value can avoid this issue.
   293		 *
   294		 * Add a spin lock and turn off the interrupt to ensure that the
   295		 * real-time performance can be guaranteed as much as possible when
   296		 * operating the following operations.
   297		 *
   298		 * 1. Add a threshold of 1.5us. If the time T between the read current
   299		 * count value CNR and the end of the cycle is less than 1.5us, wait
   300		 * for T to be longer than 1.5us before updating the SAR register.
   301		 * This is to avoid the situation that when the first SAR is written,
   302		 * the current cycle just ends and the SAR FIFO that just be written
   303		 * is emptied again.
   304		 *
   305		 * 2. Use __raw_writel() to minimize the interval between two writes to
   306		 * the SAR register to increase the fastest pwm frequency supported.
   307		 *
   308		 * When the PWM period is longer than 2us(or <500KHz), this workaround
   309		 * can solve this problem.
   310		 */
   311		if (duty_cycles < imx->duty_cycle) {
   312			c = clkrate * 1500;
   313			do_div(c, NSEC_PER_SEC);
   314			counter_check = c;
 > 315			sar_last = cpu_to_le32(imx->duty_cycle);
 > 316			sar_current = cpu_to_le32(duty_cycles);
   317	
   318			spin_lock_irqsave(&imx->lock, flags);
   319			if (state->period >= 2000) {
   320				while ((period_cycles -
   321					readl_relaxed(imx->mmio_base + MX3_PWMCNR))
   322					< counter_check) {
   323					if (!--timeout)
   324						break;
   325				};
   326			}
   327			if (!(MX3_PWMSR_FIFOAV &
   328			      readl_relaxed(imx->mmio_base + MX3_PWMSR)))
   329				__raw_writel(sar_last, reg_sar);
   330			__raw_writel(sar_current, reg_sar);
   331			spin_unlock_irqrestore(&imx->lock, flags);
   332		} else
   333			writel(duty_cycles, imx->mmio_base + MX3_PWMSAR);
   334	
   335		writel(period_cycles, imx->mmio_base + MX3_PWMPR);
   336	
   337		/*
   338		 * Store the duty cycle for future reference in cases where the
   339		 * MX3_PWMSAR register can't be read (i.e. when the PWM is disabled).
   340		 */
   341		imx->duty_cycle = duty_cycles;
   342	
   343		cr = MX3_PWMCR_PRESCALER_SET(prescale) |
   344		     MX3_PWMCR_STOPEN | MX3_PWMCR_DOZEN | MX3_PWMCR_WAITEN |
   345		     FIELD_PREP(MX3_PWMCR_CLKSRC, MX3_PWMCR_CLKSRC_IPG_HIGH) |
   346		     MX3_PWMCR_DBGEN;
   347	
   348		if (state->polarity == PWM_POLARITY_INVERSED)
   349			cr |= FIELD_PREP(MX3_PWMCR_POUTC,
   350					MX3_PWMCR_POUTC_INVERTED);
   351	
   352		if (state->enabled)
   353			cr |= MX3_PWMCR_EN;
   354	
   355		writel(cr, imx->mmio_base + MX3_PWMCR);
   356	
   357		if (!state->enabled)
   358			pwm_imx27_clk_disable_unprepare(imx);
   359	
   360		return 0;
   361	}
   362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

--2MvctjMWrZFUohpu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/h8300 5.15.5 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="h8300-linux-gcc (GCC) 12.1.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y

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
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_LZO is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_POSIX_MQUEUE=y
CONFIG_WATCH_QUEUE=y
CONFIG_USELIB=y
# CONFIG_AUDIT is not set

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_GENERIC_CLOCKEVENTS=y
# CONFIG_TIME_KUNIT_TEST is not set

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

CONFIG_BPF=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
# end of BPF subsystem

# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_PSI=y
# CONFIG_PSI_DEFAULT_DISABLED is not set
# end of CPU/Task time and stats accounting

# CONFIG_CPU_ISOLATION is not set

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_PREEMPT_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
CONFIG_RCU_BOOST=y
CONFIG_RCU_BOOST_DELAY=500
# CONFIG_RCU_NOCB_CPU is not set
CONFIG_TASKS_TRACE_RCU_READ_MB=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
# CONFIG_IKHEADERS is not set

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
# CONFIG_BLK_CGROUP is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_RD_GZIP is not set
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
# CONFIG_RD_LZO is not set
# CONFIG_RD_LZ4 is not set
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_HAVE_UID16=y
CONFIG_EXPERT=y
# CONFIG_MULTIUSER is not set
# CONFIG_SGETMASK_SYSCALL is not set
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
# CONFIG_POSIX_TIMERS is not set
# CONFIG_PRINTK is not set
# CONFIG_BUG is not set
# CONFIG_BASE_FULL is not set
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
# CONFIG_EPOLL is not set
# CONFIG_SIGNALFD is not set
# CONFIG_TIMERFD is not set
CONFIG_EVENTFD=y
# CONFIG_AIO is not set
# CONFIG_IO_URING is not set
# CONFIG_ADVISE_SYSCALLS is not set
CONFIG_MEMBARRIER=y
# CONFIG_KALLSYMS is not set
CONFIG_KCMP=y
CONFIG_EMBEDDED=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
# end of Kernel Performance Events And Counters

# CONFIG_VM_EVENT_COUNTERS is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_SLAB=y
# CONFIG_SLUB is not set
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_MMAP_ALLOW_UNINITIALIZED is not set
CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
# end of General setup

CONFIG_H8300=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_GENERIC_CSUM=y
CONFIG_HZ=100
CONFIG_NR_CPUS=1
CONFIG_CPU_H8S=y
CONFIG_H8S2678=y
CONFIG_RAMKERNEL=y

#
# Processor type and features
#
# CONFIG_H8300_AE3068 is not set
# CONFIG_H8300_H8MAX is not set
# CONFIG_H8300_KANEBEBE is not set
# CONFIG_H8300H_SIM is not set
CONFIG_H8S_EDOSK2674=y
# CONFIG_H8S_SIM is not set
CONFIG_H8300_BUILTIN_DTB=""
CONFIG_OFFSET=0
# end of Processor type and features

#
# General architecture-dependent options
#
CONFIG_SET_FS=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_LTO_NONE=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_HAVE_ARCH_HASH=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_CPU_NO_EFFICIENT_FFS=y
# CONFIG_LOCK_EVENT_COUNTS is not set

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
# end of GCOV-based kernel profiling
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
# CONFIG_MODULES is not set
CONFIG_BLOCK=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=y
# CONFIG_BLK_DEV_ZONED is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
# CONFIG_BLK_DEBUG_FS is not set
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
# CONFIG_AIX_PARTITION is not set
CONFIG_OSF_PARTITION=y
CONFIG_AMIGA_PARTITION=y
CONFIG_ATARI_PARTITION=y
# CONFIG_MAC_PARTITION is not set
# CONFIG_MSDOS_PARTITION is not set
# CONFIG_LDM_PARTITION is not set
# CONFIG_SGI_PARTITION is not set
CONFIG_ULTRIX_PARTITION=y
# CONFIG_SUN_PARTITION is not set
# CONFIG_KARMA_PARTITION is not set
CONFIG_EFI_PARTITION=y
CONFIG_SYSV68_PARTITION=y
CONFIG_CMDLINE_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_MQ_RDMA=y

#
# IO Schedulers
#
# CONFIG_MQ_IOSCHED_DEADLINE is not set
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y

#
# Executable file formats
#
CONFIG_BINFMT_SCRIPT=y
CONFIG_ARCH_HAS_BINFMT_FLAT=y
# CONFIG_BINFMT_FLAT is not set
CONFIG_BINFMT_FLAT_ARGVP_ENVP_ON_STACK=y
CONFIG_BINFMT_FLAT_OLD_ALWAYS_RAM=y
CONFIG_BINFMT_MISC=y
# CONFIG_COREDUMP is not set
# end of Executable file formats

#
# Memory Management options
#
CONFIG_FLATMEM=y
CONFIG_SPLIT_PTLOCK_CPUS=999999
# CONFIG_PAGE_REPORTING is not set
CONFIG_VIRT_TO_BUS=y
CONFIG_NOMMU_INITIAL_TRIM_EXCESS=1
CONFIG_NEED_PER_CPU_KM=y
CONFIG_CLEANCACHE=y
CONFIG_ZPOOL=y
# CONFIG_ZBUD is not set
CONFIG_Z3FOLD=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set

#
# Data Access Monitoring
#
CONFIG_DAMON=y
# CONFIG_DAMON_KUNIT_TEST is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_INGRESS=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
# CONFIG_PACKET is not set
# CONFIG_UNIX is not set
CONFIG_TLS=y
CONFIG_TLS_DEVICE=y
CONFIG_TLS_TOE=y
CONFIG_XFRM=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
CONFIG_XFRM_SUB_POLICY=y
# CONFIG_XFRM_MIGRATE is not set
CONFIG_XFRM_AH=y
CONFIG_XFRM_ESP=y
CONFIG_XFRM_IPCOMP=y
CONFIG_NET_KEY=y
# CONFIG_NET_KEY_MIGRATE is not set
CONFIG_XFRM_ESPINTCP=y
# CONFIG_SMC is not set
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
CONFIG_IP_ADVANCED_ROUTER=y
# CONFIG_IP_FIB_TRIE_STATS is not set
# CONFIG_IP_MULTIPLE_TABLES is not set
CONFIG_IP_ROUTE_MULTIPATH=y
# CONFIG_IP_ROUTE_VERBOSE is not set
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
# CONFIG_IP_PNP_DHCP is not set
CONFIG_IP_PNP_BOOTP=y
CONFIG_IP_PNP_RARP=y
CONFIG_NET_IPIP=y
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=y
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=y
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=y
CONFIG_INET_ESP=y
# CONFIG_INET_ESP_OFFLOAD is not set
CONFIG_INET_ESPINTCP=y
CONFIG_INET_IPCOMP=y
CONFIG_INET_XFRM_TUNNEL=y
CONFIG_INET_TUNNEL=y
# CONFIG_INET_DIAG is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=y
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=y
# CONFIG_TCP_CONG_HTCP is not set
CONFIG_TCP_CONG_HSTCP=y
# CONFIG_TCP_CONG_HYBLA is not set
CONFIG_TCP_CONG_VEGAS=y
# CONFIG_TCP_CONG_NV is not set
CONFIG_TCP_CONG_SCALABLE=y
# CONFIG_TCP_CONG_LP is not set
CONFIG_TCP_CONG_VENO=y
CONFIG_TCP_CONG_YEAH=y
# CONFIG_TCP_CONG_ILLINOIS is not set
CONFIG_TCP_CONG_DCTCP=y
CONFIG_TCP_CONG_CDG=y
CONFIG_TCP_CONG_BBR=y
# CONFIG_DEFAULT_BIC is not set
# CONFIG_DEFAULT_CUBIC is not set
# CONFIG_DEFAULT_VEGAS is not set
# CONFIG_DEFAULT_VENO is not set
# CONFIG_DEFAULT_WESTWOOD is not set
# CONFIG_DEFAULT_DCTCP is not set
CONFIG_DEFAULT_CDG=y
# CONFIG_DEFAULT_BBR is not set
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cdg"
# CONFIG_TCP_MD5SIG is not set
# CONFIG_IPV6 is not set
# CONFIG_MPTCP is not set
# CONFIG_NETWORK_SECMARK is not set
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_NETLINK=y
CONFIG_NETFILTER_FAMILY_ARP=y
CONFIG_NETFILTER_NETLINK_ACCT=y
CONFIG_NETFILTER_NETLINK_QUEUE=y
CONFIG_NETFILTER_NETLINK_LOG=y
CONFIG_NETFILTER_NETLINK_OSF=y
CONFIG_NF_CONNTRACK=y
CONFIG_NF_LOG_SYSLOG=y
CONFIG_NETFILTER_CONNCOUNT=y
CONFIG_NF_CONNTRACK_MARK=y
# CONFIG_NF_CONNTRACK_ZONES is not set
# CONFIG_NF_CONNTRACK_EVENTS is not set
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
# CONFIG_NF_CT_PROTO_DCCP is not set
CONFIG_NF_CT_PROTO_SCTP=y
# CONFIG_NF_CT_PROTO_UDPLITE is not set
CONFIG_NF_CONNTRACK_AMANDA=y
# CONFIG_NF_CONNTRACK_FTP is not set
CONFIG_NF_CONNTRACK_H323=y
CONFIG_NF_CONNTRACK_IRC=y
CONFIG_NF_CONNTRACK_BROADCAST=y
CONFIG_NF_CONNTRACK_NETBIOS_NS=y
CONFIG_NF_CONNTRACK_SNMP=y
# CONFIG_NF_CONNTRACK_PPTP is not set
# CONFIG_NF_CONNTRACK_SANE is not set
# CONFIG_NF_CONNTRACK_SIP is not set
CONFIG_NF_CONNTRACK_TFTP=y
CONFIG_NF_CT_NETLINK=y
CONFIG_NF_CT_NETLINK_TIMEOUT=y
# CONFIG_NETFILTER_NETLINK_GLUE_CT is not set
CONFIG_NF_NAT=y
CONFIG_NF_NAT_AMANDA=y
CONFIG_NF_NAT_IRC=y
CONFIG_NF_NAT_TFTP=y
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NETFILTER_SYNPROXY=y
# CONFIG_NF_TABLES is not set
CONFIG_NETFILTER_XTABLES=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=y
# CONFIG_NETFILTER_XT_CONNMARK is not set
CONFIG_NETFILTER_XT_SET=y

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=y
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=y
# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
CONFIG_NETFILTER_XT_TARGET_DSCP=y
CONFIG_NETFILTER_XT_TARGET_HL=y
# CONFIG_NETFILTER_XT_TARGET_HMARK is not set
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=y
CONFIG_NETFILTER_XT_TARGET_LED=y
# CONFIG_NETFILTER_XT_TARGET_LOG is not set
# CONFIG_NETFILTER_XT_TARGET_MARK is not set
CONFIG_NETFILTER_XT_NAT=y
CONFIG_NETFILTER_XT_TARGET_NETMAP=y
CONFIG_NETFILTER_XT_TARGET_NFLOG=y
# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
CONFIG_NETFILTER_XT_TARGET_RATEEST=y
CONFIG_NETFILTER_XT_TARGET_REDIRECT=y
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=y
CONFIG_NETFILTER_XT_TARGET_TEE=y
CONFIG_NETFILTER_XT_TARGET_TPROXY=y
CONFIG_NETFILTER_XT_TARGET_TCPMSS=y
# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
CONFIG_NETFILTER_XT_MATCH_BPF=y
# CONFIG_NETFILTER_XT_MATCH_CGROUP is not set
CONFIG_NETFILTER_XT_MATCH_CLUSTER=y
# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=y
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=y
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=y
# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
# CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
# CONFIG_NETFILTER_XT_MATCH_CPU is not set
CONFIG_NETFILTER_XT_MATCH_DCCP=y
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=y
CONFIG_NETFILTER_XT_MATCH_DSCP=y
CONFIG_NETFILTER_XT_MATCH_ECN=y
# CONFIG_NETFILTER_XT_MATCH_ESP is not set
# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
# CONFIG_NETFILTER_XT_MATCH_HELPER is not set
CONFIG_NETFILTER_XT_MATCH_HL=y
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
CONFIG_NETFILTER_XT_MATCH_IPVS=y
CONFIG_NETFILTER_XT_MATCH_L2TP=y
CONFIG_NETFILTER_XT_MATCH_LENGTH=y
CONFIG_NETFILTER_XT_MATCH_LIMIT=y
# CONFIG_NETFILTER_XT_MATCH_MAC is not set
# CONFIG_NETFILTER_XT_MATCH_MARK is not set
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=y
CONFIG_NETFILTER_XT_MATCH_NFACCT=y
# CONFIG_NETFILTER_XT_MATCH_OSF is not set
CONFIG_NETFILTER_XT_MATCH_OWNER=y
# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=y
CONFIG_NETFILTER_XT_MATCH_QUOTA=y
CONFIG_NETFILTER_XT_MATCH_RATEEST=y
CONFIG_NETFILTER_XT_MATCH_REALM=y
CONFIG_NETFILTER_XT_MATCH_RECENT=y
CONFIG_NETFILTER_XT_MATCH_SCTP=y
# CONFIG_NETFILTER_XT_MATCH_SOCKET is not set
CONFIG_NETFILTER_XT_MATCH_STATE=y
CONFIG_NETFILTER_XT_MATCH_STATISTIC=y
# CONFIG_NETFILTER_XT_MATCH_STRING is not set
# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
CONFIG_NETFILTER_XT_MATCH_TIME=y
# CONFIG_NETFILTER_XT_MATCH_U32 is not set
# end of Core Netfilter Configuration

CONFIG_IP_SET=y
CONFIG_IP_SET_MAX=256
# CONFIG_IP_SET_BITMAP_IP is not set
CONFIG_IP_SET_BITMAP_IPMAC=y
# CONFIG_IP_SET_BITMAP_PORT is not set
CONFIG_IP_SET_HASH_IP=y
CONFIG_IP_SET_HASH_IPMARK=y
CONFIG_IP_SET_HASH_IPPORT=y
CONFIG_IP_SET_HASH_IPPORTIP=y
CONFIG_IP_SET_HASH_IPPORTNET=y
# CONFIG_IP_SET_HASH_IPMAC is not set
CONFIG_IP_SET_HASH_MAC=y
CONFIG_IP_SET_HASH_NETPORTNET=y
CONFIG_IP_SET_HASH_NET=y
# CONFIG_IP_SET_HASH_NETNET is not set
CONFIG_IP_SET_HASH_NETPORT=y
CONFIG_IP_SET_HASH_NETIFACE=y
# CONFIG_IP_SET_LIST_SET is not set
CONFIG_IP_VS=y
CONFIG_IP_VS_DEBUG=y
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
# CONFIG_IP_VS_PROTO_AH is not set
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
# CONFIG_IP_VS_RR is not set
CONFIG_IP_VS_WRR=y
# CONFIG_IP_VS_LC is not set
# CONFIG_IP_VS_WLC is not set
CONFIG_IP_VS_FO=y
# CONFIG_IP_VS_OVF is not set
# CONFIG_IP_VS_LBLC is not set
CONFIG_IP_VS_LBLCR=y
# CONFIG_IP_VS_DH is not set
# CONFIG_IP_VS_SH is not set
CONFIG_IP_VS_MH=y
CONFIG_IP_VS_SED=y
# CONFIG_IP_VS_NQ is not set
# CONFIG_IP_VS_TWOS is not set

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
# CONFIG_IP_VS_NFCT is not set

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=y
# CONFIG_NF_SOCKET_IPV4 is not set
CONFIG_NF_TPROXY_IPV4=y
CONFIG_NF_DUP_IPV4=y
CONFIG_NF_LOG_ARP=y
CONFIG_NF_LOG_IPV4=y
CONFIG_NF_REJECT_IPV4=y
# CONFIG_NF_NAT_SNMP_BASIC is not set
CONFIG_NF_NAT_H323=y
CONFIG_IP_NF_IPTABLES=y
CONFIG_IP_NF_MATCH_AH=y
CONFIG_IP_NF_MATCH_ECN=y
CONFIG_IP_NF_MATCH_RPFILTER=y
CONFIG_IP_NF_MATCH_TTL=y
CONFIG_IP_NF_FILTER=y
# CONFIG_IP_NF_TARGET_REJECT is not set
CONFIG_IP_NF_TARGET_SYNPROXY=y
CONFIG_IP_NF_NAT=y
# CONFIG_IP_NF_TARGET_MASQUERADE is not set
CONFIG_IP_NF_TARGET_NETMAP=y
CONFIG_IP_NF_TARGET_REDIRECT=y
CONFIG_IP_NF_MANGLE=y
CONFIG_IP_NF_TARGET_CLUSTERIP=y
CONFIG_IP_NF_TARGET_ECN=y
CONFIG_IP_NF_TARGET_TTL=y
# CONFIG_IP_NF_RAW is not set
# CONFIG_IP_NF_ARPTABLES is not set
# end of IP: Netfilter Configuration

# CONFIG_NF_CONNTRACK_BRIDGE is not set
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
CONFIG_IP_SCTP=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
# CONFIG_SCTP_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
CONFIG_ATM=y
CONFIG_ATM_CLIP=y
CONFIG_ATM_CLIP_NO_ICMP=y
CONFIG_ATM_LANE=y
# CONFIG_ATM_MPOA is not set
# CONFIG_ATM_BR2684 is not set
# CONFIG_L2TP is not set
CONFIG_STP=y
CONFIG_GARP=y
CONFIG_MRP=y
# CONFIG_BRIDGE is not set
CONFIG_VLAN_8021Q=y
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
# CONFIG_DECNET is not set
CONFIG_LLC=y
CONFIG_LLC2=y
# CONFIG_ATALK is not set
CONFIG_X25=y
CONFIG_LAPB=y
CONFIG_PHONET=y
CONFIG_IEEE802154=y
CONFIG_IEEE802154_NL802154_EXPERIMENTAL=y
# CONFIG_IEEE802154_SOCKET is not set
# CONFIG_MAC802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=y
CONFIG_NET_SCH_HTB=y
CONFIG_NET_SCH_HFSC=y
CONFIG_NET_SCH_ATM=y
CONFIG_NET_SCH_PRIO=y
CONFIG_NET_SCH_MULTIQ=y
# CONFIG_NET_SCH_RED is not set
CONFIG_NET_SCH_SFB=y
CONFIG_NET_SCH_SFQ=y
CONFIG_NET_SCH_TEQL=y
CONFIG_NET_SCH_TBF=y
# CONFIG_NET_SCH_CBS is not set
CONFIG_NET_SCH_ETF=y
CONFIG_NET_SCH_TAPRIO=y
CONFIG_NET_SCH_GRED=y
CONFIG_NET_SCH_DSMARK=y
CONFIG_NET_SCH_NETEM=y
CONFIG_NET_SCH_DRR=y
CONFIG_NET_SCH_MQPRIO=y
CONFIG_NET_SCH_SKBPRIO=y
# CONFIG_NET_SCH_CHOKE is not set
# CONFIG_NET_SCH_QFQ is not set
CONFIG_NET_SCH_CODEL=y
# CONFIG_NET_SCH_FQ_CODEL is not set
CONFIG_NET_SCH_CAKE=y
CONFIG_NET_SCH_FQ=y
# CONFIG_NET_SCH_HHF is not set
CONFIG_NET_SCH_PIE=y
CONFIG_NET_SCH_FQ_PIE=y
# CONFIG_NET_SCH_PLUG is not set
CONFIG_NET_SCH_ETS=y
# CONFIG_NET_SCH_DEFAULT is not set

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=y
# CONFIG_NET_CLS_TCINDEX is not set
# CONFIG_NET_CLS_ROUTE4 is not set
CONFIG_NET_CLS_FW=y
# CONFIG_NET_CLS_U32 is not set
CONFIG_NET_CLS_RSVP=y
CONFIG_NET_CLS_RSVP6=y
CONFIG_NET_CLS_FLOW=y
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=y
CONFIG_NET_CLS_FLOWER=y
# CONFIG_NET_CLS_MATCHALL is not set
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=y
# CONFIG_NET_EMATCH_NBYTE is not set
CONFIG_NET_EMATCH_U32=y
CONFIG_NET_EMATCH_META=y
CONFIG_NET_EMATCH_TEXT=y
CONFIG_NET_EMATCH_CANID=y
# CONFIG_NET_EMATCH_IPSET is not set
CONFIG_NET_EMATCH_IPT=y
# CONFIG_NET_CLS_ACT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
# CONFIG_DNS_RESOLVER is not set
CONFIG_BATMAN_ADV=y
CONFIG_BATMAN_ADV_BATMAN_V=y
CONFIG_BATMAN_ADV_BLA=y
CONFIG_BATMAN_ADV_DAT=y
# CONFIG_BATMAN_ADV_NC is not set
# CONFIG_BATMAN_ADV_MCAST is not set
CONFIG_BATMAN_ADV_DEBUG=y
# CONFIG_OPENVSWITCH is not set
CONFIG_VSOCKETS=y
CONFIG_VSOCKETS_DIAG=y
# CONFIG_VSOCKETS_LOOPBACK is not set
# CONFIG_VIRTIO_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
# CONFIG_NET_MPLS_GSO is not set
CONFIG_NET_NSH=y
CONFIG_HSR=y
# CONFIG_NET_SWITCHDEV is not set
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_SOCK_RX_QUEUE_MAPPING=y
# CONFIG_CGROUP_NET_PRIO is not set
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y

#
# Network testing
#
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=y
# CONFIG_CAN_RAW is not set
# CONFIG_CAN_BCM is not set
CONFIG_CAN_GW=y
# CONFIG_CAN_J1939 is not set
CONFIG_CAN_ISOTP=y

#
# CAN Device Drivers
#
# CONFIG_CAN_VCAN is not set
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_SLCAN=y
CONFIG_CAN_DEV=y
CONFIG_CAN_CALC_BITTIMING=y
CONFIG_CAN_AT91=y
# CONFIG_CAN_FLEXCAN is not set
CONFIG_CAN_GRCAN=y
CONFIG_CAN_SUN4I=y
# CONFIG_CAN_XILINXCAN is not set
# CONFIG_CAN_C_CAN is not set
CONFIG_CAN_CC770=y
CONFIG_CAN_CC770_ISA=y
CONFIG_CAN_CC770_PLATFORM=y
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
CONFIG_CAN_RCAR=y
CONFIG_CAN_RCAR_CANFD=y
# CONFIG_CAN_SJA1000 is not set
CONFIG_CAN_SOFTING=y

#
# CAN SPI interfaces
#
CONFIG_CAN_HI311X=y
CONFIG_CAN_MCP251X=y
# CONFIG_CAN_MCP251XFD is not set
# end of CAN SPI interfaces

#
# CAN USB interfaces
#
# CONFIG_CAN_8DEV_USB is not set
CONFIG_CAN_EMS_USB=y
# CONFIG_CAN_ESD_USB2 is not set
# CONFIG_CAN_ETAS_ES58X is not set
# CONFIG_CAN_GS_USB is not set
# CONFIG_CAN_KVASER_USB is not set
# CONFIG_CAN_MCBA_USB is not set
CONFIG_CAN_PEAK_USB=y
CONFIG_CAN_UCAN=y
# end of CAN USB interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
# end of CAN Device Drivers

# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
CONFIG_AF_KCM=y
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_RFKILL is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
CONFIG_CAIF=y
# CONFIG_CAIF_DEBUG is not set
CONFIG_CAIF_NETDEV=y
CONFIG_CAIF_USB=y
CONFIG_CEPH_LIB=y
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
# CONFIG_CEPH_LIB_USE_DNS_RESOLVER is not set
CONFIG_NFC=y
CONFIG_NFC_DIGITAL=y
CONFIG_NFC_NCI=y
# CONFIG_NFC_NCI_SPI is not set
# CONFIG_NFC_NCI_UART is not set
# CONFIG_NFC_HCI is not set

#
# Near Field Communication (NFC) devices
#
CONFIG_NFC_TRF7970A=y
CONFIG_NFC_SIM=y
# CONFIG_NFC_PORT100 is not set
# CONFIG_NFC_VIRTUAL_NCI is not set
CONFIG_NFC_FDP=y
CONFIG_NFC_FDP_I2C=y
CONFIG_NFC_PN533=y
# CONFIG_NFC_PN533_USB is not set
CONFIG_NFC_PN533_I2C=y
CONFIG_NFC_MRVL=y
CONFIG_NFC_MRVL_USB=y
# CONFIG_NFC_MRVL_I2C is not set
CONFIG_NFC_ST_NCI=y
CONFIG_NFC_ST_NCI_I2C=y
CONFIG_NFC_ST_NCI_SPI=y
CONFIG_NFC_NXP_NCI=y
# CONFIG_NFC_NXP_NCI_I2C is not set
CONFIG_NFC_S3FWRN5=y
CONFIG_NFC_S3FWRN5_I2C=y
CONFIG_NFC_ST95HF=y
# end of Near Field Communication (NFC) devices

# CONFIG_PSAMPLE is not set
CONFIG_NET_IFE=y
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SOCK_MSG=y
CONFIG_FAILOVER=y
# CONFIG_ETHTOOL_NETLINK is not set

#
# Device Drivers
#
# CONFIG_PCCARD is not set

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
# CONFIG_DEVTMPFS is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_FW_LOADER_COMPRESS=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
CONFIG_DEBUG_DRIVER=y
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_PM_QOS_KUNIT_TEST is not set
# CONFIG_DRIVER_PE_KUNIT_TEST is not set
CONFIG_GENERIC_CPU_DEVICES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_ARM_INTEGRATOR_LM is not set
# CONFIG_BT1_APB is not set
CONFIG_BT1_AXI=y
CONFIG_MOXTET=y
# CONFIG_HISILICON_LPC is not set
CONFIG_INTEL_IXP4XX_EB=y
CONFIG_QCOM_EBI2=y
# CONFIG_MHI_BUS is not set
# end of Bus devices

CONFIG_CONNECTOR=y
# CONFIG_PROC_EVENTS is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
CONFIG_ARM_SCMI_PROTOCOL=y
CONFIG_ARM_SCMI_HAVE_TRANSPORT=y
CONFIG_ARM_SCMI_HAVE_MSG=y
CONFIG_ARM_SCMI_TRANSPORT_VIRTIO=y
CONFIG_ARM_SCMI_POWER_DOMAIN=y
# end of ARM System Control and Management Interface Protocol

# CONFIG_ARM_SCPI_POWER_DOMAIN is not set
# CONFIG_FIRMWARE_MEMMAP is not set
CONFIG_BCM47XX_NVRAM=y
CONFIG_BCM47XX_SPROM=y
# CONFIG_TEE_BNXT_FW is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
CONFIG_MTD=y

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
CONFIG_MTD_BCM63XX_PARTS=y
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_OF_PARTS=y
# CONFIG_MTD_OF_PARTS_BCM4908 is not set
CONFIG_MTD_OF_PARTS_LINKSYS_NS=y
CONFIG_MTD_PARSER_IMAGETAG=y
CONFIG_MTD_PARSER_TRX=y
# CONFIG_MTD_SHARPSL_PARTS is not set
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
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
# CONFIG_NFTL is not set
CONFIG_INFTL=y
CONFIG_RFD_FTL=y
# CONFIG_SSFDC is not set
CONFIG_SM_FTL=y
CONFIG_MTD_OOPS=y
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
# CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
CONFIG_MTD_MAP_BANK_WIDTH_16=y
CONFIG_MTD_MAP_BANK_WIDTH_32=y
# CONFIG_MTD_CFI_I1 is not set
# CONFIG_MTD_CFI_I2 is not set
CONFIG_MTD_CFI_I4=y
# CONFIG_MTD_CFI_I8 is not set
# CONFIG_MTD_OTP is not set
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_CFI_STAA is not set
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
# CONFIG_MTD_NETSC520 is not set
# CONFIG_MTD_TS5500 is not set
CONFIG_MTD_UCLINUX=y
CONFIG_MTD_PLATRAM=y
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_DATAFLASH=y
CONFIG_MTD_DATAFLASH_WRITE_VERIFY=y
CONFIG_MTD_DATAFLASH_OTP=y
CONFIG_MTD_MCHP23K256=y
# CONFIG_MTD_MCHP48L640 is not set
# CONFIG_MTD_SPEAR_SMI is not set
CONFIG_MTD_SST25L=y
CONFIG_MTD_SLRAM=y
# CONFIG_MTD_PHRAM is not set
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
# CONFIG_MTD_ONENAND_GENERIC is not set
CONFIG_MTD_ONENAND_SAMSUNG=y
CONFIG_MTD_ONENAND_OTP=y
CONFIG_MTD_ONENAND_2X_PROGRAM=y
CONFIG_MTD_RAW_NAND=y

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_DENALI=y
CONFIG_MTD_NAND_DENALI_DT=y
CONFIG_MTD_NAND_AMS_DELTA=y
CONFIG_MTD_NAND_OMAP2=y
# CONFIG_MTD_NAND_OMAP_BCH is not set
CONFIG_MTD_NAND_SHARPSL=y
# CONFIG_MTD_NAND_ATMEL is not set
# CONFIG_MTD_NAND_MARVELL is not set
CONFIG_MTD_NAND_SLC_LPC32XX=y
# CONFIG_MTD_NAND_MLC_LPC32XX is not set
CONFIG_MTD_NAND_BRCMNAND=y
# CONFIG_MTD_NAND_BCM47XXNFLASH is not set
CONFIG_MTD_NAND_OXNAS=y
# CONFIG_MTD_NAND_FSL_IFC is not set
CONFIG_MTD_NAND_VF610_NFC=y
CONFIG_MTD_NAND_MXC=y
CONFIG_MTD_NAND_SH_FLCTL=y
CONFIG_MTD_NAND_DAVINCI=y
CONFIG_MTD_NAND_TXX9NDFMC=y
CONFIG_MTD_NAND_JZ4780=y
CONFIG_MTD_NAND_INGENIC_ECC=y
CONFIG_MTD_NAND_JZ4740_ECC=y
CONFIG_MTD_NAND_JZ4725B_BCH=y
# CONFIG_MTD_NAND_JZ4780_BCH is not set
CONFIG_MTD_NAND_FSMC=y
# CONFIG_MTD_NAND_SUNXI is not set
CONFIG_MTD_NAND_HISI504=y
CONFIG_MTD_NAND_QCOM=y
CONFIG_MTD_NAND_MTK=y
# CONFIG_MTD_NAND_MXIC is not set
CONFIG_MTD_NAND_TEGRA=y
# CONFIG_MTD_NAND_STM32_FMC2 is not set
# CONFIG_MTD_NAND_MESON is not set
CONFIG_MTD_NAND_GPIO=y
CONFIG_MTD_NAND_PLATFORM=y
# CONFIG_MTD_NAND_CADENCE is not set
CONFIG_MTD_NAND_ARASAN=y
CONFIG_MTD_NAND_INTEL_LGM=y

#
# Misc
#
# CONFIG_MTD_NAND_NANDSIM is not set
CONFIG_MTD_NAND_DISKONCHIP=y
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y
CONFIG_MTD_SPI_NAND=y

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
# CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
CONFIG_MTD_NAND_ECC_SW_BCH=y
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_SPI_NOR is not set
# CONFIG_MTD_UBI is not set
CONFIG_MTD_HYPERBUS=y
CONFIG_HBMC_AM654=y
CONFIG_DTC=y
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
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
CONFIG_PARPORT=y
CONFIG_PARPORT_AX88796=y
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=y
CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=y
CONFIG_CDROM=y
CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
CONFIG_BLK_DEV_CRYPTOLOOP=y

#
# DRBD disabled because PROC_FS or INET not selected
#
# CONFIG_BLK_DEV_NBD is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_CDROM_PKTCDVD=y
CONFIG_CDROM_PKTCDVD_BUFFERS=8
CONFIG_CDROM_PKTCDVD_WCACHE=y
# CONFIG_ATA_OVER_ETH is not set
CONFIG_VIRTIO_BLK=y
CONFIG_BLK_DEV_RBD=y

#
# NVME Support
#
CONFIG_NVME_CORE=y
# CONFIG_NVME_MULTIPATH is not set
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
CONFIG_NVME_TCP=y
CONFIG_NVME_TARGET=y
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=y
# CONFIG_NVME_TARGET_FC is not set
CONFIG_NVME_TARGET_TCP=y
# end of NVME Support

#
# Misc devices
#
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
# CONFIG_AD525X_DPOT_SPI is not set
CONFIG_DUMMY_IRQ=y
CONFIG_ICS932S401=y
CONFIG_ATMEL_SSC=y
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_GEHC_ACHC is not set
CONFIG_HI6421V600_IRQ=y
CONFIG_QCOM_COINCELL=y
# CONFIG_APDS9802ALS is not set
CONFIG_ISL29003=y
CONFIG_ISL29020=y
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=y
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
CONFIG_DS1682=y
# CONFIG_LATTICE_ECP3_CONFIG is not set
CONFIG_SRAM=y
CONFIG_XILINX_SDFEC=y
CONFIG_HISI_HIKEY_USB=y
CONFIG_C2PORT=y

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
CONFIG_EEPROM_AT25=y
CONFIG_EEPROM_LEGACY=y
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_93XX46=y
CONFIG_EEPROM_IDT_89HPESX=y
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_SPI is not set
# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
# CONFIG_ECHO is not set
# CONFIG_MISC_RTSX_USB is not set
CONFIG_UACCE=y
CONFIG_PVPANIC=y
CONFIG_PVPANIC_MMIO=y
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y

#
# SCSI support type (disk, tape, CD-ROM)
#
# CONFIG_BLK_DEV_SD is not set
# CONFIG_CHR_DEV_ST is not set
CONFIG_BLK_DEV_SR=y
CONFIG_CHR_DEV_SG=y
CONFIG_BLK_DEV_BSG=y
CONFIG_CHR_DEV_SCH=y
CONFIG_SCSI_ENCLOSURE=y
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
CONFIG_SCSI_FC_ATTRS=y
CONFIG_SCSI_ISCSI_ATTRS=y
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
CONFIG_SCSI_SAS_ATA=y
# CONFIG_SCSI_SAS_HOST_SMP is not set
# CONFIG_SCSI_SRP_ATTRS is not set
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
CONFIG_ISCSI_TCP=y
CONFIG_ISCSI_BOOT_SYSFS=y
# CONFIG_SCSI_HISI_SAS is not set
# CONFIG_SCSI_UFSHCD is not set
CONFIG_SCSI_UFS_TI_J721E=y
# CONFIG_LIBFC is not set
CONFIG_SCSI_DEBUG=y
CONFIG_SCSI_VIRTIO=y
CONFIG_SCSI_DH=y
# CONFIG_SCSI_DH_RDAC is not set
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
# CONFIG_SCSI_DH_ALUA is not set
# end of SCSI device support

CONFIG_ATA=y
CONFIG_SATA_HOST=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI_PLATFORM=y
# CONFIG_AHCI_IMX is not set
CONFIG_AHCI_CEVA=y
CONFIG_AHCI_XGENE=y
# CONFIG_AHCI_QORIQ is not set
CONFIG_SATA_GEMINI=y
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_SATA_HIGHBANK=y
CONFIG_SATA_MV=y
# CONFIG_SATA_RCAR is not set

#
# PATA SFF controllers with BMDMA
#

#
# PIO-only SFF controllers
#
CONFIG_PATA_IXP4XX_CF=y
CONFIG_PATA_PLATFORM=y
# CONFIG_PATA_OF_PLATFORM is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_MD is not set
CONFIG_TARGET_CORE=y
# CONFIG_TCM_IBLOCK is not set
CONFIG_TCM_FILEIO=y
CONFIG_TCM_PSCSI=y
# CONFIG_LOOPBACK_TARGET is not set
CONFIG_ISCSI_TARGET=y
CONFIG_SBP_TARGET=y

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
CONFIG_FIREWIRE_SBP2=y
CONFIG_FIREWIRE_NET=y
# end of IEEE 1394 (FireWire) support

# CONFIG_NETDEVICES is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
# CONFIG_MOUSE_PS2_ALPS is not set
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
# CONFIG_MOUSE_PS2_ELANTECH_SMBUS is not set
# CONFIG_MOUSE_PS2_SENTELIC is not set
CONFIG_MOUSE_PS2_TOUCHKIT=y
# CONFIG_MOUSE_PS2_FOCALTECH is not set
CONFIG_MOUSE_PS2_SMBUS=y
# CONFIG_MOUSE_SERIAL is not set
CONFIG_MOUSE_APPLETOUCH=y
# CONFIG_MOUSE_BCM5974 is not set
# CONFIG_MOUSE_CYAPA is not set
# CONFIG_MOUSE_ELAN_I2C is not set
CONFIG_MOUSE_VSXXXAA=y
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=y
CONFIG_MOUSE_SYNAPTICS_USB=y
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=y
CONFIG_TABLET_USB_AIPTEK=y
# CONFIG_TABLET_USB_HANWANG is not set
CONFIG_TABLET_USB_KBTAB=y
CONFIG_TABLET_USB_PEGASUS=y
CONFIG_TABLET_SERIAL_WACOM4=y
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_TOUCHSCREEN_FTS is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_88PM80X_ONKEY is not set
CONFIG_INPUT_AD714X=y
CONFIG_INPUT_AD714X_I2C=y
# CONFIG_INPUT_AD714X_SPI is not set
CONFIG_INPUT_ARIEL_PWRBUTTON=y
# CONFIG_INPUT_ATMEL_CAPTOUCH is not set
CONFIG_INPUT_BMA150=y
CONFIG_INPUT_E3X0_BUTTON=y
CONFIG_INPUT_PM8XXX_VIBRATOR=y
CONFIG_INPUT_PMIC8XXX_PWRKEY=y
# CONFIG_INPUT_MAX77650_ONKEY is not set
# CONFIG_INPUT_MAX77693_HAPTIC is not set
CONFIG_INPUT_MAX8925_ONKEY=y
# CONFIG_INPUT_MAX8997_HAPTIC is not set
CONFIG_INPUT_MC13783_PWRBUTTON=y
CONFIG_INPUT_MMA8450=y
CONFIG_INPUT_GPIO_BEEPER=y
# CONFIG_INPUT_GPIO_DECODER is not set
CONFIG_INPUT_GPIO_VIBRA=y
# CONFIG_INPUT_CPCAP_PWRBUTTON is not set
CONFIG_INPUT_ATI_REMOTE2=y
CONFIG_INPUT_KEYSPAN_REMOTE=y
CONFIG_INPUT_KXTJ9=y
# CONFIG_INPUT_POWERMATE is not set
# CONFIG_INPUT_YEALINK is not set
CONFIG_INPUT_CM109=y
CONFIG_INPUT_REGULATOR_HAPTIC=y
CONFIG_INPUT_TPS65218_PWRBUTTON=y
# CONFIG_INPUT_AXP20X_PEK is not set
# CONFIG_INPUT_TWL6040_VIBRA is not set
CONFIG_INPUT_UINPUT=y
CONFIG_INPUT_PCF50633_PMU=y
CONFIG_INPUT_PCF8574=y
CONFIG_INPUT_PWM_BEEPER=y
CONFIG_INPUT_PWM_VIBRA=y
CONFIG_INPUT_GPIO_ROTARY_ENCODER=y
CONFIG_INPUT_DA7280_HAPTICS=y
CONFIG_INPUT_DA9052_ONKEY=y
CONFIG_INPUT_DA9055_ONKEY=y
CONFIG_INPUT_DA9063_ONKEY=y
CONFIG_INPUT_WM831X_ON=y
CONFIG_INPUT_PCAP=y
# CONFIG_INPUT_ADXL34X is not set
CONFIG_INPUT_IMS_PCU=y
CONFIG_INPUT_IQS269A=y
CONFIG_INPUT_IQS626A=y
CONFIG_INPUT_CMA3000=y
CONFIG_INPUT_CMA3000_I2C=y
CONFIG_INPUT_DRV260X_HAPTICS=y
# CONFIG_INPUT_DRV2665_HAPTICS is not set
# CONFIG_INPUT_DRV2667_HAPTICS is not set
CONFIG_INPUT_HISI_POWERKEY=y
CONFIG_INPUT_SC27XX_VIBRA=y
CONFIG_INPUT_STPMIC1_ONKEY=y
CONFIG_RMI4_CORE=y
# CONFIG_RMI4_I2C is not set
# CONFIG_RMI4_SPI is not set
CONFIG_RMI4_SMB=y
# CONFIG_RMI4_F03 is not set
CONFIG_RMI4_2D_SENSOR=y
# CONFIG_RMI4_F11 is not set
CONFIG_RMI4_F12=y
# CONFIG_RMI4_F30 is not set
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_PARKBD=y
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_APBPS2 is not set
CONFIG_SERIO_OLPC_APSP=y
CONFIG_SERIO_SUN4I_PS2=y
CONFIG_SERIO_GPIO_PS2=y
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
CONFIG_GAMEPORT_L4=y
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
# CONFIG_UNIX98_PTYS is not set
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
# CONFIG_SERIAL_8250 is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_AMBA_PL010 is not set
CONFIG_SERIAL_ATMEL=y
CONFIG_SERIAL_ATMEL_CONSOLE=y
# CONFIG_SERIAL_ATMEL_PDC is not set
CONFIG_SERIAL_ATMEL_TTYAT=y
CONFIG_SERIAL_MESON=y
# CONFIG_SERIAL_MESON_CONSOLE is not set
CONFIG_SERIAL_CLPS711X=y
CONFIG_SERIAL_CLPS711X_CONSOLE=y
CONFIG_SERIAL_SAMSUNG=y
CONFIG_SERIAL_SAMSUNG_UARTS_4=y
CONFIG_SERIAL_SAMSUNG_UARTS=4
CONFIG_SERIAL_SAMSUNG_CONSOLE=y
CONFIG_SERIAL_TEGRA=y
CONFIG_SERIAL_MAX3100=y
CONFIG_SERIAL_MAX310X=y
# CONFIG_SERIAL_IMX is not set
CONFIG_SERIAL_IMX_EARLYCON=y
CONFIG_SERIAL_UARTLITE=y
# CONFIG_SERIAL_UARTLITE_CONSOLE is not set
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_SH_SCI=y
CONFIG_SERIAL_SH_SCI_NR_UARTS=3
CONFIG_SERIAL_SH_SCI_CONSOLE=y
# CONFIG_SERIAL_SH_SCI_EARLYCON is not set
CONFIG_SERIAL_HS_LPC32XX=y
CONFIG_SERIAL_HS_LPC32XX_CONSOLE=y
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_MSM=y
CONFIG_SERIAL_MSM_CONSOLE=y
# CONFIG_SERIAL_VT8500 is not set
CONFIG_SERIAL_OMAP=y
# CONFIG_SERIAL_OMAP_CONSOLE is not set
CONFIG_SERIAL_SIFIVE=y
# CONFIG_SERIAL_SIFIVE_CONSOLE is not set
# CONFIG_SERIAL_LANTIQ is not set
CONFIG_SERIAL_QE=y
CONFIG_SERIAL_SCCNXP=y
# CONFIG_SERIAL_SCCNXP_CONSOLE is not set
# CONFIG_SERIAL_SC16IS7XX is not set
CONFIG_SERIAL_TIMBERDALE=y
CONFIG_SERIAL_BCM63XX=y
# CONFIG_SERIAL_BCM63XX_CONSOLE is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
CONFIG_SERIAL_MXS_AUART=y
CONFIG_SERIAL_MXS_AUART_CONSOLE=y
# CONFIG_SERIAL_XILINX_PS_UART is not set
# CONFIG_SERIAL_MPS2_UART is not set
CONFIG_SERIAL_ARC=y
# CONFIG_SERIAL_ARC_CONSOLE is not set
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_FSL_LPUART is not set
CONFIG_SERIAL_CONEXANT_DIGICOLOR=y
CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE=y
# CONFIG_SERIAL_ST_ASC is not set
# CONFIG_SERIAL_MEN_Z135 is not set
CONFIG_SERIAL_SPRD=y
# CONFIG_SERIAL_SPRD_CONSOLE is not set
CONFIG_SERIAL_STM32=y
# CONFIG_SERIAL_STM32_CONSOLE is not set
CONFIG_SERIAL_MVEBU_UART=y
# CONFIG_SERIAL_MVEBU_CONSOLE is not set
CONFIG_SERIAL_OWL=y
CONFIG_SERIAL_OWL_CONSOLE=y
# CONFIG_SERIAL_RDA is not set
# CONFIG_SERIAL_MILBEAUT_USIO is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_N_GSM=y
CONFIG_NULL_TTY=y
CONFIG_HVC_DRIVER=y
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_TTY_PRINTK=y
CONFIG_TTY_PRINTK_LEVEL=6
# CONFIG_PRINTER is not set
CONFIG_PPDEV=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=y
CONFIG_IPMI_SI=y
# CONFIG_IPMI_SSIF is not set
CONFIG_IPMI_WATCHDOG=y
# CONFIG_IPMI_POWEROFF is not set
CONFIG_IPMI_KCS_BMC=y
CONFIG_ASPEED_KCS_IPMI_BMC=y
CONFIG_NPCM7XX_KCS_IPMI_BMC=y
CONFIG_IPMI_KCS_BMC_CDEV_IPMI=y
CONFIG_IPMI_KCS_BMC_SERIO=y
# CONFIG_ASPEED_BT_IPMI_BMC is not set
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_IXP4XX=y
# CONFIG_HW_RANDOM_VIRTIO is not set
CONFIG_HW_RANDOM_IMX_RNGC=y
# CONFIG_HW_RANDOM_STM32 is not set
CONFIG_HW_RANDOM_MESON=y
CONFIG_HW_RANDOM_MTK=y
CONFIG_HW_RANDOM_EXYNOS=y
CONFIG_HW_RANDOM_NPCM=y
CONFIG_HW_RANDOM_KEYSTONE=y
CONFIG_HW_RANDOM_CCTRNG=y
CONFIG_HW_RANDOM_XIPHERA=y
# CONFIG_DEVMEM is not set
# CONFIG_TCG_TPM is not set
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
CONFIG_XILLYBUS_OF=y
CONFIG_XILLYUSB=y
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
# CONFIG_I2C_MUX_GPIO is not set
CONFIG_I2C_MUX_GPMUX=y
CONFIG_I2C_MUX_LTC4306=y
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_PINCTRL=y
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_DEMUX_PINCTRL=y
CONFIG_I2C_MUX_MLXCPLD=y
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#
CONFIG_I2C_HIX5HD2=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ALTERA is not set
# CONFIG_I2C_ASPEED is not set
CONFIG_I2C_AT91=y
CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL=y
CONFIG_I2C_AXXIA=y
CONFIG_I2C_BCM2835=y
CONFIG_I2C_BCM_IPROC=y
CONFIG_I2C_BCM_KONA=y
# CONFIG_I2C_BRCMSTB is not set
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DAVINCI=y
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DIGICOLOR is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_EXYNOS5 is not set
CONFIG_I2C_GPIO=y
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
# CONFIG_I2C_HIGHLANDER is not set
CONFIG_I2C_HISI=y
CONFIG_I2C_IMG=y
# CONFIG_I2C_IMX_LPI2C is not set
CONFIG_I2C_IMX_FLEXIO=y
# CONFIG_I2C_IOP3XX is not set
CONFIG_I2C_JZ4780=y
CONFIG_I2C_LPC2K=y
CONFIG_I2C_MESON=y
CONFIG_I2C_MT65XX=y
CONFIG_I2C_MT7621=y
CONFIG_I2C_MV64XXX=y
CONFIG_I2C_MXS=y
# CONFIG_I2C_NPCM7XX is not set
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_OMAP is not set
# CONFIG_I2C_OWL is not set
CONFIG_I2C_PCA_PLATFORM=y
CONFIG_I2C_PNX=y
CONFIG_I2C_PXA=y
CONFIG_I2C_PXA_SLAVE=y
# CONFIG_I2C_QCOM_CCI is not set
CONFIG_I2C_RIIC=y
# CONFIG_I2C_RK3X is not set
# CONFIG_I2C_S3C2410 is not set
# CONFIG_I2C_SH_MOBILE is not set
CONFIG_I2C_SIMTEC=y
# CONFIG_I2C_SPRD is not set
CONFIG_I2C_ST=y
CONFIG_I2C_STM32F4=y
CONFIG_I2C_STM32F7=y
CONFIG_I2C_SUN6I_P2WI=y
CONFIG_I2C_SYNQUACER=y
CONFIG_I2C_TEGRA_BPMP=y
CONFIG_I2C_UNIPHIER=y
CONFIG_I2C_UNIPHIER_F=y
CONFIG_I2C_VERSATILE=y
CONFIG_I2C_WMT=y
CONFIG_I2C_XILINX=y
CONFIG_I2C_XLR=y
CONFIG_I2C_XLP9XX=y
CONFIG_I2C_RCAR=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
# CONFIG_I2C_DLN2 is not set
CONFIG_I2C_CP2615=y
CONFIG_I2C_PARPORT=y
CONFIG_I2C_ROBOTFUZZ_OSIF=y
CONFIG_I2C_TAOS_EVM=y
CONFIG_I2C_TINY_USB=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=y
CONFIG_I2C_CROS_EC_TUNNEL=y
# CONFIG_I2C_FSI is not set
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_SLAVE_TESTUNIT=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=y
CONFIG_DW_I3C_MASTER=y
# CONFIG_SVC_I3C_MASTER is not set
# CONFIG_MIPI_I3C_HCI is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=y
CONFIG_SPI_ALTERA_CORE=y
# CONFIG_SPI_AR934X is not set
CONFIG_SPI_ATH79=y
# CONFIG_SPI_ARMADA_3700 is not set
CONFIG_SPI_ATMEL=y
# CONFIG_SPI_AT91_USART is not set
CONFIG_SPI_ATMEL_QUADSPI=y
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BCM2835 is not set
CONFIG_SPI_BCM2835AUX=y
CONFIG_SPI_BCM63XX=y
CONFIG_SPI_BCM63XX_HSSPI=y
CONFIG_SPI_BCM_QSPI=y
CONFIG_SPI_BITBANG=y
CONFIG_SPI_BUTTERFLY=y
CONFIG_SPI_CADENCE=y
CONFIG_SPI_CADENCE_QUADSPI=y
CONFIG_SPI_CLPS711X=y
CONFIG_SPI_DESIGNWARE=y
# CONFIG_SPI_DW_DMA is not set
# CONFIG_SPI_DW_MMIO is not set
CONFIG_SPI_DW_BT1=y
CONFIG_SPI_DW_BT1_DIRMAP=y
CONFIG_SPI_DLN2=y
# CONFIG_SPI_EP93XX is not set
CONFIG_SPI_FSI=y
CONFIG_SPI_FSL_LPSPI=y
# CONFIG_SPI_FSL_QUADSPI is not set
# CONFIG_SPI_HISI_KUNPENG is not set
# CONFIG_SPI_HISI_SFC_V3XX is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_GPIO is not set
CONFIG_SPI_IMG_SPFI=y
CONFIG_SPI_IMX=y
CONFIG_SPI_JCORE=y
CONFIG_SPI_LM70_LLP=y
CONFIG_SPI_LP8841_RTC=y
CONFIG_SPI_FSL_LIB=y
CONFIG_SPI_FSL_SPI=y
CONFIG_SPI_FSL_DSPI=y
# CONFIG_SPI_MESON_SPICC is not set
# CONFIG_SPI_MESON_SPIFC is not set
CONFIG_SPI_MT65XX=y
CONFIG_SPI_MT7621=y
CONFIG_SPI_MTK_NOR=y
CONFIG_SPI_NPCM_FIU=y
# CONFIG_SPI_NPCM_PSPI is not set
CONFIG_SPI_LANTIQ_SSC=y
CONFIG_SPI_OC_TINY=y
CONFIG_SPI_OMAP24XX=y
CONFIG_SPI_TI_QSPI=y
# CONFIG_SPI_OMAP_100K is not set
CONFIG_SPI_ORION=y
# CONFIG_SPI_PIC32 is not set
CONFIG_SPI_PIC32_SQI=y
# CONFIG_SPI_PXA2XX is not set
CONFIG_SPI_ROCKCHIP=y
# CONFIG_SPI_ROCKCHIP_SFC is not set
CONFIG_SPI_RPCIF=y
CONFIG_SPI_RSPI=y
CONFIG_SPI_QUP=y
CONFIG_SPI_S3C64XX=y
CONFIG_SPI_SC18IS602=y
CONFIG_SPI_SH_MSIOF=y
CONFIG_SPI_SH=y
CONFIG_SPI_SH_HSPI=y
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_SPRD is not set
CONFIG_SPI_SPRD_ADI=y
CONFIG_SPI_STM32=y
CONFIG_SPI_STM32_QSPI=y
# CONFIG_SPI_ST_SSC4 is not set
CONFIG_SPI_SUN4I=y
CONFIG_SPI_SUN6I=y
CONFIG_SPI_SYNQUACER=y
CONFIG_SPI_MXIC=y
CONFIG_SPI_TEGRA210_QUAD=y
# CONFIG_SPI_TEGRA114 is not set
# CONFIG_SPI_TEGRA20_SFLASH is not set
CONFIG_SPI_TEGRA20_SLINK=y
CONFIG_SPI_UNIPHIER=y
# CONFIG_SPI_XCOMM is not set
CONFIG_SPI_XILINX=y
# CONFIG_SPI_XLP is not set
# CONFIG_SPI_XTENSA_XTFPGA is not set
# CONFIG_SPI_ZYNQ_QSPI is not set
CONFIG_SPI_ZYNQMP_GQSPI=y
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
CONFIG_SPI_MUX=y

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
CONFIG_SPI_TLE62X0=y
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
CONFIG_SPMI=y
CONFIG_SPMI_HISI3670=y
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
# CONFIG_PPS is not set

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
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AXP209 is not set
CONFIG_PINCTRL_AT91PIO4=y
CONFIG_PINCTRL_AMD=y
CONFIG_PINCTRL_BM1880=y
CONFIG_PINCTRL_DA850_PUPD=y
# CONFIG_PINCTRL_DA9062 is not set
CONFIG_PINCTRL_LPC18XX=y
CONFIG_PINCTRL_MCP23S08_I2C=y
CONFIG_PINCTRL_MCP23S08_SPI=y
CONFIG_PINCTRL_MCP23S08=y
CONFIG_PINCTRL_ROCKCHIP=y
# CONFIG_PINCTRL_SINGLE is not set
CONFIG_PINCTRL_SX150X=y
# CONFIG_PINCTRL_PISTACHIO is not set
# CONFIG_PINCTRL_STMFX is not set
CONFIG_PINCTRL_MAX77620=y
CONFIG_PINCTRL_INGENIC=y
# CONFIG_PINCTRL_OCELOT is not set
# CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
CONFIG_PINCTRL_OWL=y
# CONFIG_PINCTRL_S500 is not set
CONFIG_PINCTRL_S700=y
# CONFIG_PINCTRL_S900 is not set
CONFIG_PINCTRL_ASPEED=y
# CONFIG_PINCTRL_ASPEED_G4 is not set
# CONFIG_PINCTRL_ASPEED_G5 is not set
CONFIG_PINCTRL_ASPEED_G6=y
# CONFIG_PINCTRL_BCM281XX is not set
CONFIG_PINCTRL_BCM2835=y
CONFIG_PINCTRL_BCM63XX=y
CONFIG_PINCTRL_BCM6318=y
CONFIG_PINCTRL_BCM6328=y
CONFIG_PINCTRL_BCM6358=y
CONFIG_PINCTRL_BCM6362=y
# CONFIG_PINCTRL_BCM6368 is not set
CONFIG_PINCTRL_BCM63268=y
# CONFIG_PINCTRL_IPROC_GPIO is not set
# CONFIG_PINCTRL_CYGNUS_MUX is not set
# CONFIG_PINCTRL_NS is not set
# CONFIG_PINCTRL_NSP_GPIO is not set
CONFIG_PINCTRL_NS2_MUX=y
CONFIG_PINCTRL_NSP_MUX=y
CONFIG_PINCTRL_BERLIN=y
CONFIG_PINCTRL_AS370=y
# CONFIG_PINCTRL_BERLIN_BG4CT is not set
# CONFIG_PINCTRL_S32V_CORE is not set
CONFIG_PINCTRL_NPCM7XX=y
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
# CONFIG_PINCTRL_RENESAS is not set
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
# CONFIG_PINCTRL_PFC_EMEV2 is not set
CONFIG_PINCTRL_PFC_R8A77995=y
CONFIG_PINCTRL_PFC_R8A7794=y
CONFIG_PINCTRL_PFC_R8A77990=y
# CONFIG_PINCTRL_PFC_R8A7779 is not set
# CONFIG_PINCTRL_PFC_R8A7790 is not set
# CONFIG_PINCTRL_PFC_R8A77950 is not set
# CONFIG_PINCTRL_PFC_R8A77951 is not set
# CONFIG_PINCTRL_PFC_R8A7778 is not set
CONFIG_PINCTRL_PFC_R8A7793=y
CONFIG_PINCTRL_PFC_R8A7791=y
CONFIG_PINCTRL_PFC_R8A77965=y
# CONFIG_PINCTRL_PFC_R8A77960 is not set
CONFIG_PINCTRL_PFC_R8A77961=y
CONFIG_PINCTRL_PFC_R8A7792=y
CONFIG_PINCTRL_PFC_R8A77980=y
CONFIG_PINCTRL_PFC_R8A77970=y
CONFIG_PINCTRL_PFC_R8A779A0=y
# CONFIG_PINCTRL_PFC_R8A7740 is not set
CONFIG_PINCTRL_PFC_R8A73A4=y
# CONFIG_PINCTRL_RZA1 is not set
# CONFIG_PINCTRL_RZA2 is not set
# CONFIG_PINCTRL_RZG2L is not set
CONFIG_PINCTRL_PFC_R8A77470=y
CONFIG_PINCTRL_PFC_R8A7745=y
CONFIG_PINCTRL_PFC_R8A7742=y
CONFIG_PINCTRL_PFC_R8A7743=y
# CONFIG_PINCTRL_PFC_R8A7744 is not set
CONFIG_PINCTRL_PFC_R8A774C0=y
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
# CONFIG_PINCTRL_PFC_R8A774A1 is not set
CONFIG_PINCTRL_PFC_R8A774B1=y
# CONFIG_PINCTRL_RZN1 is not set
# CONFIG_PINCTRL_PFC_SH7203 is not set
# CONFIG_PINCTRL_PFC_SH7264 is not set
# CONFIG_PINCTRL_PFC_SH7269 is not set
# CONFIG_PINCTRL_PFC_SH7720 is not set
CONFIG_PINCTRL_PFC_SH7722=y
CONFIG_PINCTRL_PFC_SH7734=y
CONFIG_PINCTRL_PFC_SH7757=y
# CONFIG_PINCTRL_PFC_SH7785 is not set
# CONFIG_PINCTRL_PFC_SH7786 is not set
CONFIG_PINCTRL_PFC_SH73A0=y
CONFIG_PINCTRL_PFC_SH7723=y
# CONFIG_PINCTRL_PFC_SH7724 is not set
CONFIG_PINCTRL_PFC_SHX3=y
# end of Renesas pinctrl drivers

CONFIG_PINCTRL_SAMSUNG=y
# CONFIG_PINCTRL_EXYNOS is not set
# CONFIG_PINCTRL_S3C24XX is not set
CONFIG_PINCTRL_S3C64XX=y
CONFIG_PINCTRL_SPRD=y
CONFIG_PINCTRL_SPRD_SC9860=y
CONFIG_PINCTRL_STM32=y
CONFIG_PINCTRL_STM32F429=y
CONFIG_PINCTRL_STM32F469=y
CONFIG_PINCTRL_STM32F746=y
# CONFIG_PINCTRL_STM32F769 is not set
# CONFIG_PINCTRL_STM32H743 is not set
CONFIG_PINCTRL_STM32MP135=y
CONFIG_PINCTRL_STM32MP157=y
CONFIG_PINCTRL_TI_IODELAY=y
CONFIG_PINCTRL_UNIPHIER=y
CONFIG_PINCTRL_UNIPHIER_LD4=y
# CONFIG_PINCTRL_UNIPHIER_PRO4 is not set
CONFIG_PINCTRL_UNIPHIER_SLD8=y
# CONFIG_PINCTRL_UNIPHIER_PRO5 is not set
CONFIG_PINCTRL_UNIPHIER_PXS2=y
CONFIG_PINCTRL_UNIPHIER_LD6B=y
# CONFIG_PINCTRL_UNIPHIER_LD11 is not set
# CONFIG_PINCTRL_UNIPHIER_LD20 is not set
CONFIG_PINCTRL_UNIPHIER_PXS3=y

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
CONFIG_PINCTRL_MTK_V2=y
CONFIG_PINCTRL_MTK_MOORE=y
CONFIG_PINCTRL_MTK_PARIS=y
CONFIG_PINCTRL_MT2701=y
CONFIG_PINCTRL_MT7623=y
CONFIG_PINCTRL_MT7629=y
# CONFIG_PINCTRL_MT8135 is not set
# CONFIG_PINCTRL_MT8127 is not set
CONFIG_PINCTRL_MT2712=y
# CONFIG_PINCTRL_MT6765 is not set
CONFIG_PINCTRL_MT6779=y
CONFIG_PINCTRL_MT6797=y
# CONFIG_PINCTRL_MT7622 is not set
CONFIG_PINCTRL_MT8167=y
# CONFIG_PINCTRL_MT8173 is not set
# CONFIG_PINCTRL_MT8183 is not set
CONFIG_PINCTRL_MT8192=y
# CONFIG_PINCTRL_MT8195 is not set
CONFIG_PINCTRL_MT8365=y
CONFIG_PINCTRL_MT8516=y
CONFIG_PINCTRL_MT6397=y
# end of MediaTek pinctrl drivers

# CONFIG_PINCTRL_TMPV7700 is not set
# CONFIG_PINCTRL_EQUILIBRIUM is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
# CONFIG_GPIO_SYSFS is not set
# CONFIG_GPIO_CDEV is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
CONFIG_GPIO_ALTERA=y
# CONFIG_GPIO_ASPEED is not set
# CONFIG_GPIO_ASPEED_SGPIO is not set
CONFIG_GPIO_ATH79=y
CONFIG_GPIO_RASPBERRYPI_EXP=y
CONFIG_GPIO_BCM_KONA=y
CONFIG_GPIO_BCM_XGS_IPROC=y
CONFIG_GPIO_BRCMSTB=y
CONFIG_GPIO_CADENCE=y
# CONFIG_GPIO_CLPS711X is not set
CONFIG_GPIO_DWAPB=y
CONFIG_GPIO_EIC_SPRD=y
CONFIG_GPIO_EM=y
CONFIG_GPIO_FTGPIO010=y
CONFIG_GPIO_GENERIC_PLATFORM=y
# CONFIG_GPIO_GRGPIO is not set
CONFIG_GPIO_HISI=y
# CONFIG_GPIO_HLWD is not set
CONFIG_GPIO_IOP=y
CONFIG_GPIO_LOGICVC=y
# CONFIG_GPIO_LPC18XX is not set
CONFIG_GPIO_LPC32XX=y
CONFIG_GPIO_MB86S7X=y
CONFIG_GPIO_MENZ127=y
CONFIG_GPIO_MPC8XXX=y
# CONFIG_GPIO_MT7621 is not set
CONFIG_GPIO_MXC=y
# CONFIG_GPIO_MXS is not set
CONFIG_GPIO_PMIC_EIC_SPRD=y
CONFIG_GPIO_PXA=y
CONFIG_GPIO_RCAR=y
# CONFIG_GPIO_RDA is not set
# CONFIG_GPIO_ROCKCHIP is not set
# CONFIG_GPIO_SAMA5D2_PIOBU is not set
CONFIG_GPIO_SIFIVE=y
CONFIG_GPIO_SIOX=y
# CONFIG_GPIO_SNPS_CREG is not set
# CONFIG_GPIO_SPRD is not set
# CONFIG_GPIO_STP_XWAY is not set
CONFIG_GPIO_SYSCON=y
# CONFIG_GPIO_TEGRA is not set
# CONFIG_GPIO_TEGRA186 is not set
CONFIG_GPIO_TS4800=y
CONFIG_GPIO_UNIPHIER=y
# CONFIG_GPIO_VISCONTI is not set
CONFIG_GPIO_WCD934X=y
CONFIG_GPIO_XGENE_SB=y
CONFIG_GPIO_XILINX=y
CONFIG_GPIO_XLP=y
CONFIG_GPIO_AMD_FCH=y
# CONFIG_GPIO_IDT3243X is not set
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
CONFIG_GPIO_ADNP=y
# CONFIG_GPIO_GW_PLD is not set
CONFIG_GPIO_MAX7300=y
# CONFIG_GPIO_MAX732X is not set
CONFIG_GPIO_PCA953X=y
# CONFIG_GPIO_PCA953X_IRQ is not set
CONFIG_GPIO_PCA9570=y
CONFIG_GPIO_PCF857X=y
# CONFIG_GPIO_TPIC2810 is not set
CONFIG_GPIO_TS4900=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=y
CONFIG_GPIO_ARIZONA=y
# CONFIG_GPIO_BD70528 is not set
CONFIG_GPIO_BD9571MWV=y
CONFIG_GPIO_DA9052=y
CONFIG_GPIO_DA9055=y
CONFIG_GPIO_DLN2=y
CONFIG_GPIO_LP3943=y
# CONFIG_GPIO_MAX77620 is not set
# CONFIG_GPIO_MAX77650 is not set
CONFIG_GPIO_SL28CPLD=y
# CONFIG_GPIO_TPS65086 is not set
# CONFIG_GPIO_TPS65910 is not set
CONFIG_GPIO_TWL6040=y
# CONFIG_GPIO_WM831X is not set
CONFIG_GPIO_WM8994=y
# end of MFD GPIO expanders

#
# SPI GPIO expanders
#
CONFIG_GPIO_74X164=y
CONFIG_GPIO_MAX3191X=y
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
CONFIG_GPIO_PISOSR=y
CONFIG_GPIO_XRA1403=y
CONFIG_GPIO_MOXTET=y
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
# CONFIG_GPIO_MOCKUP is not set
CONFIG_GPIO_VIRTIO=y
# end of Virtual GPIO drivers

CONFIG_W1=y
# CONFIG_W1_CON is not set

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_DS2490=y
CONFIG_W1_MASTER_DS2482=y
CONFIG_W1_MASTER_MXC=y
CONFIG_W1_MASTER_DS1WM=y
CONFIG_W1_MASTER_GPIO=y
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=y
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=y
CONFIG_W1_SLAVE_DS2408_READBACK=y
CONFIG_W1_SLAVE_DS2413=y
# CONFIG_W1_SLAVE_DS2406 is not set
# CONFIG_W1_SLAVE_DS2423 is not set
# CONFIG_W1_SLAVE_DS2805 is not set
CONFIG_W1_SLAVE_DS2430=y
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=y
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=y
# CONFIG_W1_SLAVE_DS250X is not set
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_POWER_SUPPLY_HWMON is not set
# CONFIG_PDA_POWER is not set
CONFIG_GENERIC_ADC_BATTERY=y
# CONFIG_MAX8925_POWER is not set
# CONFIG_WM831X_BACKUP is not set
CONFIG_WM831X_POWER=y
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
CONFIG_BATTERY_ACT8945A=y
# CONFIG_BATTERY_CPCAP is not set
CONFIG_BATTERY_CW2015=y
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
CONFIG_BATTERY_LEGO_EV3=y
CONFIG_BATTERY_INGENIC=y
CONFIG_BATTERY_SBS=y
# CONFIG_CHARGER_SBS is not set
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
CONFIG_BATTERY_BQ27XXX_HDQ=y
# CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
# CONFIG_BATTERY_DA9052 is not set
CONFIG_CHARGER_AXP20X=y
# CONFIG_BATTERY_AXP20X is not set
# CONFIG_AXP20X_POWER is not set
CONFIG_BATTERY_MAX17040=y
CONFIG_BATTERY_MAX17042=y
# CONFIG_BATTERY_MAX1721X is not set
CONFIG_CHARGER_PCF50633=y
# CONFIG_CHARGER_CPCAP is not set
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_LP8788=y
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_MANAGER is not set
# CONFIG_CHARGER_LT3651 is not set
CONFIG_CHARGER_LTC4162L=y
CONFIG_CHARGER_MAX14577=y
CONFIG_CHARGER_DETECTOR_MAX14656=y
CONFIG_CHARGER_MAX77650=y
CONFIG_CHARGER_MAX8998=y
CONFIG_CHARGER_QCOM_SMBB=y
CONFIG_CHARGER_BQ2415X=y
CONFIG_CHARGER_BQ24190=y
CONFIG_CHARGER_BQ24257=y
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_BQ25980=y
CONFIG_CHARGER_BQ256XX=y
# CONFIG_CHARGER_SMB347 is not set
CONFIG_CHARGER_TPS65090=y
CONFIG_CHARGER_TPS65217=y
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
# CONFIG_CHARGER_CROS_USBPD is not set
# CONFIG_CHARGER_CROS_PCHG is not set
# CONFIG_CHARGER_SC2731 is not set
CONFIG_FUEL_GAUGE_SC27XX=y
# CONFIG_CHARGER_UCS1002 is not set
CONFIG_CHARGER_BD99954=y
CONFIG_BATTERY_ACER_A500=y
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_AD7314=y
CONFIG_SENSORS_AD7414=y
CONFIG_SENSORS_AD7418=y
# CONFIG_SENSORS_ADM1021 is not set
CONFIG_SENSORS_ADM1025=y
# CONFIG_SENSORS_ADM1026 is not set
CONFIG_SENSORS_ADM1029=y
CONFIG_SENSORS_ADM1031=y
CONFIG_SENSORS_ADM1177=y
CONFIG_SENSORS_ADM9240=y
CONFIG_SENSORS_ADT7X10=y
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=y
# CONFIG_SENSORS_ADT7411 is not set
CONFIG_SENSORS_ADT7462=y
CONFIG_SENSORS_ADT7470=y
CONFIG_SENSORS_ADT7475=y
# CONFIG_SENSORS_AHT10 is not set
CONFIG_SENSORS_AQUACOMPUTER_D5NEXT=y
CONFIG_SENSORS_AS370=y
CONFIG_SENSORS_ASC7621=y
CONFIG_SENSORS_AXI_FAN_CONTROL=y
CONFIG_SENSORS_ARM_SCMI=y
CONFIG_SENSORS_ASPEED=y
CONFIG_SENSORS_ATXP1=y
CONFIG_SENSORS_BT1_PVT=y
CONFIG_SENSORS_BT1_PVT_ALARMS=y
CONFIG_SENSORS_CORSAIR_CPRO=y
# CONFIG_SENSORS_CORSAIR_PSU is not set
CONFIG_SENSORS_DRIVETEMP=y
# CONFIG_SENSORS_DS620 is not set
# CONFIG_SENSORS_DS1621 is not set
# CONFIG_SENSORS_DA9052_ADC is not set
CONFIG_SENSORS_DA9055=y
# CONFIG_SENSORS_SPARX5 is not set
CONFIG_SENSORS_F71805F=y
# CONFIG_SENSORS_F71882FG is not set
CONFIG_SENSORS_F75375S=y
CONFIG_SENSORS_GSC=y
CONFIG_SENSORS_MC13783_ADC=y
CONFIG_SENSORS_FTSTEUTATES=y
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=y
CONFIG_SENSORS_G760A=y
# CONFIG_SENSORS_G762 is not set
CONFIG_SENSORS_GPIO_FAN=y
CONFIG_SENSORS_HIH6130=y
CONFIG_SENSORS_IBMAEM=y
CONFIG_SENSORS_IBMPEX=y
# CONFIG_SENSORS_IIO_HWMON is not set
CONFIG_SENSORS_IT87=y
CONFIG_SENSORS_JC42=y
CONFIG_SENSORS_POWR1220=y
# CONFIG_SENSORS_LINEAGE is not set
CONFIG_SENSORS_LTC2945=y
CONFIG_SENSORS_LTC2947=y
CONFIG_SENSORS_LTC2947_I2C=y
CONFIG_SENSORS_LTC2947_SPI=y
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC2992=y
CONFIG_SENSORS_LTC4151=y
# CONFIG_SENSORS_LTC4215 is not set
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=y
CONFIG_SENSORS_LTC4260=y
CONFIG_SENSORS_LTC4261=y
# CONFIG_SENSORS_MAX1111 is not set
CONFIG_SENSORS_MAX127=y
# CONFIG_SENSORS_MAX16065 is not set
CONFIG_SENSORS_MAX1619=y
CONFIG_SENSORS_MAX1668=y
# CONFIG_SENSORS_MAX17135 is not set
# CONFIG_SENSORS_MAX197 is not set
CONFIG_SENSORS_MAX31722=y
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX6621 is not set
# CONFIG_SENSORS_MAX6639 is not set
CONFIG_SENSORS_MAX6642=y
# CONFIG_SENSORS_MAX6650 is not set
CONFIG_SENSORS_MAX6697=y
# CONFIG_SENSORS_MAX31790 is not set
# CONFIG_SENSORS_MCP3021 is not set
CONFIG_SENSORS_TC654=y
CONFIG_SENSORS_TPS23861=y
# CONFIG_SENSORS_MENF21BMC_HWMON is not set
CONFIG_SENSORS_MR75203=y
CONFIG_SENSORS_ADCXX=y
CONFIG_SENSORS_LM63=y
CONFIG_SENSORS_LM70=y
# CONFIG_SENSORS_LM73 is not set
CONFIG_SENSORS_LM75=y
# CONFIG_SENSORS_LM77 is not set
CONFIG_SENSORS_LM78=y
CONFIG_SENSORS_LM80=y
# CONFIG_SENSORS_LM83 is not set
CONFIG_SENSORS_LM85=y
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=y
CONFIG_SENSORS_LM92=y
CONFIG_SENSORS_LM93=y
# CONFIG_SENSORS_LM95234 is not set
CONFIG_SENSORS_LM95241=y
CONFIG_SENSORS_LM95245=y
# CONFIG_SENSORS_PC87360 is not set
# CONFIG_SENSORS_PC87427 is not set
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775=y
CONFIG_SENSORS_NCT7802=y
CONFIG_SENSORS_NCT7904=y
CONFIG_SENSORS_NPCM7XX=y
CONFIG_SENSORS_NSA320=y
CONFIG_SENSORS_NZXT_KRAKEN2=y
CONFIG_SENSORS_OCC_P8_I2C=y
CONFIG_SENSORS_OCC=y
# CONFIG_SENSORS_PCF8591 is not set
CONFIG_PMBUS=y
CONFIG_SENSORS_PMBUS=y
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=y
CONFIG_SENSORS_BEL_PFE=y
CONFIG_SENSORS_BPA_RS600=y
CONFIG_SENSORS_FSP_3Y=y
# CONFIG_SENSORS_IBM_CFFPS is not set
CONFIG_SENSORS_DPS920AB=y
CONFIG_SENSORS_INSPUR_IPSPS=y
# CONFIG_SENSORS_IR35221 is not set
CONFIG_SENSORS_IR36021=y
# CONFIG_SENSORS_IR38064 is not set
CONFIG_SENSORS_IRPS5401=y
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=y
CONFIG_SENSORS_LTC2978=y
CONFIG_SENSORS_LTC2978_REGULATOR=y
CONFIG_SENSORS_LTC3815=y
CONFIG_SENSORS_MAX15301=y
CONFIG_SENSORS_MAX16064=y
CONFIG_SENSORS_MAX16601=y
CONFIG_SENSORS_MAX20730=y
CONFIG_SENSORS_MAX20751=y
CONFIG_SENSORS_MAX31785=y
CONFIG_SENSORS_MAX34440=y
CONFIG_SENSORS_MAX8688=y
CONFIG_SENSORS_MP2888=y
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_PIM4328 is not set
CONFIG_SENSORS_PM6764TR=y
CONFIG_SENSORS_PXE1610=y
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
CONFIG_SENSORS_TPS40422=y
CONFIG_SENSORS_TPS53679=y
# CONFIG_SENSORS_UCD9000 is not set
# CONFIG_SENSORS_UCD9200 is not set
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=y
CONFIG_SENSORS_PWM_FAN=y
CONFIG_SENSORS_RASPBERRYPI_HWMON=y
CONFIG_SENSORS_SL28CPLD=y
CONFIG_SENSORS_SBTSI=y
CONFIG_SENSORS_SBRMI=y
# CONFIG_SENSORS_SHT15 is not set
# CONFIG_SENSORS_SHT21 is not set
CONFIG_SENSORS_SHT3x=y
CONFIG_SENSORS_SHT4x=y
CONFIG_SENSORS_SHTC1=y
CONFIG_SENSORS_DME1737=y
# CONFIG_SENSORS_EMC1403 is not set
CONFIG_SENSORS_EMC2103=y
CONFIG_SENSORS_EMC6W201=y
CONFIG_SENSORS_SMSC47M1=y
# CONFIG_SENSORS_SMSC47M192 is not set
# CONFIG_SENSORS_SMSC47B397 is not set
CONFIG_SENSORS_SCH56XX_COMMON=y
CONFIG_SENSORS_SCH5627=y
# CONFIG_SENSORS_SCH5636 is not set
CONFIG_SENSORS_STTS751=y
CONFIG_SENSORS_SMM665=y
# CONFIG_SENSORS_ADC128D818 is not set
# CONFIG_SENSORS_ADS7828 is not set
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=y
CONFIG_SENSORS_INA209=y
# CONFIG_SENSORS_INA2XX is not set
CONFIG_SENSORS_INA3221=y
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=y
CONFIG_SENSORS_TMP102=y
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=y
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VT1211=y
CONFIG_SENSORS_W83773G=y
# CONFIG_SENSORS_W83781D is not set
# CONFIG_SENSORS_W83791D is not set
CONFIG_SENSORS_W83792D=y
# CONFIG_SENSORS_W83793 is not set
CONFIG_SENSORS_W83795=y
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=y
# CONFIG_SENSORS_W83L786NG is not set
CONFIG_SENSORS_W83627HF=y
# CONFIG_SENSORS_W83627EHF is not set
# CONFIG_SENSORS_WM831X is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_NETLINK=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_HWMON is not set
# CONFIG_THERMAL_OF is not set
# CONFIG_THERMAL_WRITABLE_TRIPS is not set
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_EMULATION is not set
# CONFIG_THERMAL_MMIO is not set
CONFIG_HISI_THERMAL=y
CONFIG_IMX_THERMAL=y
CONFIG_IMX8MM_THERMAL=y
CONFIG_K3_THERMAL=y
# CONFIG_DEVICE_THERMAL is not set
CONFIG_MAX77620_THERMAL=y
CONFIG_SPEAR_THERMAL=y
CONFIG_SUN8I_THERMAL=y
CONFIG_ROCKCHIP_THERMAL=y
CONFIG_RCAR_THERMAL=y
# CONFIG_RCAR_GEN3_THERMAL is not set
CONFIG_KIRKWOOD_THERMAL=y
CONFIG_DOVE_THERMAL=y
# CONFIG_ARMADA_THERMAL is not set
CONFIG_DA9062_THERMAL=y
CONFIG_MTK_THERMAL=y

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
CONFIG_BRCMSTB_THERMAL=y
CONFIG_BCM_NS_THERMAL=y
# CONFIG_BCM_SR_THERMAL is not set
# end of Broadcom thermal drivers

#
# Texas Instruments thermal drivers
#
CONFIG_TI_SOC_THERMAL=y
CONFIG_TI_THERMAL=y
# CONFIG_OMAP3_THERMAL is not set
# CONFIG_OMAP4_THERMAL is not set
CONFIG_OMAP5_THERMAL=y
# CONFIG_DRA752_THERMAL is not set
# end of Texas Instruments thermal drivers

#
# Samsung thermal drivers
#
# end of Samsung thermal drivers

#
# NVIDIA Tegra thermal drivers
#
# CONFIG_TEGRA_SOCTHERM is not set
# CONFIG_TEGRA_BPMP_THERMAL is not set
# CONFIG_TEGRA30_TSENSOR is not set
# end of NVIDIA Tegra thermal drivers

CONFIG_GENERIC_ADC_THERMAL=y

#
# Qualcomm thermal drivers
#
CONFIG_QCOM_TSENS=y
# CONFIG_QCOM_SPMI_ADC_TM5 is not set
CONFIG_QCOM_SPMI_TEMP_ALARM=y
# end of Qualcomm thermal drivers

# CONFIG_SPRD_THERMAL is not set
# CONFIG_KHADAS_MCU_FAN_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
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
# CONFIG_SOFT_WATCHDOG is not set
# CONFIG_BD957XMUF_WATCHDOG is not set
CONFIG_DA9052_WATCHDOG=y
# CONFIG_DA9055_WATCHDOG is not set
CONFIG_DA9063_WATCHDOG=y
CONFIG_DA9062_WATCHDOG=y
CONFIG_GPIO_WATCHDOG=y
# CONFIG_GPIO_WATCHDOG_ARCH_INITCALL is not set
CONFIG_MENF21BMC_WATCHDOG=y
# CONFIG_MENZ069_WATCHDOG is not set
CONFIG_WM831X_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=y
CONFIG_SL28CPLD_WATCHDOG=y
CONFIG_ARMADA_37XX_WATCHDOG=y
CONFIG_ASM9260_WATCHDOG=y
CONFIG_AT91RM9200_WATCHDOG=y
CONFIG_AT91SAM9X_WATCHDOG=y
# CONFIG_SAMA5D4_WATCHDOG is not set
CONFIG_CADENCE_WATCHDOG=y
CONFIG_FTWDT010_WATCHDOG=y
CONFIG_S3C2410_WATCHDOG=y
# CONFIG_DW_WATCHDOG is not set
# CONFIG_EP93XX_WATCHDOG is not set
# CONFIG_OMAP_WATCHDOG is not set
CONFIG_PNX4008_WATCHDOG=y
CONFIG_DAVINCI_WATCHDOG=y
CONFIG_K3_RTI_WATCHDOG=y
CONFIG_RN5T618_WATCHDOG=y
CONFIG_SUNXI_WATCHDOG=y
CONFIG_NPCM7XX_WATCHDOG=y
CONFIG_STMP3XXX_RTC_WATCHDOG=y
# CONFIG_TS4800_WATCHDOG is not set
CONFIG_TS72XX_WATCHDOG=y
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_MAX77620_WATCHDOG=y
CONFIG_IMX2_WDT=y
# CONFIG_IMX7ULP_WDT is not set
CONFIG_MOXART_WDT=y
# CONFIG_ST_LPC_WATCHDOG is not set
# CONFIG_TEGRA_WATCHDOG is not set
CONFIG_QCOM_WDT=y
CONFIG_MESON_GXBB_WATCHDOG=y
# CONFIG_MESON_WATCHDOG is not set
CONFIG_MEDIATEK_WATCHDOG=y
CONFIG_DIGICOLOR_WATCHDOG=y
# CONFIG_LPC18XX_WATCHDOG is not set
# CONFIG_RENESAS_WDT is not set
CONFIG_RENESAS_RZAWDT=y
# CONFIG_ASPEED_WATCHDOG is not set
CONFIG_STPMIC1_WATCHDOG=y
# CONFIG_UNIPHIER_WATCHDOG is not set
CONFIG_RTD119X_WATCHDOG=y
CONFIG_SPRD_WATCHDOG=y
CONFIG_VISCONTI_WATCHDOG=y
CONFIG_MSC313E_WATCHDOG=y
CONFIG_SC520_WDT=y
CONFIG_BCM47XX_WDT=y
CONFIG_BCM2835_WDT=y
CONFIG_BCM_KONA_WDT=y
# CONFIG_BCM_KONA_WDT_DEBUG is not set
CONFIG_BCM7038_WDT=y
CONFIG_IMGPDC_WDT=y
# CONFIG_MPC5200_WDT is not set
CONFIG_MEN_A21_WDT=y
CONFIG_UML_WATCHDOG=y

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=y
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_MIPS=y
CONFIG_BCMA_PFLASH=y
# CONFIG_BCMA_SFLASH is not set
CONFIG_BCMA_NFLASH=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_ACT8945A=y
CONFIG_MFD_SUN4I_GPADC=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_AS3722 is not set
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_AT91_USART=y
CONFIG_MFD_ATMEL_FLEXCOM=y
CONFIG_MFD_ATMEL_HLCDC=y
CONFIG_MFD_ATMEL_SMC=y
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_CROS_EC_DEV=y
# CONFIG_MFD_MADERA is not set
CONFIG_MFD_ASIC3=y
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_SPI=y
# CONFIG_MFD_DA9052_I2C is not set
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=y
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_DLN2=y
# CONFIG_MFD_ENE_KB3930 is not set
# CONFIG_MFD_EXYNOS_LPASS is not set
CONFIG_MFD_GATEWORKS_GSC=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_SPI=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
# CONFIG_MFD_MXS_LRADC is not set
CONFIG_MFD_MX25_TSADC=y
# CONFIG_MFD_IMX_MIX is not set
# CONFIG_MFD_MXC_HDMI is not set
# CONFIG_MFD_HI6421_PMIC is not set
# CONFIG_MFD_HI6421_SPMI is not set
# CONFIG_MFD_HI655X_PMIC is not set
CONFIG_HTC_PASIC3=y
CONFIG_HTC_I2CPLD=y
CONFIG_MFD_IQS62X=y
# CONFIG_MFD_KEMPLD is not set
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=y
# CONFIG_MFD_MAX17135 is not set
# CONFIG_MFD_FP9931 is not set
CONFIG_MFD_MAX77620=y
CONFIG_MFD_MAX77650=y
CONFIG_MFD_MAX77686=y
# CONFIG_MFD_MAX77693 is not set
CONFIG_MFD_MAX77843=y
# CONFIG_MFD_MAX8907 is not set
CONFIG_MFD_MAX8925=y
CONFIG_MFD_MAX8997=y
CONFIG_MFD_MAX8998=y
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=y
CONFIG_EZX_PCAP=y
CONFIG_MFD_CPCAP=y
# CONFIG_MFD_VIPERBOARD is not set
CONFIG_MFD_NTXEC=y
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=y
# CONFIG_PCF50633_GPIO is not set
CONFIG_MFD_PM8XXX=y
# CONFIG_MFD_SPMI_PMIC is not set
CONFIG_MFD_RT4831=y
CONFIG_MFD_RT5033=y
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_RK808 is not set
# CONFIG_MFD_RN5T618 is not set
CONFIG_MFD_SEC_CORE=y
CONFIG_MFD_SI476X_CORE=y
# CONFIG_MFD_SL28CPLD is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
CONFIG_MFD_SC27XX_PMIC=y
CONFIG_ABX500_CORE=y
# CONFIG_MFD_STMPE is not set
CONFIG_MFD_SUN6I_PRCM=y
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_LP3943=y
CONFIG_MFD_LP8788=y
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TPS65217=y
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TI_LP87565 is not set
# CONFIG_MFD_TPS65218 is not set
# CONFIG_MFD_TPS6586X is not set
CONFIG_MFD_TPS65910=y
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
CONFIG_MFD_TPS80031=y
# CONFIG_TWL4030_CORE is not set
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
# CONFIG_MFD_TC3589X is not set
CONFIG_MFD_TQMX86=y
# CONFIG_MFD_LOCHNAGAR is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_ARIZONA_SPI=y
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
# CONFIG_MFD_WM8997 is not set
CONFIG_MFD_WM8998=y
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
# CONFIG_MFD_WM831X_I2C is not set
CONFIG_MFD_WM831X_SPI=y
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=y
CONFIG_MFD_STW481X=y
CONFIG_MFD_ROHM_BD718XX=y
CONFIG_MFD_ROHM_BD70528=y
# CONFIG_MFD_ROHM_BD71828 is not set
CONFIG_MFD_ROHM_BD957XMUF=y
CONFIG_MFD_STM32_LPTIMER=y
CONFIG_MFD_STM32_TIMERS=y
CONFIG_MFD_STPMIC1=y
CONFIG_MFD_STMFX=y
CONFIG_MFD_WCD934X=y
# CONFIG_MFD_ATC260X_I2C is not set
CONFIG_MFD_KHADAS_MCU=y
CONFIG_MFD_ACER_A500_EC=y
# CONFIG_MFD_QCOM_PM8008 is not set
# CONFIG_MFD_INTEL_M10_BMC is not set
CONFIG_MFD_RSMU_I2C=y
CONFIG_MFD_RSMU_SPI=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
# CONFIG_REGULATOR_88PG86X is not set
CONFIG_REGULATOR_88PM800=y
# CONFIG_REGULATOR_ACT8865 is not set
CONFIG_REGULATOR_ACT8945A=y
CONFIG_REGULATOR_AD5398=y
CONFIG_REGULATOR_ANATOP=y
CONFIG_REGULATOR_AAT2870=y
# CONFIG_REGULATOR_ARM_SCMI is not set
CONFIG_REGULATOR_AXP20X=y
CONFIG_REGULATOR_BCM590XX=y
# CONFIG_REGULATOR_BD718XX is not set
CONFIG_REGULATOR_BD9571MWV=y
# CONFIG_REGULATOR_BD957XMUF is not set
CONFIG_REGULATOR_CPCAP=y
CONFIG_REGULATOR_CROS_EC=y
CONFIG_REGULATOR_DA9052=y
# CONFIG_REGULATOR_DA9055 is not set
# CONFIG_REGULATOR_DA9062 is not set
CONFIG_REGULATOR_DA9121=y
CONFIG_REGULATOR_DA9210=y
# CONFIG_REGULATOR_DA9211 is not set
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_FAN53880=y
# CONFIG_REGULATOR_GPIO is not set
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=y
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
CONFIG_REGULATOR_LP872X=y
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LP8788=y
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
# CONFIG_REGULATOR_MAX14577 is not set
# CONFIG_REGULATOR_MAX1586 is not set
# CONFIG_REGULATOR_MAX77620 is not set
CONFIG_REGULATOR_MAX77650=y
CONFIG_REGULATOR_MAX8649=y
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8893=y
CONFIG_REGULATOR_MAX8907=y
CONFIG_REGULATOR_MAX8925=y
CONFIG_REGULATOR_MAX8952=y
# CONFIG_REGULATOR_MAX8997 is not set
CONFIG_REGULATOR_MAX8998=y
CONFIG_REGULATOR_MAX77686=y
CONFIG_REGULATOR_MAX77693=y
CONFIG_REGULATOR_MAX77802=y
# CONFIG_REGULATOR_MAX77826 is not set
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
CONFIG_REGULATOR_MC13892=y
CONFIG_REGULATOR_MCP16502=y
CONFIG_REGULATOR_MP5416=y
CONFIG_REGULATOR_MP8859=y
# CONFIG_REGULATOR_MP886X is not set
# CONFIG_REGULATOR_MPQ7920 is not set
CONFIG_REGULATOR_MT6311=y
# CONFIG_REGULATOR_MT6315 is not set
CONFIG_REGULATOR_PBIAS=y
CONFIG_REGULATOR_PCA9450=y
CONFIG_REGULATOR_PCAP=y
# CONFIG_REGULATOR_PCF50633 is not set
# CONFIG_REGULATOR_PF8X00 is not set
# CONFIG_REGULATOR_PFUZE100 is not set
# CONFIG_REGULATOR_PV88060 is not set
CONFIG_REGULATOR_PV88080=y
# CONFIG_REGULATOR_PV88090 is not set
CONFIG_REGULATOR_PWM=y
CONFIG_REGULATOR_QCOM_RPMH=y
# CONFIG_REGULATOR_QCOM_SPMI is not set
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=y
# CONFIG_REGULATOR_RT4801 is not set
CONFIG_REGULATOR_RT4831=y
CONFIG_REGULATOR_RT5033=y
# CONFIG_REGULATOR_RT6160 is not set
# CONFIG_REGULATOR_RT6245 is not set
CONFIG_REGULATOR_RTQ2134=y
# CONFIG_REGULATOR_RTMV20 is not set
CONFIG_REGULATOR_RTQ6752=y
# CONFIG_REGULATOR_S2MPA01 is not set
CONFIG_REGULATOR_S2MPS11=y
CONFIG_REGULATOR_S5M8767=y
# CONFIG_REGULATOR_SC2731 is not set
# CONFIG_REGULATOR_SLG51000 is not set
CONFIG_REGULATOR_STM32_BOOSTER=y
CONFIG_REGULATOR_STM32_VREFBUF=y
CONFIG_REGULATOR_STM32_PWR=y
CONFIG_REGULATOR_STPMIC1=y
# CONFIG_REGULATOR_STW481X_VMMC is not set
CONFIG_REGULATOR_SY8106A=y
# CONFIG_REGULATOR_SY8824X is not set
CONFIG_REGULATOR_SY8827N=y
# CONFIG_REGULATOR_TPS51632 is not set
CONFIG_REGULATOR_TPS6105X=y
CONFIG_REGULATOR_TPS62360=y
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=y
CONFIG_REGULATOR_TPS65086=y
CONFIG_REGULATOR_TPS65090=y
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS65217=y
CONFIG_REGULATOR_TPS6524X=y
# CONFIG_REGULATOR_TPS65910 is not set
# CONFIG_REGULATOR_TPS80031 is not set
CONFIG_REGULATOR_UNIPHIER=y
CONFIG_REGULATOR_VCTRL=y
CONFIG_REGULATOR_WM831X=y
CONFIG_REGULATOR_WM8994=y
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_RC_CORE=y
# CONFIG_RC_MAP is not set
CONFIG_LIRC=y
# CONFIG_BPF_LIRC_MODE2 is not set
# CONFIG_RC_DECODERS is not set
CONFIG_RC_DEVICES=y
CONFIG_RC_ATI_REMOTE=y
CONFIG_IR_ENE=y
CONFIG_IR_HIX5HD2=y
CONFIG_IR_IMON=y
CONFIG_IR_IMON_RAW=y
CONFIG_IR_MCEUSB=y
CONFIG_IR_ITE_CIR=y
CONFIG_IR_FINTEK=y
# CONFIG_IR_MESON is not set
# CONFIG_IR_MESON_TX is not set
CONFIG_IR_MTK=y
CONFIG_IR_NUVOTON=y
CONFIG_IR_REDRAT3=y
CONFIG_IR_SPI=y
CONFIG_IR_STREAMZAP=y
CONFIG_IR_WINBOND_CIR=y
CONFIG_IR_IGORPLUGUSB=y
CONFIG_IR_IGUANA=y
CONFIG_IR_TTUSBIR=y
# CONFIG_IR_RX51 is not set
CONFIG_IR_IMG=y
CONFIG_IR_IMG_RAW=y
CONFIG_IR_IMG_HW=y
# CONFIG_IR_IMG_NEC is not set
# CONFIG_IR_IMG_JVC is not set
# CONFIG_IR_IMG_SONY is not set
# CONFIG_IR_IMG_SHARP is not set
CONFIG_IR_IMG_SANYO=y
CONFIG_IR_IMG_RC5=y
CONFIG_IR_IMG_RC6=y
CONFIG_RC_LOOPBACK=y
# CONFIG_IR_GPIO_CIR is not set
CONFIG_IR_GPIO_TX=y
CONFIG_IR_PWM_TX=y
# CONFIG_RC_ST is not set
CONFIG_IR_SUNXI=y
CONFIG_IR_SERIAL=y
# CONFIG_IR_SERIAL_TRANSMITTER is not set
# CONFIG_IR_SIR is not set
# CONFIG_RC_XBOX_DVD is not set
# CONFIG_IR_TOY is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y
CONFIG_CEC_PIN=y
CONFIG_MEDIA_CEC_RC=y
CONFIG_CEC_PIN_ERROR_INJ=y
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_CEC_CH7322=y
CONFIG_CEC_CROS_EC=y
CONFIG_CEC_MESON_AO=y
CONFIG_CEC_MESON_G12A_AO=y
CONFIG_CEC_GPIO=y
CONFIG_CEC_SAMSUNG_S5P=y
# CONFIG_CEC_STI is not set
CONFIG_CEC_STM32=y
# CONFIG_CEC_TEGRA is not set
# CONFIG_USB_PULSE8_CEC is not set
CONFIG_USB_RAINSHADOW_CEC=y
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
# CONFIG_DVB_NET is not set
CONFIG_DVB_MAX_ADAPTERS=16
# CONFIG_DVB_DYNAMIC_MINORS is not set
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
CONFIG_DVB_ULE_DEBUG=y
# end of Digital TV options

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
CONFIG_V4L_PLATFORM_DRIVERS=y
# CONFIG_VIDEO_CADENCE is not set
CONFIG_DVB_PLATFORM_DRIVERS=y
CONFIG_DVB_C8SECTPFE=y
CONFIG_SDR_PLATFORM_DRIVERS=y

#
# MMC/SDIO DVB adapters
#
# CONFIG_SMS_SDIO_DRV is not set
# CONFIG_DVB_TEST_DRIVERS is not set

#
# FireWire (IEEE 1394) Adapters
#
CONFIG_DVB_FIREDTV=y
CONFIG_DVB_FIREDTV_INPUT=y
# end of Media drivers

#
# Media ancillary drivers
#

#
# Media SPI Adapters
#
CONFIG_CXD2880_SPI_DRV=y
# end of Media SPI Adapters

CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_SIMPLE=y
# CONFIG_MEDIA_TUNER_TDA18250 is not set
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_MT20XX=y
# CONFIG_MEDIA_TUNER_MT2060 is not set
CONFIG_MEDIA_TUNER_MT2063=y
CONFIG_MEDIA_TUNER_MT2266=y
CONFIG_MEDIA_TUNER_MT2131=y
CONFIG_MEDIA_TUNER_QT1010=y
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC5000=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_MXL5005S=y
CONFIG_MEDIA_TUNER_MXL5007T=y
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_MAX2165=y
CONFIG_MEDIA_TUNER_TDA18218=y
CONFIG_MEDIA_TUNER_FC0011=y
CONFIG_MEDIA_TUNER_FC0012=y
CONFIG_MEDIA_TUNER_FC0013=y
CONFIG_MEDIA_TUNER_TDA18212=y
CONFIG_MEDIA_TUNER_M88RS6000T=y
# CONFIG_MEDIA_TUNER_TUA9001 is not set
CONFIG_MEDIA_TUNER_SI2157=y
CONFIG_MEDIA_TUNER_IT913X=y
# CONFIG_MEDIA_TUNER_R820T is not set
CONFIG_MEDIA_TUNER_MXL301RF=y
CONFIG_MEDIA_TUNER_QM1D1C0042=y
CONFIG_MEDIA_TUNER_QM1D1B0004=y
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_STB0899=y
CONFIG_DVB_STB6100=y
CONFIG_DVB_STV090x=y
# CONFIG_DVB_STV0910 is not set
CONFIG_DVB_STV6110x=y
CONFIG_DVB_STV6111=y
# CONFIG_DVB_MXL5XX is not set
# CONFIG_DVB_M88DS3103 is not set

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=y
# CONFIG_DVB_TDA18271C2DD is not set
CONFIG_DVB_SI2165=y
CONFIG_DVB_MN88472=y
CONFIG_DVB_MN88473=y

#
# DVB-S (satellite) frontends
#
# CONFIG_DVB_CX24110 is not set
# CONFIG_DVB_CX24123 is not set
CONFIG_DVB_MT312=y
# CONFIG_DVB_ZL10036 is not set
# CONFIG_DVB_ZL10039 is not set
# CONFIG_DVB_S5H1420 is not set
CONFIG_DVB_STV0288=y
# CONFIG_DVB_STB6000 is not set
# CONFIG_DVB_STV0299 is not set
CONFIG_DVB_STV6110=y
CONFIG_DVB_STV0900=y
CONFIG_DVB_TDA8083=y
# CONFIG_DVB_TDA10086 is not set
CONFIG_DVB_TDA8261=y
# CONFIG_DVB_VES1X93 is not set
# CONFIG_DVB_TUNER_ITD1000 is not set
CONFIG_DVB_TUNER_CX24113=y
# CONFIG_DVB_TDA826X is not set
# CONFIG_DVB_TUA6100 is not set
# CONFIG_DVB_CX24116 is not set
# CONFIG_DVB_CX24117 is not set
CONFIG_DVB_CX24120=y
CONFIG_DVB_SI21XX=y
CONFIG_DVB_TS2020=y
# CONFIG_DVB_DS3000 is not set
# CONFIG_DVB_MB86A16 is not set
# CONFIG_DVB_TDA10071 is not set

#
# DVB-T (terrestrial) frontends
#
# CONFIG_DVB_SP887X is not set
# CONFIG_DVB_CX22700 is not set
CONFIG_DVB_CX22702=y
CONFIG_DVB_S5H1432=y
CONFIG_DVB_DRXD=y
# CONFIG_DVB_L64781 is not set
CONFIG_DVB_TDA1004X=y
CONFIG_DVB_NXT6000=y
CONFIG_DVB_MT352=y
CONFIG_DVB_ZL10353=y
CONFIG_DVB_DIB3000MB=y
CONFIG_DVB_DIB3000MC=y
CONFIG_DVB_DIB7000M=y
# CONFIG_DVB_DIB7000P is not set
# CONFIG_DVB_DIB9000 is not set
# CONFIG_DVB_TDA10048 is not set
CONFIG_DVB_AF9013=y
# CONFIG_DVB_EC100 is not set
CONFIG_DVB_STV0367=y
CONFIG_DVB_CXD2820R=y
# CONFIG_DVB_CXD2841ER is not set
CONFIG_DVB_RTL2830=y
CONFIG_DVB_RTL2832=y
# CONFIG_DVB_SI2168 is not set
CONFIG_DVB_ZD1301_DEMOD=y
CONFIG_DVB_CXD2880=y

#
# DVB-C (cable) frontends
#
CONFIG_DVB_VES1820=y
# CONFIG_DVB_TDA10021 is not set
CONFIG_DVB_TDA10023=y
CONFIG_DVB_STV0297=y

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
# CONFIG_DVB_NXT200X is not set
CONFIG_DVB_OR51211=y
# CONFIG_DVB_OR51132 is not set
CONFIG_DVB_BCM3510=y
CONFIG_DVB_LGDT330X=y
# CONFIG_DVB_LGDT3305 is not set
# CONFIG_DVB_LGDT3306A is not set
# CONFIG_DVB_LG2160 is not set
CONFIG_DVB_S5H1409=y
CONFIG_DVB_AU8522=y
CONFIG_DVB_AU8522_DTV=y
# CONFIG_DVB_S5H1411 is not set
CONFIG_DVB_MXL692=y

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_S921=y
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
CONFIG_DVB_TUNER_DIB0070=y
CONFIG_DVB_TUNER_DIB0090=y

#
# SEC control devices for DVB-S
#
# CONFIG_DVB_DRX39XYJ is not set
CONFIG_DVB_LNBH25=y
# CONFIG_DVB_LNBH29 is not set
CONFIG_DVB_LNBP21=y
CONFIG_DVB_LNBP22=y
CONFIG_DVB_ISL6405=y
# CONFIG_DVB_ISL6421 is not set
# CONFIG_DVB_ISL6423 is not set
CONFIG_DVB_A8293=y
CONFIG_DVB_LGS8GL5=y
CONFIG_DVB_LGS8GXX=y
CONFIG_DVB_ATBM8830=y
# CONFIG_DVB_TDA665x is not set
CONFIG_DVB_IX2505V=y
# CONFIG_DVB_M88RS2000 is not set
CONFIG_DVB_AF9033=y
CONFIG_DVB_HORUS3A=y
CONFIG_DVB_ASCOT2E=y
# CONFIG_DVB_HELENE is not set

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=y
CONFIG_DVB_SP2=y
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
CONFIG_DVB_DUMMY_FE=y
# end of Media ancillary drivers

#
# Graphics support
#
# CONFIG_IMX_IPUV3_CORE is not set
# CONFIG_DRM is not set

#
# ARM devices
#
# end of ARM devices

# CONFIG_IMX8MP_HDMI_PAVI is not set

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CLPS711X is not set
# CONFIG_FB_IMX is not set
CONFIG_FB_ARC=y
# CONFIG_FB_CONTROL is not set
CONFIG_FB_UVESA=y
CONFIG_FB_GBE=y
CONFIG_FB_GBE_MEM=4
# CONFIG_FB_PVR2 is not set
CONFIG_FB_OPENCORES=y
CONFIG_FB_S1D13XXX=y
# CONFIG_FB_ATMEL is not set
CONFIG_FB_WM8505=y
CONFIG_FB_WMT_GE_ROPS=y
CONFIG_FB_PXA168=y
CONFIG_FB_W100=y
CONFIG_FB_SH_MOBILE_LCDC=y
# CONFIG_FB_TMIO is not set
CONFIG_FB_S3C=y
CONFIG_FB_S3C_DEBUG_REGWRITE=y
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_GOLDFISH is not set
# CONFIG_FB_DA8XX is not set
# CONFIG_FB_VIRTUAL is not set
CONFIG_FB_METRONOME=y
CONFIG_FB_BROADSHEET=y
# CONFIG_FB_SIMPLE is not set
CONFIG_FB_SSD1307=y
# CONFIG_FB_OMAP2 is not set
CONFIG_MMP_DISP=y
CONFIG_MMP_DISP_CONTROLLER=y
# CONFIG_MMP_DISP_SPI is not set
# CONFIG_MMP_PANEL_TPOHVGA is not set
CONFIG_MMP_FB=y
CONFIG_FB_MXC=y
# CONFIG_FB_MXC_DISP_FRAMEWORK is not set
# CONFIG_FB_MXC_OVERLAY is not set
CONFIG_FB_MXC_EDID=y
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_L4F00242T03=y
# CONFIG_LCD_LMS283GF05 is not set
CONFIG_LCD_LTV350QV=y
CONFIG_LCD_ILI922X=y
CONFIG_LCD_ILI9320=y
CONFIG_LCD_TDO24M=y
CONFIG_LCD_VGG2432A4=y
# CONFIG_LCD_PLATFORM is not set
CONFIG_LCD_AMS369FG06=y
CONFIG_LCD_LMS501KF03=y
CONFIG_LCD_HX8357=y
CONFIG_LCD_OTM3225A=y
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
CONFIG_BACKLIGHT_LM3533=y
CONFIG_BACKLIGHT_PWM=y
# CONFIG_BACKLIGHT_DA9052 is not set
CONFIG_BACKLIGHT_MAX8925=y
CONFIG_BACKLIGHT_QCOM_WLED=y
# CONFIG_BACKLIGHT_RT4831 is not set
CONFIG_BACKLIGHT_WM831X=y
CONFIG_BACKLIGHT_ADP5520=y
# CONFIG_BACKLIGHT_ADP8860 is not set
CONFIG_BACKLIGHT_ADP8870=y
CONFIG_BACKLIGHT_PCF50633=y
# CONFIG_BACKLIGHT_AAT2870 is not set
CONFIG_BACKLIGHT_LM3630A=y
CONFIG_BACKLIGHT_LM3639=y
CONFIG_BACKLIGHT_LP855X=y
CONFIG_BACKLIGHT_LP8788=y
CONFIG_BACKLIGHT_TPS65217=y
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
# CONFIG_BACKLIGHT_BD6107 is not set
CONFIG_BACKLIGHT_ARCXCNN=y
CONFIG_BACKLIGHT_LED=y
# end of Backlight & LCD device support

CONFIG_VIDEOMODE_HELPERS=y
# CONFIG_LOGO is not set
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SOUND_OSS_CORE=y
# CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_RAWMIDI=y
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
CONFIG_SND_MIXER_OSS=y
# CONFIG_SND_PCM_OSS is not set
# CONFIG_SND_PCM_TIMER is not set
CONFIG_SND_HRTIMER=y
# CONFIG_SND_DYNAMIC_MINORS is not set
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_VERBOSE_PRINTK=y
CONFIG_SND_DEBUG=y
# CONFIG_SND_DEBUG_VERBOSE is not set
# CONFIG_SND_CTL_VALIDATION is not set
CONFIG_SND_JACK_INJECTION_DEBUG=y
CONFIG_SND_SEQUENCER=y
# CONFIG_SND_SEQ_DUMMY is not set
CONFIG_SND_SEQUENCER_OSS=y
# CONFIG_SND_SEQ_HRTIMER_DEFAULT is not set
CONFIG_SND_SEQ_MIDI_EVENT=y
CONFIG_SND_SEQ_MIDI=y
# CONFIG_SND_DRIVERS is not set

#
# HD-Audio
#
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=64
# CONFIG_SND_SPI is not set
# CONFIG_SND_USB is not set
# CONFIG_SND_FIREWIRE is not set
# CONFIG_SND_SOC is not set
CONFIG_SND_VIRTIO=y

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
CONFIG_HIDRAW=y
CONFIG_UHID=y
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
# CONFIG_HID_ACCUTOUCH is not set
# CONFIG_HID_ACRUX is not set
CONFIG_HID_APPLE=y
CONFIG_HID_APPLEIR=y
# CONFIG_HID_ASUS is not set
CONFIG_HID_AUREAL=y
# CONFIG_HID_BELKIN is not set
# CONFIG_HID_BETOP_FF is not set
CONFIG_HID_BIGBEN_FF=y
CONFIG_HID_CHERRY=y
CONFIG_HID_CHICONY=y
CONFIG_HID_CORSAIR=y
# CONFIG_HID_COUGAR is not set
CONFIG_HID_MACALLY=y
CONFIG_HID_PRODIKEYS=y
CONFIG_HID_CMEDIA=y
CONFIG_HID_CP2112=y
CONFIG_HID_CREATIVE_SB0540=y
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=y
CONFIG_DRAGONRISE_FF=y
CONFIG_HID_EMS_FF=y
CONFIG_HID_ELAN=y
CONFIG_HID_ELECOM=y
# CONFIG_HID_ELO is not set
# CONFIG_HID_EZKEY is not set
CONFIG_HID_FT260=y
CONFIG_HID_GEMBIRD=y
CONFIG_HID_GFRM=y
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_GOOGLE_HAMMER is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=y
CONFIG_HID_KYE=y
CONFIG_HID_UCLOGIC=y
CONFIG_HID_WALTOP=y
CONFIG_HID_VIEWSONIC=y
CONFIG_HID_GYRATION=y
CONFIG_HID_ICADE=y
# CONFIG_HID_ITE is not set
# CONFIG_HID_JABRA is not set
CONFIG_HID_TWINHAN=y
CONFIG_HID_KENSINGTON=y
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=y
# CONFIG_HID_LOGITECH is not set
# CONFIG_HID_MAGICMOUSE is not set
CONFIG_HID_MALTRON=y
CONFIG_HID_MAYFLASH=y
CONFIG_HID_REDRAGON=y
# CONFIG_HID_MICROSOFT is not set
CONFIG_HID_MONTEREY=y
# CONFIG_HID_MULTITOUCH is not set
CONFIG_HID_NTI=y
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=y
CONFIG_HID_PANTHERLORD=y
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=y
CONFIG_HID_PICOLCD_FB=y
# CONFIG_HID_PICOLCD_BACKLIGHT is not set
CONFIG_HID_PICOLCD_LCD=y
# CONFIG_HID_PICOLCD_LEDS is not set
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PLAYSTATION=y
# CONFIG_PLAYSTATION_FF is not set
CONFIG_HID_PRIMAX=y
CONFIG_HID_RETRODE=y
CONFIG_HID_ROCCAT=y
CONFIG_HID_SAITEK=y
CONFIG_HID_SAMSUNG=y
CONFIG_HID_SEMITEK=y
CONFIG_HID_SONY=y
# CONFIG_SONY_FF is not set
# CONFIG_HID_SPEEDLINK is not set
CONFIG_HID_STEAM=y
CONFIG_HID_STEELSERIES=y
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_RMI is not set
CONFIG_HID_GREENASIA=y
CONFIG_GREENASIA_FF=y
# CONFIG_HID_SMARTJOYPLUS is not set
CONFIG_HID_TIVO=y
CONFIG_HID_TOPSEED=y
CONFIG_HID_THINGM=y
CONFIG_HID_THRUSTMASTER=y
# CONFIG_THRUSTMASTER_FF is not set
CONFIG_HID_UDRAW_PS3=y
# CONFIG_HID_U2FZERO is not set
CONFIG_HID_WACOM=y
CONFIG_HID_WIIMOTE=y
CONFIG_HID_XINMO=y
CONFIG_HID_ZEROPLUS=y
CONFIG_ZEROPLUS_FF=y
CONFIG_HID_ZYDACRON=y
# CONFIG_HID_SENSOR_HUB is not set
# CONFIG_HID_ALPS is not set
CONFIG_HID_MCP2221=y
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
CONFIG_HID_PID=y
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

#
# I2C HID support
#
CONFIG_I2C_HID_OF=y
CONFIG_I2C_HID_OF_GOODIX=y
# end of I2C HID support

CONFIG_I2C_HID_CORE=y
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=y
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
CONFIG_USB_OTG_PRODUCTLIST=y
CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB=y
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
# CONFIG_USB_MON is not set

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
CONFIG_USB_XHCI_DBGCAP=y
CONFIG_USB_XHCI_PCI_RENESAS=y
CONFIG_USB_XHCI_PLATFORM=y
# CONFIG_USB_XHCI_HISTB is not set
CONFIG_USB_XHCI_MTK=y
CONFIG_USB_XHCI_MVEBU=y
CONFIG_USB_XHCI_RCAR=y
# CONFIG_USB_BRCMSTB is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
# CONFIG_USB_EHCI_TT_NEWSCHED is not set
CONFIG_USB_EHCI_FSL=y
CONFIG_USB_EHCI_HCD_NPCM7XX=y
CONFIG_USB_EHCI_HCD_ORION=y
CONFIG_USB_EHCI_HCD_SPEAR=y
CONFIG_USB_EHCI_HCD_STI=y
# CONFIG_USB_EHCI_HCD_AT91 is not set
# CONFIG_USB_EHCI_SH is not set
CONFIG_USB_EHCI_EXYNOS=y
CONFIG_USB_EHCI_MV=y
# CONFIG_USB_CNS3XXX_EHCI is not set
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OXU210HP_HCD=y
CONFIG_USB_ISP116X_HCD=y
CONFIG_USB_ISP1362_HCD=y
CONFIG_USB_FOTG210_HCD=y
# CONFIG_USB_MAX3421_HCD is not set
# CONFIG_USB_OHCI_HCD is not set
CONFIG_USB_U132_HCD=y
CONFIG_USB_SL811_HCD=y
# CONFIG_USB_SL811_HCD_ISO is not set
CONFIG_USB_R8A66597_HCD=y
# CONFIG_USB_RENESAS_USBHS_HCD is not set
CONFIG_USB_HCD_BCMA=y
# CONFIG_USB_HCD_TEST_MODE is not set
CONFIG_USB_RENESAS_USBHS=y

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
# CONFIG_USB_PRINTER is not set
CONFIG_USB_WDM=y
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
# CONFIG_USB_STORAGE is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
CONFIG_USB_MICROTEK=y
CONFIG_USBIP_CORE=y
CONFIG_USBIP_VHCI_HCD=y
CONFIG_USBIP_VHCI_HC_PORTS=8
CONFIG_USBIP_VHCI_NR_HCS=1
CONFIG_USBIP_HOST=y
# CONFIG_USBIP_VUDC is not set
CONFIG_USBIP_DEBUG=y
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MTU3 is not set
CONFIG_USB_MUSB_HDRC=y
# CONFIG_USB_MUSB_HOST is not set
CONFIG_USB_MUSB_GADGET=y
# CONFIG_USB_MUSB_DUAL_ROLE is not set

#
# Platform Glue Layer
#
CONFIG_USB_MUSB_DSPS=y
# CONFIG_USB_MUSB_UX500 is not set
CONFIG_USB_MUSB_JZ4740=y

#
# MUSB DMA mode
#
# CONFIG_MUSB_PIO_ONLY is not set
# CONFIG_USB_INVENTRA_DMA is not set
CONFIG_USB_DWC3=y
CONFIG_USB_DWC3_ULPI=y
# CONFIG_USB_DWC3_HOST is not set
CONFIG_USB_DWC3_GADGET=y
# CONFIG_USB_DWC3_DUAL_ROLE is not set

#
# Platform Glue Driver Support
#
CONFIG_USB_DWC3_OMAP=y
# CONFIG_USB_DWC3_EXYNOS is not set
CONFIG_USB_DWC3_KEYSTONE=y
CONFIG_USB_DWC3_MESON_G12A=y
# CONFIG_USB_DWC3_OF_SIMPLE is not set
# CONFIG_USB_DWC3_ST is not set
# CONFIG_USB_DWC3_QCOM is not set
CONFIG_USB_DWC3_IMX8MP=y
# CONFIG_USB_DWC2 is not set
CONFIG_USB_CHIPIDEA=y
# CONFIG_USB_CHIPIDEA_UDC is not set
# CONFIG_USB_CHIPIDEA_HOST is not set
CONFIG_USB_CHIPIDEA_MSM=y
# CONFIG_USB_CHIPIDEA_IMX is not set
# CONFIG_USB_CHIPIDEA_GENERIC is not set
CONFIG_USB_CHIPIDEA_TEGRA=y
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y
# CONFIG_USB_ISP1760_GADGET_ROLE is not set
# CONFIG_USB_ISP1760_DUAL_ROLE is not set

#
# USB port drivers
#
CONFIG_USB_USS720=y
CONFIG_USB_SERIAL=y
# CONFIG_USB_SERIAL_CONSOLE is not set
# CONFIG_USB_SERIAL_GENERIC is not set
CONFIG_USB_SERIAL_SIMPLE=y
# CONFIG_USB_SERIAL_AIRCABLE is not set
CONFIG_USB_SERIAL_ARK3116=y
# CONFIG_USB_SERIAL_BELKIN is not set
CONFIG_USB_SERIAL_CH341=y
CONFIG_USB_SERIAL_WHITEHEAT=y
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
CONFIG_USB_SERIAL_CP210X=y
CONFIG_USB_SERIAL_CYPRESS_M8=y
# CONFIG_USB_SERIAL_EMPEG is not set
CONFIG_USB_SERIAL_FTDI_SIO=y
CONFIG_USB_SERIAL_VISOR=y
CONFIG_USB_SERIAL_IPAQ=y
# CONFIG_USB_SERIAL_IR is not set
CONFIG_USB_SERIAL_EDGEPORT=y
CONFIG_USB_SERIAL_EDGEPORT_TI=y
CONFIG_USB_SERIAL_F81232=y
# CONFIG_USB_SERIAL_F8153X is not set
# CONFIG_USB_SERIAL_GARMIN is not set
# CONFIG_USB_SERIAL_IPW is not set
CONFIG_USB_SERIAL_IUU=y
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
CONFIG_USB_SERIAL_KEYSPAN=y
# CONFIG_USB_SERIAL_KLSI is not set
CONFIG_USB_SERIAL_KOBIL_SCT=y
CONFIG_USB_SERIAL_MCT_U232=y
# CONFIG_USB_SERIAL_METRO is not set
# CONFIG_USB_SERIAL_MOS7720 is not set
# CONFIG_USB_SERIAL_MOS7840 is not set
CONFIG_USB_SERIAL_MXUPORT=y
# CONFIG_USB_SERIAL_NAVMAN is not set
CONFIG_USB_SERIAL_PL2303=y
# CONFIG_USB_SERIAL_OTI6858 is not set
# CONFIG_USB_SERIAL_QCAUX is not set
CONFIG_USB_SERIAL_QUALCOMM=y
CONFIG_USB_SERIAL_SPCP8X5=y
# CONFIG_USB_SERIAL_SAFE is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
CONFIG_USB_SERIAL_SYMBOL=y
CONFIG_USB_SERIAL_TI=y
CONFIG_USB_SERIAL_CYBERJACK=y
CONFIG_USB_SERIAL_WWAN=y
CONFIG_USB_SERIAL_OPTION=y
# CONFIG_USB_SERIAL_OMNINET is not set
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
CONFIG_USB_ADUTUX=y
# CONFIG_USB_SEVSEG is not set
CONFIG_USB_LEGOTOWER=y
CONFIG_USB_LCD=y
CONFIG_USB_CYPRESS_CY7C63=y
CONFIG_USB_CYTHERM=y
CONFIG_USB_IDMOUSE=y
CONFIG_USB_FTDI_ELAN=y
CONFIG_USB_APPLEDISPLAY=y
CONFIG_APPLE_MFI_FASTCHARGE=y
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
CONFIG_USB_TRANCEVIBRATOR=y
CONFIG_USB_IOWARRIOR=y
CONFIG_USB_TEST=y
CONFIG_USB_EHSET_TEST_FIXTURE=y
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=y
CONFIG_USB_EZUSB_FX2=y
# CONFIG_USB_HUB_USB251XB is not set
CONFIG_USB_HSIC_USB3503=y
CONFIG_USB_HSIC_USB4604=y
CONFIG_USB_LINK_LAYER_TEST=y
CONFIG_USB_CHAOSKEY=y
# CONFIG_BRCM_USB_PINMAP is not set
CONFIG_USB_ATM=y
CONFIG_USB_SPEEDTOUCH=y
CONFIG_USB_CXACRU=y
# CONFIG_USB_UEAGLEATM is not set
CONFIG_USB_XUSBATM=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_NOP_USB_XCEIV is not set
CONFIG_USB_GPIO_VBUS=y
# CONFIG_USB_ISP1301 is not set
CONFIG_USB_TEGRA_PHY=y
CONFIG_USB_ULPI=y
CONFIG_USB_ULPI_VIEWPORT=y
# CONFIG_JZ4770_PHY is not set
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=y
CONFIG_USB_GADGET_DEBUG=y
# CONFIG_USB_GADGET_VERBOSE is not set
CONFIG_USB_GADGET_DEBUG_FS=y
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
CONFIG_U_SERIAL_CONSOLE=y

#
# USB Peripheral Controller
#
# CONFIG_USB_LPC32XX is not set
CONFIG_USB_FUSB300=y
CONFIG_USB_FOTG210_UDC=y
CONFIG_USB_GR_UDC=y
CONFIG_USB_R8A66597=y
# CONFIG_USB_RENESAS_USBHS_UDC is not set
# CONFIG_USB_RENESAS_USB3 is not set
CONFIG_USB_PXA27X=y
CONFIG_USB_MV_UDC=y
# CONFIG_USB_MV_U3D is not set
CONFIG_USB_SNP_CORE=y
CONFIG_USB_SNP_UDC_PLAT=y
CONFIG_USB_M66592=y
CONFIG_USB_BDC_UDC=y
CONFIG_USB_NET2272=y
# CONFIG_USB_NET2272_DMA is not set
CONFIG_USB_GADGET_XILINX=y
CONFIG_USB_MAX3420_UDC=y
# CONFIG_USB_ASPEED_VHUB is not set
# CONFIG_USB_DUMMY_HCD is not set
# end of USB Peripheral Controller

CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_F_SS_LB=y
CONFIG_USB_U_SERIAL=y
CONFIG_USB_U_ETHER=y
CONFIG_USB_U_AUDIO=y
CONFIG_USB_F_SERIAL=y
CONFIG_USB_F_OBEX=y
CONFIG_USB_F_NCM=y
CONFIG_USB_F_ECM=y
CONFIG_USB_F_PHONET=y
CONFIG_USB_F_SUBSET=y
CONFIG_USB_F_RNDIS=y
CONFIG_USB_F_MASS_STORAGE=y
CONFIG_USB_F_FS=y
CONFIG_USB_F_UAC1=y
CONFIG_USB_F_UAC1_LEGACY=y
CONFIG_USB_F_UAC2=y
CONFIG_USB_F_MIDI=y
CONFIG_USB_F_HID=y
CONFIG_USB_F_PRINTER=y
CONFIG_USB_F_TCM=y
CONFIG_USB_CONFIGFS=y
CONFIG_USB_CONFIGFS_SERIAL=y
# CONFIG_USB_CONFIGFS_ACM is not set
# CONFIG_USB_CONFIGFS_OBEX is not set
# CONFIG_USB_CONFIGFS_NCM is not set
# CONFIG_USB_CONFIGFS_ECM is not set
# CONFIG_USB_CONFIGFS_ECM_SUBSET is not set
CONFIG_USB_CONFIGFS_RNDIS=y
# CONFIG_USB_CONFIGFS_EEM is not set
CONFIG_USB_CONFIGFS_PHONET=y
# CONFIG_USB_CONFIGFS_MASS_STORAGE is not set
CONFIG_USB_CONFIGFS_F_LB_SS=y
# CONFIG_USB_CONFIGFS_F_FS is not set
# CONFIG_USB_CONFIGFS_F_UAC1 is not set
CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y
CONFIG_USB_CONFIGFS_F_UAC2=y
# CONFIG_USB_CONFIGFS_F_MIDI is not set
# CONFIG_USB_CONFIGFS_F_HID is not set
CONFIG_USB_CONFIGFS_F_PRINTER=y
# CONFIG_USB_CONFIGFS_F_TCM is not set

#
# USB Gadget precomposed configurations
#
CONFIG_USB_ZERO=y
CONFIG_USB_AUDIO=y
CONFIG_GADGET_UAC1=y
# CONFIG_GADGET_UAC1_LEGACY is not set
CONFIG_USB_ETH=y
CONFIG_USB_ETH_RNDIS=y
# CONFIG_USB_ETH_EEM is not set
CONFIG_USB_G_NCM=y
CONFIG_USB_GADGETFS=y
CONFIG_USB_FUNCTIONFS=y
CONFIG_USB_FUNCTIONFS_ETH=y
CONFIG_USB_FUNCTIONFS_RNDIS=y
CONFIG_USB_FUNCTIONFS_GENERIC=y
CONFIG_USB_MASS_STORAGE=y
CONFIG_USB_GADGET_TARGET=y
# CONFIG_USB_G_SERIAL is not set
CONFIG_USB_MIDI_GADGET=y
CONFIG_USB_G_PRINTER=y
# CONFIG_USB_CDC_COMPOSITE is not set
CONFIG_USB_G_NOKIA=y
CONFIG_USB_G_ACM_MS=y
# CONFIG_USB_G_MULTI is not set
CONFIG_USB_G_HID=y
CONFIG_USB_G_DBGP=y
# CONFIG_USB_G_DBGP_PRINTK is not set
CONFIG_USB_G_DBGP_SERIAL=y
# CONFIG_USB_RAW_GADGET is not set
# end of USB Gadget precomposed configurations

# CONFIG_TYPEC is not set
CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=y
CONFIG_PWRSEQ_EMMC=y
CONFIG_PWRSEQ_SIMPLE=y
CONFIG_MMC_BLOCK=y
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=y
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
CONFIG_MMC_SDHCI=y
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PLTFM=y
CONFIG_MMC_SDHCI_OF_ARASAN=y
CONFIG_MMC_SDHCI_OF_ASPEED=y
# CONFIG_MMC_SDHCI_OF_ASPEED_TEST is not set
CONFIG_MMC_SDHCI_OF_AT91=y
CONFIG_MMC_SDHCI_OF_ESDHC=y
# CONFIG_MMC_SDHCI_OF_DWCMSHC is not set
CONFIG_MMC_SDHCI_OF_SPARX5=y
CONFIG_MMC_SDHCI_CADENCE=y
CONFIG_MMC_SDHCI_CNS3XXX=y
CONFIG_MMC_SDHCI_ESDHC_IMX=y
CONFIG_MMC_SDHCI_DOVE=y
CONFIG_MMC_SDHCI_TEGRA=y
# CONFIG_MMC_SDHCI_S3C is not set
CONFIG_MMC_SDHCI_PXAV3=y
# CONFIG_MMC_SDHCI_PXAV2 is not set
CONFIG_MMC_SDHCI_SPEAR=y
# CONFIG_MMC_SDHCI_BCM_KONA is not set
CONFIG_MMC_SDHCI_F_SDH30=y
CONFIG_MMC_SDHCI_MILBEAUT=y
CONFIG_MMC_SDHCI_IPROC=y
# CONFIG_MMC_MESON_GX is not set
# CONFIG_MMC_MESON_MX_SDHC is not set
# CONFIG_MMC_MESON_MX_SDIO is not set
CONFIG_MMC_MOXART=y
# CONFIG_MMC_SDHCI_ST is not set
CONFIG_MMC_OMAP_HS=y
# CONFIG_MMC_SDHCI_MSM is not set
# CONFIG_MMC_DAVINCI is not set
# CONFIG_MMC_SPI is not set
CONFIG_MMC_S3C=y
CONFIG_MMC_S3C_HW_SDIO_IRQ=y
CONFIG_MMC_S3C_PIO=y
# CONFIG_MMC_S3C_DMA is not set
# CONFIG_MMC_SDHCI_SPRD is not set
CONFIG_MMC_TMIO_CORE=y
CONFIG_MMC_TMIO=y
# CONFIG_MMC_SDHI is not set
CONFIG_MMC_UNIPHIER=y
CONFIG_MMC_DW=y
CONFIG_MMC_DW_PLTFM=y
# CONFIG_MMC_DW_BLUEFIELD is not set
CONFIG_MMC_DW_EXYNOS=y
CONFIG_MMC_DW_HI3798CV200=y
CONFIG_MMC_DW_K3=y
CONFIG_MMC_SH_MMCIF=y
CONFIG_MMC_VUB300=y
CONFIG_MMC_USHC=y
CONFIG_MMC_USDHI6ROL0=y
# CONFIG_MMC_SUNXI is not set
CONFIG_MMC_CQHCI=y
CONFIG_MMC_HSQ=y
CONFIG_MMC_BCM2835=y
CONFIG_MMC_MTK=y
CONFIG_MMC_SDHCI_XENON=y
CONFIG_MMC_SDHCI_OMAP=y
CONFIG_MMC_SDHCI_AM654=y
CONFIG_MMC_OWL=y
CONFIG_MEMSTICK=y
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y
# CONFIG_MSPRO_BLOCK is not set
# CONFIG_MS_BLOCK is not set

#
# MemoryStick Host Controller Drivers
#
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
CONFIG_LEDS_CLASS_MULTICOLOR=y
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_AN30259A=y
# CONFIG_LEDS_ARIEL is not set
CONFIG_LEDS_AW2013=y
CONFIG_LEDS_BCM6328=y
CONFIG_LEDS_BCM6358=y
CONFIG_LEDS_CPCAP=y
CONFIG_LEDS_CR0014114=y
# CONFIG_LEDS_EL15203000 is not set
CONFIG_LEDS_TURRIS_OMNIA=y
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3532=y
# CONFIG_LEDS_LM3533 is not set
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_LM3692X=y
# CONFIG_LEDS_S3C24XX is not set
CONFIG_LEDS_COBALT_QUBE=y
CONFIG_LEDS_COBALT_RAQ=y
CONFIG_LEDS_PCA9532=y
# CONFIG_LEDS_PCA9532_GPIO is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=y
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP50XX=y
CONFIG_LEDS_LP55XX_COMMON=y
CONFIG_LEDS_LP5521=y
# CONFIG_LEDS_LP5523 is not set
CONFIG_LEDS_LP5562=y
# CONFIG_LEDS_LP8501 is not set
CONFIG_LEDS_LP8788=y
CONFIG_LEDS_LP8860=y
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA963X=y
# CONFIG_LEDS_WM831X_STATUS is not set
CONFIG_LEDS_DA9052=y
CONFIG_LEDS_DAC124S085=y
# CONFIG_LEDS_PWM is not set
CONFIG_LEDS_REGULATOR=y
CONFIG_LEDS_BD2802=y
CONFIG_LEDS_LT3593=y
# CONFIG_LEDS_ADP5520 is not set
# CONFIG_LEDS_MC13783 is not set
CONFIG_LEDS_NS2=y
CONFIG_LEDS_NETXBIG=y
CONFIG_LEDS_ASIC3=y
CONFIG_LEDS_TCA6507=y
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_MAX77650=y
CONFIG_LEDS_MAX8997=y
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_OT200 is not set
CONFIG_LEDS_MENF21BMC=y
CONFIG_LEDS_IS31FL319X=y
CONFIG_LEDS_IS31FL32XX=y
CONFIG_LEDS_SC27XX_BLTC=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
CONFIG_LEDS_SYSCON=y
CONFIG_LEDS_PM8058=y
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
CONFIG_LEDS_SPI_BYTE=y
# CONFIG_LEDS_TI_LMU_COMMON is not set
# CONFIG_LEDS_TPS6105X is not set
CONFIG_LEDS_IP30=y
# CONFIG_LEDS_ACER_A500 is not set
CONFIG_LEDS_LGM=y

#
# Flash and Torch LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
CONFIG_LEDS_TRIGGER_DISK=y
CONFIG_LEDS_TRIGGER_MTD=y
# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=y
CONFIG_LEDS_TRIGGER_GPIO=y
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
# CONFIG_LEDS_TRIGGER_CAMERA is not set
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_LEDS_TRIGGER_NETDEV=y
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=y
CONFIG_LEDS_TRIGGER_TTY=y
CONFIG_ACCESSIBILITY=y

#
# Speakup console speech
#
# end of Speakup console speech

CONFIG_INFINIBAND=y
CONFIG_INFINIBAND_USER_MAD=y
# CONFIG_INFINIBAND_ADDR_TRANS is not set
CONFIG_INFINIBAND_VIRT_DMA=y
# CONFIG_RDMA_SIW is not set
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
CONFIG_DMABUF_HEAPS=y
CONFIG_DMABUF_SYSFS_STATS=y
# CONFIG_DMABUF_HEAPS_SYSTEM is not set
# CONFIG_DMABUF_HEAPS_DSP is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_HD44780_COMMON=y
# CONFIG_HD44780 is not set
CONFIG_IMG_ASCII_LCD=y
CONFIG_HT16K33=y
CONFIG_LCD2S=y
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
# CONFIG_PANEL_CHANGE_MESSAGE is not set
# CONFIG_CHARLCD_BL_OFF is not set
CONFIG_CHARLCD_BL_ON=y
# CONFIG_CHARLCD_BL_FLASH is not set
# CONFIG_PANEL is not set
CONFIG_VFIO=y
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PLATFORM=y
CONFIG_VFIO_AMBA=y
CONFIG_VFIO_PLATFORM_CALXEDAXGMAC_RESET=y
# CONFIG_VFIO_PLATFORM_AMDXGBE_RESET is not set
CONFIG_VFIO_PLATFORM_BCMFLEXRM_RESET=y
CONFIG_VFIO_MDEV=y
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VDPA is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=y
CONFIG_GREYBUS_ES2=y
CONFIG_COMEDI=y
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_USB_DRIVERS is not set
# CONFIG_COMEDI_8255_SA is not set
# CONFIG_COMEDI_KCOMEDILIB is not set
CONFIG_COMEDI_NI_ROUTING=y
CONFIG_COMEDI_TESTS=y
CONFIG_COMEDI_TESTS_EXAMPLE=y
CONFIG_COMEDI_TESTS_NI_ROUTES=y
# CONFIG_STAGING is not set
# CONFIG_GOLDFISH is not set
CONFIG_CHROME_PLATFORMS=y
CONFIG_CROS_EC=y
CONFIG_CROS_EC_I2C=y
CONFIG_CROS_EC_SPI=y
CONFIG_CROS_EC_PROTO=y
CONFIG_CROS_EC_CHARDEV=y
# CONFIG_CROS_EC_LIGHTBAR is not set
CONFIG_CROS_EC_VBC=y
CONFIG_CROS_EC_DEBUGFS=y
CONFIG_CROS_EC_SENSORHUB=y
# CONFIG_CROS_EC_SYSFS is not set
CONFIG_CROS_USBPD_NOTIFY=y
# CONFIG_MELLANOX_PLATFORM is not set
# CONFIG_OLPC_XO175 is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=y

#
# Clock driver for ARM Reference designs
#
# CONFIG_ICST is not set
CONFIG_CLK_SP810=y
# end of Clock driver for ARM Reference designs

# CONFIG_CLK_HSDK is not set
# CONFIG_LMK04832 is not set
CONFIG_COMMON_CLK_MAX77686=y
CONFIG_COMMON_CLK_MAX9485=y
CONFIG_COMMON_CLK_HI655X=y
CONFIG_COMMON_CLK_SCMI=y
# CONFIG_COMMON_CLK_SCPI is not set
# CONFIG_COMMON_CLK_SI5341 is not set
CONFIG_COMMON_CLK_SI5351=y
# CONFIG_COMMON_CLK_SI514 is not set
CONFIG_COMMON_CLK_SI544=y
# CONFIG_COMMON_CLK_SI570 is not set
CONFIG_COMMON_CLK_BM1880=y
# CONFIG_COMMON_CLK_CDCE706 is not set
CONFIG_COMMON_CLK_CDCE925=y
CONFIG_COMMON_CLK_CS2000_CP=y
# CONFIG_COMMON_CLK_FSL_FLEXSPI is not set
# CONFIG_COMMON_CLK_FSL_SAI is not set
CONFIG_COMMON_CLK_GEMINI=y
CONFIG_COMMON_CLK_ASPEED=y
CONFIG_COMMON_CLK_S2MPS11=y
CONFIG_CLK_TWL6040=y
CONFIG_COMMON_CLK_AXI_CLKGEN=y
CONFIG_CLK_QORIQ=y
# CONFIG_CLK_LS1028A_PLLDIG is not set
CONFIG_COMMON_CLK_XGENE=y
CONFIG_COMMON_CLK_PWM=y
# CONFIG_COMMON_CLK_OXNAS is not set
# CONFIG_COMMON_CLK_VC5 is not set
CONFIG_COMMON_CLK_MMP2_AUDIO=y
CONFIG_COMMON_CLK_BD718XX=y
# CONFIG_COMMON_CLK_FIXED_MMIO is not set
# CONFIG_CLK_ACTIONS is not set
CONFIG_CLK_ANALOGBITS_WRPLL_CLN28HPC=y
CONFIG_CLK_BAIKAL_T1=y
CONFIG_CLK_BT1_CCU_PLL=y
CONFIG_CLK_BT1_CCU_DIV=y
CONFIG_CLK_BCM2711_DVP=y
# CONFIG_CLK_BCM2835 is not set
CONFIG_CLK_BCM_63XX=y
# CONFIG_CLK_BCM_63XX_GATE is not set
CONFIG_CLK_BCM_KONA=y
CONFIG_COMMON_CLK_IPROC=y
CONFIG_CLK_BCM_CYGNUS=y
# CONFIG_CLK_BCM_HR2 is not set
CONFIG_CLK_BCM_NSP=y
CONFIG_CLK_BCM_NS2=y
# CONFIG_CLK_BCM_SR is not set
# CONFIG_CLK_RASPBERRYPI is not set
CONFIG_COMMON_CLK_HI3516CV300=y
# CONFIG_COMMON_CLK_HI3519 is not set
CONFIG_COMMON_CLK_HI3559A=y
CONFIG_COMMON_CLK_HI3660=y
CONFIG_COMMON_CLK_HI3670=y
# CONFIG_COMMON_CLK_HI3798CV200 is not set
# CONFIG_COMMON_CLK_HI6220 is not set
CONFIG_RESET_HISI=y
# CONFIG_COMMON_CLK_BOSTON is not set
CONFIG_MXC_CLK=y
CONFIG_CLK_IMX8MM=y
CONFIG_CLK_IMX8MN=y
CONFIG_CLK_IMX8MP=y
CONFIG_CLK_IMX8MQ=y
# CONFIG_CLK_IMX8ULP is not set

#
# Ingenic SoCs drivers
#
CONFIG_INGENIC_CGU_COMMON=y
CONFIG_INGENIC_CGU_JZ4740=y
CONFIG_INGENIC_CGU_JZ4725B=y
# CONFIG_INGENIC_CGU_JZ4760 is not set
CONFIG_INGENIC_CGU_JZ4770=y
CONFIG_INGENIC_CGU_JZ4780=y
CONFIG_INGENIC_CGU_X1000=y
CONFIG_INGENIC_CGU_X1830=y
# CONFIG_INGENIC_TCU_CLK is not set
# end of Ingenic SoCs drivers

CONFIG_COMMON_CLK_KEYSTONE=y
CONFIG_TI_SYSCON_CLK=y

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
# CONFIG_COMMON_CLK_MT2701 is not set
# CONFIG_COMMON_CLK_MT2712 is not set
# CONFIG_COMMON_CLK_MT6765 is not set
# CONFIG_COMMON_CLK_MT6779 is not set
CONFIG_COMMON_CLK_MT6797=y
# CONFIG_COMMON_CLK_MT6797_MMSYS is not set
CONFIG_COMMON_CLK_MT6797_IMGSYS=y
# CONFIG_COMMON_CLK_MT6797_VDECSYS is not set
CONFIG_COMMON_CLK_MT6797_VENCSYS=y
CONFIG_COMMON_CLK_MT7622=y
CONFIG_COMMON_CLK_MT7622_ETHSYS=y
CONFIG_COMMON_CLK_MT7622_HIFSYS=y
# CONFIG_COMMON_CLK_MT7622_AUDSYS is not set
CONFIG_COMMON_CLK_MT7629=y
# CONFIG_COMMON_CLK_MT7629_ETHSYS is not set
# CONFIG_COMMON_CLK_MT7629_HIFSYS is not set
# CONFIG_COMMON_CLK_MT8135 is not set
# CONFIG_COMMON_CLK_MT8167 is not set
CONFIG_COMMON_CLK_MT8173=y
CONFIG_COMMON_CLK_MT8173_MMSYS=y
CONFIG_COMMON_CLK_MT8183=y
CONFIG_COMMON_CLK_MT8183_AUDIOSYS=y
CONFIG_COMMON_CLK_MT8183_CAMSYS=y
# CONFIG_COMMON_CLK_MT8183_IMGSYS is not set
# CONFIG_COMMON_CLK_MT8183_IPU_CORE0 is not set
# CONFIG_COMMON_CLK_MT8183_IPU_CORE1 is not set
CONFIG_COMMON_CLK_MT8183_IPU_ADL=y
CONFIG_COMMON_CLK_MT8183_IPU_CONN=y
# CONFIG_COMMON_CLK_MT8183_MFGCFG is not set
CONFIG_COMMON_CLK_MT8183_MMSYS=y
CONFIG_COMMON_CLK_MT8183_VDECSYS=y
# CONFIG_COMMON_CLK_MT8183_VENCSYS is not set
CONFIG_COMMON_CLK_MT8192=y
CONFIG_COMMON_CLK_MT8192_AUDSYS=y
# CONFIG_COMMON_CLK_MT8192_CAMSYS is not set
# CONFIG_COMMON_CLK_MT8192_IMGSYS is not set
CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP=y
# CONFIG_COMMON_CLK_MT8192_IPESYS is not set
# CONFIG_COMMON_CLK_MT8192_MDPSYS is not set
# CONFIG_COMMON_CLK_MT8192_MFGCFG is not set
CONFIG_COMMON_CLK_MT8192_MMSYS=y
# CONFIG_COMMON_CLK_MT8192_MSDC is not set
# CONFIG_COMMON_CLK_MT8192_SCP_ADSP is not set
# CONFIG_COMMON_CLK_MT8192_VDECSYS is not set
CONFIG_COMMON_CLK_MT8192_VENCSYS=y
CONFIG_COMMON_CLK_MT8516=y
# CONFIG_COMMON_CLK_MT8516_AUDSYS is not set
# end of Clock driver for MediaTek SoC

#
# Clock support for Amlogic platforms
#
# end of Clock support for Amlogic platforms

# CONFIG_MSTAR_MSC313_MPLL is not set
# CONFIG_COMMON_CLK_PISTACHIO is not set
# CONFIG_COMMON_CLK_QCOM is not set
# CONFIG_CLK_MT7621 is not set
CONFIG_CLK_RENESAS=y
# CONFIG_CLK_EMEV2 is not set
# CONFIG_CLK_RZA1 is not set
CONFIG_CLK_R7S9210=y
# CONFIG_CLK_R8A73A4 is not set
# CONFIG_CLK_R8A7740 is not set
# CONFIG_CLK_R8A7742 is not set
# CONFIG_CLK_R8A7743 is not set
# CONFIG_CLK_R8A7745 is not set
# CONFIG_CLK_R8A77470 is not set
CONFIG_CLK_R8A774A1=y
CONFIG_CLK_R8A774B1=y
# CONFIG_CLK_R8A774C0 is not set
CONFIG_CLK_R8A774E1=y
CONFIG_CLK_R8A7778=y
# CONFIG_CLK_R8A7779 is not set
# CONFIG_CLK_R8A7790 is not set
CONFIG_CLK_R8A7791=y
CONFIG_CLK_R8A7792=y
CONFIG_CLK_R8A7794=y
CONFIG_CLK_R8A7795=y
# CONFIG_CLK_R8A77960 is not set
# CONFIG_CLK_R8A77961 is not set
CONFIG_CLK_R8A77965=y
# CONFIG_CLK_R8A77970 is not set
# CONFIG_CLK_R8A77980 is not set
# CONFIG_CLK_R8A77990 is not set
CONFIG_CLK_R8A77995=y
CONFIG_CLK_R8A779A0=y
CONFIG_CLK_R9A06G032=y
# CONFIG_CLK_R9A07G044 is not set
# CONFIG_CLK_SH73A0 is not set
CONFIG_CLK_RCAR_CPG_LIB=y
CONFIG_CLK_RCAR_GEN2_CPG=y
CONFIG_CLK_RCAR_GEN3_CPG=y
# CONFIG_CLK_RCAR_USB2_CLOCK_SEL is not set
# CONFIG_CLK_RZG2L is not set
CONFIG_CLK_RENESAS_CPG_MSSR=y
CONFIG_CLK_RENESAS_CPG_MSTP=y
CONFIG_CLK_RENESAS_DIV6=y
# CONFIG_ARCH_S32_CLK is not set
CONFIG_COMMON_CLK_SAMSUNG=y
CONFIG_S3C64XX_COMMON_CLK=y
# CONFIG_S5PV210_COMMON_CLK is not set
CONFIG_EXYNOS_3250_COMMON_CLK=y
# CONFIG_EXYNOS_4_COMMON_CLK is not set
# CONFIG_EXYNOS_5250_COMMON_CLK is not set
CONFIG_EXYNOS_5260_COMMON_CLK=y
# CONFIG_EXYNOS_5410_COMMON_CLK is not set
# CONFIG_EXYNOS_5420_COMMON_CLK is not set
# CONFIG_EXYNOS_ARM64_COMMON_CLK is not set
CONFIG_EXYNOS_AUDSS_CLK_CON=y
CONFIG_EXYNOS_CLKOUT=y
# CONFIG_S3C2410_COMMON_CLK is not set
CONFIG_S3C2412_COMMON_CLK=y
# CONFIG_S3C2443_COMMON_CLK is not set
CONFIG_CLK_SIFIVE=y
CONFIG_CLK_SIFIVE_PRCI=y
# CONFIG_CLK_INTEL_SOCFPGA is not set
# CONFIG_SPRD_COMMON_CLK is not set
CONFIG_CLK_SUNXI=y
CONFIG_CLK_SUNXI_CLOCKS=y
CONFIG_CLK_SUNXI_PRCM_SUN6I=y
CONFIG_CLK_SUNXI_PRCM_SUN8I=y
# CONFIG_CLK_SUNXI_PRCM_SUN9I is not set
CONFIG_SUNXI_CCU=y
# CONFIG_SUNIV_F1C100S_CCU is not set
# CONFIG_SUN50I_A64_CCU is not set
# CONFIG_SUN50I_A100_CCU is not set
CONFIG_SUN50I_A100_R_CCU=y
CONFIG_SUN50I_H6_CCU=y
CONFIG_SUN50I_H616_CCU=y
CONFIG_SUN50I_H6_R_CCU=y
CONFIG_SUN4I_A10_CCU=y
# CONFIG_SUN5I_CCU is not set
# CONFIG_SUN6I_A31_CCU is not set
# CONFIG_SUN8I_A23_CCU is not set
# CONFIG_SUN8I_A33_CCU is not set
# CONFIG_SUN8I_A83T_CCU is not set
# CONFIG_SUN8I_H3_CCU is not set
# CONFIG_SUN8I_V3S_CCU is not set
# CONFIG_SUN8I_DE2_CCU is not set
CONFIG_SUN8I_R40_CCU=y
# CONFIG_SUN9I_A80_CCU is not set
CONFIG_SUN8I_R_CCU=y
CONFIG_COMMON_CLK_TI_ADPLL=y
CONFIG_CLK_UNIPHIER=y
# CONFIG_CLK_LGM_CGU is not set
CONFIG_XILINX_VCU=y
CONFIG_COMMON_CLK_ZYNQMP=y
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
# CONFIG_BCM2835_TIMER is not set
CONFIG_BCM_KONA_TIMER=y
# CONFIG_DAVINCI_TIMER is not set
CONFIG_DIGICOLOR_TIMER=y
# CONFIG_DW_APB_TIMER is not set
# CONFIG_FTTMR010_TIMER is not set
CONFIG_IXP4XX_TIMER=y
CONFIG_MESON6_TIMER=y
CONFIG_OWL_TIMER=y
# CONFIG_RDA_TIMER is not set
# CONFIG_SUN4I_TIMER is not set
# CONFIG_SUN5I_HSTIMER is not set
# CONFIG_TEGRA_TIMER is not set
# CONFIG_VT8500_TIMER is not set
# CONFIG_NPCM7XX_TIMER is not set
# CONFIG_CADENCE_TTC_TIMER is not set
# CONFIG_ASM9260_TIMER is not set
CONFIG_CLKSRC_DBX500_PRCMU=y
CONFIG_CLPS711X_TIMER=y
# CONFIG_MXS_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
CONFIG_INTEGRATOR_AP_TIMER=y
# CONFIG_CLKSRC_PISTACHIO is not set
CONFIG_CLKSRC_STM32_LP=y
# CONFIG_ARMV7M_SYSTICK is not set
CONFIG_ATMEL_PIT=y
CONFIG_ATMEL_ST=y
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
CONFIG_FSL_FTM_TIMER=y
CONFIG_OXNAS_RPS_TIMER=y
CONFIG_MTK_TIMER=y
CONFIG_SPRD_TIMER=y
# CONFIG_CLKSRC_JCORE_PIT is not set
# CONFIG_SH_TIMER_CMT is not set
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_RENESAS_OSTM is not set
# CONFIG_SH_TIMER_TMU is not set
CONFIG_EM_TIMER_STI=y
# CONFIG_CLKSRC_PXA is not set
CONFIG_H8300_TMR8=y
# CONFIG_H8300_TMR16 is not set
CONFIG_H8300_TPU=y
# CONFIG_TIMER_IMX_SYS_CTR is not set
# CONFIG_CLKSRC_ST_LPC is not set
# CONFIG_ATCPIT100_TIMER is not set
# CONFIG_INGENIC_TIMER is not set
CONFIG_INGENIC_SYSOST=y
# CONFIG_INGENIC_OST is not set
# CONFIG_MICROCHIP_PIT64B is not set
# end of Clock Source drivers

# CONFIG_MAILBOX is not set
CONFIG_IOMMU_API=y

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
CONFIG_REMOTEPROC_CDEV=y
CONFIG_INGENIC_VPU_RPROC=y
# CONFIG_MTK_SCP is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
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
CONFIG_MESON_CLK_MEASURE=y
CONFIG_MESON_GX_SOCINFO=y
# CONFIG_MESON_MX_SOCINFO is not set
# end of Amlogic SoC drivers

#
# ASPEED SoC drivers
#
CONFIG_ASPEED_LPC_CTRL=y
CONFIG_ASPEED_LPC_SNOOP=y
CONFIG_ASPEED_P2A_CTRL=y
# CONFIG_ASPEED_SOCINFO is not set
# end of ASPEED SoC drivers

CONFIG_AT91_SOC_ID=y
CONFIG_AT91_SOC_SFR=y

#
# Broadcom SoC drivers
#
# CONFIG_BCM2835_POWER is not set
CONFIG_SOC_BCM63XX=y
# CONFIG_SOC_BRCMSTB is not set
# CONFIG_BCM63XX_POWER is not set
CONFIG_BCM_PMB=y
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
CONFIG_QUICC_ENGINE=y
CONFIG_UCC_SLOW=y
CONFIG_UCC=y
CONFIG_FSL_GUTS=y
CONFIG_DPAA2_CONSOLE=y
# CONFIG_FSL_QIXIS is not set
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# CONFIG_SOC_IMX8M is not set
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
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

#
# MediaTek SoC drivers
#
# CONFIG_MTK_CMDQ is not set
CONFIG_MTK_DEVAPC=y
CONFIG_MTK_INFRACFG=y
# CONFIG_MTK_PMIC_WRAP is not set
# CONFIG_MTK_SCPSYS is not set
CONFIG_MTK_MMSYS=y
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_COMMAND_DB is not set
# CONFIG_QCOM_GENI_SE is not set
CONFIG_QCOM_GSBI=y
# CONFIG_QCOM_LLCC is not set
CONFIG_QCOM_RPMH=y
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
# CONFIG_ROCKCHIP_GRF is not set
CONFIG_ROCKCHIP_IODOMAIN=y
CONFIG_SOC_SAMSUNG=y
# CONFIG_EXYNOS_ASV_ARM is not set
CONFIG_EXYNOS_CHIPID=y
CONFIG_EXYNOS_PM_DOMAINS=y
# CONFIG_EXYNOS_REGULATOR_COUPLER is not set
CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER=y
CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER=y
# CONFIG_SOC_TI is not set
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=y
CONFIG_EXTCON_FSA9480=y
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_MAX14577=y
# CONFIG_EXTCON_MAX3355 is not set
CONFIG_EXTCON_MAX77843=y
# CONFIG_EXTCON_MAX8997 is not set
CONFIG_EXTCON_PTN5150=y
CONFIG_EXTCON_QCOM_SPMI_MISC=y
# CONFIG_EXTCON_RT8973A is not set
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
CONFIG_EXTCON_USBC_CROS_EC=y
# CONFIG_EXTCON_USBC_TUSB320 is not set
CONFIG_MEMORY=y
CONFIG_DDR=y
# CONFIG_ATMEL_SDRAMC is not set
CONFIG_ATMEL_EBI=y
# CONFIG_BRCMSTB_DPFE is not set
# CONFIG_BT1_L2_CTL is not set
# CONFIG_TI_AEMIF is not set
CONFIG_TI_EMIF=y
CONFIG_OMAP_GPMC=y
# CONFIG_OMAP_GPMC_DEBUG is not set
CONFIG_MVEBU_DEVBUS=y
CONFIG_FSL_CORENET_CF=y
CONFIG_FSL_IFC=y
CONFIG_JZ4780_NEMC=y
CONFIG_MTK_SMI=y
CONFIG_DA8XX_DDRCTL=y
CONFIG_RENESAS_RPCIF=y
# CONFIG_STM32_FMC2_EBI is not set
# CONFIG_SAMSUNG_MC is not set
# CONFIG_TEGRA_MC is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
# CONFIG_IIO_BUFFER_CB is not set
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=y
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
# CONFIG_ADIS16201 is not set
CONFIG_ADIS16209=y
CONFIG_ADXL345=y
CONFIG_ADXL345_I2C=y
CONFIG_ADXL345_SPI=y
CONFIG_ADXL372=y
CONFIG_ADXL372_SPI=y
# CONFIG_ADXL372_I2C is not set
# CONFIG_BMA220 is not set
CONFIG_BMA400=y
CONFIG_BMA400_I2C=y
CONFIG_BMA400_SPI=y
# CONFIG_BMC150_ACCEL is not set
CONFIG_BMI088_ACCEL=y
CONFIG_BMI088_ACCEL_SPI=y
CONFIG_DA280=y
CONFIG_DA311=y
CONFIG_DMARD06=y
CONFIG_DMARD09=y
CONFIG_DMARD10=y
CONFIG_FXLS8962AF=y
# CONFIG_FXLS8962AF_I2C is not set
CONFIG_FXLS8962AF_SPI=y
CONFIG_IIO_ST_ACCEL_3AXIS=y
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=y
CONFIG_IIO_ST_ACCEL_SPI_3AXIS=y
CONFIG_KXSD9=y
# CONFIG_KXSD9_SPI is not set
# CONFIG_KXSD9_I2C is not set
# CONFIG_KXCJK1013 is not set
# CONFIG_MC3230 is not set
CONFIG_MMA7455=y
# CONFIG_MMA7455_I2C is not set
CONFIG_MMA7455_SPI=y
# CONFIG_MMA7660 is not set
# CONFIG_MMA8452 is not set
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
CONFIG_MMA9553=y
CONFIG_MXC4005=y
# CONFIG_MXC6255 is not set
CONFIG_SCA3000=y
CONFIG_SCA3300=y
# CONFIG_STK8312 is not set
CONFIG_STK8BA50=y
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD_SIGMA_DELTA=y
# CONFIG_AD7091R5 is not set
CONFIG_AD7124=y
# CONFIG_AD7192 is not set
CONFIG_AD7266=y
CONFIG_AD7291=y
CONFIG_AD7292=y
CONFIG_AD7298=y
CONFIG_AD7476=y
CONFIG_AD7606=y
CONFIG_AD7606_IFACE_PARALLEL=y
# CONFIG_AD7606_IFACE_SPI is not set
CONFIG_AD7766=y
# CONFIG_AD7768_1 is not set
CONFIG_AD7780=y
CONFIG_AD7791=y
CONFIG_AD7793=y
CONFIG_AD7887=y
CONFIG_AD7923=y
CONFIG_AD7949=y
CONFIG_AD799X=y
CONFIG_AD9467=y
CONFIG_ADI_AXI_ADC=y
CONFIG_ASPEED_ADC=y
CONFIG_AT91_ADC=y
# CONFIG_AT91_SAMA5D2_ADC is not set
CONFIG_AXP20X_ADC=y
# CONFIG_AXP288_ADC is not set
CONFIG_BCM_IPROC_ADC=y
# CONFIG_CC10001_ADC is not set
CONFIG_CPCAP_ADC=y
# CONFIG_DLN2_ADC is not set
CONFIG_ENVELOPE_DETECTOR=y
CONFIG_EXYNOS_ADC=y
CONFIG_FSL_MX25_ADC=y
CONFIG_HI8435=y
CONFIG_HX711=y
CONFIG_INA2XX_ADC=y
CONFIG_INGENIC_ADC=y
CONFIG_IMX7D_ADC=y
# CONFIG_IMX8QXP_ADC is not set
CONFIG_LP8788_ADC=y
# CONFIG_LPC18XX_ADC is not set
CONFIG_LPC32XX_ADC=y
CONFIG_LTC2471=y
# CONFIG_LTC2485 is not set
# CONFIG_LTC2496 is not set
# CONFIG_LTC2497 is not set
# CONFIG_MAX1027 is not set
CONFIG_MAX11100=y
CONFIG_MAX1118=y
CONFIG_MAX1241=y
CONFIG_MAX1363=y
# CONFIG_MAX9611 is not set
CONFIG_MCP320X=y
# CONFIG_MCP3422 is not set
CONFIG_MCP3911=y
# CONFIG_MEDIATEK_MT6577_AUXADC is not set
CONFIG_MEN_Z188_ADC=y
# CONFIG_MESON_SARADC is not set
# CONFIG_MP2629_ADC is not set
CONFIG_NAU7802=y
# CONFIG_NPCM_ADC is not set
CONFIG_QCOM_VADC_COMMON=y
CONFIG_QCOM_PM8XXX_XOADC=y
CONFIG_QCOM_SPMI_IADC=y
CONFIG_QCOM_SPMI_VADC=y
# CONFIG_QCOM_SPMI_ADC5 is not set
# CONFIG_RCAR_GYRO_ADC is not set
CONFIG_ROCKCHIP_SARADC=y
CONFIG_RZG2L_ADC=y
CONFIG_SC27XX_ADC=y
CONFIG_SPEAR_ADC=y
CONFIG_SD_ADC_MODULATOR=y
# CONFIG_STM32_ADC_CORE is not set
CONFIG_STM32_DFSDM_CORE=y
CONFIG_STM32_DFSDM_ADC=y
CONFIG_SUN4I_GPADC=y
CONFIG_TI_ADC081C=y
CONFIG_TI_ADC0832=y
# CONFIG_TI_ADC084S021 is not set
CONFIG_TI_ADC12138=y
CONFIG_TI_ADC108S102=y
CONFIG_TI_ADC128S052=y
CONFIG_TI_ADC161S626=y
CONFIG_TI_ADS1015=y
CONFIG_TI_ADS7950=y
CONFIG_TI_ADS8344=y
CONFIG_TI_ADS8688=y
# CONFIG_TI_ADS124S08 is not set
# CONFIG_TI_ADS131E08 is not set
CONFIG_TI_TLC4541=y
CONFIG_TI_TSC2046=y
# CONFIG_VF610_ADC is not set
CONFIG_XILINX_XADC=y
# end of Analog to digital converters

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_AD8366 is not set
CONFIG_HMC425=y
# end of Amplifiers

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
CONFIG_ATLAS_EZO_SENSOR=y
# CONFIG_BME680 is not set
CONFIG_CCS811=y
# CONFIG_IAQCORE is not set
# CONFIG_SCD30_CORE is not set
# CONFIG_SENSIRION_SGP30 is not set
CONFIG_SENSIRION_SGP40=y
CONFIG_SPS30=y
CONFIG_SPS30_I2C=y
# CONFIG_VZ89X is not set
# end of Chemical Sensors

# CONFIG_IIO_CROS_EC_SENSORS_CORE is not set

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
CONFIG_IIO_SCMI=y
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# CONFIG_IIO_SSP_SENSORHUB is not set
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_SPI=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
# CONFIG_AD5064 is not set
# CONFIG_AD5360 is not set
# CONFIG_AD5380 is not set
CONFIG_AD5421=y
# CONFIG_AD5446 is not set
CONFIG_AD5449=y
CONFIG_AD5592R_BASE=y
CONFIG_AD5592R=y
# CONFIG_AD5593R is not set
CONFIG_AD5504=y
CONFIG_AD5624R_SPI=y
CONFIG_AD5686=y
CONFIG_AD5686_SPI=y
CONFIG_AD5696_I2C=y
CONFIG_AD5755=y
# CONFIG_AD5758 is not set
CONFIG_AD5761=y
CONFIG_AD5764=y
# CONFIG_AD5766 is not set
CONFIG_AD5770R=y
CONFIG_AD5791=y
# CONFIG_AD7303 is not set
CONFIG_AD8801=y
CONFIG_DPOT_DAC=y
CONFIG_DS4424=y
# CONFIG_LPC18XX_DAC is not set
CONFIG_LTC1660=y
CONFIG_LTC2632=y
# CONFIG_M62332 is not set
CONFIG_MAX517=y
# CONFIG_MAX5821 is not set
CONFIG_MCP4725=y
# CONFIG_MCP4922 is not set
# CONFIG_STM32_DAC is not set
CONFIG_TI_DAC082S085=y
# CONFIG_TI_DAC5571 is not set
CONFIG_TI_DAC7311=y
CONFIG_TI_DAC7612=y
# CONFIG_VF610_DAC is not set
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_DUMMY_EVGEN=y
CONFIG_IIO_SIMPLE_DUMMY=y
CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
# CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
# end of IIO dummy driver

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
CONFIG_AD9523=y
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
CONFIG_ADF4350=y
CONFIG_ADF4371=y
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
CONFIG_ADIS16080=y
# CONFIG_ADIS16130 is not set
CONFIG_ADIS16136=y
CONFIG_ADIS16260=y
CONFIG_ADXRS290=y
# CONFIG_ADXRS450 is not set
# CONFIG_BMG160 is not set
CONFIG_FXAS21002C=y
CONFIG_FXAS21002C_I2C=y
CONFIG_FXAS21002C_SPI=y
CONFIG_MPU3050=y
CONFIG_MPU3050_I2C=y
CONFIG_IIO_ST_GYRO_3AXIS=y
CONFIG_IIO_ST_GYRO_I2C_3AXIS=y
CONFIG_IIO_ST_GYRO_SPI_3AXIS=y
CONFIG_ITG3200=y
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4403=y
CONFIG_AFE4404=y
CONFIG_MAX30100=y
CONFIG_MAX30102=y
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=y
CONFIG_DHT11=y
CONFIG_HDC100X=y
CONFIG_HDC2010=y
CONFIG_HTS221=y
CONFIG_HTS221_I2C=y
CONFIG_HTS221_SPI=y
CONFIG_HTU21=y
# CONFIG_SI7005 is not set
CONFIG_SI7020=y
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_ADIS16400=y
CONFIG_ADIS16460=y
# CONFIG_ADIS16475 is not set
CONFIG_ADIS16480=y
# CONFIG_BMI160_I2C is not set
# CONFIG_BMI160_SPI is not set
CONFIG_FXOS8700=y
CONFIG_FXOS8700_I2C=y
CONFIG_FXOS8700_SPI=y
CONFIG_KMX61=y
# CONFIG_INV_ICM42600_I2C is not set
# CONFIG_INV_ICM42600_SPI is not set
CONFIG_INV_MPU6050_IIO=y
# CONFIG_INV_MPU6050_I2C is not set
CONFIG_INV_MPU6050_SPI=y
# CONFIG_IIO_ST_LSM6DSX is not set
CONFIG_IIO_ST_LSM9DS0=y
CONFIG_IIO_ST_LSM9DS0_I2C=y
CONFIG_IIO_ST_LSM9DS0_SPI=y
# end of Inertial measurement units

CONFIG_IIO_ADIS_LIB=y
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
CONFIG_ADJD_S311=y
# CONFIG_ADUX1020 is not set
CONFIG_AL3010=y
CONFIG_AL3320A=y
# CONFIG_APDS9300 is not set
CONFIG_APDS9960=y
CONFIG_AS73211=y
CONFIG_BH1750=y
CONFIG_BH1780=y
# CONFIG_CM32181 is not set
CONFIG_CM3232=y
CONFIG_CM3323=y
CONFIG_CM3605=y
# CONFIG_CM36651 is not set
CONFIG_GP2AP002=y
CONFIG_GP2AP020A00F=y
CONFIG_IQS621_ALS=y
# CONFIG_SENSORS_ISL29018 is not set
CONFIG_SENSORS_ISL29028=y
# CONFIG_ISL29125 is not set
CONFIG_JSA1212=y
# CONFIG_RPR0521 is not set
CONFIG_SENSORS_LM3533=y
CONFIG_LTR501=y
CONFIG_LV0104CS=y
CONFIG_MAX44000=y
CONFIG_MAX44009=y
CONFIG_NOA1305=y
CONFIG_OPT3001=y
# CONFIG_PA12203001 is not set
# CONFIG_SI1133 is not set
CONFIG_SI1145=y
CONFIG_STK3310=y
CONFIG_ST_UVIS25=y
CONFIG_ST_UVIS25_I2C=y
CONFIG_ST_UVIS25_SPI=y
# CONFIG_TCS3414 is not set
CONFIG_TCS3472=y
CONFIG_SENSORS_TSL2563=y
# CONFIG_TSL2583 is not set
CONFIG_TSL2591=y
CONFIG_TSL2772=y
CONFIG_TSL4531=y
CONFIG_US5182D=y
CONFIG_VCNL4000=y
CONFIG_VCNL4035=y
CONFIG_VEML6030=y
CONFIG_VEML6070=y
# CONFIG_VL6180 is not set
# CONFIG_ZOPT2201 is not set
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8974=y
CONFIG_AK8975=y
CONFIG_AK09911=y
CONFIG_BMC150_MAGN=y
# CONFIG_BMC150_MAGN_I2C is not set
CONFIG_BMC150_MAGN_SPI=y
CONFIG_MAG3110=y
# CONFIG_MMC35240 is not set
CONFIG_IIO_ST_MAGN_3AXIS=y
CONFIG_IIO_ST_MAGN_I2C_3AXIS=y
CONFIG_IIO_ST_MAGN_SPI_3AXIS=y
CONFIG_SENSORS_HMC5843=y
CONFIG_SENSORS_HMC5843_I2C=y
# CONFIG_SENSORS_HMC5843_SPI is not set
CONFIG_SENSORS_RM3100=y
CONFIG_SENSORS_RM3100_I2C=y
CONFIG_SENSORS_RM3100_SPI=y
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

# CONFIG_IIO_TEST_FORMAT is not set

#
# Triggers - standalone
#
CONFIG_IIO_INTERRUPT_TRIGGER=y
CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
CONFIG_IIO_STM32_TIMER_TRIGGER=y
CONFIG_IIO_SYSFS_TRIGGER=y
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=y
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=y
CONFIG_AD5272=y
CONFIG_DS1803=y
# CONFIG_MAX5432 is not set
CONFIG_MAX5481=y
CONFIG_MAX5487=y
CONFIG_MCP4018=y
CONFIG_MCP4131=y
# CONFIG_MCP4531 is not set
CONFIG_MCP41010=y
# CONFIG_TPL0102 is not set
# end of Digital potentiometers

#
# Digital potentiostats
#
# CONFIG_LMP91000 is not set
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=y
# CONFIG_BMP280 is not set
CONFIG_DLHL60D=y
# CONFIG_DPS310 is not set
# CONFIG_HP03 is not set
CONFIG_ICP10100=y
CONFIG_MPL115=y
CONFIG_MPL115_I2C=y
# CONFIG_MPL115_SPI is not set
# CONFIG_MPL3115 is not set
CONFIG_MS5611=y
CONFIG_MS5611_I2C=y
# CONFIG_MS5611_SPI is not set
# CONFIG_MS5637 is not set
# CONFIG_IIO_ST_PRESS is not set
CONFIG_T5403=y
CONFIG_HP206C=y
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y
CONFIG_ZPA2326_SPI=y
# end of Pressure sensors

#
# Lightning sensors
#
CONFIG_AS3935=y
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_CROS_EC_MKBP_PROXIMITY=y
# CONFIG_ISL29501 is not set
# CONFIG_LIDAR_LITE_V2 is not set
CONFIG_MB1232=y
CONFIG_PING=y
# CONFIG_RFD77402 is not set
CONFIG_SRF04=y
CONFIG_SX9310=y
CONFIG_SX9500=y
CONFIG_SRF08=y
CONFIG_VCNL3020=y
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
CONFIG_AD2S90=y
CONFIG_AD2S1200=y
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=y
CONFIG_LTC2983=y
# CONFIG_MAXIM_THERMOCOUPLE is not set
# CONFIG_MLX90614 is not set
# CONFIG_MLX90632 is not set
CONFIG_TMP006=y
CONFIG_TMP007=y
CONFIG_TMP117=y
CONFIG_TSYS01=y
CONFIG_TSYS02D=y
CONFIG_MAX31856=y
# end of Temperature sensors

CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
CONFIG_PWM_ATMEL=y
# CONFIG_PWM_ATMEL_HLCDC_PWM is not set
CONFIG_PWM_ATMEL_TCB=y
CONFIG_PWM_BCM_IPROC=y
CONFIG_PWM_BCM_KONA=y
CONFIG_PWM_BCM2835=y
CONFIG_PWM_BERLIN=y
CONFIG_PWM_BRCMSTB=y
CONFIG_PWM_CLPS711X=y
CONFIG_PWM_CROS_EC=y
# CONFIG_PWM_EP93XX is not set
CONFIG_PWM_FSL_FTM=y
CONFIG_PWM_HIBVT=y
CONFIG_PWM_IMG=y
# CONFIG_PWM_IMX1 is not set
CONFIG_PWM_IMX27=y
CONFIG_PWM_IMX_TPM=y
CONFIG_PWM_INTEL_LGM=y
CONFIG_PWM_IQS620A=y
CONFIG_PWM_JZ4740=y
# CONFIG_PWM_KEEMBAY is not set
CONFIG_PWM_LP3943=y
# CONFIG_PWM_LPC18XX_SCT is not set
CONFIG_PWM_LPC32XX=y
CONFIG_PWM_LPSS=y
CONFIG_PWM_LPSS_PLATFORM=y
CONFIG_PWM_MESON=y
CONFIG_PWM_MTK_DISP=y
CONFIG_PWM_MEDIATEK=y
CONFIG_PWM_MXS=y
CONFIG_PWM_NTXEC=y
# CONFIG_PWM_OMAP_DMTIMER is not set
CONFIG_PWM_PCA9685=y
CONFIG_PWM_PXA=y
# CONFIG_PWM_RASPBERRYPI_POE is not set
CONFIG_PWM_RCAR=y
CONFIG_PWM_RENESAS_TPU=y
CONFIG_PWM_ROCKCHIP=y
CONFIG_PWM_SAMSUNG=y
# CONFIG_PWM_SIFIVE is not set
# CONFIG_PWM_SL28CPLD is not set
CONFIG_PWM_SPEAR=y
# CONFIG_PWM_SPRD is not set
# CONFIG_PWM_STI is not set
# CONFIG_PWM_STM32 is not set
CONFIG_PWM_STM32_LP=y
CONFIG_PWM_SUN4I=y
# CONFIG_PWM_TEGRA is not set
CONFIG_PWM_TIECAP=y
# CONFIG_PWM_TIEHRPWM is not set
CONFIG_PWM_VISCONTI=y
# CONFIG_PWM_VT8500 is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
# CONFIG_AL_FIC is not set
# CONFIG_JCORE_AIC is not set
# CONFIG_RENESAS_INTC_IRQPIN is not set
# CONFIG_RENESAS_IRQC is not set
CONFIG_RENESAS_RZA1_IRQC=y
# CONFIG_SL28CPLD_INTC is not set
# CONFIG_TS4800_IRQ is not set
# CONFIG_INGENIC_TCU_IRQ is not set
CONFIG_RENESAS_H8S_INTC=y
# CONFIG_IRQ_UNIPHIER_AIDET is not set
CONFIG_IMX_IRQSTEER=y
# CONFIG_IMX_INTMUX is not set
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_LOONGSON_PCH_PIC is not set
CONFIG_MST_IRQ=y
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_SERIAL_IPOCTAL is not set
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_ATH79 is not set
CONFIG_RESET_AXS10X=y
# CONFIG_RESET_BCM6345 is not set
# CONFIG_RESET_BERLIN is not set
CONFIG_RESET_BRCMSTB=y
# CONFIG_RESET_BRCMSTB_RESCAL is not set
# CONFIG_RESET_HSDK is not set
CONFIG_RESET_IMX7=y
# CONFIG_RESET_INTEL_GW is not set
CONFIG_RESET_K210=y
# CONFIG_RESET_LANTIQ is not set
CONFIG_RESET_GPIO=y
CONFIG_RESET_LPC18XX=y
# CONFIG_RESET_MCHP_SPARX5 is not set
CONFIG_RESET_MESON=y
CONFIG_RESET_MESON_AUDIO_ARB=y
CONFIG_RESET_NPCM=y
CONFIG_RESET_PISTACHIO=y
CONFIG_RESET_QCOM_AOSS=y
CONFIG_RESET_QCOM_PDC=y
CONFIG_RESET_RASPBERRYPI=y
# CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
CONFIG_RESET_SCMI=y
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_SOCFPGA is not set
CONFIG_RESET_SUNXI=y
# CONFIG_RESET_TI_SYSCON is not set
CONFIG_RESET_UNIPHIER=y
CONFIG_RESET_UNIPHIER_GLUE=y
# CONFIG_RESET_ZYNQ is not set
CONFIG_COMMON_RESET_HI3660=y
CONFIG_COMMON_RESET_HI6220=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
CONFIG_PHY_LPC18XX_USB_OTG=y
# CONFIG_PHY_PISTACHIO_USB is not set
CONFIG_PHY_XGENE=y
# CONFIG_USB_LGM_PHY is not set
CONFIG_PHY_CAN_TRANSCEIVER=y
# CONFIG_PHY_MIXEL_LVDS is not set
# CONFIG_PHY_MIXEL_LVDS_COMBO is not set
CONFIG_PHY_SUN4I_USB=y
CONFIG_PHY_SUN6I_MIPI_DPHY=y
# CONFIG_PHY_SUN9I_USB is not set
# CONFIG_PHY_SUN50I_USB3 is not set
CONFIG_PHY_MESON8B_USB2=y
CONFIG_PHY_MESON_GXL_USB2=y
CONFIG_PHY_MESON_G12A_USB2=y
# CONFIG_PHY_MESON_G12A_USB3_PCIE is not set
CONFIG_PHY_MESON_AXG_PCIE=y
# CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG is not set
CONFIG_PHY_MESON_AXG_MIPI_DPHY=y
# CONFIG_PHY_BCM63XX_USBH is not set
CONFIG_PHY_CYGNUS_PCIE=y
# CONFIG_PHY_BCM_SR_USB is not set
CONFIG_BCM_KONA_USB2_PHY=y
CONFIG_PHY_BCM_NS_USB2=y
CONFIG_PHY_NS2_USB_DRD=y
CONFIG_PHY_BRCM_SATA=y
CONFIG_PHY_BRCM_USB=y
# CONFIG_PHY_BCM_SR_PCIE is not set
CONFIG_PHY_CADENCE_TORRENT=y
CONFIG_PHY_CADENCE_DPHY=y
# CONFIG_PHY_CADENCE_SIERRA is not set
CONFIG_PHY_CADENCE_SALVO=y
# CONFIG_PHY_FSL_IMX8MP_LVDS is not set
# CONFIG_PHY_FSL_IMX8MQ_USB is not set
CONFIG_PHY_MIXEL_MIPI_DPHY=y
# CONFIG_PHY_SAMSUNG_HDMI_PHY is not set
# CONFIG_PHY_FSL_IMX_PCIE is not set
CONFIG_PHY_HI6220_USB=y
# CONFIG_PHY_HI3660_USB is not set
CONFIG_PHY_HI3670_USB=y
CONFIG_PHY_HISTB_COMBPHY=y
CONFIG_PHY_HISI_INNO_USB2=y
CONFIG_PHY_INGENIC_USB=y
CONFIG_PHY_LANTIQ_VRX200_PCIE=y
CONFIG_PHY_LANTIQ_RCU_USB2=y
CONFIG_ARMADA375_USBCLUSTER_PHY=y
# CONFIG_PHY_BERLIN_SATA is not set
# CONFIG_PHY_BERLIN_USB is not set
CONFIG_PHY_MVEBU_A3700_UTMI=y
CONFIG_PHY_MVEBU_A38X_COMPHY=y
# CONFIG_PHY_MVEBU_CP110_UTMI is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
CONFIG_PHY_PXA_USB=y
# CONFIG_PHY_MMP3_USB is not set
# CONFIG_PHY_MMP3_HSIC is not set
CONFIG_PHY_MTK_TPHY=y
CONFIG_PHY_MTK_UFS=y
CONFIG_PHY_MTK_XSPHY=y
CONFIG_PHY_MTK_HDMI=y
CONFIG_PHY_MTK_MIPI_DSI=y
# CONFIG_PHY_SPARX5_SERDES is not set
CONFIG_PHY_CPCAP_USB=y
CONFIG_PHY_MAPPHONE_MDM6600=y
# CONFIG_PHY_OCELOT_SERDES is not set
CONFIG_PHY_ATH79_USB=y
CONFIG_PHY_QCOM_IPQ4019_USB=y
# CONFIG_PHY_QCOM_PCIE2 is not set
CONFIG_PHY_QCOM_QMP=y
# CONFIG_PHY_QCOM_QUSB2 is not set
CONFIG_PHY_QCOM_USB_HS=y
# CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2 is not set
CONFIG_PHY_QCOM_USB_HSIC=y
# CONFIG_PHY_QCOM_USB_HS_28NM is not set
CONFIG_PHY_QCOM_USB_SS=y
CONFIG_PHY_QCOM_IPQ806X_USB=y
# CONFIG_PHY_MT7621_PCI is not set
# CONFIG_PHY_RALINK_USB is not set
CONFIG_PHY_RCAR_GEN3_USB3=y
CONFIG_PHY_ROCKCHIP_DPHY_RX0=y
# CONFIG_PHY_ROCKCHIP_INNO_HDMI is not set
CONFIG_PHY_ROCKCHIP_INNO_USB2=y
# CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY is not set
CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=y
CONFIG_PHY_ROCKCHIP_PCIE=y
CONFIG_PHY_ROCKCHIP_TYPEC=y
CONFIG_PHY_EXYNOS_DP_VIDEO=y
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
CONFIG_PHY_EXYNOS_PCIE=y
CONFIG_PHY_SAMSUNG_UFS=y
CONFIG_PHY_SAMSUNG_USB2=y
# CONFIG_PHY_S5PV210_USB2 is not set
CONFIG_PHY_UNIPHIER_USB2=y
CONFIG_PHY_UNIPHIER_USB3=y
# CONFIG_PHY_UNIPHIER_PCIE is not set
# CONFIG_PHY_UNIPHIER_AHCI is not set
CONFIG_PHY_ST_SPEAR1310_MIPHY=y
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
# CONFIG_PHY_STIH407_USB is not set
CONFIG_PHY_STM32_USBPHYC=y
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
CONFIG_PHY_INTEL_LGM_EMMC=y
# CONFIG_PHY_XILINX_ZYNQMP is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_DTPM=y
CONFIG_MCB=y
# CONFIG_MCB_LPC is not set
# CONFIG_RAS is not set

#
# Android
#
CONFIG_ANDROID=y
# end of Android

CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_IMX_IIM is not set
# CONFIG_NVMEM_IMX_OCOTP is not set
CONFIG_JZ4780_EFUSE=y
CONFIG_NVMEM_LPC18XX_EEPROM=y
CONFIG_NVMEM_LPC18XX_OTP=y
CONFIG_NVMEM_MXS_OCOTP=y
CONFIG_MTK_EFUSE=y
# CONFIG_NVMEM_NINTENDO_OTP is not set
CONFIG_QCOM_QFPROM=y
CONFIG_NVMEM_SPMI_SDAM=y
# CONFIG_ROCKCHIP_EFUSE is not set
CONFIG_ROCKCHIP_OTP=y
CONFIG_NVMEM_BCM_OCOTP=y
CONFIG_NVMEM_STM32_ROMEM=y
# CONFIG_UNIPHIER_EFUSE is not set
CONFIG_NVMEM_VF610_OCOTP=y
CONFIG_MESON_MX_EFUSE=y
CONFIG_NVMEM_SNVS_LPGPR=y
# CONFIG_SC27XX_EFUSE is not set
# CONFIG_SPRD_EFUSE is not set
CONFIG_NVMEM_RMEM=y
# CONFIG_NVMEM_BRCM_NVRAM is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_FSI=y
CONFIG_FSI_NEW_DEV_NODE=y
CONFIG_FSI_MASTER_GPIO=y
# CONFIG_FSI_MASTER_HUB is not set
CONFIG_FSI_MASTER_ASPEED=y
CONFIG_FSI_SCOM=y
# CONFIG_FSI_SBEFIFO is not set
CONFIG_TEE=y

#
# TEE drivers
#
# end of TEE drivers

CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
# CONFIG_MUX_ADG792A is not set
CONFIG_MUX_ADGS1408=y
CONFIG_MUX_GPIO=y
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=y
CONFIG_SLIMBUS=y
# CONFIG_SLIM_QCOM_CTRL is not set
CONFIG_INTERCONNECT=y
# CONFIG_INTERCONNECT_IMX is not set
# CONFIG_INTERCONNECT_QCOM_OSM_L3 is not set
# CONFIG_INTERCONNECT_SAMSUNG is not set
CONFIG_COUNTER=y
# CONFIG_INTERRUPT_CNT is not set
# CONFIG_STM32_TIMER_CNT is not set
# CONFIG_STM32_LPTIMER_CNT is not set
# CONFIG_TI_EQEP is not set
CONFIG_FTM_QUADDEC=y
CONFIG_MICROCHIP_TCB_CAPTURE=y
CONFIG_MOST=y
# CONFIG_MOST_USB_HDM is not set
CONFIG_MOST_CDEV=y
CONFIG_MOST_SND=y
# end of Device Drivers

#
# File systems
#
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=y
CONFIG_EXT2_FS_XATTR=y
CONFIG_EXT2_FS_POSIX_ACL=y
CONFIG_EXT2_FS_SECURITY=y
CONFIG_EXT3_FS=y
# CONFIG_EXT3_FS_POSIX_ACL is not set
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=y
# CONFIG_EXT4_FS_POSIX_ACL is not set
CONFIG_EXT4_FS_SECURITY=y
CONFIG_EXT4_DEBUG=y
CONFIG_EXT4_KUNIT_TESTS=y
CONFIG_JBD2=y
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
CONFIG_JFS_FS=y
# CONFIG_JFS_POSIX_ACL is not set
CONFIG_JFS_SECURITY=y
# CONFIG_JFS_DEBUG is not set
# CONFIG_JFS_STATISTICS is not set
CONFIG_XFS_FS=y
# CONFIG_XFS_SUPPORT_V4 is not set
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
# CONFIG_XFS_ONLINE_REPAIR is not set
# CONFIG_XFS_WARN is not set
# CONFIG_XFS_DEBUG is not set
CONFIG_GFS2_FS=y
# CONFIG_GFS2_FS_LOCKING_DLM is not set
# CONFIG_OCFS2_FS is not set
CONFIG_BTRFS_FS=y
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
CONFIG_BTRFS_ASSERT=y
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=y
# CONFIG_F2FS_STAT_FS is not set
CONFIG_F2FS_FS_XATTR=y
# CONFIG_F2FS_FS_POSIX_ACL is not set
CONFIG_F2FS_FS_SECURITY=y
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
CONFIG_F2FS_FS_COMPRESSION=y
# CONFIG_F2FS_FS_LZO is not set
# CONFIG_F2FS_FS_LZ4 is not set
CONFIG_F2FS_FS_ZSTD=y
CONFIG_F2FS_IOSTAT=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
# CONFIG_FILE_LOCKING is not set
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
CONFIG_FS_VERITY=y
# CONFIG_FS_VERITY_DEBUG is not set
CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_QUOTA is not set
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_QUOTACTL=y
# CONFIG_AUTOFS4_FS is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
CONFIG_OVERLAY_FS_INDEX=y
# CONFIG_OVERLAY_FS_NFS_EXPORT is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_FSCACHE=y
# CONFIG_FSCACHE_DEBUG is not set
# CONFIG_CACHEFILES is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
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
CONFIG_NTFS_FS=y
# CONFIG_NTFS_DEBUG is not set
# CONFIG_NTFS_RW is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
# CONFIG_PROC_FS is not set
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=y
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=y
# CONFIG_NLS_CODEPAGE_861 is not set
CONFIG_NLS_CODEPAGE_862=y
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
CONFIG_NLS_CODEPAGE_936=y
CONFIG_NLS_CODEPAGE_950=y
CONFIG_NLS_CODEPAGE_932=y
# CONFIG_NLS_CODEPAGE_949 is not set
CONFIG_NLS_CODEPAGE_874=y
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_CODEPAGE_1250 is not set
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=y
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
# CONFIG_NLS_ISO8859_14 is not set
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=y
CONFIG_NLS_MAC_GAELIC=y
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=y
# CONFIG_NLS_MAC_INUIT is not set
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=y
# CONFIG_NLS_UTF8 is not set
CONFIG_DLM=y
CONFIG_DLM_DEBUG=y
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_ENCRYPTED_KEYS=y
CONFIG_KEY_DH_OPERATIONS=y
CONFIG_KEY_NOTIFICATIONS=y
CONFIG_SECURITY_DMESG_RESTRICT=y
# CONFIG_SECURITYFS is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
CONFIG_ZERO_CALL_USED_REGS=y
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
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
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_TEST=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_ECC=y
# CONFIG_CRYPTO_ECDH is not set
CONFIG_CRYPTO_ECDSA=y
CONFIG_CRYPTO_ECRDSA=y
CONFIG_CRYPTO_SM2=y
# CONFIG_CRYPTO_CURVE25519 is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y
# CONFIG_CRYPTO_TLS is not set

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_LRW is not set
CONFIG_CRYPTO_OFB=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XTS=y
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_ADIANTUM is not set
# CONFIG_CRYPTO_ESSIV is not set

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_XXHASH=y
CONFIG_CRYPTO_BLAKE2B=y
# CONFIG_CRYPTO_BLAKE2S is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_WP512=y

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ANUBIS=y
# CONFIG_CRYPTO_ARC4 is not set
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=y
# CONFIG_CRYPTO_CAST5 is not set
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_KHAZAD=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_SEED=y
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_SM4 is not set
# CONFIG_CRYPTO_TEA is not set
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_842 is not set
CONFIG_CRYPTO_LZ4=y
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
# CONFIG_CRYPTO_USER_API_HASH is not set
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
CONFIG_CRYPTO_USER_API_RNG_CAVP=y
# CONFIG_CRYPTO_USER_API_AEAD is not set
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
CONFIG_CRYPTO_HASH_INFO=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
# CONFIG_CRYPTO_LIB_BLAKE2S is not set
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
CONFIG_CRYPTO_LIB_SHA256=y
# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
# CONFIG_SIGNED_PE_FILE_VERIFICATION is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# CONFIG_SYSTEM_REVOCATION_LIST is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
CONFIG_RAID6_PQ_BENCHMARK=y
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
# CONFIG_CORDIC is not set
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=y
CONFIG_STMP_DEVICE=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
CONFIG_CRC32_SARWATE=y
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC64 is not set
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
# CONFIG_XZ_DEC_X86 is not set
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
# CONFIG_XZ_DEC_ARMTHUMB is not set
# CONFIG_XZ_DEC_SPARC is not set
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_ENC16=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=y
CONFIG_TEXTSEARCH_BM=y
CONFIG_TEXTSEARCH_FSM=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_DMA=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_DMA_NONCOHERENT_MMAP=y
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_DQL=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_NLATTR=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_DIMLIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_SG_SPLIT=y
CONFIG_SG_POOL=y
CONFIG_UACCESS_MEMCPY=y
CONFIG_SBITMAP=y
CONFIG_PARMAN=y
CONFIG_OBJAGG=y
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_SYMBOLIC_ERRNAME is not set
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
CONFIG_READABLE_ASM=y
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
CONFIG_ARCH_WANT_FRAME_POINTERS=y
CONFIG_FRAME_POINTER=y
CONFIG_VMLINUX_MAP=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_UBSAN=y
CONFIG_CC_HAS_UBSAN_BOUNDS=y
# CONFIG_UBSAN_BOUNDS is not set
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_DIV_ZERO is not set
# CONFIG_UBSAN_UNREACHABLE is not set
# CONFIG_UBSAN_BOOL is not set
CONFIG_UBSAN_ENUM=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_OBJECTS=y
CONFIG_DEBUG_OBJECTS_SELFTEST=y
CONFIG_DEBUG_OBJECTS_FREE=y
CONFIG_DEBUG_OBJECTS_TIMERS=y
# CONFIG_DEBUG_OBJECTS_WORK is not set
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_DEBUG_SLAB is not set
# CONFIG_DEBUG_STACK_USAGE is not set
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_DEBUG_VM=y
CONFIG_DEBUG_VM_VMACACHE=y
CONFIG_DEBUG_VM_RB=y
# CONFIG_DEBUG_VM_PGFLAGS is not set
CONFIG_DEBUG_NOMMU_REGIONS=y
# CONFIG_DEBUG_MEMORY_INIT is not set
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=1
# CONFIG_DETECT_HUNG_TASK is not set
CONFIG_WQ_WATCHDOG=y
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_DEBUG_RT_MUTEXES=y
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_RWSEMS is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=y
CONFIG_WW_MUTEX_SELFTEST=y
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
# CONFIG_DEBUG_KOBJECT is not set
# CONFIG_DEBUG_KOBJECT_RELEASE is not set

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
CONFIG_RCU_SCALE_TEST=y
# CONFIG_RCU_TORTURE_TEST is not set
CONFIG_RCU_REF_SCALE_TEST=y
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_TRACE=y
# CONFIG_RCU_EQS_DEBUG is not set
# CONFIG_RCU_STRICT_GRACE_PERIOD is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
CONFIG_TRACE_CLOCK=y
# CONFIG_SAMPLES is not set

#
# h8300 Debugging
#

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
CONFIG_KUNIT_DEBUGFS=y
CONFIG_KUNIT_TEST=y
# CONFIG_KUNIT_EXAMPLE_TEST is not set
# CONFIG_KUNIT_ALL_TESTS is not set
CONFIG_NOTIFIER_ERROR_INJECTION=y
CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=y
CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
CONFIG_FAIL_PAGE_ALLOC=y
CONFIG_FAULT_INJECTION_USERCOPY=y
# CONFIG_FAIL_MAKE_REQUEST is not set
CONFIG_FAIL_IO_TIMEOUT=y
# CONFIG_FAIL_FUTEX is not set
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_LKDTM=y
# CONFIG_TEST_LIST_SORT is not set
CONFIG_TEST_MIN_HEAP=y
# CONFIG_TEST_SORT is not set
CONFIG_TEST_DIV64=y
CONFIG_BACKTRACE_SELF_TEST=y
CONFIG_RBTREE_TEST=y
CONFIG_REED_SOLOMON_TEST=y
# CONFIG_INTERVAL_TREE_TEST is not set
CONFIG_ATOMIC64_SELFTEST=y
CONFIG_TEST_HEXDUMP=y
# CONFIG_STRING_SELFTEST is not set
CONFIG_TEST_STRING_HELPERS=y
CONFIG_TEST_STRSCPY=y
CONFIG_TEST_KSTRTOX=y
# CONFIG_TEST_PRINTF is not set
CONFIG_TEST_SCANF=y
CONFIG_TEST_BITMAP=y
# CONFIG_TEST_UUID is not set
CONFIG_TEST_XARRAY=y
# CONFIG_TEST_OVERFLOW is not set
CONFIG_TEST_RHASHTABLE=y
# CONFIG_TEST_HASH is not set
CONFIG_TEST_IDA=y
# CONFIG_TEST_PARMAN is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
CONFIG_TEST_FIRMWARE=y
CONFIG_BITFIELD_KUNIT=y
# CONFIG_RESOURCE_KUNIT_TEST is not set
CONFIG_SYSCTL_KUNIT_TEST=y
CONFIG_LIST_KUNIT_TEST=y
CONFIG_LINEAR_RANGES_TEST=y
# CONFIG_CMDLINE_KUNIT_TEST is not set
# CONFIG_BITS_TEST is not set
CONFIG_RATIONAL_KUNIT_TEST=y
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_MEMCAT_P is not set
CONFIG_TEST_OBJAGG=y
CONFIG_TEST_STACKINIT=y
# CONFIG_TEST_MEMINIT is not set
CONFIG_TEST_FREE_PAGES=y
# end of Kernel Testing and Coverage

CONFIG_WARN_MISSING_DOCUMENTS=y
# CONFIG_WARN_ABI_ERRORS is not set
# end of Kernel hacking

--2MvctjMWrZFUohpu--
