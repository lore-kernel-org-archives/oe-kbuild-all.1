Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF01AA47
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jan 2023 21:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673126539; x=1704662539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YCy0E/LfdgtSgrMEWpN2c4elrcKllsF0eEd3HODVBXs=;
  b=JlpWZfTo52RembWLtrB8mijN85S3QyaCegUA4QrWw/UGeg8/ZUzaw0At
   Ma2X3wZmYXfjCa/0SmsakTU1dp8sSzS3MroYBCKAqmy1iH0/TBio1P6Dc
   W/I2+soNpbcVcul3XCs8YotNTiSFUg+XYH3FAWNe5gzTwu4SYUKgsdRae
   uB+uajyk3J7QkKtMYhzDJodpChhSBl2PG1IodZ5R0KwT/sVNvsjxOvzDG
   p12KviLyvv3tO0zSZsZLxT5BvjsN6dh7321tIqtM8/iN7AIenb3yLGnay
   6qPsuY7ZKL+duVKXODxz9A2KxyeoMxRPNJCJ2zpAO+sB9zciN5wXQVG7N
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="321379041"
X-IronPort-AV: E=Sophos;i="5.96,309,1665471600"; 
   d="scan'208";a="321379041"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2023 13:22:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="688633048"
X-IronPort-AV: E=Sophos;i="5.96,309,1665471600"; 
   d="scan'208";a="688633048"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 07 Jan 2023 13:22:15 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pEGdo-0004sV-1E;
	Sat, 07 Jan 2023 21:22:12 +0000
Date: Sun, 8 Jan 2023 05:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:linux-5.4.y 384/7010]
 drivers/tty/synclink.c:4091:46: error: 'DMA_MODE_CASCADE' undeclared; did
 you mean 'DMA_MODE_READ'?
Message-ID: <202301080517.kpTUdnL3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="vUIiKg51LlL5XLB2"
Content-Disposition: inline


--vUIiKg51LlL5XLB2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
head:   851c2b5fb7936d54e1147f76f88e2675f9f82b52
commit: 53a72858bcae7eaa7df8d167dbf60682d70f82a6 [384/7010] m68knommu: only set CONFIG_ISA_DMA_API for ColdFire sub-arch
config: m68k-randconfig-r022-20230108
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=53a72858bcae7eaa7df8d167dbf60682d70f82a6
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.4.y
        git checkout 53a72858bcae7eaa7df8d167dbf60682d70f82a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/tty/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10,
                    from drivers/tty/synclink.c:63:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/m68k/include/asm/page_mm.h:169:50: warning: ordered comparison of pointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
         |                                                  ^~
   include/asm-generic/bug.h:182:32: note: in definition of macro 'WARN_ON'
     182 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/dma-mapping.h:355:13: note: in expansion of macro 'WARN_ON_ONCE'
     355 |         if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
         |             ^~~~~~~~~~~~
   arch/m68k/include/asm/page_mm.h:170:33: note: in expansion of macro 'virt_addr_valid'
     170 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         |                                 ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:355:26: note: in expansion of macro 'pfn_valid'
     355 |         if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
         |                          ^~~~~~~~~
   drivers/tty/synclink.c: In function 'mgsl_claim_resources':
>> drivers/tty/synclink.c:4091:46: error: 'DMA_MODE_CASCADE' undeclared (first use in this function); did you mean 'DMA_MODE_READ'?
    4091 |                 set_dma_mode(info->dma_level,DMA_MODE_CASCADE);
         |                                              ^~~~~~~~~~~~~~~~
         |                                              DMA_MODE_READ
   drivers/tty/synclink.c:4091:46: note: each undeclared identifier is reported only once for each function it appears in
   drivers/tty/synclink.c: In function 'usc_reset':
   drivers/tty/synclink.c:5687:21: warning: variable 'readval' set but not used [-Wunused-but-set-variable]
    5687 |                 u32 readval;
         |                     ^~~~~~~
   drivers/tty/synclink.c: In function 'mgsl_load_pci_memory':
   drivers/tty/synclink.c:7398:23: warning: variable 'Dummy' set but not used [-Wunused-but-set-variable]
    7398 |         unsigned long Dummy;
         |                       ^~~~~


vim +4091 drivers/tty/synclink.c

^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4025  
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4026  static int mgsl_claim_resources(struct mgsl_struct *info)
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4027  {
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4028  	if (request_region(info->io_base,info->io_addr_size,"synclink") == NULL) {
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4029  		printk( "%s(%d):I/O address conflict on device %s Addr=%08X\n",
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4030  			__FILE__,__LINE__,info->device_name, info->io_base);
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4031  		return -ENODEV;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4032  	}
0fab6de09c71a9 drivers/char/synclink.c Joe Perches        2008-04-28  4033  	info->io_addr_requested = true;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4034  	
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4035  	if ( request_irq(info->irq_level,mgsl_interrupt,info->irq_flags,
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4036  		info->device_name, info ) < 0 ) {
25985edcedea63 drivers/tty/synclink.c  Lucas De Marchi    2011-03-30  4037  		printk( "%s(%d):Can't request interrupt on device %s IRQ=%d\n",
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4038  			__FILE__,__LINE__,info->device_name, info->irq_level );
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4039  		goto errout;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4040  	}
0fab6de09c71a9 drivers/char/synclink.c Joe Perches        2008-04-28  4041  	info->irq_requested = true;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4042  	
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4043  	if ( info->bus_type == MGSL_BUS_TYPE_PCI ) {
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4044  		if (request_mem_region(info->phys_memory_base,0x40000,"synclink") == NULL) {
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4045  			printk( "%s(%d):mem addr conflict device %s Addr=%08X\n",
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4046  				__FILE__,__LINE__,info->device_name, info->phys_memory_base);
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4047  			goto errout;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4048  		}
0fab6de09c71a9 drivers/char/synclink.c Joe Perches        2008-04-28  4049  		info->shared_mem_requested = true;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4050  		if (request_mem_region(info->phys_lcr_base + info->lcr_offset,128,"synclink") == NULL) {
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4051  			printk( "%s(%d):lcr mem addr conflict device %s Addr=%08X\n",
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4052  				__FILE__,__LINE__,info->device_name, info->phys_lcr_base + info->lcr_offset);
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4053  			goto errout;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4054  		}
0fab6de09c71a9 drivers/char/synclink.c Joe Perches        2008-04-28  4055  		info->lcr_mem_requested = true;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4056  
24cb233520f019 drivers/char/synclink.c Alan Cox           2008-04-30  4057  		info->memory_base = ioremap_nocache(info->phys_memory_base,
24cb233520f019 drivers/char/synclink.c Alan Cox           2008-04-30  4058  								0x40000);
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4059  		if (!info->memory_base) {
25985edcedea63 drivers/tty/synclink.c  Lucas De Marchi    2011-03-30  4060  			printk( "%s(%d):Can't map shared memory on device %s MemAddr=%08X\n",
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4061  				__FILE__,__LINE__,info->device_name, info->phys_memory_base );
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4062  			goto errout;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4063  		}
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4064  		
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4065  		if ( !mgsl_memory_test(info) ) {
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4066  			printk( "%s(%d):Failed shared memory test %s MemAddr=%08X\n",
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4067  				__FILE__,__LINE__,info->device_name, info->phys_memory_base );
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4068  			goto errout;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4069  		}
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4070  		
24cb233520f019 drivers/char/synclink.c Alan Cox           2008-04-30  4071  		info->lcr_base = ioremap_nocache(info->phys_lcr_base,
24cb233520f019 drivers/char/synclink.c Alan Cox           2008-04-30  4072  								PAGE_SIZE);
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4073  		if (!info->lcr_base) {
25985edcedea63 drivers/tty/synclink.c  Lucas De Marchi    2011-03-30  4074  			printk( "%s(%d):Can't map LCR memory on device %s MemAddr=%08X\n",
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4075  				__FILE__,__LINE__,info->device_name, info->phys_lcr_base );
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4076  			goto errout;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4077  		}
24cb233520f019 drivers/char/synclink.c Alan Cox           2008-04-30  4078  		info->lcr_base += info->lcr_offset;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4079  		
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4080  	} else {
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4081  		/* claim DMA channel */
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4082  		
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4083  		if (request_dma(info->dma_level,info->device_name) < 0){
25985edcedea63 drivers/tty/synclink.c  Lucas De Marchi    2011-03-30  4084  			printk( "%s(%d):Can't request DMA channel on device %s DMA=%d\n",
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4085  				__FILE__,__LINE__,info->device_name, info->dma_level );
556c27806071d6 drivers/tty/synclink.c  Christophe JAILLET 2017-09-17  4086  			goto errout;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4087  		}
0fab6de09c71a9 drivers/char/synclink.c Joe Perches        2008-04-28  4088  		info->dma_requested = true;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4089  
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4090  		/* ISA adapter uses bus master DMA */		
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16 @4091  		set_dma_mode(info->dma_level,DMA_MODE_CASCADE);
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4092  		enable_dma(info->dma_level);
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4093  	}
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4094  	
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4095  	if ( mgsl_allocate_dma_buffers(info) < 0 ) {
25985edcedea63 drivers/tty/synclink.c  Lucas De Marchi    2011-03-30  4096  		printk( "%s(%d):Can't allocate DMA buffers on device %s DMA=%d\n",
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4097  			__FILE__,__LINE__,info->device_name, info->dma_level );
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4098  		goto errout;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4099  	}	
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4100  	
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4101  	return 0;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4102  errout:
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4103  	mgsl_release_resources(info);
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4104  	return -ENODEV;
^1da177e4c3f41 drivers/char/synclink.c Linus Torvalds     2005-04-16  4105  

:::::: The code at line 4091 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

--vUIiKg51LlL5XLB2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/m68k 5.4.147 Kernel Configuration
#

#
# Compiler: m68k-linux-gcc (GCC) 12.1.0
#
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_POSIX_MQUEUE is not set
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_USELIB=y
CONFIG_AUDIT=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_BSD_PROCESS_ACCT=y
# CONFIG_BSD_PROCESS_ACCT_V3 is not set
# CONFIG_TASKSTATS is not set
CONFIG_PSI=y
CONFIG_PSI_DEFAULT_DISABLED=y
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
CONFIG_TASKS_RCU=y
# end of RCU Subsystem

CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=17
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
# CONFIG_CGROUP_BPF is not set
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
CONFIG_USER_NS=y
# CONFIG_PID_NS is not set
# CONFIG_NET_NS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
CONFIG_SYSFS_DEPRECATED=y
CONFIG_SYSFS_DEPRECATED_V2=y
CONFIG_RELAY=y
# CONFIG_BLK_DEV_INITRD is not set
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_BPF=y
CONFIG_EXPERT=y
# CONFIG_UID16 is not set
CONFIG_MULTIUSER=y
# CONFIG_SGETMASK_SYSCALL is not set
# CONFIG_SYSFS_SYSCALL is not set
CONFIG_SYSCTL_SYSCALL=y
# CONFIG_FHANDLE is not set
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
# CONFIG_BUG is not set
# CONFIG_ELF_CORE is not set
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_HAVE_FUTEX_CMPXCHG=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
# CONFIG_TIMERFD is not set
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
# CONFIG_AIO is not set
# CONFIG_IO_URING is not set
# CONFIG_ADVISE_SYSCALLS is not set
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_BPF_SYSCALL=y
# CONFIG_USERFAULTFD is not set
CONFIG_EMBEDDED=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SLAB=y
# CONFIG_SLUB is not set
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_SYSTEM_DATA_VERIFICATION=y
# CONFIG_PROFILING is not set
# end of General setup

CONFIG_M68K=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_GENERIC_CSUM=y
CONFIG_TIME_LOW_RES=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_ZONE_DMA=y
CONFIG_HZ=100
CONFIG_PGTABLE_LEVELS=2
CONFIG_MMU=y
CONFIG_MMU_COLDFIRE=y

#
# Platform setup
#

#
# Processor Type
#
# CONFIG_M68KCLASSIC is not set
CONFIG_COLDFIRE=y
CONFIG_M547x=y
# CONFIG_M548x is not set
# CONFIG_M5441x is not set
CONFIG_M54xx=y

#
# Processor Specific Options
#
# CONFIG_M68KFPU_EMU is not set
CONFIG_ADVANCED=y
CONFIG_RMW_INSNS=y
# CONFIG_SINGLE_MEMORY_CHUNK is not set
CONFIG_ARCH_DISCONTIGMEM_ENABLE=y
CONFIG_NODES_SHIFT=3
CONFIG_CPU_HAS_NO_BITFIELDS=y
CONFIG_CPU_HAS_NO_MULDIV64=y
CONFIG_FPU=y
CONFIG_HAVE_CACHE_CB=y
CONFIG_HAVE_MBAR=y
CONFIG_CLOCK_FREQ=266000000
CONFIG_CACHE_WRITETHRU=y
# CONFIG_CACHE_COPYBACK is not set

#
# Machine Types
#
# CONFIG_FIREBEE is not set

#
# Machine Options
#
CONFIG_UBOOT=y
CONFIG_4KSTACKS=y

#
# RAM configuration
#
CONFIG_RAMBASE=0
CONFIG_RAMSIZE=0x400000
CONFIG_VECTORBASE=0
CONFIG_MBAR=0x10000000
CONFIG_KERNELBASE=0x400

#
# ROM configuration
#
CONFIG_ROM=y
CONFIG_ROMBASE=0
CONFIG_ROMVEC=0
CONFIG_ROMSTART=0x400
CONFIG_ROMSIZE=0x100000
CONFIG_RAMKERNEL=y
# CONFIG_ROMKERNEL is not set

#
# Bus Support
#
CONFIG_ISA_DMA_API=y
# end of Platform setup

#
# Kernel Features
#

#
# Platform devices
#
# CONFIG_PROC_HARDWARE is not set
# end of Platform devices

#
# Character devices
#
# end of Character devices

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_CLK=y
CONFIG_MMU_GATHER_NO_RANGE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
CONFIG_64BIT_TIME=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_CPU_NO_EFFICIENT_FFS=y
# CONFIG_REFCOUNT_FULL is not set
# CONFIG_LOCK_EVENT_COUNTS is not set

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
CONFIG_GCOV_FORMAT_4_7=y
# end of GCOV-based kernel profiling

CONFIG_PLUGIN_HOSTCC=""
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
CONFIG_MODULE_FORCE_UNLOAD=y
CONFIG_MODVERSIONS=y
CONFIG_ASM_MODVERSIONS=y
CONFIG_MODULE_SRCVERSION_ALL=y
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
# CONFIG_MODULE_SIG_ALL is not set
CONFIG_MODULE_SIG_SHA1=y
# CONFIG_MODULE_SIG_SHA224 is not set
# CONFIG_MODULE_SIG_SHA256 is not set
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha1"
# CONFIG_MODULE_COMPRESS is not set
CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y
CONFIG_UNUSED_SYMBOLS=y
# CONFIG_BLOCK is not set
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_FREEZER=y

#
# Executable file formats
#
# CONFIG_BINFMT_ELF is not set
CONFIG_BINFMT_SCRIPT=m
CONFIG_ARCH_HAS_BINFMT_FLAT=y
CONFIG_BINFMT_FLAT=y
CONFIG_BINFMT_FLAT_ARGVP_ENVP_ON_STACK=y
CONFIG_BINFMT_FLAT_OLD=y
CONFIG_BINFMT_ZFLAT=y
CONFIG_BINFMT_SHARED_FLAT=y
CONFIG_HAVE_AOUT=y
CONFIG_BINFMT_AOUT=y
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_DISCONTIGMEM=y
CONFIG_FLAT_NODE_MEM_MAP=y
CONFIG_NEED_MULTIPLE_NODES=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_VIRT_TO_BUS=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CLEANCACHE is not set
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_AREAS=7
# CONFIG_ZPOOL is not set
CONFIG_ZBUD=y
CONFIG_ZSMALLOC=y
# CONFIG_ZSMALLOC_STAT is not set
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_FRAME_VECTOR=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_BENCHMARK is not set
# end of Memory Management options

CONFIG_NET=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
# CONFIG_PACKET is not set
CONFIG_UNIX=m
CONFIG_UNIX_SCM=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=m
# CONFIG_TLS_DEVICE is not set
CONFIG_XFRM=y
CONFIG_XFRM_ALGO=y
# CONFIG_XFRM_USER is not set
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
# CONFIG_XFRM_MIGRATE is not set
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_IPCOMP=y
# CONFIG_NET_KEY is not set
CONFIG_XDP_SOCKETS=y
CONFIG_XDP_SOCKETS_DIAG=y
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
CONFIG_IP_PNP_BOOTP=y
CONFIG_IP_PNP_RARP=y
CONFIG_NET_IPIP=y
CONFIG_NET_IPGRE_DEMUX=y
CONFIG_NET_IP_TUNNEL=y
# CONFIG_NET_IPGRE is not set
# CONFIG_SYN_COOKIES is not set
CONFIG_NET_IPVTI=m
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
# CONFIG_INET_AH is not set
CONFIG_INET_ESP=m
# CONFIG_INET_ESP_OFFLOAD is not set
CONFIG_INET_IPCOMP=y
CONFIG_INET_XFRM_TUNNEL=y
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
CONFIG_INET_UDP_DIAG=m
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=m
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
CONFIG_INET6_AH=m
# CONFIG_INET6_ESP is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_MULTIPLE_TABLES=y
CONFIG_IPV6_SUBTREES=y
# CONFIG_IPV6_MROUTE is not set
CONFIG_IPV6_SEG6_LWTUNNEL=y
CONFIG_IPV6_SEG6_HMAC=y
CONFIG_NETLABEL=y
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
# CONFIG_NETFILTER is not set
CONFIG_BPFILTER=y
# CONFIG_IP_DCCP is not set
CONFIG_IP_SCTP=m
CONFIG_SCTP_DBG_OBJCNT=y
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1 is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
# CONFIG_SCTP_COOKIE_HMAC_SHA1 is not set
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
CONFIG_STP=y
CONFIG_GARP=y
CONFIG_MRP=y
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
# CONFIG_BRIDGE_VLAN_FILTERING is not set
CONFIG_VLAN_8021Q=y
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
CONFIG_DECNET=m
# CONFIG_DECNET_ROUTER is not set
CONFIG_LLC=y
CONFIG_LLC2=y
CONFIG_ATALK=y
# CONFIG_DEV_APPLETALK is not set
# CONFIG_X25 is not set
CONFIG_LAPB=y
CONFIG_PHONET=y
CONFIG_6LOWPAN=m
# CONFIG_6LOWPAN_DEBUGFS is not set
CONFIG_6LOWPAN_NHC=m
CONFIG_6LOWPAN_NHC_DEST=m
# CONFIG_6LOWPAN_NHC_FRAGMENT is not set
CONFIG_6LOWPAN_NHC_HOP=m
CONFIG_6LOWPAN_NHC_IPV6=m
CONFIG_6LOWPAN_NHC_MOBILITY=m
# CONFIG_6LOWPAN_NHC_ROUTING is not set
# CONFIG_6LOWPAN_NHC_UDP is not set
CONFIG_6LOWPAN_GHC_EXT_HDR_HOP=m
CONFIG_6LOWPAN_GHC_UDP=m
CONFIG_6LOWPAN_GHC_ICMPV6=m
CONFIG_6LOWPAN_GHC_EXT_HDR_DEST=m
# CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE is not set
CONFIG_IEEE802154=m
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=m
# CONFIG_IEEE802154_6LOWPAN is not set
CONFIG_MAC802154=m
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=m
CONFIG_NET_SCH_HTB=y
# CONFIG_NET_SCH_HFSC is not set
# CONFIG_NET_SCH_PRIO is not set
# CONFIG_NET_SCH_MULTIQ is not set
# CONFIG_NET_SCH_RED is not set
CONFIG_NET_SCH_SFB=m
# CONFIG_NET_SCH_SFQ is not set
# CONFIG_NET_SCH_TEQL is not set
# CONFIG_NET_SCH_TBF is not set
CONFIG_NET_SCH_CBS=m
CONFIG_NET_SCH_ETF=y
CONFIG_NET_SCH_TAPRIO=m
# CONFIG_NET_SCH_GRED is not set
# CONFIG_NET_SCH_DSMARK is not set
CONFIG_NET_SCH_NETEM=y
# CONFIG_NET_SCH_DRR is not set
# CONFIG_NET_SCH_MQPRIO is not set
CONFIG_NET_SCH_SKBPRIO=y
# CONFIG_NET_SCH_CHOKE is not set
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=y
CONFIG_NET_SCH_CAKE=y
CONFIG_NET_SCH_FQ=m
# CONFIG_NET_SCH_HHF is not set
CONFIG_NET_SCH_PIE=y
# CONFIG_NET_SCH_INGRESS is not set
# CONFIG_NET_SCH_PLUG is not set
# CONFIG_NET_SCH_DEFAULT is not set

#
# Classification
#
CONFIG_NET_CLS=y
# CONFIG_NET_CLS_BASIC is not set
# CONFIG_NET_CLS_TCINDEX is not set
# CONFIG_NET_CLS_ROUTE4 is not set
# CONFIG_NET_CLS_FW is not set
CONFIG_NET_CLS_U32=m
# CONFIG_CLS_U32_PERF is not set
# CONFIG_CLS_U32_MARK is not set
CONFIG_NET_CLS_RSVP=m
CONFIG_NET_CLS_RSVP6=y
CONFIG_NET_CLS_FLOW=y
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
# CONFIG_NET_CLS_MATCHALL is not set
# CONFIG_NET_EMATCH is not set
CONFIG_NET_CLS_ACT=y
# CONFIG_NET_ACT_POLICE is not set
CONFIG_NET_ACT_GACT=m
# CONFIG_GACT_PROB is not set
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
CONFIG_NET_ACT_NAT=y
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=y
# CONFIG_NET_ACT_MPLS is not set
# CONFIG_NET_ACT_VLAN is not set
CONFIG_NET_ACT_BPF=m
# CONFIG_NET_ACT_SKBMOD is not set
CONFIG_NET_ACT_IFE=y
CONFIG_NET_ACT_TUNNEL_KEY=y
CONFIG_NET_IFE_SKBMARK=m
CONFIG_NET_IFE_SKBPRIO=m
# CONFIG_NET_IFE_SKBTCINDEX is not set
CONFIG_NET_TC_SKB_EXT=y
CONFIG_NET_SCH_FIFO=y
# CONFIG_DCB is not set
# CONFIG_DNS_RESOLVER is not set
CONFIG_BATMAN_ADV=y
CONFIG_BATMAN_ADV_BATMAN_V=y
# CONFIG_BATMAN_ADV_BLA is not set
CONFIG_BATMAN_ADV_DAT=y
CONFIG_BATMAN_ADV_NC=y
CONFIG_BATMAN_ADV_DEBUGFS=y
CONFIG_BATMAN_ADV_DEBUG=y
# CONFIG_BATMAN_ADV_SYSFS is not set
CONFIG_OPENVSWITCH=y
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=y
CONFIG_MPLS_IPTUNNEL=y
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
CONFIG_NET_L3_MASTER_DEV=y
CONFIG_QRTR=y
CONFIG_QRTR_SMD=y
CONFIG_QRTR_TUN=m
# CONFIG_NET_NCSI is not set
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
# CONFIG_CAN_RAW is not set
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set

#
# CAN Device Drivers
#
CONFIG_CAN_VCAN=m
CONFIG_CAN_VXCAN=m
CONFIG_CAN_SLCAN=m
# CONFIG_CAN_DEV is not set
# CONFIG_CAN_DEBUG_DEVICES is not set
# end of CAN Device Drivers

CONFIG_BT=y
CONFIG_BT_BREDR=y
CONFIG_BT_RFCOMM=y
CONFIG_BT_RFCOMM_TTY=y
# CONFIG_BT_BNEP is not set
CONFIG_BT_HIDP=m
CONFIG_BT_HS=y
# CONFIG_BT_LE is not set
CONFIG_BT_LEDS=y
CONFIG_BT_SELFTEST=y
# CONFIG_BT_DEBUGFS is not set

#
# Bluetooth device drivers
#
CONFIG_BT_INTEL=m
CONFIG_BT_BCM=m
CONFIG_BT_RTL=m
CONFIG_BT_QCA=m
CONFIG_BT_HCIBTUSB=m
CONFIG_BT_HCIBTUSB_AUTOSUSPEND=y
# CONFIG_BT_HCIBTUSB_BCM is not set
CONFIG_BT_HCIBTUSB_MTK=y
CONFIG_BT_HCIBTUSB_RTL=y
CONFIG_BT_HCIBTSDIO=m
CONFIG_BT_HCIUART=m
CONFIG_BT_HCIUART_SERDEV=y
CONFIG_BT_HCIUART_H4=y
# CONFIG_BT_HCIUART_BCSP is not set
# CONFIG_BT_HCIUART_ATH3K is not set
CONFIG_BT_HCIUART_LL=y
# CONFIG_BT_HCIUART_3WIRE is not set
# CONFIG_BT_HCIUART_INTEL is not set
CONFIG_BT_HCIUART_BCM=y
CONFIG_BT_HCIUART_QCA=y
# CONFIG_BT_HCIUART_AG6XX is not set
# CONFIG_BT_HCIUART_MRVL is not set
# CONFIG_BT_HCIBCM203X is not set
CONFIG_BT_HCIBPA10X=m
CONFIG_BT_HCIBFUSB=m
CONFIG_BT_HCIDTL1=m
CONFIG_BT_HCIBT3C=m
CONFIG_BT_HCIBLUECARD=m
CONFIG_BT_HCIVHCI=y
CONFIG_BT_MRVL=y
CONFIG_BT_MRVL_SDIO=m
# CONFIG_BT_ATH3K is not set
CONFIG_BT_WILINK=m
# CONFIG_BT_MTKSDIO is not set
# CONFIG_BT_MTKUART is not set
CONFIG_BT_QCOMSMD=m
# end of Bluetooth device drivers

# CONFIG_AF_RXRPC is not set
CONFIG_AF_KCM=y
CONFIG_STREAM_PARSER=y
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_WIMAX=y
CONFIG_WIMAX_DEBUG_LEVEL=8
# CONFIG_RFKILL is not set
CONFIG_NET_9P=m
CONFIG_NET_9P_VIRTIO=m
# CONFIG_NET_9P_DEBUG is not set
CONFIG_CAIF=y
CONFIG_CAIF_DEBUG=y
CONFIG_CAIF_NETDEV=y
CONFIG_CAIF_USB=m
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
# CONFIG_CEPH_LIB_USE_DNS_RESOLVER is not set
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
CONFIG_NET_IFE=y
CONFIG_LWTUNNEL=y
# CONFIG_LWTUNNEL_BPF is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_FAILOVER=y

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_QUIRKS=y
CONFIG_PCI_DEBUG=y
CONFIG_PCI_REALLOC_ENABLE_AUTO=y
CONFIG_PCI_STUB=m
CONFIG_PCI_PF_STUB=m
CONFIG_PCI_ATS=y
CONFIG_PCI_IOV=y
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_CPCI=y
# CONFIG_HOTPLUG_PCI_SHPC is not set

#
# PCI controller drivers
#

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support

CONFIG_PCIE_XILINX=y
CONFIG_PCIE_ALTERA=m

#
# DesignWare PCI Core Support
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_EP=y
CONFIG_PCIE_ARTPEC6=y
CONFIG_PCIE_ARTPEC6_EP=y
# end of DesignWare PCI Core Support
# end of PCI controller drivers

#
# PCI Endpoint
#
CONFIG_PCI_ENDPOINT=y
CONFIG_PCI_ENDPOINT_CONFIGFS=y
# CONFIG_PCI_EPF_TEST is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=m
# end of PCI switch controller drivers

CONFIG_PCCARD=y
CONFIG_PCMCIA=y
CONFIG_PCMCIA_LOAD_CIS=y
CONFIG_CARDBUS=y

#
# PC-card bridges
#
# CONFIG_YENTA is not set
CONFIG_PD6729=m
CONFIG_I82092=y
CONFIG_PCCARD_NONSTATIC=y
CONFIG_RAPIDIO=y
CONFIG_RAPIDIO_DISC_TIMEOUT=30
# CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
CONFIG_RAPIDIO_DMA_ENGINE=y
CONFIG_RAPIDIO_DEBUG=y
CONFIG_RAPIDIO_ENUM_BASIC=m
CONFIG_RAPIDIO_CHMAN=y
# CONFIG_RAPIDIO_MPORT_CDEV is not set

#
# RapidIO Switch drivers
#
CONFIG_RAPIDIO_TSI57X=y
CONFIG_RAPIDIO_CPS_XX=m
CONFIG_RAPIDIO_TSI568=y
CONFIG_RAPIDIO_CPS_GEN2=y
CONFIG_RAPIDIO_RXS_GEN3=y
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
CONFIG_FW_LOADER_COMPRESS=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
# CONFIG_ALLOW_DEV_COREDUMP is not set
CONFIG_DEBUG_DRIVER=y
CONFIG_DEBUG_DEVRES=y
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
CONFIG_TEST_ASYNC_DRIVER_PROBE=m
CONFIG_GENERIC_CPU_DEVICES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_SPMI=m
CONFIG_REGMAP_W1=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_QCOM_EBI2=y
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y
CONFIG_GNSS=m
CONFIG_GNSS_SERIAL=m
CONFIG_GNSS_MTK_SERIAL=m
CONFIG_GNSS_SIRF_SERIAL=m
CONFIG_GNSS_UBX_SERIAL=m
CONFIG_MTD=y
CONFIG_MTD_TESTS=m

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
CONFIG_MTD_BCM63XX_PARTS=m
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_PARSER_IMAGETAG=m
# CONFIG_MTD_PARSER_TRX is not set
# CONFIG_MTD_SHARPSL_PARTS is not set
CONFIG_MTD_REDBOOT_PARTS=m
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_OOPS=m
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_MAP_BANK_WIDTH_8=y
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
CONFIG_MTD_MAP_BANK_WIDTH_32=y
# CONFIG_MTD_CFI_I1 is not set
# CONFIG_MTD_CFI_I2 is not set
# CONFIG_MTD_CFI_I4 is not set
CONFIG_MTD_CFI_I8=y
# CONFIG_MTD_OTP is not set
CONFIG_MTD_CFI_INTELEXT=m
CONFIG_MTD_CFI_AMDSTD=m
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=m
CONFIG_MTD_ABSENT=m
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=y
# CONFIG_MTD_PHYSMAP_COMPAT is not set
CONFIG_MTD_PHYSMAP_GPIO_ADDR=y
# CONFIG_MTD_TS5500 is not set
CONFIG_MTD_PCI=y
CONFIG_MTD_PCMCIA=y
# CONFIG_MTD_PCMCIA_ANONYMOUS is not set
CONFIG_MTD_UCLINUX=y
# CONFIG_MTD_INTEL_VR_NOR is not set
CONFIG_MTD_PLATRAM=y
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_PMC551=m
# CONFIG_MTD_PMC551_BUGFIX is not set
# CONFIG_MTD_PMC551_DEBUG is not set
CONFIG_MTD_DATAFLASH=y
CONFIG_MTD_DATAFLASH_WRITE_VERIFY=y
# CONFIG_MTD_DATAFLASH_OTP is not set
CONFIG_MTD_MCHP23K256=y
# CONFIG_MTD_SST25L is not set
# CONFIG_MTD_SLRAM is not set
CONFIG_MTD_PHRAM=y
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=y
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

CONFIG_MTD_NAND_CORE=y
# CONFIG_MTD_ONENAND is not set
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
CONFIG_MTD_RAW_NAND=y
CONFIG_MTD_NAND_ECC_SW_BCH=y

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_DENALI=y
CONFIG_MTD_NAND_DENALI_PCI=y
CONFIG_MTD_NAND_AMS_DELTA=m
CONFIG_MTD_NAND_OMAP2=y
CONFIG_MTD_NAND_OMAP_BCH=y
CONFIG_MTD_NAND_OMAP_BCH_BUILD=y
# CONFIG_MTD_NAND_TANGO is not set
# CONFIG_MTD_NAND_SHARPSL is not set
# CONFIG_MTD_NAND_CAFE is not set
CONFIG_MTD_NAND_ATMEL=m
# CONFIG_MTD_NAND_MARVELL is not set
CONFIG_MTD_NAND_SLC_LPC32XX=m
# CONFIG_MTD_NAND_MLC_LPC32XX is not set
CONFIG_MTD_NAND_BRCMNAND=m
CONFIG_MTD_NAND_BCM47XXNFLASH=m
# CONFIG_MTD_NAND_OXNAS is not set
CONFIG_MTD_NAND_FSL_IFC=m
# CONFIG_MTD_NAND_VF610_NFC is not set
CONFIG_MTD_NAND_MXC=m
# CONFIG_MTD_NAND_SH_FLCTL is not set
# CONFIG_MTD_NAND_DAVINCI is not set
CONFIG_MTD_NAND_TXX9NDFMC=y
CONFIG_MTD_NAND_SUNXI=m
# CONFIG_MTD_NAND_HISI504 is not set
CONFIG_MTD_NAND_QCOM=m
CONFIG_MTD_NAND_MTK=m
CONFIG_MTD_NAND_MXIC=y
CONFIG_MTD_NAND_TEGRA=m
# CONFIG_MTD_NAND_STM32_FMC2 is not set
CONFIG_MTD_NAND_MESON=y
CONFIG_MTD_NAND_GPIO=y
# CONFIG_MTD_NAND_PLATFORM is not set

#
# Misc
#
CONFIG_MTD_SM_COMMON=m
CONFIG_MTD_NAND_NANDSIM=y
CONFIG_MTD_NAND_RICOH=m
# CONFIG_MTD_NAND_DISKONCHIP is not set
CONFIG_MTD_SPI_NAND=y

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=m
CONFIG_MTD_QINFO_PROBE=m
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_SPI_NOR is not set
# CONFIG_MTD_UBI is not set
# CONFIG_MTD_HYPERBUS is not set
# CONFIG_OF is not set
CONFIG_PARPORT=m
CONFIG_PARPORT_AX88796=m
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
CONFIG_AD525X_DPOT=m
CONFIG_AD525X_DPOT_I2C=m
CONFIG_AD525X_DPOT_SPI=m
CONFIG_DUMMY_IRQ=y
CONFIG_PHANTOM=m
CONFIG_INTEL_MID_PTI=m
CONFIG_TIFM_CORE=y
# CONFIG_TIFM_7XX1 is not set
CONFIG_ICS932S401=y
CONFIG_ATMEL_SSC=y
# CONFIG_ENCLOSURE_SERVICES is not set
CONFIG_HP_ILO=y
CONFIG_QCOM_COINCELL=m
CONFIG_QCOM_FASTRPC=y
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
# CONFIG_ISL29020 is not set
CONFIG_SENSORS_TSL2550=m
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
CONFIG_DS1682=m
# CONFIG_PCH_PHUB is not set
CONFIG_LATTICE_ECP3_CONFIG=y
CONFIG_SRAM=y
CONFIG_PCI_ENDPOINT_TEST=m
CONFIG_XILINX_SDFEC=y
CONFIG_MISC_RTSX=y
CONFIG_C2PORT=y

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_AT25=m
# CONFIG_EEPROM_LEGACY is not set
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_93XX46=m
CONFIG_EEPROM_IDT_89HPESX=m
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=y
CONFIG_CB710_DEBUG=y
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=y
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_SPI=m
# CONFIG_SENSORS_LIS3_I2C is not set
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
# CONFIG_VOP_BUS is not set

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
# end of Intel MIC & related support

CONFIG_ECHO=m
CONFIG_MISC_ALCOR_PCI=m
CONFIG_MISC_RTSX_PCI=m
CONFIG_MISC_RTSX_USB=y
CONFIG_HABANA_AI=y
# end of Misc devices

CONFIG_HAVE_IDE=y

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# end of SCSI device support

CONFIG_FUSION=y
CONFIG_FUSION_MAX_SGE=128
# CONFIG_FUSION_LOGGING is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
CONFIG_FIREWIRE_NOSY=m
# end of IEEE 1394 (FireWire) support

# CONFIG_NETDEVICES is not set

#
# Input device support
#
CONFIG_INPUT=m
CONFIG_INPUT_LEDS=m
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_POLLDEV=m
# CONFIG_INPUT_SPARSEKMAP is not set
CONFIG_INPUT_MATRIXKMAP=m

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=m
CONFIG_INPUT_EVBUG=m

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
# CONFIG_JOYSTICK_A3D is not set
CONFIG_JOYSTICK_ADI=m
CONFIG_JOYSTICK_COBRA=m
# CONFIG_JOYSTICK_GF2K is not set
# CONFIG_JOYSTICK_GRIP is not set
CONFIG_JOYSTICK_GRIP_MP=m
CONFIG_JOYSTICK_GUILLEMOT=m
# CONFIG_JOYSTICK_INTERACT is not set
CONFIG_JOYSTICK_SIDEWINDER=m
# CONFIG_JOYSTICK_TMDC is not set
CONFIG_JOYSTICK_IFORCE=m
# CONFIG_JOYSTICK_IFORCE_USB is not set
# CONFIG_JOYSTICK_IFORCE_232 is not set
CONFIG_JOYSTICK_WARRIOR=m
# CONFIG_JOYSTICK_MAGELLAN is not set
# CONFIG_JOYSTICK_SPACEORB is not set
CONFIG_JOYSTICK_SPACEBALL=m
CONFIG_JOYSTICK_STINGER=m
CONFIG_JOYSTICK_TWIDJOY=m
# CONFIG_JOYSTICK_ZHENHUA is not set
CONFIG_JOYSTICK_DB9=m
# CONFIG_JOYSTICK_GAMECON is not set
CONFIG_JOYSTICK_TURBOGRAFX=m
# CONFIG_JOYSTICK_AS5011 is not set
# CONFIG_JOYSTICK_JOYDUMP is not set
CONFIG_JOYSTICK_XPAD=m
CONFIG_JOYSTICK_XPAD_FF=y
CONFIG_JOYSTICK_XPAD_LEDS=y
CONFIG_JOYSTICK_PSXPAD_SPI=m
# CONFIG_JOYSTICK_PSXPAD_SPI_FF is not set
CONFIG_JOYSTICK_PXRC=m
# CONFIG_JOYSTICK_FSIA6B is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
CONFIG_INPUT_AD714X=m
CONFIG_INPUT_AD714X_I2C=m
# CONFIG_INPUT_AD714X_SPI is not set
# CONFIG_INPUT_ATMEL_CAPTOUCH is not set
CONFIG_INPUT_BMA150=m
CONFIG_INPUT_E3X0_BUTTON=m
# CONFIG_INPUT_MSM_VIBRATOR is not set
CONFIG_INPUT_PM8XXX_VIBRATOR=m
CONFIG_INPUT_PMIC8XXX_PWRKEY=m
CONFIG_INPUT_M68K_BEEP=m
# CONFIG_INPUT_MAX77650_ONKEY is not set
CONFIG_INPUT_MAX77693_HAPTIC=m
CONFIG_INPUT_MAX8925_ONKEY=m
CONFIG_INPUT_MC13783_PWRBUTTON=m
CONFIG_INPUT_MMA8450=m
CONFIG_INPUT_GP2A=m
CONFIG_INPUT_GPIO_BEEPER=m
# CONFIG_INPUT_GPIO_DECODER is not set
CONFIG_INPUT_GPIO_VIBRA=m
CONFIG_INPUT_CPCAP_PWRBUTTON=m
CONFIG_INPUT_ATI_REMOTE2=m
CONFIG_INPUT_KEYSPAN_REMOTE=m
# CONFIG_INPUT_KXTJ9 is not set
CONFIG_INPUT_POWERMATE=m
CONFIG_INPUT_YEALINK=m
CONFIG_INPUT_CM109=m
CONFIG_INPUT_REGULATOR_HAPTIC=m
# CONFIG_INPUT_AXP20X_PEK is not set
CONFIG_INPUT_UINPUT=m
CONFIG_INPUT_PCF50633_PMU=m
# CONFIG_INPUT_PCF8574 is not set
CONFIG_INPUT_PWM_BEEPER=m
CONFIG_INPUT_PWM_VIBRA=m
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
CONFIG_INPUT_DA9052_ONKEY=m
CONFIG_INPUT_DA9063_ONKEY=m
CONFIG_INPUT_WM831X_ON=m
CONFIG_INPUT_PCAP=m
# CONFIG_INPUT_ADXL34X is not set
CONFIG_INPUT_IMS_PCU=m
# CONFIG_INPUT_CMA3000 is not set
CONFIG_INPUT_DRV260X_HAPTICS=m
CONFIG_INPUT_DRV2665_HAPTICS=m
CONFIG_INPUT_DRV2667_HAPTICS=m
CONFIG_INPUT_HISI_POWERKEY=m
CONFIG_INPUT_SC27XX_VIBRA=m
# CONFIG_RMI4_CORE is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=m
CONFIG_SERIO_SERPORT=m
# CONFIG_SERIO_PARKBD is not set
CONFIG_SERIO_PCIPS2=m
CONFIG_SERIO_LIBPS2=m
CONFIG_SERIO_RAW=m
# CONFIG_SERIO_ALTERA_PS2 is not set
CONFIG_SERIO_PS2MULT=m
# CONFIG_SERIO_ARC_PS2 is not set
CONFIG_SERIO_OLPC_APSP=m
CONFIG_SERIO_SUN4I_PS2=m
CONFIG_SERIO_GPIO_PS2=m
CONFIG_USERIO=m
CONFIG_GAMEPORT=m
CONFIG_GAMEPORT_NS558=m
# CONFIG_GAMEPORT_L4 is not set
CONFIG_GAMEPORT_EMU10K1=m
# CONFIG_GAMEPORT_FM801 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
# CONFIG_UNIX98_PTYS is not set
# CONFIG_LEGACY_PTYS is not set
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_ROCKETPORT is not set
# CONFIG_CYCLADES is not set
CONFIG_MOXA_INTELLIO=m
CONFIG_MOXA_SMARTIO=y
CONFIG_SYNCLINK=y
# CONFIG_SYNCLINKMP is not set
CONFIG_SYNCLINK_GT=y
CONFIG_NOZOMI=m
# CONFIG_ISI is not set
CONFIG_N_HDLC=y
# CONFIG_N_GSM is not set
# CONFIG_TRACE_SINK is not set
CONFIG_NULL_TTY=y
# CONFIG_LDISC_AUTOLOAD is not set
# CONFIG_DEVMEM is not set
CONFIG_DEVKMEM=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
# CONFIG_SERIAL_8250_FINTEK is not set
# CONFIG_SERIAL_8250_CONSOLE is not set
# CONFIG_SERIAL_8250_DMA is not set
# CONFIG_SERIAL_8250_PCI is not set
CONFIG_SERIAL_8250_CS=m
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_DWLIB=y
# CONFIG_SERIAL_8250_DW is not set
CONFIG_SERIAL_8250_RT288X=y
# CONFIG_SERIAL_8250_UNIPHIER is not set
CONFIG_SERIAL_8250_LPSS=m
CONFIG_SERIAL_8250_MID=m

#
# Non-8250 serial port support
#
CONFIG_SERIAL_ATMEL=y
# CONFIG_SERIAL_ATMEL_CONSOLE is not set
CONFIG_SERIAL_ATMEL_PDC=y
CONFIG_SERIAL_ATMEL_TTYAT=y
# CONFIG_SERIAL_CLPS711X is not set
CONFIG_SERIAL_MAX3100=y
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_IMX is not set
CONFIG_SERIAL_UARTLITE=m
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_SH_SCI=m
CONFIG_SERIAL_SH_SCI_NR_UARTS=2
CONFIG_SERIAL_SH_SCI_DMA=y
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_MCF=y
CONFIG_SERIAL_MCF_BAUDRATE=19200
# CONFIG_SERIAL_MCF_CONSOLE is not set
CONFIG_SERIAL_JSM=m
CONFIG_SERIAL_QCOM_GENI=m
CONFIG_SERIAL_SCCNXP=y
# CONFIG_SERIAL_SCCNXP_CONSOLE is not set
# CONFIG_SERIAL_SC16IS7XX is not set
CONFIG_SERIAL_TIMBERDALE=y
CONFIG_SERIAL_BCM63XX=y
CONFIG_SERIAL_BCM63XX_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=y
CONFIG_SERIAL_ALTERA_UART=m
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_IFX6X60 is not set
CONFIG_SERIAL_PCH_UART=y
# CONFIG_SERIAL_PCH_UART_CONSOLE is not set
CONFIG_SERIAL_MXS_AUART=m
CONFIG_SERIAL_MPS2_UART_CONSOLE=y
CONFIG_SERIAL_MPS2_UART=y
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
CONFIG_SERIAL_RP2=m
CONFIG_SERIAL_RP2_NR_UARTS=32
CONFIG_SERIAL_FSL_LPUART=m
CONFIG_SERIAL_FSL_LINFLEXUART=m
CONFIG_SERIAL_ST_ASC=y
# CONFIG_SERIAL_ST_ASC_CONSOLE is not set
# CONFIG_SERIAL_STM32 is not set
# CONFIG_SERIAL_MVEBU_UART is not set
# CONFIG_SERIAL_OWL is not set
# CONFIG_SERIAL_RDA is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_DEV_BUS=y
CONFIG_SERIAL_DEV_CTRL_TTYPORT=y
CONFIG_TTY_PRINTK=m
CONFIG_TTY_PRINTK_LEVEL=6
# CONFIG_PRINTER is not set
CONFIG_PPDEV=m
CONFIG_HVC_DRIVER=y
CONFIG_VIRTIO_CONSOLE=y
# CONFIG_IPMI_HANDLER is not set
CONFIG_IPMI_KCS_BMC=y
CONFIG_ASPEED_KCS_IPMI_BMC=y
CONFIG_NPCM7XX_KCS_IPMI_BMC=y
# CONFIG_ASPEED_BT_IPMI_BMC is not set
CONFIG_IPMB_DEVICE_INTERFACE=y
# CONFIG_HW_RANDOM is not set
# CONFIG_APPLICOM is not set

#
# PCMCIA character devices
#
# CONFIG_SYNCLINK_CS is not set
CONFIG_CARDMAN_4000=y
CONFIG_CARDMAN_4040=y
CONFIG_SCR24X=m
# end of PCMCIA character devices

# CONFIG_TCG_TPM is not set
# CONFIG_DEVPORT is not set
CONFIG_XILLYBUS=y
# CONFIG_XILLYBUS_PCIE is not set
# end of Character devices

# CONFIG_RANDOM_TRUST_BOOTLOADER is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
CONFIG_I2C_MUX_GPIO=y
CONFIG_I2C_MUX_GPMUX=y
CONFIG_I2C_MUX_LTC4306=m
CONFIG_I2C_MUX_PCA9541=m
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_PINCTRL=y
CONFIG_I2C_MUX_REG=m
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=m
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_ALI1535=y
CONFIG_I2C_ALI1563=m
CONFIG_I2C_ALI15X3=y
# CONFIG_I2C_AMD756 is not set
CONFIG_I2C_AMD8111=m
CONFIG_I2C_HIX5HD2=m
CONFIG_I2C_I801=y
CONFIG_I2C_ISCH=y
# CONFIG_I2C_PIIX4 is not set
CONFIG_I2C_NFORCE2=y
CONFIG_I2C_NVIDIA_GPU=y
CONFIG_I2C_SIS5595=y
CONFIG_I2C_SIS630=m
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
# CONFIG_I2C_VIAPRO is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ASPEED is not set
# CONFIG_I2C_AXXIA is not set
# CONFIG_I2C_BCM_IPROC is not set
CONFIG_I2C_BRCMSTB=m
CONFIG_I2C_CBUS_GPIO=m
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
CONFIG_I2C_DESIGNWARE_PCI=y
CONFIG_I2C_EFM32=m
CONFIG_I2C_EG20T=y
CONFIG_I2C_EMEV2=y
# CONFIG_I2C_GPIO is not set
CONFIG_I2C_IMG=m
CONFIG_I2C_IMX=m
CONFIG_I2C_IMX_LPI2C=y
CONFIG_I2C_JZ4780=y
CONFIG_I2C_KEMPLD=y
CONFIG_I2C_MESON=m
# CONFIG_I2C_MT65XX is not set
CONFIG_I2C_MT7621=y
CONFIG_I2C_OCORES=y
# CONFIG_I2C_OWL is not set
CONFIG_I2C_PCA_PLATFORM=y
# CONFIG_I2C_QCOM_GENI is not set
CONFIG_I2C_RIIC=y
CONFIG_I2C_SH_MOBILE=y
# CONFIG_I2C_SIMTEC is not set
# CONFIG_I2C_STM32F4 is not set
CONFIG_I2C_STM32F7=y
CONFIG_I2C_SUN6I_P2WI=m
CONFIG_I2C_SYNQUACER=y
CONFIG_I2C_UNIPHIER=y
CONFIG_I2C_UNIPHIER_F=m
# CONFIG_I2C_VERSATILE is not set
# CONFIG_I2C_XILINX is not set
CONFIG_I2C_XLP9XX=m
# CONFIG_I2C_RCAR is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_DLN2 is not set
CONFIG_I2C_PARPORT=m
CONFIG_I2C_PARPORT_LIGHT=m
CONFIG_I2C_ROBOTFUZZ_OSIF=m
# CONFIG_I2C_TAOS_EVM is not set
CONFIG_I2C_TINY_USB=y
# CONFIG_I2C_VIPERBOARD is not set

#
# Other I2C/SMBus bus drivers
#
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
# CONFIG_I2C_SLAVE_EEPROM is not set
CONFIG_I2C_DEBUG_CORE=y
CONFIG_I2C_DEBUG_ALGO=y
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=y
CONFIG_SPI_ATH79=m
CONFIG_SPI_ARMADA_3700=m
# CONFIG_SPI_ATMEL is not set
CONFIG_SPI_AT91_USART=m
CONFIG_SPI_AXI_SPI_ENGINE=m
# CONFIG_SPI_BCM2835 is not set
CONFIG_SPI_BCM2835AUX=m
# CONFIG_SPI_BCM63XX is not set
CONFIG_SPI_BCM63XX_HSSPI=m
# CONFIG_SPI_BCM_QSPI is not set
CONFIG_SPI_BITBANG=y
CONFIG_SPI_BUTTERFLY=m
CONFIG_SPI_CADENCE=m
CONFIG_SPI_CLPS711X=y
CONFIG_SPI_DESIGNWARE=y
CONFIG_SPI_DW_PCI=m
# CONFIG_SPI_DW_MMIO is not set
CONFIG_SPI_DLN2=m
# CONFIG_SPI_EP93XX is not set
CONFIG_SPI_FSL_LPSPI=y
CONFIG_SPI_FSL_QUADSPI=y
CONFIG_SPI_NXP_FLEXSPI=m
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_IMG_SPFI is not set
CONFIG_SPI_IMX=y
CONFIG_SPI_LM70_LLP=m
# CONFIG_SPI_LP8841_RTC is not set
# CONFIG_SPI_FSL_DSPI is not set
# CONFIG_SPI_MESON_SPICC is not set
CONFIG_SPI_MESON_SPIFC=m
CONFIG_SPI_MT65XX=m
CONFIG_SPI_MT7621=y
CONFIG_SPI_NPCM_PSPI=m
CONFIG_SPI_LANTIQ_SSC=y
# CONFIG_SPI_OC_TINY is not set
CONFIG_SPI_OMAP24XX=m
CONFIG_SPI_TI_QSPI=y
CONFIG_SPI_OMAP_100K=m
CONFIG_SPI_ORION=y
# CONFIG_SPI_PIC32 is not set
CONFIG_SPI_PIC32_SQI=y
# CONFIG_SPI_PXA2XX is not set
CONFIG_SPI_ROCKCHIP=m
# CONFIG_SPI_RSPI is not set
CONFIG_SPI_QCOM_GENI=m
CONFIG_SPI_S3C64XX=m
CONFIG_SPI_SC18IS602=m
CONFIG_SPI_SH_MSIOF=m
CONFIG_SPI_SH=m
CONFIG_SPI_SH_HSPI=m
CONFIG_SPI_SIFIVE=y
CONFIG_SPI_SPRD=m
CONFIG_SPI_SPRD_ADI=y
# CONFIG_SPI_STM32 is not set
# CONFIG_SPI_ST_SSC4 is not set
# CONFIG_SPI_SUN4I is not set
CONFIG_SPI_SUN6I=y
CONFIG_SPI_SYNQUACER=y
CONFIG_SPI_MXIC=y
# CONFIG_SPI_TEGRA114 is not set
CONFIG_SPI_TEGRA20_SFLASH=m
CONFIG_SPI_TEGRA20_SLINK=y
CONFIG_SPI_TOPCLIFF_PCH=m
CONFIG_SPI_TXX9=y
CONFIG_SPI_XCOMM=m
CONFIG_SPI_XILINX=y
CONFIG_SPI_XLP=y
CONFIG_SPI_XTENSA_XTFPGA=y
# CONFIG_SPI_ZYNQ_QSPI is not set
CONFIG_SPI_ZYNQMP_GQSPI=m

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
# CONFIG_SPI_LOOPBACK_TEST is not set
CONFIG_SPI_TLE62X0=y
# CONFIG_SPI_SLAVE is not set
CONFIG_SPMI=m
# CONFIG_SPMI_MSM_PMIC_ARB is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=m
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set
CONFIG_NTP_PPS=y

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
# CONFIG_PPS_CLIENT_PARPORT is not set
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_DTE=y
CONFIG_PTP_1588_CLOCK_QORIQ=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_PTP_1588_CLOCK_PCH=m
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
CONFIG_PINCTRL_AMD=m
CONFIG_PINCTRL_MCP23S08=y
CONFIG_PINCTRL_SX150X=y
CONFIG_PINCTRL_PXA=y
CONFIG_PINCTRL_PXA25X=m
# CONFIG_PINCTRL_PXA27X is not set
# CONFIG_PINCTRL_SH_PFC is not set
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
# CONFIG_PINCTRL_PFC_EMEV2 is not set
CONFIG_PINCTRL_PFC_R8A73A4=y
CONFIG_PINCTRL_PFC_R8A7740=y
CONFIG_PINCTRL_PFC_R8A7743=y
CONFIG_PINCTRL_PFC_R8A7744=y
# CONFIG_PINCTRL_PFC_R8A7745 is not set
# CONFIG_PINCTRL_PFC_R8A77470 is not set
# CONFIG_PINCTRL_PFC_R8A774A1 is not set
CONFIG_PINCTRL_PFC_R8A774C0=y
CONFIG_PINCTRL_PFC_R8A7778=y
# CONFIG_PINCTRL_PFC_R8A7779 is not set
# CONFIG_PINCTRL_PFC_R8A7790 is not set
# CONFIG_PINCTRL_PFC_R8A7791 is not set
# CONFIG_PINCTRL_PFC_R8A7792 is not set
CONFIG_PINCTRL_PFC_R8A7793=y
CONFIG_PINCTRL_PFC_R8A7794=y
CONFIG_PINCTRL_PFC_R8A7795=y
# CONFIG_PINCTRL_PFC_R8A7796 is not set
# CONFIG_PINCTRL_PFC_R8A77965 is not set
# CONFIG_PINCTRL_PFC_R8A77970 is not set
# CONFIG_PINCTRL_PFC_R8A77980 is not set
# CONFIG_PINCTRL_PFC_R8A77990 is not set
CONFIG_PINCTRL_PFC_R8A77995=y
CONFIG_PINCTRL_PFC_SH7203=y
# CONFIG_PINCTRL_PFC_SH7264 is not set
# CONFIG_PINCTRL_PFC_SH7269 is not set
CONFIG_PINCTRL_PFC_SH73A0=y
# CONFIG_PINCTRL_PFC_SH7720 is not set
CONFIG_PINCTRL_PFC_SH7722=y
CONFIG_PINCTRL_PFC_SH7723=y
CONFIG_PINCTRL_PFC_SH7724=y
CONFIG_PINCTRL_PFC_SH7734=y
# CONFIG_PINCTRL_PFC_SH7757 is not set
CONFIG_PINCTRL_PFC_SH7785=y
CONFIG_PINCTRL_PFC_SH7786=y
# CONFIG_PINCTRL_PFC_SHX3 is not set

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=m

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_ATH79 is not set
CONFIG_GPIO_CLPS711X=m
# CONFIG_GPIO_DWAPB is not set
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_IOP=m
CONFIG_GPIO_MB86S7X=m
# CONFIG_GPIO_MPC8XXX is not set
CONFIG_GPIO_RCAR=y
# CONFIG_GPIO_SIOX is not set
# CONFIG_GPIO_VX855 is not set
CONFIG_GPIO_XILINX=y
CONFIG_GPIO_ZX=y
CONFIG_GPIO_AMD_FCH=y
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
CONFIG_GPIO_MAX7300=m
# CONFIG_GPIO_MAX732X is not set
CONFIG_GPIO_PCA953X=y
# CONFIG_GPIO_PCA953X_IRQ is not set
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=y
CONFIG_GPIO_TS4900=m
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=m
# CONFIG_GPIO_ARIZONA is not set
CONFIG_GPIO_DA9052=m
CONFIG_GPIO_DLN2=m
# CONFIG_GPIO_JANZ_TTL is not set
CONFIG_GPIO_KEMPLD=m
CONFIG_GPIO_LP873X=m
CONFIG_GPIO_MADERA=y
CONFIG_GPIO_MAX77650=m
# CONFIG_GPIO_RC5T583 is not set
CONFIG_GPIO_TPS65086=m
# CONFIG_GPIO_TPS6586X is not set
# CONFIG_GPIO_TPS65912 is not set
CONFIG_GPIO_WM831X=m
CONFIG_GPIO_WM8994=y
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
CONFIG_GPIO_BT8XX=y
CONFIG_GPIO_ML_IOH=m
CONFIG_GPIO_PCH=y
CONFIG_GPIO_PCI_IDIO_16=m
# CONFIG_GPIO_PCIE_IDIO_24 is not set
CONFIG_GPIO_RDC321X=m
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
CONFIG_GPIO_MAX3191X=m
CONFIG_GPIO_MAX7301=m
CONFIG_GPIO_MC33880=m
CONFIG_GPIO_PISOSR=m
CONFIG_GPIO_XRA1403=y
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=m
# end of USB GPIO expanders

CONFIG_GPIO_MOCKUP=y
CONFIG_W1=m
CONFIG_W1_CON=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=m
CONFIG_W1_MASTER_DS2490=m
# CONFIG_W1_MASTER_DS2482 is not set
CONFIG_W1_MASTER_MXC=m
# CONFIG_W1_MASTER_DS1WM is not set
# CONFIG_W1_MASTER_GPIO is not set
CONFIG_W1_MASTER_SGI=m
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
# CONFIG_W1_SLAVE_THERM is not set
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=m
CONFIG_W1_SLAVE_DS2408=m
CONFIG_W1_SLAVE_DS2408_READBACK=y
CONFIG_W1_SLAVE_DS2413=m
# CONFIG_W1_SLAVE_DS2406 is not set
CONFIG_W1_SLAVE_DS2423=m
CONFIG_W1_SLAVE_DS2805=m
# CONFIG_W1_SLAVE_DS2431 is not set
CONFIG_W1_SLAVE_DS2433=m
# CONFIG_W1_SLAVE_DS2433_CRC is not set
# CONFIG_W1_SLAVE_DS2438 is not set
# CONFIG_W1_SLAVE_DS250X is not set
CONFIG_W1_SLAVE_DS2780=m
# CONFIG_W1_SLAVE_DS2781 is not set
CONFIG_W1_SLAVE_DS28E04=m
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

# CONFIG_POWER_AVS is not set
# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
CONFIG_GENERIC_ADC_BATTERY=y
CONFIG_MAX8925_POWER=m
CONFIG_WM831X_BACKUP=m
CONFIG_WM831X_POWER=m
# CONFIG_TEST_POWER is not set
CONFIG_CHARGER_ADP5061=m
CONFIG_BATTERY_ACT8945A=y
CONFIG_BATTERY_CPCAP=m
CONFIG_BATTERY_DS2760=m
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
CONFIG_BATTERY_INGENIC=m
CONFIG_BATTERY_SBS=m
CONFIG_CHARGER_SBS=m
# CONFIG_MANAGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
# CONFIG_BATTERY_BQ27XXX_HDQ is not set
CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
# CONFIG_BATTERY_DA9052 is not set
# CONFIG_BATTERY_DA9150 is not set
# CONFIG_CHARGER_AXP20X is not set
# CONFIG_BATTERY_AXP20X is not set
CONFIG_AXP20X_POWER=y
CONFIG_AXP288_FUEL_GAUGE=y
CONFIG_BATTERY_MAX17040=y
CONFIG_BATTERY_MAX17042=m
CONFIG_BATTERY_MAX1721X=m
CONFIG_CHARGER_PCF50633=y
CONFIG_CHARGER_CPCAP=m
CONFIG_CHARGER_ISP1704=m
# CONFIG_CHARGER_MAX8903 is not set
CONFIG_CHARGER_LP8727=m
CONFIG_CHARGER_LP8788=m
CONFIG_CHARGER_GPIO=y
# CONFIG_CHARGER_MANAGER is not set
# CONFIG_CHARGER_LT3651 is not set
CONFIG_CHARGER_MAX14577=y
CONFIG_CHARGER_MAX77650=m
# CONFIG_CHARGER_MAX77693 is not set
CONFIG_CHARGER_BQ2415X=m
CONFIG_CHARGER_BQ24190=m
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
CONFIG_CHARGER_BQ25890=m
# CONFIG_CHARGER_SMB347 is not set
CONFIG_CHARGER_TPS65090=y
CONFIG_BATTERY_GAUGE_LTC2941=m
CONFIG_BATTERY_GOLDFISH=m
CONFIG_BATTERY_RT5033=m
CONFIG_CHARGER_RT9455=y
CONFIG_CHARGER_SC2731=m
CONFIG_FUEL_GAUGE_SC27XX=m
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
# CONFIG_SENSORS_AD7314 is not set
# CONFIG_SENSORS_AD7414 is not set
CONFIG_SENSORS_AD7418=y
# CONFIG_SENSORS_ADM1021 is not set
# CONFIG_SENSORS_ADM1025 is not set
# CONFIG_SENSORS_ADM1026 is not set
# CONFIG_SENSORS_ADM1029 is not set
CONFIG_SENSORS_ADM1031=m
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7310=y
CONFIG_SENSORS_ADT7410=m
# CONFIG_SENSORS_ADT7411 is not set
CONFIG_SENSORS_ADT7462=y
# CONFIG_SENSORS_ADT7470 is not set
CONFIG_SENSORS_ADT7475=m
CONFIG_SENSORS_AS370=y
CONFIG_SENSORS_ASC7621=m
CONFIG_SENSORS_ASPEED=y
# CONFIG_SENSORS_ATXP1 is not set
CONFIG_SENSORS_DS620=y
# CONFIG_SENSORS_DS1621 is not set
CONFIG_SENSORS_DA9052_ADC=y
CONFIG_SENSORS_I5K_AMB=y
CONFIG_SENSORS_F71805F=y
# CONFIG_SENSORS_F71882FG is not set
# CONFIG_SENSORS_F75375S is not set
CONFIG_SENSORS_MC13783_ADC=y
CONFIG_SENSORS_FTSTEUTATES=m
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=y
# CONFIG_SENSORS_HIH6130 is not set
# CONFIG_SENSORS_IIO_HWMON is not set
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=y
CONFIG_SENSORS_POWR1220=m
CONFIG_SENSORS_LINEAGE=y
CONFIG_SENSORS_LTC2945=y
CONFIG_SENSORS_LTC2990=m
CONFIG_SENSORS_LTC4151=y
# CONFIG_SENSORS_LTC4215 is not set
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=y
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
CONFIG_SENSORS_MAX16065=y
# CONFIG_SENSORS_MAX1619 is not set
CONFIG_SENSORS_MAX1668=y
CONFIG_SENSORS_MAX197=m
CONFIG_SENSORS_MAX31722=m
CONFIG_SENSORS_MAX6621=y
CONFIG_SENSORS_MAX6639=y
# CONFIG_SENSORS_MAX6642 is not set
CONFIG_SENSORS_MAX6650=m
# CONFIG_SENSORS_MAX6697 is not set
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=m
CONFIG_SENSORS_MLXREG_FAN=m
# CONFIG_SENSORS_TC654 is not set
CONFIG_SENSORS_ADCXX=y
# CONFIG_SENSORS_LM63 is not set
CONFIG_SENSORS_LM70=m
CONFIG_SENSORS_LM73=y
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=y
# CONFIG_SENSORS_LM78 is not set
# CONFIG_SENSORS_LM80 is not set
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=y
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=y
# CONFIG_SENSORS_LM93 is not set
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
# CONFIG_SENSORS_LM95245 is not set
# CONFIG_SENSORS_PC87360 is not set
CONFIG_SENSORS_PC87427=y
CONFIG_SENSORS_NTC_THERMISTOR=y
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775=y
CONFIG_SENSORS_NCT7802=y
# CONFIG_SENSORS_NCT7904 is not set
CONFIG_SENSORS_NPCM7XX=y
# CONFIG_SENSORS_OCC_P8_I2C is not set
CONFIG_SENSORS_PCF8591=y
# CONFIG_PMBUS is not set
CONFIG_SENSORS_PWM_FAN=y
# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
CONFIG_SENSORS_SHT15=m
# CONFIG_SENSORS_SHT21 is not set
# CONFIG_SENSORS_SHT3x is not set
CONFIG_SENSORS_SHTC1=m
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_DME1737=y
CONFIG_SENSORS_EMC1403=m
CONFIG_SENSORS_EMC2103=m
# CONFIG_SENSORS_EMC6W201 is not set
CONFIG_SENSORS_SMSC47M1=y
# CONFIG_SENSORS_SMSC47M192 is not set
CONFIG_SENSORS_SMSC47B397=y
CONFIG_SENSORS_SCH56XX_COMMON=y
CONFIG_SENSORS_SCH5627=y
# CONFIG_SENSORS_SCH5636 is not set
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
CONFIG_SENSORS_ADC128D818=m
# CONFIG_SENSORS_ADS7828 is not set
# CONFIG_SENSORS_ADS7871 is not set
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=y
# CONFIG_SENSORS_INA2XX is not set
# CONFIG_SENSORS_INA3221 is not set
CONFIG_SENSORS_TC74=y
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=y
CONFIG_SENSORS_TMP103=m
CONFIG_SENSORS_TMP108=m
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=y
CONFIG_SENSORS_VIA686A=m
# CONFIG_SENSORS_VT1211 is not set
CONFIG_SENSORS_VT8231=y
CONFIG_SENSORS_W83773G=y
CONFIG_SENSORS_W83781D=y
# CONFIG_SENSORS_W83791D is not set
CONFIG_SENSORS_W83792D=y
CONFIG_SENSORS_W83793=y
CONFIG_SENSORS_W83795=y
CONFIG_SENSORS_W83795_FANCTRL=y
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=y
CONFIG_SENSORS_W83627EHF=y
CONFIG_SENSORS_WM831X=y
# CONFIG_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
# CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=y
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
# CONFIG_SOFT_WATCHDOG_PRETIMEOUT is not set
# CONFIG_DA9052_WATCHDOG is not set
CONFIG_DA9055_WATCHDOG=m
CONFIG_DA9063_WATCHDOG=y
CONFIG_DA9062_WATCHDOG=y
CONFIG_MENF21BMC_WATCHDOG=m
# CONFIG_TANGOX_WATCHDOG is not set
CONFIG_WM831X_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=m
# CONFIG_ZIIRAVE_WATCHDOG is not set
CONFIG_MLX_WDT=m
CONFIG_ARMADA_37XX_WATCHDOG=m
# CONFIG_AT91RM9200_WATCHDOG is not set
CONFIG_AT91SAM9X_WATCHDOG=m
# CONFIG_SAMA5D4_WATCHDOG is not set
CONFIG_CADENCE_WATCHDOG=y
CONFIG_FTWDT010_WATCHDOG=y
CONFIG_S3C2410_WATCHDOG=y
CONFIG_DW_WATCHDOG=m
# CONFIG_EP93XX_WATCHDOG is not set
# CONFIG_OMAP_WATCHDOG is not set
CONFIG_PNX4008_WATCHDOG=m
# CONFIG_DAVINCI_WATCHDOG is not set
CONFIG_RN5T618_WATCHDOG=m
CONFIG_SUNXI_WATCHDOG=y
CONFIG_NPCM7XX_WATCHDOG=y
CONFIG_STMP3XXX_RTC_WATCHDOG=m
CONFIG_TS72XX_WATCHDOG=y
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_MAX77620_WATCHDOG=y
CONFIG_IMX2_WDT=m
CONFIG_IMX7ULP_WDT=y
CONFIG_MOXART_WDT=m
# CONFIG_SIRFSOC_WATCHDOG is not set
CONFIG_TEGRA_WATCHDOG=m
# CONFIG_QCOM_WDT is not set
CONFIG_MESON_GXBB_WATCHDOG=m
CONFIG_MESON_WATCHDOG=y
CONFIG_MEDIATEK_WATCHDOG=y
CONFIG_DIGICOLOR_WATCHDOG=m
# CONFIG_LPC18XX_WATCHDOG is not set
# CONFIG_ATLAS7_WATCHDOG is not set
CONFIG_RENESAS_WDT=m
# CONFIG_RENESAS_RZAWDT is not set
# CONFIG_ASPEED_WATCHDOG is not set
CONFIG_SPRD_WATCHDOG=y
# CONFIG_ALIM7101_WDT is not set
# CONFIG_SC520_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_KEMPLD_WDT=m
# CONFIG_RDC321X_WDT is not set
CONFIG_BCM47XX_WDT=y
# CONFIG_BCM_KONA_WDT is not set
CONFIG_BCM7038_WDT=y
CONFIG_IMGPDC_WDT=m
CONFIG_MPC5200_WDT=y
CONFIG_MV64X60_WDT=m
CONFIG_MEN_A21_WDT=m
# CONFIG_UML_WATCHDOG is not set

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=y
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=y
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=m
CONFIG_SSB_PCIHOST_POSSIBLE=y
# CONFIG_SSB_PCIHOST is not set
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
# CONFIG_SSB_PCMCIAHOST is not set
CONFIG_SSB_SDIOHOST_POSSIBLE=y
CONFIG_SSB_SDIOHOST=y
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_MIPS=y
CONFIG_BCMA_PFLASH=y
CONFIG_BCMA_NFLASH=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_SUN4I_GPADC=m
CONFIG_MFD_AS3711=y
CONFIG_PMIC_ADP5520=y
# CONFIG_MFD_AAT2870_CORE is not set
CONFIG_MFD_AT91_USART=y
CONFIG_MFD_ATMEL_SMC=y
CONFIG_MFD_BCM590XX=y
# CONFIG_MFD_BD9571MWV is not set
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_MADERA=y
CONFIG_MFD_MADERA_I2C=y
# CONFIG_MFD_MADERA_SPI is not set
CONFIG_MFD_CS47L15=y
CONFIG_MFD_CS47L35=y
# CONFIG_MFD_CS47L85 is not set
# CONFIG_MFD_CS47L90 is not set
# CONFIG_MFD_CS47L92 is not set
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_SPI=y
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=m
CONFIG_MFD_DA9150=y
CONFIG_MFD_DLN2=y
# CONFIG_MFD_EXYNOS_LPASS is not set
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_SPI=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MXS_LRADC=y
CONFIG_MFD_MX25_TSADC=m
# CONFIG_HTC_PASIC3 is not set
CONFIG_HTC_I2CPLD=y
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=y
CONFIG_MFD_JANZ_CMODIO=m
CONFIG_MFD_KEMPLD=y
# CONFIG_MFD_88PM800 is not set
CONFIG_MFD_88PM805=m
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=y
# CONFIG_MFD_MAX77620 is not set
CONFIG_MFD_MAX77650=m
# CONFIG_MFD_MAX77686 is not set
CONFIG_MFD_MAX77693=m
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=m
CONFIG_MFD_MAX8925=y
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
CONFIG_EZX_PCAP=y
CONFIG_MFD_CPCAP=y
CONFIG_MFD_VIPERBOARD=y
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=y
CONFIG_PCF50633_GPIO=y
CONFIG_MFD_PM8XXX=y
CONFIG_MFD_RDC321X=y
CONFIG_MFD_RT5033=y
CONFIG_MFD_RC5T583=y
CONFIG_MFD_SEC_CORE=y
CONFIG_MFD_SI476X_CORE=m
CONFIG_MFD_SM501=y
# CONFIG_MFD_SM501_GPIO is not set
# CONFIG_MFD_SKY81452 is not set
CONFIG_MFD_SMSC=y
# CONFIG_MFD_SC27XX_PMIC is not set
# CONFIG_ABX500_CORE is not set
CONFIG_MFD_SUN6I_PRCM=y
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
# CONFIG_MFD_LP3943 is not set
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=y
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=m
CONFIG_MFD_TPS65086=m
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TI_LP873X=y
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=m
CONFIG_MFD_TPS65912_I2C=m
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_MFD_TPS80031 is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
CONFIG_MFD_LM3533=m
# CONFIG_MFD_TIMBERDALE is not set
CONFIG_MFD_TQMX86=m
CONFIG_MFD_VX855=m
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_CS47L24 is not set
CONFIG_MFD_WM5102=y
CONFIG_MFD_WM5110=y
# CONFIG_MFD_WM8997 is not set
CONFIG_MFD_WM8998=y
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=y
# CONFIG_MFD_STW481X is not set
CONFIG_MFD_STM32_LPTIMER=m
CONFIG_MFD_STM32_TIMERS=y
# CONFIG_MFD_STMFX is not set
# CONFIG_RAVE_SP_CORE is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
CONFIG_REGULATOR_88PG86X=m
CONFIG_REGULATOR_ACT8865=m
# CONFIG_REGULATOR_AD5398 is not set
CONFIG_REGULATOR_ANATOP=m
CONFIG_REGULATOR_AS3711=y
# CONFIG_REGULATOR_AXP20X is not set
CONFIG_REGULATOR_BCM590XX=y
# CONFIG_REGULATOR_CPCAP is not set
CONFIG_REGULATOR_DA9052=m
CONFIG_REGULATOR_DA9062=m
CONFIG_REGULATOR_DA9210=m
CONFIG_REGULATOR_DA9211=m
CONFIG_REGULATOR_FAN53555=m
CONFIG_REGULATOR_GPIO=m
CONFIG_REGULATOR_ISL9305=m
CONFIG_REGULATOR_ISL6271A=m
CONFIG_REGULATOR_LM363X=y
# CONFIG_REGULATOR_LP3971 is not set
CONFIG_REGULATOR_LP3972=y
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP8755=m
CONFIG_REGULATOR_LP8788=y
CONFIG_REGULATOR_LTC3589=y
# CONFIG_REGULATOR_LTC3676 is not set
CONFIG_REGULATOR_MAX14577=m
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX77650=m
CONFIG_REGULATOR_MAX8649=m
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8907=m
CONFIG_REGULATOR_MAX8925=m
CONFIG_REGULATOR_MAX8952=m
CONFIG_REGULATOR_MAX77693=y
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
CONFIG_REGULATOR_MC13892=m
CONFIG_REGULATOR_MT6311=m
CONFIG_REGULATOR_MT6380=m
# CONFIG_REGULATOR_PBIAS is not set
CONFIG_REGULATOR_PCAP=y
CONFIG_REGULATOR_PCF50633=y
# CONFIG_REGULATOR_PFUZE100 is not set
CONFIG_REGULATOR_PV88060=m
# CONFIG_REGULATOR_PV88080 is not set
CONFIG_REGULATOR_PV88090=m
CONFIG_REGULATOR_PWM=m
CONFIG_REGULATOR_QCOM_RPMH=m
# CONFIG_REGULATOR_QCOM_SPMI is not set
CONFIG_REGULATOR_RC5T583=y
CONFIG_REGULATOR_RT5033=y
CONFIG_REGULATOR_S2MPA01=m
# CONFIG_REGULATOR_S2MPS11 is not set
# CONFIG_REGULATOR_S5M8767 is not set
# CONFIG_REGULATOR_SC2731 is not set
# CONFIG_REGULATOR_SLG51000 is not set
# CONFIG_REGULATOR_STM32_BOOSTER is not set
# CONFIG_REGULATOR_STM32_VREFBUF is not set
CONFIG_REGULATOR_STM32_PWR=y
# CONFIG_REGULATOR_STW481X_VMMC is not set
# CONFIG_REGULATOR_SY8106A is not set
CONFIG_REGULATOR_SY8824X=y
# CONFIG_REGULATOR_TPS51632 is not set
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS65023=m
# CONFIG_REGULATOR_TPS6507X is not set
CONFIG_REGULATOR_TPS65086=m
CONFIG_REGULATOR_TPS65090=m
CONFIG_REGULATOR_TPS65132=y
# CONFIG_REGULATOR_TPS6524X is not set
CONFIG_REGULATOR_TPS6586X=m
CONFIG_REGULATOR_TPS65912=m
# CONFIG_REGULATOR_WM831X is not set
# CONFIG_REGULATOR_WM8994 is not set
CONFIG_CEC_CORE=y
# CONFIG_RC_CORE is not set
# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_IMX_IPUV3_CORE is not set
# CONFIG_DRM is not set
CONFIG_DRM_DP_CEC=y

#
# ARM devices
#
# end of ARM devices

#
# ACP (Audio CoProcessor) Configuration
#
# end of ACP (Audio CoProcessor) Configuration

#
# Frame buffer Devices
#
# CONFIG_FB is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_GENERIC=y
# CONFIG_BACKLIGHT_LM3533 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_DA9052=y
CONFIG_BACKLIGHT_MAX8925=m
CONFIG_BACKLIGHT_PM8941_WLED=y
# CONFIG_BACKLIGHT_WM831X is not set
# CONFIG_BACKLIGHT_ADP5520 is not set
CONFIG_BACKLIGHT_ADP8860=y
CONFIG_BACKLIGHT_ADP8870=m
# CONFIG_BACKLIGHT_PCF50633 is not set
CONFIG_BACKLIGHT_LM3630A=y
# CONFIG_BACKLIGHT_LM3639 is not set
# CONFIG_BACKLIGHT_LP855X is not set
CONFIG_BACKLIGHT_LP8788=y
CONFIG_BACKLIGHT_AS3711=m
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_HWDEP=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_RAWMIDI=y
# CONFIG_SND_OSSEMUL is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=y
# CONFIG_SND_VERBOSE_PROCFS is not set
# CONFIG_SND_VERBOSE_PRINTK is not set
CONFIG_SND_DEBUG=y
# CONFIG_SND_DEBUG_VERBOSE is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_SEQUENCER=y
CONFIG_SND_SEQ_DUMMY=y
CONFIG_SND_SEQ_MIDI_EVENT=y
CONFIG_SND_SEQ_MIDI=y
# CONFIG_SND_DRIVERS is not set
CONFIG_SND_ISA=y
# CONFIG_SND_ADLIB is not set
# CONFIG_SND_AD1848 is not set
# CONFIG_SND_AZT1605 is not set
# CONFIG_SND_AZT2316 is not set
# CONFIG_SND_CMI8328 is not set
# CONFIG_SND_CMI8330 is not set
# CONFIG_SND_CS4231 is not set
# CONFIG_SND_CS4236 is not set
# CONFIG_SND_ES1688 is not set
# CONFIG_SND_ES18XX is not set
# CONFIG_SND_GUSCLASSIC is not set
# CONFIG_SND_GUSEXTREME is not set
# CONFIG_SND_GUSMAX is not set
# CONFIG_SND_JAZZ16 is not set
# CONFIG_SND_OPL3SA2 is not set
# CONFIG_SND_OPTI92X_AD1848 is not set
# CONFIG_SND_OPTI92X_CS4231 is not set
# CONFIG_SND_OPTI93X is not set
# CONFIG_SND_MIRO is not set
# CONFIG_SND_SB8 is not set
# CONFIG_SND_SB16 is not set
# CONFIG_SND_SBAWE is not set
# CONFIG_SND_SSCAPE is not set
# CONFIG_SND_WAVEFRONT is not set
# CONFIG_SND_PCI is not set

#
# HD-Audio
#
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=64
# CONFIG_SND_SPI is not set
CONFIG_SND_USB=y
CONFIG_SND_USB_AUDIO=y
CONFIG_SND_USB_UA101=y
CONFIG_SND_USB_CAIAQ=y
# CONFIG_SND_USB_US122L is not set
CONFIG_SND_USB_6FIRE=y
CONFIG_SND_USB_HIFACE=y
CONFIG_SND_BCD2000=y
CONFIG_SND_USB_LINE6=y
# CONFIG_SND_USB_POD is not set
CONFIG_SND_USB_PODHD=m
CONFIG_SND_USB_TONEPORT=m
CONFIG_SND_USB_VARIAX=y
# CONFIG_SND_PCMCIA is not set
# CONFIG_SND_SOC is not set

#
# HID support
#
CONFIG_HID=m
CONFIG_HID_BATTERY_STRENGTH=y
# CONFIG_HIDRAW is not set
CONFIG_UHID=m
# CONFIG_HID_GENERIC is not set

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACRUX is not set
# CONFIG_HID_APPLE is not set
# CONFIG_HID_ASUS is not set
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
CONFIG_HID_CHERRY=m
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
CONFIG_HID_MACALLY=m
# CONFIG_HID_PRODIKEYS is not set
# CONFIG_HID_CMEDIA is not set
CONFIG_HID_CYPRESS=m
# CONFIG_HID_DRAGONRISE is not set
CONFIG_HID_EMS_FF=m
# CONFIG_HID_ELECOM is not set
CONFIG_HID_EZKEY=m
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
# CONFIG_HID_KEYTOUCH is not set
CONFIG_HID_KYE=m
CONFIG_HID_WALTOP=m
CONFIG_HID_VIEWSONIC=m
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
# CONFIG_HID_JABRA is not set
CONFIG_HID_TWINHAN=m
# CONFIG_HID_KENSINGTON is not set
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
# CONFIG_HID_LOGITECH is not set
CONFIG_HID_MAGICMOUSE=m
CONFIG_HID_MALTRON=m
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
CONFIG_HID_NTI=m
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
CONFIG_HID_PETALYNX=m
# CONFIG_HID_PICOLCD is not set
CONFIG_HID_PLANTRONICS=m
CONFIG_HID_PRIMAX=m
# CONFIG_HID_SAITEK is not set
# CONFIG_HID_SAMSUNG is not set
CONFIG_HID_SPEEDLINK=m
CONFIG_HID_STEAM=m
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
# CONFIG_HID_RMI is not set
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
# CONFIG_HID_SMARTJOYPLUS is not set
CONFIG_HID_TIVO=m
# CONFIG_HID_TOPSEED is not set
# CONFIG_HID_THINGM is not set
# CONFIG_HID_THRUSTMASTER is not set
# CONFIG_HID_UDRAW_PS3 is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
# CONFIG_HID_ZYDACRON is not set
CONFIG_HID_SENSOR_HUB=m
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# end of Special HID drivers

#
# USB HID support
#
# CONFIG_USB_HID is not set
CONFIG_HID_PID=y

#
# USB HID Boot Protocol drivers
#
CONFIG_USB_KBD=m
CONFIG_USB_MOUSE=m
# end of USB HID Boot Protocol drivers
# end of USB HID support

#
# I2C HID support
#
# CONFIG_I2C_HID is not set
# end of I2C HID support

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=m
# end of Intel ISH HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
CONFIG_USB_ULPI_BUS=m
CONFIG_USB_CONN_GPIO=m
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_PCI is not set
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG_WHITELIST is not set
CONFIG_USB_OTG_BLACKLIST_HUB=y
# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=m

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=m
# CONFIG_USB_XHCI_HCD is not set
CONFIG_USB_EHCI_HCD=y
# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
# CONFIG_USB_EHCI_TT_NEWSCHED is not set
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_NPCM7XX is not set
CONFIG_USB_EHCI_HCD_PLATFORM=m
CONFIG_USB_OXU210HP_HCD=y
# CONFIG_USB_ISP116X_HCD is not set
CONFIG_USB_ISP1362_HCD=y
# CONFIG_USB_FOTG210_HCD is not set
CONFIG_USB_MAX3421_HCD=m
CONFIG_USB_OHCI_HCD=m
CONFIG_USB_OHCI_HCD_LPC32XX=m
# CONFIG_USB_OHCI_HCD_SSB is not set
CONFIG_USB_OHCI_HCD_PLATFORM=m
CONFIG_USB_U132_HCD=m
CONFIG_USB_SL811_HCD=y
CONFIG_USB_SL811_HCD_ISO=y
CONFIG_USB_SL811_CS=y
# CONFIG_USB_R8A66597_HCD is not set
CONFIG_USB_RENESAS_USBHS_HCD=m
CONFIG_USB_HCD_BCMA=m
# CONFIG_USB_HCD_SSB is not set
CONFIG_USB_HCD_TEST_MODE=y
CONFIG_USB_RENESAS_USBHS=m

#
# USB Device Class drivers
#
CONFIG_USB_ACM=m
CONFIG_USB_PRINTER=m
CONFIG_USB_WDM=y
CONFIG_USB_TMC=y

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
# CONFIG_USBIP_CORE is not set
CONFIG_USB_CDNS3=y
# CONFIG_USB_CDNS3_HOST is not set
# CONFIG_USB_MTU3 is not set
CONFIG_USB_MUSB_HDRC=y
CONFIG_USB_MUSB_HOST=y

#
# Platform Glue Layer
#
CONFIG_USB_MUSB_UX500=y

#
# MUSB DMA mode
#
# CONFIG_MUSB_PIO_ONLY is not set
# CONFIG_USB_UX500_DMA is not set
# CONFIG_USB_DWC3 is not set
CONFIG_USB_DWC2=m
# CONFIG_USB_DWC2_HOST is not set

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
# CONFIG_USB_DWC2_PERIPHERAL is not set
CONFIG_USB_DWC2_DUAL_ROLE=y
CONFIG_USB_DWC2_DEBUG=y
# CONFIG_USB_DWC2_VERBOSE is not set
# CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
CONFIG_USB_DWC2_DEBUG_PERIODIC=y
CONFIG_USB_CHIPIDEA=m
# CONFIG_USB_CHIPIDEA_UDC is not set
# CONFIG_USB_CHIPIDEA_HOST is not set
CONFIG_USB_ISP1760=m
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y
# CONFIG_USB_ISP1760_GADGET_ROLE is not set
# CONFIG_USB_ISP1760_DUAL_ROLE is not set

#
# USB port drivers
#
CONFIG_USB_USS720=m
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
CONFIG_USB_SERIAL_GENERIC=y
CONFIG_USB_SERIAL_SIMPLE=y
CONFIG_USB_SERIAL_AIRCABLE=y
CONFIG_USB_SERIAL_ARK3116=m
CONFIG_USB_SERIAL_BELKIN=y
# CONFIG_USB_SERIAL_CH341 is not set
# CONFIG_USB_SERIAL_WHITEHEAT is not set
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
CONFIG_USB_SERIAL_CP210X=m
CONFIG_USB_SERIAL_CYPRESS_M8=m
CONFIG_USB_SERIAL_EMPEG=y
# CONFIG_USB_SERIAL_FTDI_SIO is not set
CONFIG_USB_SERIAL_VISOR=y
# CONFIG_USB_SERIAL_IPAQ is not set
CONFIG_USB_SERIAL_IR=m
CONFIG_USB_SERIAL_EDGEPORT=m
CONFIG_USB_SERIAL_EDGEPORT_TI=m
CONFIG_USB_SERIAL_F81232=y
CONFIG_USB_SERIAL_F8153X=m
CONFIG_USB_SERIAL_GARMIN=m
# CONFIG_USB_SERIAL_IPW is not set
# CONFIG_USB_SERIAL_IUU is not set
CONFIG_USB_SERIAL_KEYSPAN_PDA=y
CONFIG_USB_SERIAL_KEYSPAN=y
# CONFIG_USB_SERIAL_KLSI is not set
CONFIG_USB_SERIAL_KOBIL_SCT=y
CONFIG_USB_SERIAL_MCT_U232=y
CONFIG_USB_SERIAL_METRO=y
# CONFIG_USB_SERIAL_MOS7720 is not set
# CONFIG_USB_SERIAL_MOS7840 is not set
CONFIG_USB_SERIAL_MXUPORT=y
# CONFIG_USB_SERIAL_NAVMAN is not set
CONFIG_USB_SERIAL_PL2303=m
CONFIG_USB_SERIAL_OTI6858=m
CONFIG_USB_SERIAL_QCAUX=m
CONFIG_USB_SERIAL_QUALCOMM=y
# CONFIG_USB_SERIAL_SPCP8X5 is not set
# CONFIG_USB_SERIAL_SAFE is not set
CONFIG_USB_SERIAL_SIERRAWIRELESS=m
CONFIG_USB_SERIAL_SYMBOL=m
CONFIG_USB_SERIAL_TI=m
# CONFIG_USB_SERIAL_CYBERJACK is not set
CONFIG_USB_SERIAL_XIRCOM=m
CONFIG_USB_SERIAL_WWAN=y
CONFIG_USB_SERIAL_OPTION=y
CONFIG_USB_SERIAL_OMNINET=m
CONFIG_USB_SERIAL_OPTICON=y
CONFIG_USB_SERIAL_XSENS_MT=y
CONFIG_USB_SERIAL_WISHBONE=y
CONFIG_USB_SERIAL_SSU100=y
CONFIG_USB_SERIAL_QT2=y
CONFIG_USB_SERIAL_UPD78F0730=m
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
CONFIG_USB_EMI26=m
CONFIG_USB_ADUTUX=y
CONFIG_USB_SEVSEG=m
CONFIG_USB_LEGOTOWER=y
CONFIG_USB_LCD=m
CONFIG_USB_CYPRESS_CY7C63=m
CONFIG_USB_CYTHERM=y
CONFIG_USB_IDMOUSE=m
CONFIG_USB_FTDI_ELAN=m
CONFIG_USB_APPLEDISPLAY=y
CONFIG_USB_SISUSBVGA=m
# CONFIG_USB_LD is not set
CONFIG_USB_TRANCEVIBRATOR=m
# CONFIG_USB_IOWARRIOR is not set
CONFIG_USB_TEST=m
CONFIG_USB_EHSET_TEST_FIXTURE=m
CONFIG_USB_ISIGHTFW=m
CONFIG_USB_YUREX=m
CONFIG_USB_EZUSB_FX2=y
CONFIG_USB_HUB_USB251XB=m
CONFIG_USB_HSIC_USB3503=m
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_KEYSTONE_USB_PHY=m
CONFIG_NOP_USB_XCEIV=m
# CONFIG_AM335X_PHY_USB is not set
CONFIG_USB_GPIO_VBUS=m
CONFIG_USB_ISP1301=m
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=m
CONFIG_USB_GADGET_DEBUG=y
CONFIG_USB_GADGET_VERBOSE=y
CONFIG_USB_GADGET_DEBUG_FILES=y
# CONFIG_USB_GADGET_DEBUG_FS is not set
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2

#
# USB Peripheral Controller
#
CONFIG_USB_LPC32XX=m
# CONFIG_USB_FUSB300 is not set
# CONFIG_USB_FOTG210_UDC is not set
CONFIG_USB_GR_UDC=m
CONFIG_USB_R8A66597=m
CONFIG_USB_RENESAS_USBHS_UDC=m
CONFIG_USB_RENESAS_USB3=m
# CONFIG_USB_PXA27X is not set
CONFIG_USB_MV_UDC=m
CONFIG_USB_MV_U3D=m
CONFIG_USB_M66592=m
# CONFIG_USB_BDC_UDC is not set
CONFIG_USB_NET2272=m
CONFIG_USB_NET2272_DMA=y
# CONFIG_USB_GADGET_XILINX is not set
# CONFIG_USB_ASPEED_VHUB is not set
# CONFIG_USB_DUMMY_HCD is not set
# end of USB Peripheral Controller

CONFIG_USB_LIBCOMPOSITE=m
CONFIG_USB_U_ETHER=m
CONFIG_USB_F_EEM=m
CONFIG_USB_F_RNDIS=m
CONFIG_USB_F_FS=m
CONFIG_USB_F_HID=m
CONFIG_USB_CONFIGFS=m
# CONFIG_USB_CONFIGFS_SERIAL is not set
# CONFIG_USB_CONFIGFS_ACM is not set
# CONFIG_USB_CONFIGFS_OBEX is not set
# CONFIG_USB_CONFIGFS_NCM is not set
# CONFIG_USB_CONFIGFS_ECM is not set
# CONFIG_USB_CONFIGFS_ECM_SUBSET is not set
CONFIG_USB_CONFIGFS_RNDIS=y
CONFIG_USB_CONFIGFS_EEM=y
# CONFIG_USB_CONFIGFS_PHONET is not set
# CONFIG_USB_CONFIGFS_F_LB_SS is not set
CONFIG_USB_CONFIGFS_F_FS=y
# CONFIG_USB_CONFIGFS_F_UAC1 is not set
# CONFIG_USB_CONFIGFS_F_UAC1_LEGACY is not set
# CONFIG_USB_CONFIGFS_F_UAC2 is not set
# CONFIG_USB_CONFIGFS_F_MIDI is not set
CONFIG_USB_CONFIGFS_F_HID=y
# CONFIG_USB_CONFIGFS_F_PRINTER is not set
# CONFIG_TYPEC is not set
CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=m
CONFIG_SDIO_UART=m
CONFIG_MMC_TEST=m

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
# CONFIG_MMC_SDHCI_PCI is not set
CONFIG_MMC_SDHCI_PLTFM=m
CONFIG_MMC_OMAP_HS=m
# CONFIG_MMC_WBSD is not set
CONFIG_MMC_ALCOR=m
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_GOLDFISH is not set
CONFIG_MMC_SPI=m
CONFIG_MMC_SDRICOH_CS=m
# CONFIG_MMC_SDHI is not set
CONFIG_MMC_CB710=m
# CONFIG_MMC_VIA_SDMMC is not set
CONFIG_MMC_DW=m
CONFIG_MMC_DW_PLTFM=m
CONFIG_MMC_DW_BLUEFIELD=m
CONFIG_MMC_DW_EXYNOS=m
CONFIG_MMC_DW_HI3798CV200=m
CONFIG_MMC_DW_K3=m
CONFIG_MMC_DW_PCI=m
CONFIG_MMC_SH_MMCIF=m
CONFIG_MMC_VUB300=m
# CONFIG_MMC_USHC is not set
CONFIG_MMC_USDHI6ROL0=m
# CONFIG_MMC_REALTEK_PCI is not set
# CONFIG_MMC_REALTEK_USB is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_BCM2835 is not set
CONFIG_MMC_MTK=m
CONFIG_MMC_SDHCI_XENON=m
CONFIG_MEMSTICK=m
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
CONFIG_MEMSTICK_JMICRON_38X=m
CONFIG_MEMSTICK_R592=m
CONFIG_MEMSTICK_REALTEK_PCI=m
# CONFIG_MEMSTICK_REALTEK_USB is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=m
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_AS3645A is not set
CONFIG_LEDS_LM3530=y
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3533 is not set
# CONFIG_LEDS_LM3642 is not set
CONFIG_LEDS_LM3601X=m
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP55XX_COMMON=y
CONFIG_LEDS_LP5521=y
# CONFIG_LEDS_LP5523 is not set
CONFIG_LEDS_LP5562=y
# CONFIG_LEDS_LP8501 is not set
CONFIG_LEDS_LP8788=y
CONFIG_LEDS_PCA955X=m
CONFIG_LEDS_PCA955X_GPIO=y
CONFIG_LEDS_PCA963X=y
# CONFIG_LEDS_WM831X_STATUS is not set
CONFIG_LEDS_DA9052=y
CONFIG_LEDS_DAC124S085=m
CONFIG_LEDS_PWM=m
CONFIG_LEDS_REGULATOR=m
CONFIG_LEDS_BD2802=m
CONFIG_LEDS_ADP5520=y
CONFIG_LEDS_MC13783=m
CONFIG_LEDS_TCA6507=m
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_MAX77650 is not set
CONFIG_LEDS_LM355x=y
CONFIG_LEDS_OT200=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
CONFIG_LEDS_PM8058=y
CONFIG_LEDS_MLXREG=m
CONFIG_LEDS_USER=m
CONFIG_LEDS_TI_LMU_COMMON=y
# CONFIG_LEDS_LM36274 is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
CONFIG_LEDS_TRIGGER_MTD=y
# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=y
# CONFIG_LEDS_TRIGGER_GPIO is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
# CONFIG_LEDS_TRIGGER_CAMERA is not set
CONFIG_LEDS_TRIGGER_PANIC=y
CONFIG_LEDS_TRIGGER_NETDEV=m
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=y
CONFIG_ACCESSIBILITY=y
# CONFIG_INFINIBAND is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
# CONFIG_RTC_INTF_DEV is not set
CONFIG_RTC_DRV_TEST=y

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_ABB5ZES3=y
CONFIG_RTC_DRV_ABEOZ9=y
CONFIG_RTC_DRV_ABX80X=m
CONFIG_RTC_DRV_BRCMSTB=m
CONFIG_RTC_DRV_DS1307=y
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=y
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=y
CONFIG_RTC_DRV_LP8788=y
CONFIG_RTC_DRV_MAX6900=y
CONFIG_RTC_DRV_MAX8907=m
CONFIG_RTC_DRV_MAX8925=m
CONFIG_RTC_DRV_MAX77686=m
# CONFIG_RTC_DRV_MESON_VRTC is not set
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=y
CONFIG_RTC_DRV_ISL12022=y
CONFIG_RTC_DRV_ISL12026=y
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=y
CONFIG_RTC_DRV_PCF85063=y
CONFIG_RTC_DRV_PCF85363=m
# CONFIG_RTC_DRV_PCF8563 is not set
CONFIG_RTC_DRV_PCF8583=y
# CONFIG_RTC_DRV_M41T80 is not set
# CONFIG_RTC_DRV_BQ32K is not set
CONFIG_RTC_DRV_TPS6586X=m
CONFIG_RTC_DRV_RC5T583=y
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
CONFIG_RTC_DRV_RX8010=m
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
# CONFIG_RTC_DRV_EM3027 is not set
CONFIG_RTC_DRV_RV3028=y
CONFIG_RTC_DRV_RV8803=m
CONFIG_RTC_DRV_S5M=y
CONFIG_RTC_DRV_SD3078=m

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
CONFIG_RTC_DRV_M41T94=y
CONFIG_RTC_DRV_DS1302=y
CONFIG_RTC_DRV_DS1305=y
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
CONFIG_RTC_DRV_MAX6916=y
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=y
CONFIG_RTC_DRV_RX6110=m
CONFIG_RTC_DRV_RS5C348=m
# CONFIG_RTC_DRV_MAX6902 is not set
CONFIG_RTC_DRV_PCF2123=m
CONFIG_RTC_DRV_MCP795=y
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
CONFIG_RTC_DRV_PCF2127=m
CONFIG_RTC_DRV_RV3029C2=m
CONFIG_RTC_DRV_RV3029_HWMON=y

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_DS1286=m
# CONFIG_RTC_DRV_DS1511 is not set
# CONFIG_RTC_DRV_DS1553 is not set
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
# CONFIG_RTC_DRV_DA9052 is not set
CONFIG_RTC_DRV_DA9063=y
CONFIG_RTC_DRV_STK17TA8=y
CONFIG_RTC_DRV_M48T86=m
CONFIG_RTC_DRV_M48T35=m
# CONFIG_RTC_DRV_M48T59 is not set
CONFIG_RTC_DRV_MSM6242=y
CONFIG_RTC_DRV_BQ4802=y
CONFIG_RTC_DRV_RP5C01=m
CONFIG_RTC_DRV_V3020=m
CONFIG_RTC_DRV_WM831X=y
CONFIG_RTC_DRV_SC27XX=m
# CONFIG_RTC_DRV_SPEAR is not set
CONFIG_RTC_DRV_PCF50633=y

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_ASM9260 is not set
# CONFIG_RTC_DRV_DAVINCI is not set
CONFIG_RTC_DRV_DIGICOLOR=m
CONFIG_RTC_DRV_MESON=y
CONFIG_RTC_DRV_S3C=y
CONFIG_RTC_DRV_EP93XX=m
# CONFIG_RTC_DRV_VR41XX is not set
CONFIG_RTC_DRV_AT91RM9200=y
CONFIG_RTC_DRV_GENERIC=m
CONFIG_RTC_DRV_VT8500=y
CONFIG_RTC_DRV_SUNXI=y
CONFIG_RTC_DRV_TX4939=m
CONFIG_RTC_DRV_MV=y
CONFIG_RTC_DRV_ARMADA38X=y
CONFIG_RTC_DRV_FTRTC010=y
# CONFIG_RTC_DRV_COH901331 is not set
# CONFIG_RTC_DRV_STMP is not set
# CONFIG_RTC_DRV_PCAP is not set
CONFIG_RTC_DRV_MC13XXX=m
# CONFIG_RTC_DRV_JZ4740 is not set
# CONFIG_RTC_DRV_LPC32XX is not set
CONFIG_RTC_DRV_PM8XXX=y
# CONFIG_RTC_DRV_TEGRA is not set
CONFIG_RTC_DRV_MOXART=m
# CONFIG_RTC_DRV_MT6397 is not set
CONFIG_RTC_DRV_MT7622=y
CONFIG_RTC_DRV_XGENE=y
CONFIG_RTC_DRV_STM32=y
CONFIG_RTC_DRV_CPCAP=m
# CONFIG_RTC_DRV_RTD119X is not set

#
# HID Sensor RTC drivers
#
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH=y
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_ALTERA_MSGDMA=y
CONFIG_AXI_DMAC=y
CONFIG_COH901318=y
CONFIG_DMA_JZ4780=m
CONFIG_DMA_SA11X0=m
CONFIG_DMA_SUN6I=m
# CONFIG_DW_AXI_DMAC is not set
# CONFIG_EP93XX_DMA is not set
CONFIG_IMG_MDC_DMA=m
CONFIG_INTEL_IDMA64=y
CONFIG_INTEL_IOP_ADMA=m
CONFIG_K3_DMA=y
# CONFIG_MCF_EDMA is not set
CONFIG_MMP_PDMA=y
CONFIG_MMP_TDMA=y
CONFIG_MV_XOR=y
# CONFIG_MXS_DMA is not set
# CONFIG_NBPFAXI_DMA is not set
CONFIG_PCH_DMA=y
# CONFIG_STM32_DMA is not set
CONFIG_STM32_DMAMUX=y
CONFIG_SPRD_DMA=y
CONFIG_S3C24XX_DMAC=y
# CONFIG_TEGRA210_ADMA is not set
CONFIG_TIMB_DMA=y
CONFIG_XGENE_DMA=y
CONFIG_ZX_DMA=m
CONFIG_MTK_HSDMA=y
CONFIG_MTK_CQDMA=m
# CONFIG_QCOM_HIDMA_MGMT is not set
CONFIG_QCOM_HIDMA=m
CONFIG_DW_DMAC_CORE=m
CONFIG_DW_DMAC=m
# CONFIG_DW_DMAC_PCI is not set
CONFIG_DW_EDMA=m
# CONFIG_DW_EDMA_PCIE is not set
CONFIG_RENESAS_DMA=y
# CONFIG_SH_DMAE_BASE is not set
CONFIG_RCAR_DMAC=m
# CONFIG_RENESAS_USB_DMAC is not set
CONFIG_TI_EDMA=y
CONFIG_DMA_OMAP=y
CONFIG_TI_DMA_CROSSBAR=y

#
# DMA Clients
#
# CONFIG_ASYNC_TX_DMA is not set
# CONFIG_DMATEST is not set
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
CONFIG_UDMABUF=y
CONFIG_DMABUF_SELFTESTS=m
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
CONFIG_CHARLCD=y
# CONFIG_UIO is not set
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_PCI is not set
CONFIG_VIRTIO_BALLOON=m
CONFIG_VIRTIO_INPUT=m
CONFIG_VIRTIO_MMIO=m
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_STAGING is not set
# CONFIG_MFD_CROS_EC is not set
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=y
CONFIG_MLXREG_IO=y
# CONFIG_OLPC_XO175 is not set
CONFIG_HWSPINLOCK=y
CONFIG_MAILBOX=y
CONFIG_IMX_MBOX=y
# CONFIG_ROCKCHIP_MBOX is not set
CONFIG_ALTERA_MBOX=y
# CONFIG_QCOM_APCS_IPC is not set
# CONFIG_BCM_PDC_MBOX is not set
CONFIG_MTK_CMDQ_MBOX=y
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_CHAR=y
CONFIG_RPMSG_QCOM_GLINK_NATIVE=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
CONFIG_RPMSG_QCOM_GLINK_SMEM=y
# CONFIG_RPMSG_QCOM_SMD is not set
CONFIG_RPMSG_VIRTIO=m
# end of Rpmsg drivers

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
CONFIG_MESON_CANVAS=m
# CONFIG_MESON_CLK_MEASURE is not set
# CONFIG_MESON_GX_SOCINFO is not set
CONFIG_MESON_MX_SOCINFO=y
# end of Amlogic SoC drivers

#
# Aspeed SoC drivers
#
CONFIG_SOC_ASPEED=y
# CONFIG_ASPEED_LPC_CTRL is not set
CONFIG_ASPEED_LPC_SNOOP=m
CONFIG_ASPEED_P2A_CTRL=y
# end of Aspeed SoC drivers

# CONFIG_AT91_SOC_ID is not set

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BRCMSTB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
CONFIG_IXP4XX_QMGR=y
CONFIG_IXP4XX_NPE=y
# end of IXP4xx SoC drivers

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=y
CONFIG_MTK_INFRACFG=y
CONFIG_MTK_PMIC_WRAP=y
# CONFIG_MTK_SCPSYS is not set
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
CONFIG_QCOM_GENI_SE=m
CONFIG_QCOM_GSBI=y
# CONFIG_QCOM_LLCC is not set
CONFIG_QCOM_RPMH=y
CONFIG_QCOM_SMEM=y
# CONFIG_QCOM_SMD_RPM is not set
CONFIG_QCOM_SMEM_STATE=y
CONFIG_QCOM_SMP2P=y
CONFIG_QCOM_SMSM=y
# CONFIG_QCOM_SOCINFO is not set
CONFIG_QCOM_WCNSS_CTRL=m
CONFIG_QCOM_APR=y
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
CONFIG_ROCKCHIP_GRF=y
CONFIG_SOC_SAMSUNG=y
CONFIG_EXYNOS_CHIPID=y
CONFIG_EXYNOS_PM_DOMAINS=y
CONFIG_SOC_TI=y
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
# CONFIG_XILINX_VCU is not set
# end of Xilinx SoC drivers

CONFIG_SOC_ZTE=y
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=m
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
CONFIG_DEVFREQ_GOV_USERSPACE=m
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_ARM_EXYNOS_BUS_DEVFREQ=m
CONFIG_PM_DEVFREQ_EVENT=y
CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=m
CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y
CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ADC_JACK is not set
# CONFIG_EXTCON_FSA9480 is not set
CONFIG_EXTCON_GPIO=y
# CONFIG_EXTCON_MAX14577 is not set
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_MAX77693=m
CONFIG_EXTCON_MAX77843=m
CONFIG_EXTCON_PTN5150=m
# CONFIG_EXTCON_QCOM_SPMI_MISC is not set
CONFIG_EXTCON_RT8973A=m
CONFIG_EXTCON_SM5502=y
# CONFIG_EXTCON_USB_GPIO is not set
CONFIG_MEMORY=y
CONFIG_FSL_IFC=y
# CONFIG_SAMSUNG_MC is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_HW_CONSUMER=m
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
# CONFIG_IIO_SW_DEVICE is not set
CONFIG_IIO_SW_TRIGGER=y

#
# Accelerometers
#
CONFIG_ADIS16201=m
CONFIG_ADIS16209=y
CONFIG_ADXL345=y
CONFIG_ADXL345_I2C=y
CONFIG_ADXL345_SPI=m
CONFIG_ADXL372=y
CONFIG_ADXL372_SPI=m
CONFIG_ADXL372_I2C=y
CONFIG_BMA180=y
# CONFIG_BMA220 is not set
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
CONFIG_BMC150_ACCEL_SPI=y
CONFIG_DA280=y
# CONFIG_DA311 is not set
CONFIG_DMARD06=m
# CONFIG_DMARD09 is not set
CONFIG_DMARD10=m
CONFIG_HID_SENSOR_ACCEL_3D=m
# CONFIG_IIO_ST_ACCEL_3AXIS is not set
CONFIG_KXSD9=m
# CONFIG_KXSD9_SPI is not set
CONFIG_KXSD9_I2C=m
CONFIG_KXCJK1013=m
CONFIG_MC3230=y
CONFIG_MMA7455=m
CONFIG_MMA7455_I2C=m
# CONFIG_MMA7455_SPI is not set
CONFIG_MMA7660=y
# CONFIG_MMA8452 is not set
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=m
CONFIG_MMA9553=y
# CONFIG_MXC4005 is not set
CONFIG_MXC6255=y
# CONFIG_SCA3000 is not set
# CONFIG_STK8312 is not set
# CONFIG_STK8BA50 is not set
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD_SIGMA_DELTA=y
CONFIG_AD7124=y
# CONFIG_AD7266 is not set
# CONFIG_AD7291 is not set
CONFIG_AD7298=y
# CONFIG_AD7476 is not set
CONFIG_AD7606=m
# CONFIG_AD7606_IFACE_PARALLEL is not set
CONFIG_AD7606_IFACE_SPI=m
CONFIG_AD7766=m
CONFIG_AD7768_1=y
CONFIG_AD7780=y
CONFIG_AD7791=m
CONFIG_AD7793=y
CONFIG_AD7887=m
# CONFIG_AD7923 is not set
CONFIG_AD7949=y
CONFIG_AD799X=y
CONFIG_AT91_SAMA5D2_ADC=m
CONFIG_AXP20X_ADC=m
# CONFIG_AXP288_ADC is not set
# CONFIG_BCM_IPROC_ADC is not set
CONFIG_CC10001_ADC=m
# CONFIG_CPCAP_ADC is not set
# CONFIG_DA9150_GPADC is not set
CONFIG_DLN2_ADC=m
CONFIG_MXS_LRADC_ADC=m
CONFIG_FSL_MX25_ADC=m
# CONFIG_HI8435 is not set
CONFIG_HX711=y
CONFIG_INA2XX_ADC=y
CONFIG_INGENIC_ADC=m
# CONFIG_IMX7D_ADC is not set
CONFIG_LP8788_ADC=m
CONFIG_LPC32XX_ADC=y
CONFIG_LTC2471=m
CONFIG_LTC2485=m
CONFIG_LTC2497=y
CONFIG_MAX1027=y
# CONFIG_MAX11100 is not set
# CONFIG_MAX1118 is not set
CONFIG_MAX1363=m
# CONFIG_MAX9611 is not set
# CONFIG_MCP320X is not set
# CONFIG_MCP3422 is not set
# CONFIG_MCP3911 is not set
CONFIG_MEDIATEK_MT6577_AUXADC=m
CONFIG_NAU7802=y
# CONFIG_NPCM_ADC is not set
CONFIG_QCOM_VADC_COMMON=y
CONFIG_QCOM_PM8XXX_XOADC=y
# CONFIG_QCOM_SPMI_IADC is not set
CONFIG_QCOM_SPMI_VADC=m
CONFIG_QCOM_SPMI_ADC5=m
CONFIG_RCAR_GYRO_ADC=y
CONFIG_SC27XX_ADC=m
CONFIG_SPEAR_ADC=m
CONFIG_STM32_DFSDM_CORE=m
CONFIG_STM32_DFSDM_ADC=m
CONFIG_SUN4I_GPADC=m
# CONFIG_TI_ADC081C is not set
# CONFIG_TI_ADC0832 is not set
# CONFIG_TI_ADC084S021 is not set
CONFIG_TI_ADC12138=y
# CONFIG_TI_ADC108S102 is not set
# CONFIG_TI_ADC128S052 is not set
CONFIG_TI_ADC161S626=m
CONFIG_TI_ADS1015=y
CONFIG_TI_ADS7950=m
# CONFIG_TI_AM335X_ADC is not set
CONFIG_TI_TLC4541=m
CONFIG_VIPERBOARD_ADC=m
CONFIG_XILINX_XADC=m
# end of Analog to digital converters

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_AD8366=m
# end of Amplifiers

#
# Chemical Sensors
#
# CONFIG_ATLAS_PH_SENSOR is not set
# CONFIG_BME680 is not set
CONFIG_CCS811=y
# CONFIG_IAQCORE is not set
CONFIG_PMS7003=y
# CONFIG_SENSIRION_SGP30 is not set
CONFIG_SPS30=y
# CONFIG_VZ89X is not set
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=m
CONFIG_HID_SENSOR_IIO_TRIGGER=m
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=m

#
# SSP Sensor Common
#
CONFIG_IIO_SSP_SENSORS_COMMONS=m
CONFIG_IIO_SSP_SENSORHUB=m
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_SPI=m
CONFIG_IIO_ST_SENSORS_CORE=m

#
# Digital to analog converters
#
CONFIG_AD5064=m
CONFIG_AD5360=y
CONFIG_AD5380=y
CONFIG_AD5421=y
# CONFIG_AD5446 is not set
# CONFIG_AD5449 is not set
CONFIG_AD5592R_BASE=y
CONFIG_AD5592R=y
CONFIG_AD5593R=y
CONFIG_AD5504=y
# CONFIG_AD5624R_SPI is not set
CONFIG_LTC1660=y
CONFIG_LTC2632=m
CONFIG_AD5686=y
CONFIG_AD5686_SPI=y
CONFIG_AD5696_I2C=m
CONFIG_AD5755=m
CONFIG_AD5758=m
CONFIG_AD5761=y
# CONFIG_AD5764 is not set
CONFIG_AD5791=m
# CONFIG_AD7303 is not set
# CONFIG_AD8801 is not set
CONFIG_DS4424=m
CONFIG_M62332=m
CONFIG_MAX517=y
CONFIG_MCP4725=m
CONFIG_MCP4922=y
# CONFIG_STM32_DAC is not set
# CONFIG_TI_DAC082S085 is not set
# CONFIG_TI_DAC5571 is not set
CONFIG_TI_DAC7311=y
# CONFIG_TI_DAC7612 is not set
# end of Digital to analog converters

#
# IIO dummy driver
#
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
CONFIG_ADIS16130=m
# CONFIG_ADIS16136 is not set
CONFIG_ADIS16260=m
CONFIG_ADXRS450=y
CONFIG_BMG160=y
CONFIG_BMG160_I2C=y
CONFIG_BMG160_SPI=y
CONFIG_FXAS21002C=y
CONFIG_FXAS21002C_I2C=y
CONFIG_FXAS21002C_SPI=y
# CONFIG_HID_SENSOR_GYRO_3D is not set
CONFIG_MPU3050=y
CONFIG_MPU3050_I2C=y
CONFIG_IIO_ST_GYRO_3AXIS=m
CONFIG_IIO_ST_GYRO_I2C_3AXIS=m
CONFIG_IIO_ST_GYRO_SPI_3AXIS=m
CONFIG_ITG3200=m
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
# CONFIG_AFE4403 is not set
CONFIG_AFE4404=m
CONFIG_MAX30100=m
# CONFIG_MAX30102 is not set
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=y
CONFIG_DHT11=m
# CONFIG_HDC100X is not set
# CONFIG_HID_SENSOR_HUMIDITY is not set
CONFIG_HTS221=y
CONFIG_HTS221_I2C=y
CONFIG_HTS221_SPI=y
CONFIG_HTU21=m
CONFIG_SI7005=y
CONFIG_SI7020=y
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_ADIS16400=m
# CONFIG_ADIS16460 is not set
CONFIG_ADIS16480=m
CONFIG_BMI160=m
CONFIG_BMI160_I2C=m
CONFIG_BMI160_SPI=m
CONFIG_KMX61=m
CONFIG_INV_MPU6050_IIO=y
# CONFIG_INV_MPU6050_I2C is not set
CONFIG_INV_MPU6050_SPI=y
# CONFIG_IIO_ST_LSM6DSX is not set
# end of Inertial measurement units

CONFIG_IIO_ADIS_LIB=y
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
CONFIG_ADJD_S311=y
# CONFIG_AL3320A is not set
# CONFIG_APDS9300 is not set
CONFIG_APDS9960=m
# CONFIG_BH1750 is not set
CONFIG_BH1780=y
# CONFIG_CM32181 is not set
CONFIG_CM3232=y
CONFIG_CM3323=m
CONFIG_CM36651=y
# CONFIG_GP2AP020A00F is not set
# CONFIG_SENSORS_ISL29018 is not set
CONFIG_SENSORS_ISL29028=m
CONFIG_ISL29125=m
CONFIG_HID_SENSOR_ALS=m
# CONFIG_HID_SENSOR_PROX is not set
# CONFIG_JSA1212 is not set
CONFIG_RPR0521=m
CONFIG_SENSORS_LM3533=m
CONFIG_LTR501=m
# CONFIG_LV0104CS is not set
CONFIG_MAX44000=m
CONFIG_MAX44009=y
CONFIG_NOA1305=m
CONFIG_OPT3001=y
CONFIG_PA12203001=y
CONFIG_SI1133=y
# CONFIG_SI1145 is not set
CONFIG_STK3310=m
CONFIG_ST_UVIS25=m
CONFIG_ST_UVIS25_I2C=m
CONFIG_ST_UVIS25_SPI=m
CONFIG_TCS3414=m
CONFIG_TCS3472=m
CONFIG_SENSORS_TSL2563=y
CONFIG_TSL2583=m
# CONFIG_TSL2772 is not set
CONFIG_TSL4531=y
# CONFIG_US5182D is not set
CONFIG_VCNL4000=y
# CONFIG_VCNL4035 is not set
CONFIG_VEML6070=y
# CONFIG_VL6180 is not set
# CONFIG_ZOPT2201 is not set
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8975=m
CONFIG_AK09911=m
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
CONFIG_BMC150_MAGN_SPI=y
CONFIG_MAG3110=m
# CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
CONFIG_MMC35240=m
CONFIG_IIO_ST_MAGN_3AXIS=m
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_IIO_ST_MAGN_SPI_3AXIS=m
CONFIG_SENSORS_HMC5843=m
# CONFIG_SENSORS_HMC5843_I2C is not set
CONFIG_SENSORS_HMC5843_SPI=m
CONFIG_SENSORS_RM3100=y
CONFIG_SENSORS_RM3100_I2C=y
CONFIG_SENSORS_RM3100_SPI=m
# end of Magnetometer sensors

#
# Multiplexers
#
# CONFIG_IIO_MUX is not set
# end of Multiplexers

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=m
CONFIG_HID_SENSOR_DEVICE_ROTATION=m
# end of Inclinometer sensors

#
# Triggers - standalone
#
CONFIG_IIO_HRTIMER_TRIGGER=y
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
CONFIG_IIO_STM32_LPTIMER_TRIGGER=m
CONFIG_IIO_STM32_TIMER_TRIGGER=y
# CONFIG_IIO_TIGHTLOOP_TRIGGER is not set
CONFIG_IIO_SYSFS_TRIGGER=m
# end of Triggers - standalone

#
# Digital potentiometers
#
CONFIG_AD5272=y
# CONFIG_DS1803 is not set
# CONFIG_MAX5432 is not set
# CONFIG_MAX5481 is not set
CONFIG_MAX5487=m
CONFIG_MCP4018=y
CONFIG_MCP4131=m
CONFIG_MCP4531=m
# CONFIG_MCP41010 is not set
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
CONFIG_ABP060MG=m
CONFIG_BMP280=y
CONFIG_BMP280_I2C=y
CONFIG_BMP280_SPI=y
# CONFIG_DPS310 is not set
# CONFIG_HID_SENSOR_PRESS is not set
CONFIG_HP03=y
CONFIG_MPL115=y
CONFIG_MPL115_I2C=y
CONFIG_MPL115_SPI=m
# CONFIG_MPL3115 is not set
# CONFIG_MS5611 is not set
# CONFIG_MS5637 is not set
CONFIG_IIO_ST_PRESS=m
CONFIG_IIO_ST_PRESS_I2C=m
CONFIG_IIO_ST_PRESS_SPI=m
CONFIG_T5403=y
# CONFIG_HP206C is not set
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y
CONFIG_ZPA2326_SPI=y
# end of Pressure sensors

#
# Lightning sensors
#
# CONFIG_AS3935 is not set
# end of Lightning sensors

#
# Proximity and distance sensors
#
# CONFIG_ISL29501 is not set
# CONFIG_LIDAR_LITE_V2 is not set
CONFIG_MB1232=m
CONFIG_RFD77402=m
CONFIG_SRF04=m
# CONFIG_SX9500 is not set
# CONFIG_SRF08 is not set
CONFIG_VL53L0X_I2C=m
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
CONFIG_MAXIM_THERMOCOUPLE=y
CONFIG_HID_SENSOR_TEMP=m
# CONFIG_MLX90614 is not set
CONFIG_MLX90632=m
CONFIG_TMP006=m
CONFIG_TMP007=m
CONFIG_TSYS01=m
# CONFIG_TSYS02D is not set
CONFIG_MAX31856=y
# end of Temperature sensors

# CONFIG_NTB is not set
CONFIG_VME_BUS=y

#
# VME Bridge Drivers
#
CONFIG_VME_CA91CX42=y
CONFIG_VME_TSI148=y
CONFIG_VME_FAKE=m

#
# VME Board Drivers
#
# CONFIG_VMIVME_7805 is not set

#
# VME Device Drivers
#
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_BCM_KONA=m
CONFIG_PWM_CLPS711X=y
# CONFIG_PWM_HIBVT is not set
CONFIG_PWM_IMX_TPM=m
# CONFIG_PWM_MTK_DISP is not set
CONFIG_PWM_MEDIATEK=y
# CONFIG_PWM_PCA9685 is not set
# CONFIG_PWM_RCAR is not set
CONFIG_PWM_RENESAS_TPU=y
CONFIG_PWM_SPRD=m
CONFIG_PWM_STM32=y
CONFIG_PWM_STM32_LP=m

#
# IRQ chip support
#
# CONFIG_AL_FIC is not set
CONFIG_MADERA_IRQ=y
# CONFIG_RENESAS_INTC_IRQPIN is not set
CONFIG_RENESAS_IRQC=y
# CONFIG_RENESAS_RZA1_IRQC is not set
CONFIG_TS4800_IRQ=y
# CONFIG_INGENIC_TCU_IRQ is not set
CONFIG_RENESAS_H8S_INTC=y
# CONFIG_EZNPS_GIC is not set
CONFIG_IRQ_UNIPHIER_AIDET=y
CONFIG_IMX_IRQSTEER=y
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_ATH79=y
CONFIG_RESET_AXS10X=y
CONFIG_RESET_BERLIN=y
# CONFIG_RESET_BRCMSTB is not set
CONFIG_RESET_HSDK=y
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_LANTIQ is not set
CONFIG_RESET_LPC18XX=y
CONFIG_RESET_MESON=y
# CONFIG_RESET_MESON_AUDIO_ARB is not set
# CONFIG_RESET_PISTACHIO is not set
CONFIG_RESET_QCOM_AOSS=y
# CONFIG_RESET_QCOM_PDC is not set
# CONFIG_RESET_SCMI is not set
CONFIG_RESET_SIMPLE=y
CONFIG_RESET_STM32MP157=y
# CONFIG_RESET_SOCFPGA is not set
# CONFIG_RESET_SUNXI is not set
CONFIG_RESET_TI_SYSCON=m
# CONFIG_RESET_ZYNQ is not set
CONFIG_COMMON_RESET_HI3660=m
CONFIG_COMMON_RESET_HI6220=m

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_PHY_SUN4I_USB is not set
# CONFIG_PHY_SUN6I_MIPI_DPHY is not set
# CONFIG_PHY_SUN9I_USB is not set
CONFIG_BCM_KONA_USB2_PHY=y
CONFIG_PHY_HI6220_USB=m
# CONFIG_PHY_HI3660_USB is not set
CONFIG_PHY_HISTB_COMBPHY=m
CONFIG_PHY_HISI_INNO_USB2=y
# CONFIG_PHY_PXA_28NM_HSIC is not set
CONFIG_PHY_PXA_28NM_USB2=m
CONFIG_PHY_CPCAP_USB=y
# CONFIG_PHY_QCOM_USB_HS is not set
CONFIG_PHY_QCOM_USB_HSIC=m
# CONFIG_PHY_RALINK_USB is not set
CONFIG_PHY_RCAR_GEN3_USB3=y
# CONFIG_PHY_ROCKCHIP_PCIE is not set
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
# CONFIG_PHY_SAMSUNG_USB2 is not set
CONFIG_PHY_ST_SPEAR1310_MIPHY=m
CONFIG_PHY_ST_SPEAR1340_MIPHY=y
CONFIG_PHY_STIH407_USB=m
CONFIG_PHY_STM32_USBPHYC=y
CONFIG_PHY_TEGRA194_P2U=m
CONFIG_OMAP_CONTROL_PHY=m
# CONFIG_TI_PIPE3 is not set
# CONFIG_PHY_TUSB1210 is not set
CONFIG_PHY_TI_GMII_SEL=m
# end of PHY Subsystem

CONFIG_POWERCAP=y
# CONFIG_MCB is not set
# CONFIG_RAS is not set
CONFIG_THUNDERBOLT=y

#
# Android
#
CONFIG_ANDROID=y
CONFIG_ANDROID_BINDER_IPC=y
# CONFIG_ANDROID_BINDERFS is not set
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
CONFIG_ANDROID_BINDER_IPC_SELFTEST=y
# end of Android

CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_IMX_IIM is not set
CONFIG_NVMEM_IMX_OCOTP=y
CONFIG_NVMEM_LPC18XX_EEPROM=y
# CONFIG_NVMEM_LPC18XX_OTP is not set
# CONFIG_NVMEM_MXS_OCOTP is not set
CONFIG_MTK_EFUSE=m
CONFIG_QCOM_QFPROM=y
# CONFIG_ROCKCHIP_EFUSE is not set
CONFIG_NVMEM_BCM_OCOTP=y
# CONFIG_NVMEM_STM32_ROMEM is not set
# CONFIG_UNIPHIER_EFUSE is not set
CONFIG_NVMEM_VF610_OCOTP=m
CONFIG_MESON_MX_EFUSE=m
CONFIG_NVMEM_SNVS_LPGPR=y
CONFIG_SC27XX_EFUSE=m

#
# HW tracing support
#
CONFIG_STM=y
# CONFIG_STM_PROTO_BASIC is not set
CONFIG_STM_PROTO_SYS_T=m
CONFIG_STM_DUMMY=m
# CONFIG_STM_SOURCE_CONSOLE is not set
# CONFIG_STM_SOURCE_HEARTBEAT is not set
CONFIG_INTEL_TH=m
CONFIG_INTEL_TH_PCI=m
CONFIG_INTEL_TH_GTH=m
CONFIG_INTEL_TH_STH=m
CONFIG_INTEL_TH_MSU=m
# CONFIG_INTEL_TH_PTI is not set
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_TEE=m

#
# TEE drivers
#
# end of TEE drivers

CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=y
CONFIG_MUX_ADGS1408=y
CONFIG_MUX_GPIO=m
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=y
# CONFIG_SIOX_BUS_GPIO is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
CONFIG_COUNTER=m
CONFIG_STM32_TIMER_CNT=m
CONFIG_STM32_LPTIMER_CNT=m
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FS_VERITY=y
CONFIG_FS_VERITY_DEBUG=y
CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
# CONFIG_INOTIFY_USER is not set
CONFIG_FANOTIFY=y
# CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS4_FS is not set
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
# CONFIG_NLS_CODEPAGE_855 is not set
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=y
# CONFIG_NLS_CODEPAGE_861 is not set
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
# CONFIG_NLS_CODEPAGE_869 is not set
CONFIG_NLS_CODEPAGE_936=y
# CONFIG_NLS_CODEPAGE_950 is not set
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=y
# CONFIG_NLS_ISO8859_8 is not set
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=m
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=y
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
# CONFIG_NLS_MAC_CELTIC is not set
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=y
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
# CONFIG_NLS_UTF8 is not set
# CONFIG_DLM is not set
CONFIG_UNICODE=y
CONFIG_UNICODE_NORMALIZATION_SELFTEST=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_BIG_KEYS=y
# CONFIG_ENCRYPTED_KEYS is not set
CONFIG_KEY_DH_OPERATIONS=y
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
# CONFIG_SECURITY_NETWORK_XFRM is not set
CONFIG_SECURITY_PATH=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
# CONFIG_SECURITY_SELINUX is not set
CONFIG_SECURITY_SMACK=y
CONFIG_SECURITY_SMACK_BRINGUP=y
CONFIG_SECURITY_SMACK_APPEND_SIGNALS=y
CONFIG_SECURITY_TOMOYO=y
CONFIG_SECURITY_TOMOYO_MAX_ACCEPT_ENTRY=2048
CONFIG_SECURITY_TOMOYO_MAX_AUDIT_LOG=1024
CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER=y
CONFIG_SECURITY_TOMOYO_INSECURE_BUILTIN_SETTING=y
CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR_HASH=y
CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y
CONFIG_SECURITY_APPARMOR_DEBUG=y
CONFIG_SECURITY_APPARMOR_DEBUG_ASSERTS=y
CONFIG_SECURITY_APPARMOR_DEBUG_MESSAGES=y
CONFIG_SECURITY_YAMA=y
CONFIG_SECURITY_SAFESETID=y
CONFIG_SECURITY_LOCKDOWN_LSM=y
CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
# CONFIG_LOCK_DOWN_KERNEL_FORCE_NONE is not set
# CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY is not set
CONFIG_LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY=y
# CONFIG_INTEGRITY is not set
CONFIG_DEFAULT_SECURITY_SMACK=y
# CONFIG_DEFAULT_SECURITY_TOMOYO is not set
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="lockdown,yama,loadpin,safesetid,integrity,smack,selinux,tomoyo,apparmor"

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
# end of Memory initialization
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
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECRDSA=m

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=m
CONFIG_CRYPTO_CFB=m
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
# CONFIG_CRYPTO_PCBC is not set
# CONFIG_CRYPTO_XTS is not set
CONFIG_CRYPTO_KEYWRAP=y
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ESSIV=y

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=m
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_XXHASH=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_RMD128=m
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_RMD256=m
# CONFIG_CRYPTO_RMD320 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_SHA256=y
# CONFIG_CRYPTO_SHA512 is not set
# CONFIG_CRYPTO_SHA3 is not set
# CONFIG_CRYPTO_SM3 is not set
CONFIG_CRYPTO_STREEBOG=m
# CONFIG_CRYPTO_TGR192 is not set
CONFIG_CRYPTO_WP512=y

#
# Ciphers
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=m
CONFIG_CRYPTO_ANUBIS=m
CONFIG_CRYPTO_LIB_ARC4=y
CONFIG_CRYPTO_ARC4=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
# CONFIG_CRYPTO_CAST6 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_DES=m
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SALSA20=m
CONFIG_CRYPTO_CHACHA20=y
# CONFIG_CRYPTO_SEED is not set
# CONFIG_CRYPTO_SERPENT is not set
# CONFIG_CRYPTO_SM4 is not set
CONFIG_CRYPTO_TEA=y
# CONFIG_CRYPTO_TWOFISH is not set

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=m
# CONFIG_CRYPTO_842 is not set
CONFIG_CRYPTO_LZ4=m
# CONFIG_CRYPTO_LZ4HC is not set
CONFIG_CRYPTO_ZSTD=y

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=m
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
CONFIG_CRYPTO_USER_API_AEAD=m
CONFIG_CRYPTO_HASH_INFO=y
# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y
CONFIG_PKCS7_TEST_KEY=m
# CONFIG_SIGNED_PE_FILE_VERIFICATION is not set

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
CONFIG_SECONDARY_TRUSTED_KEYRING=y
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

#
# Library routines
#
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_STMP_DEVICE=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=m
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=m
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
# CONFIG_CRC4 is not set
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
CONFIG_AUDIT_GENERIC=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=m
CONFIG_LZO_DECOMPRESS=m
CONFIG_LZ4_COMPRESS=m
CONFIG_LZ4_DECOMPRESS=m
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
# CONFIG_XZ_DEC_ARM is not set
CONFIG_XZ_DEC_ARMTHUMB=y
# CONFIG_XZ_DEC_SPARC is not set
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=m
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_BCH=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_DMA=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
# CONFIG_DMA_API_DEBUG is not set
CONFIG_SGL_ALLOC=y
CONFIG_DQL=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=m
CONFIG_NLATTR=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_SG_SPLIT=y
# CONFIG_PARMAN is not set
# CONFIG_OBJAGG is not set
# CONFIG_STRING_SELFTEST is not set
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
CONFIG_PRINTK_CALLER=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
CONFIG_DYNAMIC_DEBUG=y
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
CONFIG_DEBUG_FS=y
CONFIG_HEADERS_INSTALL=y
CONFIG_OPTIMIZE_INLINING=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_FRAME_POINTER is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
CONFIG_DEBUG_PAGEALLOC=y
# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
CONFIG_PAGE_POISONING=y
# CONFIG_PAGE_POISONING_NO_SANITY is not set
# CONFIG_PAGE_POISONING_ZERO is not set
# CONFIG_DEBUG_OBJECTS is not set
CONFIG_DEBUG_SLAB=y
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_DEBUG_VM is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_KASAN_STACK=1
# end of Memory Debugging

CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_DEBUG_SHIRQ=y

#
# Debug Lockups and Hangs
#
# CONFIG_SOFTLOCKUP_DETECTOR is not set
# CONFIG_DETECT_HUNG_TASK is not set
CONFIG_WQ_WATCHDOG=y
# end of Debug Lockups and Hangs

CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
# CONFIG_SCHED_DEBUG is not set
# CONFIG_SCHEDSTATS is not set
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
# CONFIG_DEBUG_RT_MUTEXES is not set
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=y
CONFIG_WW_MUTEX_SELFTEST=m
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
CONFIG_DEBUG_KOBJECT=y
CONFIG_HAVE_DEBUG_BUGVERBOSE=y
# CONFIG_DEBUG_LIST is not set
CONFIG_DEBUG_PLIST=y
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
# CONFIG_RCU_PERF_TEST is not set
CONFIG_RCU_TORTURE_TEST=m
# CONFIG_RCU_TRACE is not set
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=m
# CONFIG_FAULT_INJECTION is not set
# CONFIG_RUNTIME_TESTING_MENU is not set
# CONFIG_MEMTEST is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_SAMPLES is not set
CONFIG_UBSAN=y
# CONFIG_UBSAN_NO_ALIGNMENT is not set
CONFIG_UBSAN_ALIGNMENT=y
# CONFIG_TEST_UBSAN is not set
# CONFIG_BOOTPARAM is not set
# end of Kernel hacking

CONFIG_WARN_MISSING_DOCUMENTS=y

--vUIiKg51LlL5XLB2--
