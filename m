Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028558F71
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 16:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685376710; x=1716912710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bLSNmYFFnZJFAjS6fQ7MWmp7tXnPyrsGhBofZQbfEFA=;
  b=JN55QPak8wHDvGkaB0lwzrq1cv4CVIWlPy1SZOTMtH02uMXQ6ZYpIXrg
   Hq/fUlj3w/shbhc5D1+DOwsm4tEwM9Cilf8dpfVJ+O9wkVD1HJOfM6C39
   yxS65jWgxqmJyD/JqrOAjjyfULd5gA+28bSYMt/91Bxe0S26rxe+DtQ9l
   dDJxkxLxQEzrKCJ5S5abekasGY06stiBqowI8DeUVfeIIA673a62L8AE9
   azMclKPLoxr59R+3ozGS6Wf+DD1KfMHqZI7CJpYO7TRX1KkN5TmJcl4J0
   RjPcIdX8+xcnT0e4IjKIAd4WD5TVH/HITNGH2CO23TWRejZfMx7GOOaZA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="335088386"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="335088386"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 09:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="850438364"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="850438364"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 May 2023 09:11:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3fTG-000L2g-2u;
	Mon, 29 May 2023 16:11:46 +0000
Date: Tue, 30 May 2023 00:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dirk Mueller <dmueller@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Nathan Chancellor <natechancellor@gmail.com>
Subject: [stable:linux-4.14.y 3076/9999] drivers/staging/pi433/rf69.c:108:52:
 warning: implicit conversion from 'enum lnaGain' to 'enum modulation'
Message-ID: <202305300049.47dX2XSu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dirk,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   b3f141a5bc7f877e96528dd31a139854ec4d6017
commit: 88f7a6aa7fb9aa5076b65489146045dac865f1d3 [3076/9999] scripts/dtc: Remove redundant YYLOC global declaration
config: openrisc-buildonly-randconfig-r003-20230529 (https://download.01.org/0day-ci/archive/20230530/202305300049.47dX2XSu-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=88f7a6aa7fb9aa5076b65489146045dac865f1d3
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.14.y
        git checkout 88f7a6aa7fb9aa5076b65489146045dac865f1d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300049.47dX2XSu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:34,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:782,
                    from include/linux/gfp.h:6,
                    from include/linux/idr.h:16,
                    from include/linux/kernfs.h:14,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from include/linux/spi/spi.h:18,
                    from drivers/staging/pi433/rf69.c:26:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   drivers/staging/pi433/rf69.c: In function 'rf69_get_modulation':
>> drivers/staging/pi433/rf69.c:108:52: warning: implicit conversion from 'enum lnaGain' to 'enum modulation' [-Wenum-conversion]
     108 |         default:                            return undefined;
         |                                                    ^~~~~~~~~
--
   In file included from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:34,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:782,
                    from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from drivers/net/ethernet/mellanox/mlxsw/core.c:38:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   drivers/net/ethernet/mellanox/mlxsw/core.c: In function 'mlxsw_core_driver_put':
>> drivers/net/ethernet/mellanox/mlxsw/core.c:768:30: warning: variable 'mlxsw_driver' set but not used [-Wunused-but-set-variable]
     768 |         struct mlxsw_driver *mlxsw_driver;
         |                              ^~~~~~~~~~~~
--
   In file included from include/linux/workqueue.h:9,
                    from include/linux/rhashtable.h:26,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:9,
                    from include/linux/sched.h:15,
                    from arch/openrisc/kernel/setup.c:21:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   arch/openrisc/kernel/setup.c: At top level:
>> arch/openrisc/kernel/setup.c:156:13: warning: no previous prototype for 'setup_cpuinfo' [-Wmissing-prototypes]
     156 | void __init setup_cpuinfo(void)
         |             ^~~~~~~~~~~~~
   arch/openrisc/kernel/setup.c:202:13: warning: no previous prototype for 'or32_early_setup' [-Wmissing-prototypes]
     202 | void __init or32_early_setup(void *fdt)
         |             ^~~~~~~~~~~~~~~~
   arch/openrisc/kernel/setup.c:228:13: warning: no previous prototype for 'detect_unit_config' [-Wmissing-prototypes]
     228 | void __init detect_unit_config(unsigned long upr, unsigned long mask,
         |             ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/workqueue.h:9,
                    from include/linux/rhashtable.h:26,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:9,
                    from include/linux/sched.h:15,
                    from arch/openrisc/kernel/traps.c:24:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   arch/openrisc/kernel/traps.c: At top level:
>> arch/openrisc/kernel/traps.c:53:6: warning: no previous prototype for 'show_trace' [-Wmissing-prototypes]
      53 | void show_trace(struct task_struct *task, unsigned long *stack)
         |      ^~~~~~~~~~
   arch/openrisc/kernel/traps.c:105:6: warning: no previous prototype for 'show_trace_task' [-Wmissing-prototypes]
     105 | void show_trace_task(struct task_struct *tsk)
         |      ^~~~~~~~~~~~~~~
   arch/openrisc/kernel/traps.c:112:6: warning: no previous prototype for 'show_registers' [-Wmissing-prototypes]
     112 | void show_registers(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~
   arch/openrisc/kernel/traps.c:176:6: warning: no previous prototype for 'nommu_dump_state' [-Wmissing-prototypes]
     176 | void nommu_dump_state(struct pt_regs *regs,
         |      ^~~~~~~~~~~~~~~~
   arch/openrisc/kernel/traps.c:253:6: warning: no previous prototype for 'die' [-Wmissing-prototypes]
     253 | void die(const char *str, struct pt_regs *regs, long err)
         |      ^~~
   arch/openrisc/kernel/traps.c:272:6: warning: no previous prototype for 'die_if_kernel' [-Wmissing-prototypes]
     272 | void die_if_kernel(const char *str, struct pt_regs *regs, long err)
         |      ^~~~~~~~~~~~~
   arch/openrisc/kernel/traps.c:280:6: warning: no previous prototype for 'unhandled_exception' [-Wmissing-prototypes]
     280 | void unhandled_exception(struct pt_regs *regs, int ea, int vector)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/openrisc/kernel/traps.c:287:13: warning: no previous prototype for 'trap_init' [-Wmissing-prototypes]
     287 | void __init trap_init(void)
         |             ^~~~~~~~~
   arch/openrisc/kernel/traps.c:292:17: warning: no previous prototype for 'do_trap' [-Wmissing-prototypes]
     292 | asmlinkage void do_trap(struct pt_regs *regs, unsigned long address)
         |                 ^~~~~~~
   arch/openrisc/kernel/traps.c:304:17: warning: no previous prototype for 'do_unaligned_access' [-Wmissing-prototypes]
     304 | asmlinkage void do_unaligned_access(struct pt_regs *regs, unsigned long address)
         |                 ^~~~~~~~~~~~~~~~~~~
   arch/openrisc/kernel/traps.c:323:17: warning: no previous prototype for 'do_bus_fault' [-Wmissing-prototypes]
     323 | asmlinkage void do_bus_fault(struct pt_regs *regs, unsigned long address)
         |                 ^~~~~~~~~~~~
   arch/openrisc/kernel/traps.c:505:17: warning: no previous prototype for 'do_illegal_instruction' [-Wmissing-prototypes]
     505 | asmlinkage void do_illegal_instruction(struct pt_regs *regs,
         |                 ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:34,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:782,
                    from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from mm/zsmalloc.c:33:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   mm/zsmalloc.c: At top level:
>> mm/zsmalloc.c:952:6: warning: no previous prototype for 'lock_zspage' [-Wmissing-prototypes]
     952 | void lock_zspage(struct zspage *zspage)
         |      ^~~~~~~~~~~
>> mm/zsmalloc.c:961:5: warning: no previous prototype for 'trylock_zspage' [-Wmissing-prototypes]
     961 | int trylock_zspage(struct zspage *zspage)
         |     ^~~~~~~~~~~~~~
--
   In file included from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:34,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:782,
                    from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from drivers/block/zram/zram_drv.c:18:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   drivers/block/zram/zram_drv.c: At top level:
>> drivers/block/zram/zram_drv.c:447:6: warning: no previous prototype for 'zram_page_end_io' [-Wmissing-prototypes]
     447 | void zram_page_end_io(struct bio *bio)
         |      ^~~~~~~~~~~~~~~~
--
   In file included from net/rose/rose_timer.c:16:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   net/rose/rose_timer.c: In function 'rose_start_t1timer':
>> net/rose/rose_timer.c:52:32: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
      52 |         rose->timer.function = (TIMER_FUNC_TYPE)rose_timer_expiry;
         |                                ^
   net/rose/rose_timer.c: In function 'rose_start_t2timer':
   net/rose/rose_timer.c:64:32: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
      64 |         rose->timer.function = (TIMER_FUNC_TYPE)rose_timer_expiry;
         |                                ^
   net/rose/rose_timer.c: In function 'rose_start_t3timer':
   net/rose/rose_timer.c:76:32: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
      76 |         rose->timer.function = (TIMER_FUNC_TYPE)rose_timer_expiry;
         |                                ^
   net/rose/rose_timer.c: In function 'rose_start_hbtimer':
   net/rose/rose_timer.c:88:32: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
      88 |         rose->timer.function = (TIMER_FUNC_TYPE)rose_timer_expiry;
         |                                ^
   net/rose/rose_timer.c: In function 'rose_start_idletimer':
   net/rose/rose_timer.c:101:44: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     101 |                 rose->idletimer.function = (TIMER_FUNC_TYPE)rose_idletimer_expiry;
         |                                            ^
--
   In file included from net/rose/rose_link.c:15:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   net/rose/rose_link.c: In function 'rose_start_ftimer':
>> net/rose/rose_link.c:40:34: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
      40 |         neigh->ftimer.function = (TIMER_FUNC_TYPE)rose_ftimer_expiry;
         |                                  ^
   net/rose/rose_link.c: In function 'rose_start_t0timer':
   net/rose/rose_link.c:51:35: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
      51 |         neigh->t0timer.function = (TIMER_FUNC_TYPE)rose_t0timer_expiry;
         |                                   ^
--
   In file included from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:34,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:782,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from drivers/md/raid1.c:34:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   drivers/md/raid1.c: In function 'handle_read_error':
>> drivers/md/raid1.c:2451:18: warning: variable 'bio_sector' set but not used [-Wunused-but-set-variable]
    2451 |         sector_t bio_sector;
         |                  ^~~~~~~~~~
   In file included from include/linux/sched/signal.h:6,
                    from drivers/md/raid1.c:40:
   include/linux/signal.h: In function 'sigfillset':
   include/linux/signal.h:190:29: warning: this statement may fall through [-Wimplicit-fallthrough=]
     190 |         case 2: set->sig[1] = -1;
         |                 ~~~~~~~~~~~~^~~~
   include/linux/signal.h:191:9: note: here
     191 |         case 1: set->sig[0] = -1;
         |         ^~~~


vim +108 drivers/staging/pi433/rf69.c

874bcba65f9a3a Marcus Wolf   2017-07-16   94  
874bcba65f9a3a Marcus Wolf   2017-07-16   95  enum modulation rf69_get_modulation(struct spi_device *spi)
874bcba65f9a3a Marcus Wolf   2017-07-16   96  {
874bcba65f9a3a Marcus Wolf   2017-07-16   97  	u8 currentValue;
874bcba65f9a3a Marcus Wolf   2017-07-16   98  
874bcba65f9a3a Marcus Wolf   2017-07-16   99  	#ifdef DEBUG
874bcba65f9a3a Marcus Wolf   2017-07-16  100  		dev_dbg(&spi->dev, "get: mode");
874bcba65f9a3a Marcus Wolf   2017-07-16  101  	#endif
874bcba65f9a3a Marcus Wolf   2017-07-16  102  
874bcba65f9a3a Marcus Wolf   2017-07-16  103  	currentValue = READ_REG(REG_DATAMODUL);
874bcba65f9a3a Marcus Wolf   2017-07-16  104  
9391cb316076a1 Marcin Ciupak 2017-08-10  105  	switch (currentValue & MASK_DATAMODUL_MODULATION_TYPE >> 3) { // TODO improvement: change 3 to define
874bcba65f9a3a Marcus Wolf   2017-07-16  106  	case DATAMODUL_MODULATION_TYPE_OOK: return OOK;
874bcba65f9a3a Marcus Wolf   2017-07-16  107  	case DATAMODUL_MODULATION_TYPE_FSK: return FSK;
874bcba65f9a3a Marcus Wolf   2017-07-16 @108  	default:			    return undefined;
874bcba65f9a3a Marcus Wolf   2017-07-16  109  	}
874bcba65f9a3a Marcus Wolf   2017-07-16  110  }
874bcba65f9a3a Marcus Wolf   2017-07-16  111  

:::::: The code at line 108 was first introduced by commit
:::::: 874bcba65f9a3a2a304b5f520529c046887c3cdc staging: pi433: New driver

:::::: TO: Marcus Wolf <linux@Wolf-Entwicklungen.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
